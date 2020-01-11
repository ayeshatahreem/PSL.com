<%@ Page Title="" Language="C#" MasterPageFile="~/PSL.Master" AutoEventWireup="true" CodeBehind="MatchDetail.aspx.cs" Inherits="PSL_WEBSITE.MatchDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3 style="margin-top:5% ;margin-left:20%">Match Detail</h3>
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
        Width="30%" AutoGenerateColumns="False">
        <Columns>
            <asp:BoundField DataField="HOME" HeaderText="HOME" SortExpression="HOME"></asp:BoundField>
            <asp:BoundField DataField="AWAY" HeaderText="AWAY" SortExpression="AWAY"></asp:BoundField>
            <asp:BoundField DataField="TossWinner" HeaderText="TOSS" SortExpression="TossWinner"></asp:BoundField>
        </Columns>
    </asp:GridView>

    <h3 style="margin-left:20%;margin-top:1%"> HOME TEAM INNINGS </h3>
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
        Width="60%" AutoGenerateColumns="False">
        <Columns>
             <asp:BoundField DataField="TEAM" HeaderText="TEAM" SortExpression="TEAM"></asp:BoundField>
             <asp:BoundField DataField="Score" HeaderText="Score" SortExpression="Score"></asp:BoundField>
             <asp:BoundField DataField="Wickets" HeaderText="Wickets" SortExpression="Wickets"></asp:BoundField>
             <asp:BoundField DataField="Overs" HeaderText="Overs" SortExpression="Overs"></asp:BoundField>
             <asp:BoundField DataField="Fours" HeaderText="Fours" SortExpression="Fours"></asp:BoundField>
             <asp:BoundField DataField="Sixes" HeaderText="Sixes" SortExpression="Sixes"></asp:BoundField>
           
        </Columns>
    </asp:GridView>

     <h3 style="margin-left:20%;margin-top:1%"> AWAY TEAM INNINGS </h3>
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
        Width="60%" AutoGenerateColumns="False">
         <Columns>
             <asp:BoundField DataField="TEAM" HeaderText="TEAM" SortExpression="TEAM"></asp:BoundField>
             <asp:BoundField DataField="Score" HeaderText="Score" SortExpression="Score"></asp:BoundField>
             <asp:BoundField DataField="Wickets" HeaderText="Wickets" SortExpression="Wickets"></asp:BoundField>
             <asp:BoundField DataField="Overs" HeaderText="Overs" SortExpression="Overs"></asp:BoundField>
             <asp:BoundField DataField="Fours" HeaderText="Fours" SortExpression="Fours"></asp:BoundField>
             <asp:BoundField DataField="Sixes" HeaderText="Sixes" SortExpression="Sixes"></asp:BoundField>
           
        </Columns>
    </asp:GridView>
     <h3 style="margin-left:20%;margin-top:1%">Winner</h3>
    <asp:GridView ID="GridView4" runat="server"
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
        Width="10%" AutoGenerateColumns="False">
        <Columns>
            <asp:BoundField DataField="TeamName" HeaderText="TeamName" SortExpression="TeamName"></asp:BoundField>
            
        </Columns>
    </asp:GridView>
      <h3 style="margin-left:20%;margin-top:1%">Commments</h3>
    <asp:GridView ID="GridView5" runat="server"
        HeaderStyle-BackColor="Green"
        BorderColor="Black"
        RowStyle-BorderColor="Black"
        HeaderStyle-BorderColor="Green"
        GridLines="None"
        Style="margin-left: 20%; margin-top: 1%;width:30%"
        RowStyle-ForeColor="White"
        HeaderStyle-HorizontalAlign="Justify"
        RowStyle-BorderWidth="0"
        RowStyle-BackColor="black"
        SortedAscendingCellStyle-Height="241px"
        Width="10%" AutoGenerateColumns="False">
        <Columns>
            <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName"></asp:BoundField>
            <asp:BoundField DataField="Comment" HeaderText="Comment" SortExpression="Comment"></asp:BoundField>
        </Columns>
    </asp:GridView>
    <asp:Label ID="Label1" runat="server" Text="" style="margin-left:20%"></asp:Label>
        <h3 style="margin-left:20%;margin-top:1%">Post a Commment</h3>
    
    <asp:TextBox ID="TextBox1" runat="server"  class="form-control" style="margin-left:20%;margin-top:1%" Height="96px" Width="599px"></asp:TextBox> 
   <asp:Button ID="post" runat="server" Text="Post" class="btn btn-lg btn-primary btn-block" type="submit" style="margin-left:20%;margin-top:1%" OnClick="post_Click" Height="40px" Width="80px"/>
           

    


</asp:Content>
