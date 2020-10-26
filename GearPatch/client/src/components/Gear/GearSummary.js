import React, { useState } from "react";
import { useHistory } from "react-router-dom";
import { Card, CardImg, CardBody, CardTitle, CardImgOverlay, CardText } from "reactstrap";

export default function GearSummary({ gearItem }) {

    const [showOwner, setShowOwner] = useState(false);

    const history = useHistory();

    const cardHover = (evt) => {
        evt.currentTarget.src = gearItem.userProfile.imageLocation;
        setShowOwner(true);
    }

    const notCardHover = (evt) => {
        evt.currentTarget.src = gearItem.imageLocation;
        setShowOwner(false)
    }

    return (
        <Card onMouseEnter={cardHover} onMouseLeave={notCardHover} onClick={() => history.push(`/gear/${gearItem.id}`)}>
            {/* Show owner's image when mouse is positioned over the item */}
            {showOwner
            ? <>
                <CardImg top width="100%" src={gearItem.userProfile.imageLocation} alt={gearItem.userProfile.lastName}/>
                <CardImgOverlay width="100%" height="100%" className="d-flex align-items-center">
                    <CardBody>
                        <CardText className="text-center text-white">
                            <h2>{gearItem.userProfile.firstName} {gearItem.userProfile.lastName[0]}.</h2>
                        </CardText>
                    </CardBody>
                </CardImgOverlay>
            </>
            : <CardImg top width="100%" src={gearItem.imageLocation} alt={gearItem.headline}/>
            }

            <CardBody>
                <CardTitle className="text-center">{gearItem.headline}</CardTitle>
            </CardBody>
        </Card>
    );
}