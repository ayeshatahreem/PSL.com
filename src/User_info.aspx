<%@ Page Title="" Language="C#" MasterPageFile="~/ADMIN_USER.Master" AutoEventWireup="true" CodeBehind="User_info.aspx.cs" Inherits="PSL_WEBSITE.User_info" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3 style="margin-left:20%; margin-top:5%">User Information</h3>
    <asp:GridView ID="GridView1" runat="server"
        HeaderStyle-BackColor="Green"
        BorderColor="Black"
        RowStyle-BorderColor="Black"
        HeaderStyle-BorderColor="Green"
        Style="margin-left: 20%; margin-top: 1%"
        RowStyle-ForeColor="White"
        HeaderStyle-HorizontalAlign="Justify"
        RowStyle-BorderWidth="0"
        RowStyle-BackColor="black"
        SortedAscendingCellStyle-Height="241px"
        Width="60%" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
        <Columns>
             <asp:TemplateField HeaderText="MatchID">
               <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1"  ToolTip='<%#Eval("UserID")%>'  OnClick="linker_button_click" runat="server">viewComments</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName"></asp:BoundField>
            <asp:BoundField DataField="EmailID" HeaderText="EmailID" SortExpression="EmailID"></asp:BoundField>
            <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender"></asp:BoundField>
            <asp:BoundField DataField="Region" HeaderText="Region" SortExpression="Region"></asp:BoundField>
            
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:PSLConnectionString %>' SelectCommand="User_info" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
</asp:Content>

