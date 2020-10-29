import React, { useContext, useState, useEffect } from "react";
import { GearContext } from "../../providers/GearProvider";
import { Container, Form, FormGroup, Input, Label, FormText, Row, Col, Button } from "reactstrap";
import { useHistory } from "react-router-dom";

export default function() {

    const { saveNewGear } = useContext(GearContext);

    const [newGear, setNewGear] = useState({});
    const [gearType, setGearType] = useState();
    const [gearTypeList, setGearTypeList] = useState([]);
    const [accessories, setAccessories] = useState([]);

    const addAccessory = (evt) => {
        evt.preventDefault();
        const currentAccessories = [...accessories];
        currentAccessories.push({});
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

    useEffect(() => {
        // Get gearTypeList
    }, [])

    useEffect(() => {
        if (gearType) {
            // Populate gearType upon selection
        }
    }, [newGear.gearTypeId])

    return (
        <Container className="mt-4">
        <h1 className="text-center">Unaltered Bootstrap New Entry Form</h1>
        <Form>
            <FormGroup>
                <Label for="headline">Headline</Label>
                <Input type="text" name="headline" id="headline" maxLength="40" />
                <FormText>Something short to grab people's attention</FormText>
            </FormGroup>
            <Row form>
                <Col md={7}>
                    <FormGroup>
                        <Label for="manufacturer">Manufacturer</Label>
                        <Input type="text" name="manufacturer" id="manufacturer" placeholder="Shure" maxLength="40" />
                    </FormGroup>
                </Col>
                <Col md={5}>
                    <FormGroup>
                        <Label for="model">Model</Label>
                        <Input type="text" name="model" id="model" placeholder="SM-57" maxLength="40" />
                    </FormGroup>
                </Col>
            </Row>
            <FormGroup>
                <Label for="price">Price</Label>
                <Input type="number" name="price" id="price" placeholder="50" />
            </FormGroup>
            <FormGroup>
                <Label for="gearTypeId">Type</Label>
                <Input type="select" name="gearTypeId" id="gearTypeId"
                    onClick={(evt) => setGearType(evt.target.value)}>
                    <option value="">Select Type</option>
                    {gearTypeList.map(gt => 
                        <option key={gt.id} value={gt.id}>{gt.name}</option>)}
                </Input>
            </FormGroup>

            {gearType && gearType.firstOptionName
            ? <FormGroup>
                <Label for="firstOptionNotes">{gearType.firstOptionName}</Label>
                <Input type="text" name="firstOptionNotes" id="firstOptionNotes" maxLength="255" />
            </FormGroup>
            : null} 

            {gearType && gearType.secondOptionName
            ? <FormGroup>
                <Label for="secondOptionNotes">{gearType.secondOptionName}</Label>
                <Input type="text" name="secondOptionNotes" id="secondOptionNotes" maxLength="255" />
            </FormGroup>
            : null}

            <FormGroup>
                <Label for="description">Description</Label>
                <Input type="textarea" name="description" id="description" />
                <FormText>Good details help other people rent your gear!</FormText>
            </FormGroup>

            {accessories.length > 0
            ? accessories.map((accessory, index) =>
                <>
                <FormGroup>
                    <Label for={`accessoryName-${index}`}>Accessory Name</Label>
                    <Input type="text" name={`accessoryName-${index}`} id={`accessoryName-${index}`} />
                </FormGroup>
                <FormGroup>
                    <Label for={`accessoryDescription-${index}`}>Accessory Description</Label>
                    <Input type="text" name={`accessoryDescription-${index}`} id={`accessoryDescription-${index}`}
                        maxLength="500" />
                </FormGroup>
                <Button type="button" id={`removeAccessory-${index}`} onClick={removeAccessory}>Remove</Button>
                </>
            )
            : null}

            <Button type="button" onClick={addAccessory}>Add Accessory</Button>
        </Form>
        </Container>
    )
}