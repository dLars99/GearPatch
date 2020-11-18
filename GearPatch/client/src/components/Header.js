import React, { useState, useContext, useEffect } from "react";
import { useHistory, NavLink as RRNavLink } from "react-router-dom";
import Login from "./Users/Login";
import { Navbar, Dropdown, DropdownToggle, DropdownMenu, DropdownItem, NavbarBrand, NavbarToggler,
    Collapse, Nav, NavItem, NavLink, Badge, Button } from "reactstrap";
import { UserProfileContext } from "../providers/UserProfileProvider";
import { MessageContext } from "../providers/MessageProvider";
import { ReservationContext } from "../providers/ReservationProvider";
import { HubConnectionBuilder } from "@microsoft/signalr";

export default function Header() {

    const { isLoggedIn, logout } = useContext(UserProfileContext);
    const { unread, setUnread, getUnread } = useContext(MessageContext);
    const { unconfirmed, getUnconfirmed } = useContext(ReservationContext);

    const [isOpen, setIsOpen] = useState(false);
    const [modal, setModal] = useState(false);
    const [dropdownOpen, setDropdownOpen] = useState(false);
     
    const toggle = () => setIsOpen(!isOpen);
    const modalToggle = () => setModal(!modal);
    const headerToggle = () => setDropdownOpen(!dropdownOpen);

    const history = useHistory();

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
        let interval = null;
        if (isLoggedIn) {
            const connection = new HubConnectionBuilder()
                .withUrl('https://localhost:3000/api/hubs/message')
                .withAutomaticReconnect()
                .build();

            connection.start()
            .then(result => {
                console.log("Message connection established!");

                connection.on('UpdateCount', messageCount => {
                    setUnread(messageCount);
                });
            })
            .catch(e => console.log("Connection failed: ", e));            
        }
        // eslint-disable-next-line
    }, [isLoggedIn])

    return (
        <header>
            <Navbar color="secondary" light fixed="top" expand="lg" className="align-items-center">
                {isLoggedIn
                ? <Dropdown isOpen={dropdownOpen} toggle={headerToggle}>
                    <DropdownToggle nav>
                        <span className="navbar-brand h1">GearPatch</span>
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
                            <NavItem className="mx-lg-3">
                                <NavLink tag={RRNavLink} to="/messages">
                                    Messages {' '}
                                    {unread !== 0 
                                    ?<Badge color="primary" pill>{unread}</Badge>
                                    : null}
                                    </NavLink>
                            </NavItem>
                            <NavItem className="mx-lg-3">
                                <NavLink tag={RRNavLink} to="/reservations">
                                    Reservations {' '}
                                    {unconfirmed !== 0
                                    ? <Badge color="primary" pill>{unconfirmed}</Badge>
                                    : null}
                                </NavLink>
                            </NavItem>
                            <NavItem className="mx-lg-3">
                                <NavLink tag={RRNavLink} to="/gear/mygear">
                                    My Gear
                                </NavLink>
                            </NavItem>
                            <NavItem className="mx-lg-3">
                                {/* eslint-disable-next-line */}
                                <a aria-current="page" className="nav-link"
                                    style={{ cursor: "pointer" }} onClick={logout}>Logout</a>
                            </NavItem>
                        </>
                        : <>
                            <NavItem className="mx-lg-3">
                                <NavLink tag={RRNavLink} to="/register">Sign Up</NavLink>
                            </NavItem>
                            <NavItem className="mx-0 mx-lg-1">
                                {/* eslint-disable-next-line */}
                                <a aria-current="page" className="nav-link"
                                    style={{ cursor: "pointer" }} onClick={modalToggle}>Sign In</a>
                            </NavItem>
                        </>
                        }
                        <NavItem className="mx-lg-3">
                            <Button type="button" color="primary" onClick={newItemButton}>List Your Gear</Button>
                        </NavItem>

                    </Nav>
                </Collapse>
                    <Login modal={modal} modalToggle={modalToggle} />
            </Navbar>
        </header>  
    );
}