<%@ Page Title="" Language="C#" MasterPageFile="~/ADMIN_USER.Master" AutoEventWireup="true" CodeBehind="Add_match.aspx.cs" Inherits="PSL_WEBSITE.Add_match" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 style="text-align:center;margin-top:5%">Add Match</h2>
    <div style="margin-left:30%;margin-top:1%;width:40%; align-self:center; text-align:center;">
    <h3 style="background-color:green;border-bottom-color:black;" >Home Team</h3>
        <asp:DropDownList  ID="DropDownList1" runat="server">
            <asp:ListItem Value="1">IslamabadUnited</asp:ListItem>
            <asp:ListItem Value="2">Karachi Kings</asp:ListItem>
            <asp:ListItem Value="3">Lahore Qalendar</asp:ListItem>
            <asp:ListItem Value="4">Peshawar Zalmi</asp:ListItem>
            <asp:ListItem Value="5">Quetta Gladiators</asp:ListItem>
            <asp:ListItem></asp:ListItem>
        </asp:DropDownList>
     <h3 style="background-color:green;border-bottom-color:black" >Away Team</h3>
        <asp:DropDownList ID="DropDownList2" runat="server">
            <asp:ListItem Value="1">IslamabadUnited</asp:ListItem>
            <asp:ListItem Value="2">Karachi Kings</asp:ListItem>
            <asp:ListItem Value="3">Lahore Qalendar</asp:ListItem>
            <asp:ListItem Value="4">Peshawar Zalmi</asp:ListItem>
            <asp:ListItem Value="5">Quetta Gladiators</asp:ListItem>
            <asp:ListItem></asp:ListItem>
        </asp:DropDownList>
         <h3 style="background-color:green;;border-bottom-color:black" >Stadium</h3>
        <asp:DropDownList ID="DropDownList3" runat="server">
            <asp:ListItem Value="1">Dubai</asp:ListItem>
            <asp:ListItem Value="2">Sharjah</asp:ListItem>
        </asp:DropDownList>
         <h3 style="background-color:green;border-bottom-color:black" >Date</h3>
        <asp:Calendar BorderColor="Black" style="margin-left:30%" DayHeaderStyle-BackColor="Green" BackColor="Black" ForeColor="White" ID="Calendar1" runat="server"></asp:Calendar>
         <h3 style="background-color:green;border-bottom-color:black" >Time</h3>
        <asp:DropDownList ID="DropDownList4" runat="server">
            <asp:ListItem Value="1">Evening</asp:ListItem>
            <asp:ListItem Value="2">Night</asp:ListItem>
        </asp:DropDownList>
       
    </div>
    <div>
    <asp:Label ID="Label1" runat="server" style="margin-left:42%; margin-top:1%" Text=""></asp:Label>
     </div>
        <asp:Button ID="Button1" class="btn btn-primary btn-lg"  OnClick="btnSubmit" style="margin-left:47.3%; margin-top:1%" runat="server" Text="Add" />
</asp:Content>
