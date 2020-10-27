import React, { useState, useContext, useEffect } from "react";
import { NavLink as RRNavLink } from "react-router-dom";
import Login from "./Login/Login";
import { Navbar, NavbarBrand, NavbarToggler, Collapse, Nav, NavItem, NavLink, Badge } from "reactstrap";
import { UserProfileContext } from "../providers/UserProfileProvider";
import { MessageContext } from "../providers/MessageProvider";

export default function Header() {

    const {isLoggedIn} = useContext(UserProfileContext);
    const { unread, getUnread } = useContext(MessageContext);

    const [isOpen, setIsOpen] = useState(false);
    const [modal, setModal] = useState(false);
    
    const toggle = () => setIsOpen(!isOpen);
    const modalToggle = () => setModal(!modal);

    useEffect(() => {
        getUnread()
        // eslint-disable-next-line
    }, [isLoggedIn])

    return (
        <header>
            <Navbar color="secondary" dark fixed="top" expand="lg">
                <NavbarBrand tag={RRNavLink} to="/">GearPatch</NavbarBrand>
                <NavbarToggler onClick={toggle} />
                <Collapse isOpen={isOpen} navbar>
                    {console.log(unread)}
                    <Nav navbar>
                        {isLoggedIn
                        ? <>
                            <NavItem>
                                <NavLink tag={RRNavLink} to="/">
                                    Messages<Badge color="primary" pill>{unread}</Badge>
                                    </NavLink>
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