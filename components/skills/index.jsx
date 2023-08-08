import React from "react";
import Section from "../shared/section";
import "./style.scss";
import TechIcons from "../../images/tech-icons.png";
import skillImage from "../../images/skill_image1.png";
import CallToAction from "../shared/CallToAction";
import { AiOutlineCloudDownload } from "react-icons/ai";
const Skills = () => {
    return (
        <Section
            background="dark"
            id="skills"
        >
            <div className="skills-content-wrapper">
                <div className="left-col">
                    <img
                        src={skillImage}
                        alt="skills"
                    />
                </div>
                <div className="right-col">
                    <p>
                        Build custom web applications from scratch,
                        incorporating both front-end and back-end components,
                        create interactive user interfaces using HTML, CSS, and
                        JavaScript.Create intuitive and responsive user
                        interfaces using HTML, CSS, and JavaScript frameworks
                        like React
                    </p>
                    <CallToAction
                        text="Download CV"
                        icon={
                            <AiOutlineCloudDownload
                                onClick={() => {
                                    window.open(
                                        "https://drive.google.com/file/d/1IJV4yhmSZh93imwrYYVUF6YdjJkCFw_I/view?usp=drive_link",
                                        "_blank"
                                    );
                                }}
                            />
                        }
                    />
                </div>
            </div>
        </Section>
    );
};

export default Skills;
