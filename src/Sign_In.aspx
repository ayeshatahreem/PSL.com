<%@ Page Title="" Language="C#" MasterPageFile="~/PSL.Master" AutoEventWireup="true" CodeBehind="Sign_In.aspx.cs" Inherits="PSL_WEBSITE.Sign_In" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 557px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="form-signin" style="text-align:center; margin-top:5%">
            <h2 class="form-signin-heading">Please sign in</h2>
            <label for="inputEmail" class="sr-only">Email address</label>
            <asp:TextBox runat="server" type="email" ID="inputEmail" class="form-control" placeholder="Email address" required=""  Style="width: 40%; margin-left: 30%; text-align: center" />
            <label for="inputPassword" class="sr-only">Password</label>
            <asp:TextBox runat="server" type="password" ID="inputPassword" class="form-control" placeholder="Password" required="" Style="width: 40%; margin-left: 30%; margin-top: 15px; text-align: center" />
            <div class="checkbox">
                <a href="Forget.aspx" target="">Forgot password?</a>
                <a href="Sign_Up.aspx" target="">don't have a account sign up</a>
            </div>
            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
           <table>
               <tr>
                   <td class="auto-style1">
                       <asp:Button ID="signin" runat="server" Text="SignIn" class="btn btn-lg btn-primary btn-block" type="submit" style="margin-left:95%" OnClick="signin_Click" Width="15%" Height="40px"/>
            
                   </td>
                   <td>
            <asp:Button ID="Admin" runat="server" Text="Admin" class="btn btn-lg btn-primary btn-block" type="submit" style="margin-left:75%" OnClick="Admin_Click" Height="40px" Width="100%"/>

                   </td>
               </tr>
           </table>
            
        </div>
        
    
</asp:Content>
