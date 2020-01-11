<%@ Page Title="" Language="C#" MasterPageFile="~/PSL.Master" AutoEventWireup="true" CodeBehind="Sign_Up.aspx.cs" Inherits="PSL_WEBSITE.Sign_Up" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="form-signin" style="text-align:center; margin-top:5%">
            <h2 class="form-signin-heading">Sign Up</h2>
            <label for="inputEmail" class="sr-only">Email address</label>
            <asp:TextBox runat="server" type="email"  id="inputEmail" class="form-control" placeholder="Email address" required="" autofocus="" style="width:40% ; margin-left:30% ;margin-top:15px; text-align:center"/>
            <label for="inputPassword" class="sr-only">Password</label>
            <asp:TextBox runat="server" type="password"  id="inputPassword" class="form-control" placeholder="Password" required="" style="width:40%; margin-left:30%;margin-top:15px;text-align:center"/>
            <label for="name" class="sr-only">Name</label>
            <asp:TextBox runat="server" type="text" id="name" class="form-control" placeholder="Name" required="" autofocus="" style="width:40% ; margin-left:30% ; margin-top:15px;text-align:center" />          
            <label for="name" class="sr-only">Occupation</label>
            <asp:TextBox runat="server" type="text" id="occupation" class="form-control" placeholder="Occupation" required="" autofocus="" style="width:40% ; margin-left:30% ; margin-top:15px;text-align:center" />          
             <label for="name" class="sr-only">Region</label>
            <asp:TextBox runat="server" type="text" id="region" class="form-control" placeholder="Region" required="" autofocus="" style="width:40% ; margin-left:30% ; margin-top:15px;text-align:center" />          
            <h5><strong>BirthDate</strong></h5>
        <asp:TextBox runat="server" type="date" id="date"  class="form-control" required="" autofocus="" style="width: 20%; margin-left: 40%; text-align: center" /> &nbsp;<div>
               <h5><strong>Gender&nbsp; </strong>
               </h5>
                <h5><asp:DropDownList ID="Gender" type="dropdown" runat="server" Width="102px">
                   <asp:ListItem Value="&#39;M&#39;">Male</asp:ListItem>
                   <asp:ListItem Value="&#39;F&#39;">FEMALE</asp:ListItem>
               </asp:DropDownList>
               </h5>
         <asp:Label ID="Label1" runat="server" Text=""></asp:Label>


               </div>
       
         <asp:Button ID="btnLogin" runat="server" class="btn btn-primary btn-lg" OnClick="btnSubmit" Text="Rgister" style="margin-top:2%" />


     </div>
</asp:Content>

