import React, { useEffect, useState, useContext } from "react"
import { useParams, useHistory } from "react-router-dom";
import { GearContext } from "../../providers/GearProvider";
import { UserProfileContext } from "../../providers/UserProfileProvider";
import { Row, Col } from "reactstrap";
import GearDetails from "./GearDetails";
import MakeReservation from "./MakeReservation";
import OwnerMore from "./OwnerMore";
import OwnerDetails from "./OwnerDetails";
import Filters from "./Filters";

export default function GearList() {

    const [gear, setGear] = useState();

    const { id } = useParams();
    const { getGearItem } = useContext(GearContext);
    const { isLoggedIn } = useContext(UserProfileContext);

    const history = useHistory();

    useEffect(() => {
        getGearItem(id).then((res) => {
            const currentUserId = (isLoggedIn) ? JSON.parse(sessionStorage.userProfile).id : -1;
            if (res.userProfileId === currentUserId) {
                history.push(`/gear/${res.id}/owner`);
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
                    <GearDetails gear={gear} history={history} />
                    <MakeReservation gear={gear} />
                </Row>
                <Row>
                    <OwnerMore ownerId={gear.userProfileId} />
                    <OwnerDetails owner={gear.userProfile} />
                </Row>
            </Col>
        </Row>
        </>        
    );
}