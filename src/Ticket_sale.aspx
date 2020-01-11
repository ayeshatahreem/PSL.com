<%@ Page Title="" Language="C#" MasterPageFile="~/PSL.Master" AutoEventWireup="true" CodeBehind="Ticket_sale.aspx.cs" Inherits="PSL_WEBSITE.Ticket_sale" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <h3 style="margin-top:5% ;margin-left:20%">Tickets</h3>
    <h3 visible="false"
        style="background-color: blue; color: white; margin-top: 1%; margin-left: 20%; width: 193px;">Price: RS. 5000/-</h3>
    <div class="form-signin" style="text-align: center; margin-top: 1%">
            <h3 style="text-align:left; margin-left:20%; width: 198px; height: 31px; background-color:green;border:double">
                Cash on Delivery!
            </h3>
             <h4 style="text-align:left; margin-left:20%;margin-top:2%;width: 135px; height: 20px;">
                Postal Address!
            </h4>
        <asp:TextBox ID="TextBox1" runat="server" class="form-control" Style="margin-top: 1%; margin-left: 20%" Height="96px" Width="516px" CausesValidation="True" TextMode="MultiLine" AutoCompleteType="BusinessStreetAddress"></asp:TextBox> 
      <asp:Label ID="Label1" runat="server" Text=""
        style="margin-top:1%"></asp:Label>
        <asp:Button ID="post" runat="server" Text="Buy" class="btn btn-lg btn-primary btn-block" type="submit" style="margin-left:20%;margin-top:1%" OnClick="buy_Click" Height="40px" Width="80px"/>

    </div>

       
       
    
   
</asp:Content>
