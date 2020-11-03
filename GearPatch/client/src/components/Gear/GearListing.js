import React, { useEffect, useState, useContext } from "react"
import { useParams, useHistory } from "react-router-dom";
import { GearContext } from "../../providers/GearProvider";
import { UserProfileContext } from "../../providers/UserProfileProvider";
import { Row, Col } from "reactstrap";
import GearDetails from "./GearDetails";
import MakeReservation from "./MakeReservation";
import OwnerMore from "./OwnerMore";
import OwnerDetails from "./OwnerDetails";

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
            if (!res.imageLocation) res.imageLocation = 'null-gear.png'
            if (!res.userProfile.imageLocation) res.userProfile.imageLocation = "null-user.jpg"
        
            setGear(res);
        });
        // eslint-disable-next-line
    }, [id])

    if (!gear) {
        return null;
    }

    return (
        <>
        <Row>
            <Col xs={12} sm={8} md={6}>
                <img width="100%" src={`/api/image/gear/${gear.imageLocation}`} alt={gear.headline} 
                    style={{maxHeight: "50vh"}} />
            </Col>
        </Row>
        <Row>

            <Col>
                <Row>
                    <GearDetails gear={gear} history={history} />
                    <MakeReservation gear={gear} />
                </Row>
                <Row>
                    <OwnerMore ownerId={gear.userProfileId} history={history} />
                    <OwnerDetails owner={gear.userProfile} />
                </Row>
            </Col>
        </Row>
        </>        
    );
}