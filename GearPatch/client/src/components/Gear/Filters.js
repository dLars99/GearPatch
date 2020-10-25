import React from "react";
import { useHistory } from "react-router-dom";
import { Button } from "reactstrap";

export default function Filters() {

    const history = useHistory();

    return (
        <Button type="button" onClick={() => history.goBack()}>Back to search results</Button>
    )
}