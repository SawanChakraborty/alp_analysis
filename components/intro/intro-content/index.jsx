import myphoto3 from "../../../images/myphoto3.png";
import myphoto101 from "../../../images/mypic101.png";
import myphoto102 from "../../../images/mypic102.png";
import myphoto103 from "../../../images/mypic103.png";
import myphoto106 from "../../../images/mypic107.png";
import { HiCode } from "react-icons/hi";
import React from "react";
import { BsAwardFill } from "react-icons/bs";
import { FaReact } from "react-icons/fa";
import { scrollToSection } from "../../utils/helpers";
import girl from "../../../images/girl.png";
import hand from "../../../images/hand.png";
import CallToAction from "../../shared/CallToAction";

import "./style.scss";

const IntroContent = () => {
    return (
        <div className="intro-content">
            <div className="layout">
                <div className="left-col">
                    <h1 className="title">
                        <span className="small-text">
                            <span className="text">Hello</span>
                            <span className="icon">
                                <img src={hand} />
                            </span>
                            <span className="text">, I Am</span>
                        </span>
                        <span className="big-text">Sawan Chakraborty</span>
                    </h1>
                    <p>
                        Code enthusiast skilled in frontend and backend
                        development, creating smooth digital experiences, I have
                        experience of building Portfolio Website, movie
                        streaming web application and an e-commerce website.
                    </p>
                    <CallToAction
                        text="Contact me"
                        action={() => scrollToSection("contact")}
                    />
                </div>
                <div className="right-col">
                    <img
                        src={myphoto106}
                        alt="Sawan Photo"
                    />

                    <div className="highlights horizontal">
                        <div className="icon">
                            <HiCode />
                        </div>
                        <div className="text">400+ Coding Questions</div>
                    </div>

                    <div className="highlights verticle">
                        <div className="icon">
                            <BsAwardFill />
                        </div>
                        <div className="text">
                            <span>98.58 %ile</span>
                            in GATE
                        </div>
                    </div>
                </div>
            </div>
        </div>
    );
};

export default IntroContent;
