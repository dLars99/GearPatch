import React, { useEffect, useState, useContext } from "react";
import { Col } from "reactstrap";

export default function OwnerMore({ ownerId }) {

    return (
        <Col xs={12} md={8}>
            <p>{ownerId}</p>
        </Col>
    );
}