<%@ Page Title="" Language="C#" MasterPageFile="~/Header_Footer.Master" AutoEventWireup="true" CodeBehind="profileofuser.aspx.cs" Inherits="geekhub_Project.profileofuser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .spacing {
            margin-top: 20px;
        }
        .full-width-button {
            color: white;
            border: none;
            width: 100%;
            margin: 0 5px;
            display: inline-block;
            padding: 10px;
            border-radius: 4px;
            box-sizing: border-box;
        }
        .full-width-button-add {
            background-color: #007bff;
        }
        .full-width-button-update {
            background-color: #28a745;
        }
        .full-width-button-delete {
            background-color: #dc3545;
        }
        .button-container {
            display: flex;
            justify-content: center;
            gap: 10px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
        }
        .container {
            margin-top: 20px;
        }
        .card {
            margin-top: 0px;
            margin-bottom: 40px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            border-radius: 4px;
        }
        .back-to-home {
            display: block;
            margin-top: 0px;
            text-align: center;
            font-size: 16px;
            color: #007bff;
            text-decoration: none;
        }
        .circular-img {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            object-fit: cover;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-body">
                        <!-- Logo Section -->
                        <div class="row">
                            <div class="col text-center">
                                <img src="imgs/profile_3135715.png" width="80px" class="circular-img" />
                                <%--<img src="imgs/WhatsApp%20Image%202024-07-08%20at%2016.26.52_e8ed382b.jpg" width="80px" class="circular-img" />--%>
                            </div>
                        </div>

                        <!-- Title Section -->
                        <div class="row">
                            <div class="col text-center">
                                <center>
                                    <h4>Your Profile</h4>
                                    <span>Account Status - </span>
                                    <asp:Label class="badge rounded-pill text-bg-info" ID="Label1" runat="server" Text="status"></asp:Label>
                                </center>
                            </div>
                        </div>

                        <!-- Separator -->
                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>

                        <!-- Registration Form -->
                        <div class="row">
                            <!-- Full Name and Date of Birth -->
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="TextBox1">Full Name</label>
                                    <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Full Name"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="TextBox2">Date of Birth</label>
                                    <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Date of Birth" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <!-- Contact Number and Email ID -->
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="TextBox3">Contact Number</label>
                                    <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Contact Number"></asp:TextBox>
                                    <asp:RegularExpressionValidator 
                                        ID="ContactNumberValidator"
                                        runat="server"
                                        ControlToValidate="TextBox3"
                                        ValidationExpression="^\d{10}$"
                                        ErrorMessage="Please enter a valid 10-digit contact number."
                                        ForeColor="Red"
                                        Display="Dynamic" />
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="TextBox4">Email ID</label>
                                    <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Email ID" TextMode="Email"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <!-- Address Information -->
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Provinces</label>
                                    <asp:DropDownList CssClass="form-control" ID="DropDownList1" runat="server">
                                        <asp:ListItem Text="Select" Value="select" />
                                        <asp:ListItem Text="Province 1" Value="Province 1" />
                                        <asp:ListItem Text="Province 2" Value="Province 2" />
                                        <asp:ListItem Text="Bagmati" Value="Bagmati" />
                                        <asp:ListItem Text="Gandaki" Value="Gandaki" />
                                        <asp:ListItem Text="Lumbini" Value="Lumbini" />
                                        <asp:ListItem Text="Karnali" Value="Karnali" />
                                        <asp:ListItem Text="Sudurpachim" Value="Sudurpachim" />
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="TextBox6">City</label>
                                    <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="City"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="TextBox7">Pincode</label>
                                    <asp:TextBox CssClass="form-control" ID="TextBox7" runat="server" placeholder="Pincode" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <!-- Full Address -->
                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <label for="TextBox5">Full Address</label>
                                    <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="Full Address" TextMode="MultiLine" Rows="1"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <!-- Login Credential Section -->
                        <div class="row">
                            <div class="col text-center">
                                <span class="badge rounded-pill text-bg-success">Login Credential</span>
                            </div>
                        </div>

                        <!-- User ID and Password -->
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="TextBox8">User ID</label>
                                    <asp:TextBox CssClass="form-control" ID="TextBox8" runat="server" placeholder="User ID" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="TextBox9">Old Password</label>
                                    <asp:TextBox CssClass="form-control" ID="TextBox9" runat="server" placeholder="Old Password" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="TextBox10">New Password</label>
                                    <asp:TextBox CssClass="form-control" ID="TextBox10" runat="server" placeholder="New Password" TextMode="Password"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <!-- Buttons -->
                        <div class="row">
                            <div class="col button-container">
                                <asp:Button CssClass="full-width-button full-width-button-update" ID="ButtonUpdate" runat="server" Text="Update" OnClick="ButtonUpdate_Click" />
                                <asp:Button CssClass="full-width-button full-width-button-delete" ID="ButtonDelete" runat="server" Text="Delete" OnClick="ButtonDelete_Click" />
                            </div>
                        </div>

                    </div>
                    <a href="index.aspx" class="back-to-home"><< Back to Home</a>
                </div>
            </div>

<%--            <div class="col-md-7">
                <div class="card">
                    <div class="card-body">
                        <!-- Profile Image Section -->
                        <div class="row">
                            <div class="col text-center">
                                <img src="imgs/WhatsApp%20Image%202024-07-08%20at%2016.26.52_e8ed382b.jpg" width="80px" class="circular-img" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>--%>
        </div>
    </div>
</asp:Content>