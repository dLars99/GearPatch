import React, { useEffect, useState, useContext } from "react"
import { useParams, useHistory } from "react-router-dom";
import { GearContext } from "../../providers/GearProvider";
import { Row, Col } from "reactstrap";
import GearDetails from "./GearDetails";
import Filters from "./Filters";

export default function GearList() {

    const [gear, setGear] = useState();

    const { id } = useParams();
    const { getGearItem } = useContext(GearContext);

    const history = useHistory();
    const currentUserId = JSON.parse(sessionStorage.userProfile).id

    useEffect(() => {
        getGearItem(id).then((res) => {
            if (res.userProfileId !== currentUserId) {
                history.push(`/gear/${res.id}`);
            }
            setGear(res);
        });
        // eslint-disable-next-line
    }, [])

    if (!gear) {
        return null;
    }

    return (
        <>
        <Row>
            <Col xs={12} sm={8} md={6}>
                <img width="100%" src={gear.imageLocation} alt={gear.headline} />
            </Col>
        </Row>
        <Row>
            <Col sm={3}>
                <Filters />
            </Col>
            <Col sm={9}>
                <Row>
                    <GearDetails gear={gear} />
                    {/* Deactivate control in place of reservation? */}
                </Row>
            </Col>
        </Row>
        </>        
    );
}