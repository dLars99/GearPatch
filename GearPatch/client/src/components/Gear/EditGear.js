import React, { useContext, useState, useEffect } from "react";
import { useHistory } from "react-router-dom";
import { GearContext } from "../../providers/GearProvider";
import { UserProfileContext } from "../../providers/UserProfileProvider";
import { NewGearValidation } from "./NewGearValidation";
import { Form, FormGroup, Input, Label, FormText, Row, Col, Button, FormFeedback } from "reactstrap";

export default function NewGear({ gear, toggleEdit }) {

    const { saveEditedGear, getGearTypes } = useContext(GearContext);
    const { getToken } = useContext(UserProfileContext);

    const [newGear, setNewGear] = useState({});
    const [gearType, setGearType] = useState();
    const [gearTypeList, setGearTypeList] = useState([]);
    const [accessories, setAccessories] = useState([]);
    const [invalid, setInvalid] = useState({headline: false, manufacturer: false, model: false, price: false, description: false,
        imageLocation: false, gearTypeId: false, firstOptionNotes: false, secondOptionNotes: false});
    const [file, setFile] = useState();
    const [imagePreview, setImagePreview] = useState();
    const [previousImage, setPreviousImage] = useState();


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
        setAccessories(currentAccessories || []);
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

    const addFile = (evt) => {
        setFile(evt.target.files[0]);
        const currentGear = { ...newGear };
        currentGear[evt.target.id] = evt.target.files[0].name;
        setImagePreview(URL.createObjectURL(evt.target.files[0]));
        setNewGear(currentGear);
    }

    const saveImage = async (url) => {
        const formData = new FormData();
        formData.append("file", file, url);
        console.log(formData);
        const token = await getToken();
        const res = await fetch("/api/image/gear", {
            method: "POST",
            headers: {
                Authorization: `Bearer ${token}`
            },
            body: formData
        });
         return res;
    }

    const handleSubmit = (evt) => {
        evt.preventDefault();
        const inputAccessories = [ ...accessories ];
        // Remove any accessories without a name
        const accessoriesToSend = inputAccessories.filter(a => a.name);

        const gearToSave = {
            id: newGear.id,
            headline: newGear.headline,
            manufacturer: newGear.manufacturer,
            model: newGear.model,
            price: parseInt(newGear.price),
            description: newGear.description,
            gearTypeId: parseInt(newGear.gearTypeId),
            isActive: newGear.isActive,
            imageLocation: newGear.imageLocation,
            userProfileId: JSON.parse(sessionStorage.userProfile).id,
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
            if (gearToSave.imageLocation !== previousImage) {
                gearToSave.imageLocation = `${new Date().getTime()}_${newGear.imageLocation}`;
                saveImage(gearToSave.imageLocation)
                .then((res) => {
                    if (res.ok) {
                        saveEditedGear(gearToSave)
                        .then(() => history.push(`/gear/${gear.id}`));
                    } else {
                        alert("An error occurred while uploading the image");
                    }
                });
            } else {
                saveEditedGear(gearToSave)
                .then(() => history.push(`/gear/${gear.id}`))
            }
        }
    }

    useEffect(() => {
        getGearTypes().then(setGearTypeList)
            .then(() => {
                if (gear.accessories) setAccessories([...gear.accessories]);
                if (gear.imageLocation) {
                    setImagePreview(`/api/image/gear/${gear.imageLocation}`);
                    setPreviousImage(gear.imageLocation);
                }
                setNewGear(gear);                 
            });
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

    if (!gearType || !accessories) {
        return null;
    }

    return (
        <Col md={8}>
            <h1>Edit Gear Listing</h1>
            <Form>
                <FormGroup>
                    <Label for="headline">Headline</Label>
                    <Input type="text" invalid={invalid.headline} name="headline" id="headline" maxLength="40" value={newGear.headline}
                        onChange={handleFieldChange} />
                    <FormFeedback>A headline is required</FormFeedback>
                    <FormText>Something short to grab people's attention</FormText>
                </FormGroup>
                <Row form>
                    <Col md={7}>
                        <FormGroup>
                            <Label for="manufacturer">Manufacturer</Label>
                            <Input type="text" invalid={invalid.manufacturer} name="manufacturer" id="manufacturer" placeholder="Shure" 
                                value={newGear.manufacturer} maxLength="40" onChange={handleFieldChange} />
                            <FormFeedback>Manufacturer is required</FormFeedback>
                        </FormGroup>
                    </Col>
                    <Col md={5}>
                        <FormGroup>
                            <Label for="model">Model</Label>
                            <Input type="text" invalid={invalid.model} name="model" id="model" placeholder="SM-57" value={newGear.model}
                                maxLength="40" onChange={handleFieldChange} />
                            <FormFeedback>Model is required</FormFeedback>
                        </FormGroup>
                    </Col>
                </Row>
                <FormGroup>
                    <Label for="price">Price</Label>
                    <Input type="number" invalid={invalid.price} name="price" id="price" placeholder="50" value={newGear.price}
                        onChange={handleFieldChange} />
                    <FormFeedback>Price is required</FormFeedback>
                    <FormText>Rentals are priced per day</FormText>
                </FormGroup>
                <FormGroup>
                    <Label for="gearTypeId">Type</Label>
                    <Input type="select" invalid={invalid.gearTypeId} name="gearTypeId" id="gearTypeId" value={newGear.gearTypeId}
                        onChange={handleFieldChange}>
                        <option value="">Select Type</option>
                        {gearTypeList.map(gt => 
                            <option key={gt.id} value={gt.id}>{gt.name}</option>)}
                    </Input>
                    <FormFeedback>Type is required</FormFeedback>
                </FormGroup>

                <FormGroup>
                    <Label for="firstOptionNotes">{gearType.firstOptionName}</Label>
                    <Input type="text" invalid={invalid.firstOptionNotes} name="firstOptionNotes" id="firstOptionNotes" maxLength="255" 
                        value={newGear.firstOptionNotes || ""} onChange={handleFieldChange} />
                    <FormFeedback>This field is required</FormFeedback>
                </FormGroup>

                {gearType && gearType.secondOptionName
                ? <FormGroup>
                    <Label for="secondOptionNotes">{gearType.secondOptionName}</Label>
                    <Input type="text" invalid={invalid.secondOptionNotes} name="secondOptionNotes" id="secondOptionNotes" maxLength="255" 
                        value={newGear.secondOptionNotes || ""} onChange={handleFieldChange} />
                    <FormFeedback>This field is required</FormFeedback>
                </FormGroup>
                : null}

                <FormGroup>
                    <Label for="description">Description</Label>
                    <Input type="textarea" name="description" id="description" value={newGear.description || ""} onChange={handleFieldChange} />
                    <FormText>Good details help other people rent your gear!</FormText>
                </FormGroup>

                <FormGroup>
                    <Label for="imageLocation">Image</Label>
                    <Input type="file" accept="image/*" invalid={invalid.imageLocation} defaultValue="" name="imageLocation" id="imageLocation" onChange={addFile} />
                    <FormFeedback>Please upload a valid image file</FormFeedback>
                    <FormText>Upload a picture of the item</FormText>
                </FormGroup>

                {imagePreview
                ? <FormGroup>
                    <img src={imagePreview} alt="preview" className="img-thumbnail" />
                </FormGroup>
                : null}
                
                {accessories.length > 0
                ? accessories.map((accessory, index) =>
                    <Row key={accessory.id} className="align-items-center">
                        <Col md={4}>
                            <FormGroup>
                                <Label for={`name-${index}`}>Accessory Name</Label>
                                <Input type="text" name={`name-${index}`} id={`name-${index}`} value={accessory.name}
                                    maxLength="50" onChange={handleAccessory} />
                                <FormText>Accessories without a name will be removed</FormText>
                            </FormGroup>
                        </Col>
                        <Col md={6}>
                            <FormGroup>
                                <Label for={`description-${index}`}>Accessory Description</Label>
                                <Input type="text" name={`description-${index}`} id={`description-${index}`} value={accessory.description || ""}
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
                    <Button onClick={toggleEdit}>Cancel</Button>
                </Col>
            </Row>

        </Col>
    )
}