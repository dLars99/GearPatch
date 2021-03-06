import React, { useEffect, useState, useContext } from "react"
import { useParams, useHistory } from "react-router-dom";
import { GearContext } from "../../providers/GearProvider";
import { Row, Col } from "reactstrap";
import GearDetails from "./GearDetails";
import EditGear from "./EditGear";
import OwnerControls from "./OwnerControls";

export default function GearList() {

    const [gear, setGear] = useState();
    const [editActive, setEditActive] = useState(false);

    const { id } = useParams();
    const { getGearItem } = useContext(GearContext);

    const history = useHistory();
    const currentUserId = JSON.parse(sessionStorage.userProfile).id
    
    const toggleEdit = () => setEditActive(!editActive);

    useEffect(() => {
        getGearItem(id).then((res) => {
            if (res.userProfileId !== currentUserId) {
                // Kick out of owner view if user is not the owner
                history.push(`/gear/${res.id}`);
            }
            if (!res.imageLocation) res.imageLocation = 'null-gear.png'
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
                <img src={`/api/image/gear/${gear.imageLocation}`} alt={gear.headline}
                    style={{maxHeight: "50vh"}} />
            </Col>
        </Row>
        <Row className="mb-5">
            {editActive
            ? <EditGear gear={gear} toggleEdit={toggleEdit} />
            : <GearDetails gear={gear} history={history}/>
            }
            <OwnerControls toggleEdit={toggleEdit} isActive={gear.isActive} gearId={gear.id} />
        </Row>
        </>        
    );
}