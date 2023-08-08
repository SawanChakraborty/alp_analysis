import React from "react";
import "./style.scss";
import { FaPhoneAlt } from "react-icons/fa";
import { MdEmail } from "react-icons/md";
const ContactInfo = () => {
    return (
        <div className="contact-info-box">
            <h4>
                I welcome inquiries,doubts, or any other relevant messages.
                Please feel free to reach out, and I will respond promptly. I
                look forward to connecting with you!
            </h4>
            <div className="contact-option">
                <FaPhoneAlt />
                <span className="text">+91 6291379764</span>
            </div>
            <div className="contact-option">
                <MdEmail />
                <span className="text">sawanchakraborty2308@gmail.com</span>
            </div>
        </div>
    );
};

export default ContactInfo;
