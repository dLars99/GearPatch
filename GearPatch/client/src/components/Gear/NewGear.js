import React, { useContext, useState, useEffect } from "react";
import { useHistory } from "react-router-dom";
import { GearContext } from "../../providers/GearProvider";
import { NewGearValidation } from "./NewGearValidation";
import { Container, Form, FormGroup, Input, Label, FormText, Row, Col, Button, FormFeedback } from "reactstrap";

export default function NewGear() {

    const { saveNewGear, getGearTypes } = useContext(GearContext);

    const [newGear, setNewGear] = useState({});
    const [gearType, setGearType] = useState();
    const [gearTypeList, setGearTypeList] = useState([]);
    const [accessories, setAccessories] = useState([]);
    const [invalid, setInvalid] = useState({headline: false, manufacturer: false, model: false, price: false, description: false,
        imageLocation: false, gearTypeId: false, firstOptionNotes: false, secondOptionNotes: false})

    const history = useHistory();

    const addAccessory = (evt) => {
        evt.preventDefault();
        const currentAccessories = [...accessories];
        currentAccessories.push({});
        setAccessories(currentAccessories);
    }

    const handleAccessory = (evt) => {
        const currentAccessories = [ ...accessories];
        const targetIndex = evt.target.id.split("-")[1];
        currentAccessories[targetIndex][evt.target.id.split("-")[0]] = evt.target.value;
        setAccessories(currentAccessories);
    }

    const removeAccessory = (evt) => {
        evt.preventDefault();
        const targetIndex = evt.target.id.split("-")[1];
        const currentAccessories = [...accessories];
        currentAccessories.splice(targetIndex, 1);
        setAccessories(currentAccessories);
    }

    const handleFieldChange = (evt) => {
        const currentInvalid = { ...invalid };
        const currentGear = { ...newGear };
        currentGear[evt.target.id] = evt.target.value;
        setNewGear(currentGear);
        // Reset field if it was previously marked invalid
        currentInvalid[evt.target.id] = false;
        setInvalid(currentInvalid);
    }

    const handleSubmit = (evt) => {
        evt.preventDefault();
        const inputAccessories = [ ...accessories ];
        // Remove any accessories without a name
        const accessoriesToSend = inputAccessories.filter(a => a.name);
        console.log("Accessories to Send", accessoriesToSend)

        const gearToSave = {
            headline: newGear.headline,
            manufacturer: newGear.manufacturer,
            model: newGear.model,
            price: parseInt(newGear.price),
            description: newGear.description,
            imageLocation: newGear.imageLocation,
            gearTypeId: parseInt(newGear.gearTypeId),
            firstOptionNotes: newGear.firstOptionNotes || null,
            secondOptionNotes: newGear.secondOptionNotes || null,
            accessories: accessoriesToSend || []
        }

        // Validation
        const fieldIsInvalid = NewGearValidation(gearToSave, gearType);
        if (fieldIsInvalid) {
            const isInvalid = { ...invalid };
            isInvalid[fieldIsInvalid] = true;
            setInvalid(isInvalid);
        } else {
            saveNewGear(gearToSave)
            .then((res) => history.push(`/gear/${res.id}`));
        }
    }

    useEffect(() => {
        getGearTypes().then(setGearTypeList);
        // eslint-disable-next-line
    }, [])

    useEffect(() => {
        // Update gearType state after a selection so FirstOption and SecondOption fields populate
        if (newGear.gearTypeId) {
            const gearTypeSelection = gearTypeList.find(gearType => gearType.id === parseInt(newGear.gearTypeId));
            setGearType(gearTypeSelection);
        }
        // eslint-disable-next-line
    }, [newGear.gearTypeId])

    return (
        <Container className="mt-4">
        <h1 className="text-center">New Gear Listing</h1>
        <Form>
            <FormGroup>
                <Label for="headline">Headline</Label>
                <Input type="text" invalid={invalid.headline} name="headline" id="headline" maxLength="40" onChange={handleFieldChange} />
                <FormFeedback>A headline is required</FormFeedback>
                <FormText>Something short to grab people's attention</FormText>
            </FormGroup>
            <Row form>
                <Col md={7}>
                    <FormGroup>
                        <Label for="manufacturer">Manufacturer</Label>
                        <Input type="text" invalid={invalid.manufacturer} name="manufacturer" id="manufacturer" placeholder="Shure" maxLength="40" 
                            onChange={handleFieldChange} />
                        <FormFeedback>Manufacturer is required</FormFeedback>
                    </FormGroup>
                </Col>
                <Col md={5}>
                    <FormGroup>
                        <Label for="model">Model</Label>
                        <Input type="text" invalid={invalid.model} name="model" id="model" placeholder="SM-57" maxLength="40" onChange={handleFieldChange} />
                        <FormFeedback>Model is required</FormFeedback>
                    </FormGroup>
                </Col>
            </Row>
            <FormGroup>
                <Label for="price">Price</Label>
                <Input type="number" invalid={invalid.price} name="price" id="price" placeholder="50" onChange={handleFieldChange} />
                <FormFeedback>Price is required</FormFeedback>
                <FormText>Rentals are priced per day</FormText>
            </FormGroup>
            <FormGroup>
                <Label for="gearTypeId">Type</Label>
                <Input type="select" invalid={invalid.gearTypeId} name="gearTypeId" id="gearTypeId"
                    onChange={handleFieldChange}>
                    <option value="">Select Type</option>
                    {gearTypeList.map(gt => 
                        <option key={gt.id} value={gt.id}>{gt.name}</option>)}
                </Input>
                <FormFeedback>Type is required</FormFeedback>
            </FormGroup>

            {gearType && gearType.firstOptionName
            ? <FormGroup>
                <Label for="firstOptionNotes">{gearType.firstOptionName}</Label>
                <Input type="text" invalid={invalid.firstOptionNotes} name="firstOptionNotes" id="firstOptionNotes" maxLength="255" onChange={handleFieldChange} />
                <FormFeedback>This field is required</FormFeedback>
            </FormGroup>
            : null} 

            {gearType && gearType.secondOptionName
            ? <FormGroup>
                <Label for="secondOptionNotes">{gearType.secondOptionName}</Label>
                <Input type="text" invalid={invalid.secondOptionNotes} name="secondOptionNotes" id="secondOptionNotes" maxLength="255" onChange={handleFieldChange} />
                <FormFeedback>This field is required</FormFeedback>
            </FormGroup>
            : null}

            <FormGroup>
                <Label for="description">Description</Label>
                <Input type="textarea" name="description" id="description" onChange={handleFieldChange} />
                <FormText>Good details help other people rent your gear!</FormText>
            </FormGroup>

            <FormGroup>
                <Label for="imageLocation">Image Location</Label>
                <Input type="url" invalid={invalid.imageLocation} name="imageLocation" id="imageLocation" onChange={handleFieldChange} />
                <FormText>Enter the URL of a picture of the item</FormText>
            </FormGroup>

            {accessories.length > 0
            ? accessories.map((accessory, index) =>
                <Row className="align-items-center">
                    {console.log(accessory)}
                    <Col md={4}>
                        <FormGroup>
                            <Label for={`name-${index}`}>Accessory Name</Label>
                            <Input type="text" name={`name-${index}`} id={`name-${index}`} 
                            maxLength="50" onChange={handleAccessory} />
                            <FormText>Accessories without a name will be removed</FormText>
                        </FormGroup>
                    </Col>
                    <Col md={6}>
                        <FormGroup>
                            <Label for={`description-${index}`}>Accessory Description</Label>
                            <Input type="text" name={`description-${index}`} id={`description-${index}`}
                                maxLength="500" onChange={handleAccessory} />
                        </FormGroup>
                    </Col>
                    <Col md={1}>
                        <Button type="button" id={`removeAccessory-${index}`} onClick={removeAccessory}>&minus;</Button>
                    </Col>
                </Row>
            )
            : null}

            <Row>
                <Col xs={2} md={1}>
                    <Button type="button" onClick={addAccessory}>+</Button>
                </Col>
                <Col xs={10} sm={11}>
                    <p>Add Accessory</p>
                </Col>
            </Row>
        </Form>
        <Row className="mt-3">
            <Col xs={3} sm={2} lg={1}>
                <Button onClick={handleSubmit}>Save</Button>
            </Col>
            <Col xs={9} sm={10} lg={11}>
                <Button onClick={() => history.push("/")}>Back to Homepage</Button>
            </Col>
        </Row>

        </Container>
    )
}