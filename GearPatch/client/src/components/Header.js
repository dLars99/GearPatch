import React, { useContext, useState } from "react";
import { NavLink as RRNavLink } from "react-router-dom";
import { Navbar, NavbarBrand, NavbarToggler, Collapse, Nav, NavItem, NavLink } from "reactstrap";

export default function Header() {

    const [isOpen, setIsOpen] = useState(false);

    const toggle = () => setIsOpen(!isOpen);

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
            </Navbar>
        </header>  
    );
}