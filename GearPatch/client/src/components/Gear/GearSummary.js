import React, { useState } from "react";
import { Col, Card, CardImg, CardBody, CardTitle, CardText, CardImgOverlay } from "reactstrap";

export default function GearSummary({ gearItem, history }) {

    const [showOwner, setShowOwner] = useState(false);

    // Set default images if no image present
    if (!gearItem.imageLocation) gearItem.imageLocation = 'null-gear.png'
    if (!gearItem.userProfile.imageLocation) gearItem.userProfile.imageLocation = "null-user.jpg"

    const cardHover = (evt) => {
        evt.currentTarget.src = gearItem.userProfile.imageLocation;
        setShowOwner(true);
    }

    const notCardHover = (evt) => {
        evt.currentTarget.src = gearItem.imageLocation;
        setShowOwner(false)
    }

    return (
        <Col sm={6} md={4} lg={3} xl={2}>
        <Card onMouseEnter={cardHover} onMouseLeave={notCardHover} onClick={() => history.push(`/gear/${gearItem.id}`)}>
            {/* Show owner's image when mouse is positioned over the item */}
            {showOwner
            ? <>
                <CardImg top src={gearItem.userProfile.imageLocation.startsWith("http") ? gearItem.userProfile.imageLocation : `/user-images/${gearItem.userProfile.imageLocation}`} alt={gearItem.userProfile.fullName}/>
                <CardImgOverlay width="100%" height="100%" className="d-flex align-items-center">
                    <CardBody>
                        <CardTitle className="text-center text-white">
                            <h2>{gearItem.userProfile.fullName}</h2>
                        </CardTitle>
                    </CardBody>
                </CardImgOverlay>
            </>
            : <CardImg top width="100%" src={gearItem.imageLocation.startsWith("http") ? gearItem.imageLocation : `/api/image/gear/${gearItem.imageLocation}`} alt={gearItem.headline}/>
            }

            <CardBody>
                <CardTitle className="text-center"><strong>{gearItem.headline}</strong></CardTitle>
                <CardText className="text-center">{gearItem.manufacturer} {gearItem.model}</CardText> 
            </CardBody>
        </Card>
        {!gearItem.isActive
        ? <p className="text-center"><em>Inactive</em></p>
        : null}
        </Col>
    );
}