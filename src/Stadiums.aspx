<%@ Page Title="" Language="C#" MasterPageFile="~/PSL.Master" AutoEventWireup="true" CodeBehind="Stadiums.aspx.cs" Inherits="PSL_WEBSITE.Stadiums" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3 style="margin-left:20%; margin-top:5%">STADIUMS</h3>
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
        Width="60%"
        AutoGenerateColumns="False" DataSourceID="Stadium_info" DataKeyNames="StadiumID">
        <Columns>
            <asp:BoundField DataField="StadiumName" HeaderText="StadiumName" SortExpression="StadiumName"></asp:BoundField>
            <asp:BoundField DataField="Location" HeaderText="Location" SortExpression="Location"></asp:BoundField>
            <asp:BoundField DataField="Capacity" HeaderText="Capacity" SortExpression="Capacity"></asp:BoundField>
        </Columns>

    </asp:GridView>
    <asp:SqlDataSource ID="Stadium_info" runat="server" ConnectionString='<%$ ConnectionStrings:PSLConnectionString %>' SelectCommand="ViewStadiumInfo" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
</asp:Content>
