import React, { useState } from "react";
import "./style.scss";
import Section from "../shared/section";
import Filters from "./filters";
import Showcase from "./showcase";
const projectsData = [
    {
        id: 1,
        name: "Movie Streaming App",
        tags: ["web-page", "mobile-app"],
        media: {
            thumbnail: require("../../images/movixApp.png"),
        },
    },
    {
        id: 2,
        name: "TimeSquare",
        tags: ["web-page"],
        media: {
            thumbnail: require("../../images/watchkart.png"),
        },
    },
    {
        id: 3,
        name: "Sales Dashboard",
        tags: ["web-app"],
        media: {
            thumbnail: require("../../images/dashboard.png"),
        },
    },
    {
        id: 4,
        name: "Amazon-Clone",
        tags: ["web-app", "web-page"],
        media: {
            thumbnail: require("../../images/amazonclone.png"),
        },
    },
];

const Portfolio = () => {
    const [projects, setProjects] = useState(projectsData);
    const [transition, setTransition] = useState(false);

    const filterProjects = (tag) => {
        setTransition("zoomout");
        setTimeout(() => {
            if (tag != "all") {
                const filteredProjects = projectsData.filter((f) =>
                    f.tags.includes(tag)
                );
                setProjects(filteredProjects);
            } else {
                setProjects(projectsData);
            }
            setTransition("zoomin");
        }, [200]);

        setTimeout(() => {
            setTransition(false);
        }, 600);
    };
    return (
        <Section
            id="portfolio"
            title="Check my Portfolio"
            backgrounds="light"
        >
            <div className="portfolio-content-wrapper">
                <Filters filterProjects={(tag) => filterProjects(tag)} />
                <Showcase
                    data={projects}
                    transition={transition}
                />
            </div>
        </Section>
    );
};

export default Portfolio;
