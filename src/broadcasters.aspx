<%@ Page Title="" Language="C#" MasterPageFile="~/PSL.Master" AutoEventWireup="true" CodeBehind="broadcasters.aspx.cs" Inherits="PSL_WEBSITE.broadcasters" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <h3 style="margin-left:20%; margin-top:5%">Broadcasters</h3>
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
        Width="40%"
        AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="Country" HeaderText="Country" SortExpression="Country"></asp:BoundField>
            <asp:BoundField DataField="TVChannel" HeaderText="TVChannel" SortExpression="TVChannel"></asp:BoundField>
        </Columns>

    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:PSLConnectionString %>' SelectCommand="broadcasters" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
</asp:Content>
