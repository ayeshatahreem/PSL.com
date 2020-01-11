<%@ Page Title="" Language="C#" MasterPageFile="~/PSL.Master" AutoEventWireup="true" CodeBehind="PSL.aspx.cs" Inherits="PSL_WEBSITE.PSL" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3 style="margin-left:20%; margin-top:5%">BASIC INFO</h3>
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
        Width="60%" AutoGenerateColumns="False" DataSourceID="BASIC">

        <Columns>
            <asp:BoundField DataField="Administrator" HeaderText="Administrator" SortExpression="Administrator"></asp:BoundField>
            <asp:BoundField DataField="PSLFormat" HeaderText="PSLFormat" SortExpression="PSLFormat"></asp:BoundField>
            <asp:BoundField DataField="TournamentYear" HeaderText="TournamentYear" SortExpression="TournamentYear"></asp:BoundField>
            <asp:BoundField DataField="TournamentFormat" HeaderText="TournamentFormat" SortExpression="TournamentFormat"></asp:BoundField>
             <asp:TemplateField HeaderText="Pictues">
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" Height="100px" Width="100px"
                          ImageUrl='<%#"data:Image/png;base64," + Convert.ToBase64String((byte[])Eval("PSLlogo")) %>'
                         />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>

    </asp:GridView>
    <h3 style="margin-left:20%">MATCHES</h3>
    <asp:GridView ID="GridView2" runat="server"
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
        Width="30%" AutoGenerateColumns="False" DataSourceID="MATCHES">
        <Columns>
            <asp:BoundField DataField="NumberOfTeams" HeaderText="NumberOfTeams" SortExpression="NumberOfTeams"></asp:BoundField>
            <asp:BoundField DataField="NumberOfMatches" HeaderText="NumberOfMatches" SortExpression="NumberOfMatches"></asp:BoundField>
            <asp:BoundField DataField="Winner" HeaderText="Winner" SortExpression="Winner"></asp:BoundField>
        </Columns>

    </asp:GridView>
    <h3 style="margin-left:20%">STATS</h3>
    <asp:GridView ID="GridView3" runat="server"
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
        Width="30%" AutoGenerateColumns="False" DataSourceID="STATS">
        <Columns>
            <asp:BoundField DataField="MostRuns" HeaderText="MostRuns" SortExpression="MostRuns"></asp:BoundField>
            <asp:BoundField DataField="MostWickets" HeaderText="MostWickets" SortExpression="MostWickets"></asp:BoundField>
        </Columns>

    </asp:GridView>

    <asp:SqlDataSource ID="BASIC" runat="server" ConnectionString='<%$ ConnectionStrings:PSLConnectionString %>' SelectCommand="ViewPSLSeasonInfo_basic" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:Parameter DefaultValue="1" Name="ID" Type="Int32"></asp:Parameter>
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="MATCHES" runat="server" ConnectionString='<%$ ConnectionStrings:PSLConnectionString %>' SelectCommand="ViewPSLSeasonInfo_matches" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:Parameter DefaultValue="1" Name="ID" Type="Int32"></asp:Parameter>
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="STATS" runat="server" ConnectionString='<%$ ConnectionStrings:PSLConnectionString %>' SelectCommand="ViewPSLSeasonInfo_stats" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:Parameter DefaultValue="1" Name="ID" Type="Int32"></asp:Parameter>
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
