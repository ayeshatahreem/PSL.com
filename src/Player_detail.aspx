<%@ Page Title="" Language="C#" MasterPageFile="~/PSL.Master" AutoEventWireup="true" CodeBehind="Player_detail.aspx.cs" Inherits="PSL_WEBSITE.Player_detail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <h3 style="margin-top:5% ;margin-left:20%">Player Detail</h3>
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
        Width="40%" AutoGenerateColumns="False">
        <Columns>
            <asp:BoundField DataField="PlayerName" HeaderText="PlayerName" SortExpression="PlayerName"></asp:BoundField>
            <asp:BoundField DataField="TotalMatchesPlayed" HeaderText="TotalMatchesPlayed" SortExpression="TotalMatchesPlayed"></asp:BoundField>
            <asp:BoundField DataField="Runs" HeaderText="Runs" SortExpression="Runs"></asp:BoundField>
            <asp:BoundField DataField="Wickets" HeaderText="Wickets" SortExpression="Wickets"></asp:BoundField>
        </Columns>
    </asp:GridView>
      <h3 style="margin-left:20%;margin-top:1%">Batting</h3>
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
        Width="40%" AutoGenerateColumns="False">
        <Columns>
             <asp:BoundField DataField="BattingStyle" HeaderText="BattingStyle" SortExpression="BattingStyle"></asp:BoundField>
             <asp:BoundField DataField="TopScore" HeaderText="TopScore" SortExpression="TopScore"></asp:BoundField>
             <asp:BoundField DataField="BattingAverage" HeaderText="BattingAverage" SortExpression="BattingAverage"></asp:BoundField>
             <asp:BoundField DataField="TotalCenturies" HeaderText="TotalCenturies" SortExpression="TotalCenturies"></asp:BoundField>           
        </Columns>
    </asp:GridView>
       <h3 style="margin-left:20%;margin-top:1%">Bownling</h3>
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
        Width="30%" AutoGenerateColumns="False">
        <Columns>
             <asp:BoundField DataField="BowlingStyle" HeaderText="BowlingStyle" SortExpression="BowlingStyle"></asp:BoundField>
             <asp:BoundField DataField="BownlingAverage" HeaderText="BownlingAverage" SortExpression="BownlingAverage"></asp:BoundField>
             <asp:BoundField DataField="Wickets" HeaderText="Wickets" SortExpression="Wickets"></asp:BoundField>    
        </Columns>
    </asp:GridView>
</asp:Content>
