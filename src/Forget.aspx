<%@ Page Title="" Language="C#" MasterPageFile="~/PSL.Master" AutoEventWireup="true" CodeBehind="Forget.aspx.cs" Inherits="PSL_WEBSITE.Forget" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">

        <div class="form-signin" style="text-align:center; margin-top:5%">
            <h2 class="form-signin-heading">Recovery Password</h2>
            <label for="inputEmail" class="sr-only">Email address</label>
            <input type="email" id="inputEmail" class="form-control" placeholder="Email address" required="" autofocus="" style="width:40% ; margin-left:30% ; text-align:center" />
            <button class="btn btn-lg btn-primary btn-block" type="submit" style="width:10%;margin-left:45%;margin-top:2%">Recover</button>
        </div>
        </div>
</asp:Content>
