<%@ Page Title="" Language="C#" MasterPageFile="~/PSL.Master" AutoEventWireup="true" CodeBehind="Schedule.aspx.cs" Inherits="PSL_WEBSITE.Schedule" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3 style="margin-left:10%;margin-top:5%">SCHEDULE</h3>
    <asp:GridView ID="GridView1" runat="server"
        HeaderStyle-BackColor="Green"
        BorderColor="Black"
        RowStyle-BorderColor="Black"
        HeaderStyle-BorderColor="Green"
        Style="margin-left: 10%; margin-top: 1%"
        RowStyle-ForeColor="White"
        HeaderStyle-HorizontalAlign="Justify"
        RowStyle-BorderWidth="0"
        RowStyle-BackColor="black"
        SortedAscendingCellStyle-Height="241px"
        Width="80%" AutoGenerateColumns="False" DataSourceID="Schedule_info">

        <Columns>
            <asp:BoundField DataField="Macth" HeaderText="Macth" SortExpression="Macth"></asp:BoundField>
            <asp:BoundField DataField="HOME" HeaderText="HOME" SortExpression="HOME"></asp:BoundField>
            <asp:BoundField DataField="AWAY" HeaderText="AWAY" SortExpression="AWAY"></asp:BoundField>
            <asp:BoundField DataField="StadiumName" HeaderText="StadiumName" SortExpression="StadiumName"></asp:BoundField>
            <asp:BoundField DataField="STARTS" HeaderText="STARTS" SortExpression="STARTS"></asp:BoundField>
            <asp:BoundField DataField="ENDS" HeaderText="ENDS" SortExpression="ENDS"></asp:BoundField>
        </Columns>

    </asp:GridView>
    <asp:SqlDataSource ID="Schedule_info" runat="server" ConnectionString='<%$ ConnectionStrings:PSLConnectionString %>' SelectCommand="VIEW_SCHEDULE" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
</asp:Content>
