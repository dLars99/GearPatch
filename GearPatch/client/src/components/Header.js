import React, { useState, useContext } from "react";
import { NavLink as RRNavLink } from "react-router-dom";
import Login from "./Login/Login";
import { Navbar, NavbarBrand, NavbarToggler, Collapse, Nav, NavItem, NavLink } from "reactstrap";
import { UserProfileContext } from "../providers/UserProfileProvider";

export default function Header() {

    const {isLoggedIn} = useContext(UserProfileContext);

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
                        {isLoggedIn
                        ? <>
                            <NavItem>
                                <NavLink tag={RRNavLink} to="/">Messages</NavLink>
                            </NavItem>
                            <NavItem>
                                <NavLink tag={RRNavLink} to="/reservations">Reservations</NavLink>
                            </NavItem>
                        </>
                        : <>
                            <NavItem>
                                <NavLink tag={RRNavLink} to="/register">Sign Up</NavLink>
                            </NavItem>
                            <NavItem className="mx-0 mx-lg-1">
                                <a aria-current="page" className="nav-link"
                                    style={{ cursor: "pointer" }} onClick={modalToggle}>Sign In</a>
                            </NavItem>
                        </>
                        }
                        <NavItem>
                            <NavLink tag={RRNavLink} to="/gear/new">List Your Gear</NavLink>
                        </NavItem>
                    </Nav>
                </Collapse>
                    <Login modal={modal} modalToggle={modalToggle} />
            </Navbar>
        </header>  
    );
}