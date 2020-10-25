import React, { useState } from "react";
import { NavLink as RRNavLink } from "react-router-dom";
import { Navbar, NavbarBrand, NavbarToggler, Collapse, Nav, NavItem, NavLink } from "reactstrap";

export default function Header() {

    const [isOpen, setIsOpen] = useState(false);
    const [modal, setModal] = useState(false);

    const toggle = () => setIsOpen(!isOpen);
    const modalToggle = () => setModal(!modal);

    return (
        <header>
            <Navbar color="secondary" dark fixed="top" expand="lg">
                <NavbarBrand tag={RRNavLink} to="/">GearPatch</NavbarBrand>
                <NavbarToggler onClick={toggle} />
                <Collapse isOpen={isOpen} navbar>
                    <Nav navbar>
                        <NavItem>
                            <NavLink tag={RRNavLink} to="/register">Sign Up</NavLink>
                        </NavItem>
                        <NavItem>
                            <NavLink tag={RRNavLink} to="/login">Sign In</NavLink>
                        </NavItem>
                        <NavItem>
                            <NavLink tag={RRNavLink} to="/gear/new">List Your Gear</NavLink>
                        </NavItem>
                    </Nav>
                </Collapse>
                <Modal isOpen={modalOpen} toggle={modalToggle} backdrop={"static"} keyboard={true}>
                    <Login modalToggle={modalToggle}
                </Modal>
            </Navbar>
        </header>  
    );
}