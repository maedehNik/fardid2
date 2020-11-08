<%@ Page Title="" Language="C#" MasterPageFile="~/CusromerSideMaster.Master" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="Fardid.ContactUs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="main">
    <section class="contact-section col-lg-12 col-md=12 col-sm-12 col-xs-12">
        <div class="container">
            <div class="container custom-alert">
                <div>

                </div>
            </div>
            <div id="contactForm" autocomplete="off">
                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                    <label for="nameinp">
                        NAME:
                    </label>
                    <%--<input type="text" name="name" id="nameinp" placeholder="Enter Your Name">--%>
                    <asp:TextBox ID="TextBox_Name" runat="server" PlaceHolder="Enter Your Name" ></asp:TextBox>
                    <asp:Label ID="Label_Name" runat="server" Text="" ForeColor="#573285"></asp:Label>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                    <label for="emailinp">
                        EMAIL:
                    </label>
                    <%--<input type="text" name="email" id="emailinp" placeholder="Enter Your Email">--%>
                    <asp:TextBox ID="TextBox_Email" runat="server" PlaceHolder="Enter Your Email"></asp:TextBox>
                    <asp:Label ID="Label_Email" runat="server" Text="" ForeColor="#573285"></asp:Label>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                    <label for="subjectinp">
                        SUBJECT:
                    </label>
                    <%--<input type="text" name="subject" id="subjectinp" placeholder="Enter Your Subject">--%>
                    <asp:TextBox ID="TextBox_Sub" runat="server" PlaceHolder="Enter Your Subject"></asp:TextBox>
                    <asp:Label ID="Label_Sub" runat="server" Text="" ForeColor="#573285"></asp:Label>
                </div>
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <label for="messageinp">
                        MESSAGE:
                    </label>
                    <%--<textarea name="message" id="messageinp" placeholder="Your Message Here..."></textarea>--%>
                    <asp:TextBox ID="TextBox_Message" runat="server" PlaceHolder="Your Message Here..." TextMode="MultiLine"></asp:TextBox>
                    <asp:Label ID="Label_Message" runat="server" Text="" ForeColor="#573285"></asp:Label>
                </div>
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <%--<input value="SEND MESSAGE" id="sendinp" onclick="return Click()">--%>
                    <asp:Button ID="Button1" runat="server" Text="SEND MESSAGE" OnClick="Button1_Click" Style="background-color: #573285; color: white; border: none; transition: all ease .5s; padding: 2px 4px; font-size: 13px;" Width="90 px"/>
                   
                </div>
            </div>
        </div>
    </section>
</div>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder_Script" runat="server">
    <script>
        function Click() {
            alert("Helooo");
            return false
        }
    </script>
</asp:Content>