<%@ Page Title="About GeekHub" Language="C#" MasterPageFile="~/Header_Footer.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="geekhub_Project.About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/About.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="about-container">
        <div class="about-content">
            <h2>About Padhante</h2>
            <p>Welcome to Padhante, your trusted partner in digital learning. We are an innovative e-learning management system designed to transform the way students and educators connect, collaborate, and grow. At Padhante, we believe that education should be accessible, engaging, and tailored to individual learning journeys.

Our platform offers a seamless experience for managing courses, tracking progress, and fostering interactive learning environments. Whether you're a student striving for academic excellence or an educator looking to deliver impactful lessons, Padhante empowers you with the tools to succeed.</p>
            <p>Our mission is to revolutionize education through technology by providing a smart, flexible, and inclusive learning ecosystem that supports lifelong learning.</p>

            <h3>Why Choose Padhante</h3>
            <ul>
                <li>Intuitive and user-friendly interface</li>
                <li>Real-time performance tracking and analytics</li>
                <li>Customizable course management tools</li>
                <li>Dedicated Labs for Practical Assessments</li>
                <li>learning via quizzes, virtual labs, discussions, and simulations</li>
            </ul>
        </div>

        <div class="about-image">
            <img src="imgs/LearningMan.jpg" />
        </div>
    </div>
</asp:Content>
