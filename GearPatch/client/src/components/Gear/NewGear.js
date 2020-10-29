import React, { useContext, useState, useEffect } from "react";
import { useHistory } from "react-router-dom";
import { GearContext } from "../../providers/GearProvider";
import { Container, Form, FormGroup, Input, Label, FormText, Row, Col, Button } from "reactstrap";

export default function() {

    const { saveNewGear, getGearTypes } = useContext(GearContext);

    const [newGear, setNewGear] = useState({});
    const [gearType, setGearType] = useState();
    const [gearTypeList, setGearTypeList] = useState([]);
    const [accessories, setAccessories] = useState([]);

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
        const currentGear = { ...newGear };
        currentGear[evt.target.id] = evt.target.value;
        setNewGear(currentGear);
    }

    const handleSubmit = (evt) => {
        evt.preventDefault();

        const gearToSave = {
            headline: newGear.headline,
            manufacturer: newGear.manufacturer,
            model: newGear.model,
            price: parseInt(newGear.price),
            description: newGear.description,
            gearTypeId: parseInt(newGear.gearTypeId),
            firstOptionNotes: newGear.firstOptionNotes || null,
            secondOptionNotes: newGear.secondOptionNotes || null,
            accessories: [...accessories]
        }

        saveNewGear(gearToSave)
        .then((res) => history.push(`/gear/${res.id}`))

        console.log(gearToSave);
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
                <Input type="text" name="headline" id="headline" maxLength="40" onChange={handleFieldChange} />
                <FormText>Something short to grab people's attention</FormText>
            </FormGroup>
            <Row form>
                <Col md={7}>
                    <FormGroup>
                        <Label for="manufacturer">Manufacturer</Label>
                        <Input type="text" name="manufacturer" id="manufacturer" placeholder="Shure" maxLength="40" 
                            onChange={handleFieldChange} />
                    </FormGroup>
                </Col>
                <Col md={5}>
                    <FormGroup>
                        <Label for="model">Model</Label>
                        <Input type="text" name="model" id="model" placeholder="SM-57" maxLength="40" onChange={handleFieldChange} />
                    </FormGroup>
                </Col>
            </Row>
            <FormGroup>
                <Label for="price">Price</Label>
                <Input type="number" name="price" id="price" placeholder="50" onChange={handleFieldChange} />
                <FormText>Rentals are priced per day</FormText>
            </FormGroup>
            <FormGroup>
                <Label for="gearTypeId">Type</Label>
                <Input type="select" name="gearTypeId" id="gearTypeId"
                    onChange={handleFieldChange}>
                    <option value="">Select Type</option>
                    {gearTypeList.map(gt => 
                        <option key={gt.id} value={gt.id}>{gt.name}</option>)}
                </Input>
            </FormGroup>

            {gearType && gearType.firstOptionName
            ? <FormGroup>
                <Label for="firstOptionNotes">{gearType.firstOptionName}</Label>
                <Input type="text" name="firstOptionNotes" id="firstOptionNotes" maxLength="255" onChange={handleFieldChange} />
            </FormGroup>
            : null} 

            {gearType && gearType.secondOptionName
            ? <FormGroup>
                <Label for="secondOptionNotes">{gearType.secondOptionName}</Label>
                <Input type="text" name="secondOptionNotes" id="secondOptionNotes" maxLength="255" onChange={handleFieldChange} />
            </FormGroup>
            : null}

            <FormGroup>
                <Label for="description">Description</Label>
                <Input type="textarea" name="description" id="description" onChange={handleFieldChange} />
                <FormText>Good details help other people rent your gear!</FormText>
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