import React, { useState, useContext, useEffect } from "react";
import { useHistory, useLocation, NavLink as RRNavLink } from "react-router-dom";
import Login from "./Users/Login";
import { Navbar, Dropdown, DropdownToggle, DropdownMenu, DropdownItem, NavbarBrand, NavbarToggler,
    Collapse, Nav, NavItem, NavLink, Badge, Button } from "reactstrap";
import { UserProfileContext } from "../providers/UserProfileProvider";
import { MessageContext } from "../providers/MessageProvider";
import { ReservationContext } from "../providers/ReservationProvider";

export default function Header() {

    const { isLoggedIn, logout } = useContext(UserProfileContext);
    const { unread, getUnread } = useContext(MessageContext);
    const { unconfirmed, getUnconfirmed } = useContext(ReservationContext);

    const [isOpen, setIsOpen] = useState(false);
    const [modal, setModal] = useState(false);
    const [dropdownOpen, setDropdownOpen] = useState(false);
     
    const toggle = () => setIsOpen(!isOpen);
    const modalToggle = () => setModal(!modal);
    const headerToggle = () => setDropdownOpen(!dropdownOpen);

    const history = useHistory();
    const location = useLocation();

    const newItemButton = (evt) => {
        evt.preventDefault();
        if (isLoggedIn) {
            history.push("/gear/new");
        } else {
            alert("Sign Up or Sign In to list gear.")
        }
    }

    const refreshCounters = () => {
        getUnread();
        getUnconfirmed();
    }

    useEffect(() => {
        refreshCounters();
        let interval = null;
        if (isLoggedIn) {
            interval = setInterval(() => {
                refreshCounters();
            }, 5000)

            return () => clearInterval(interval);
        } else if (!isLoggedIn) {
            clearInterval(interval);
        }
        // eslint-disable-next-line
    }, [isLoggedIn])

    return (
        <header>
            <Navbar color="secondary" light fixed="top" expand="lg">
                {isLoggedIn
                ? <Dropdown nav isOpen={dropdownOpen} toggle={headerToggle}>
                    <DropdownToggle nav>
                        <NavbarBrand>GearPatch</NavbarBrand>
                    </DropdownToggle>
                    <DropdownMenu>
                        <DropdownItem tag={RRNavLink} to="/">Homepage</DropdownItem>
                        <DropdownItem tag={RRNavLink} to="/user">User Profile</DropdownItem>
                    </DropdownMenu>
                </Dropdown>
                : <NavbarBrand tag={RRNavLink} to="/">GearPatch</NavbarBrand>
                }

                <NavbarToggler onClick={toggle} />
                <Collapse isOpen={isOpen} navbar>
                    <Nav navbar className="ml-auto">
                        {isLoggedIn
                        ? <>
                            <NavItem>
                                <NavLink tag={RRNavLink} to="/messages">
                                    Messages <Badge color="primary" pill>{unread}</Badge>
                                    </NavLink>
                            </NavItem>
                            <NavItem>
                                <NavLink tag={RRNavLink} to="/reservations">
                                    Reservations <Badge color="primary" pill>{unconfirmed}</Badge>
                                </NavLink>
                            </NavItem>
                            <NavItem>
                                <NavLink tag={RRNavLink} to="/gear/mygear">
                                    My Gear
                                </NavLink>
                            </NavItem>
                            <NavItem>
                                {/* eslint-disable-next-line */}
                                <a aria-current="page" className="nav-link"
                                    style={{ cursor: "pointer" }} onClick={logout}>Logout</a>
                            </NavItem>
                        </>
                        : <>
                            <NavItem>
                                <NavLink tag={RRNavLink} to="/register">Sign Up</NavLink>
                            </NavItem>
                            <NavItem className="mx-0 mx-lg-1">
                                {/* eslint-disable-next-line */}
                                <a aria-current="page" className="nav-link"
                                    style={{ cursor: "pointer" }} onClick={modalToggle}>Sign In</a>
                            </NavItem>
                        </>
                        }
                        <NavItem>
                            <Button type="button" color="primary" onClick={newItemButton}>List Your Gear</Button>
                        </NavItem>

                    </Nav>
                </Collapse>
                    <Login modal={modal} modalToggle={modalToggle} />
            </Navbar>
        </header>  
    );
}