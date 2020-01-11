<%@ Page Title="" Language="C#" MasterPageFile="~/PSL.Master" AutoEventWireup="true" CodeBehind="Tickets.aspx.cs" Inherits="PSL_WEBSITE.Tickets" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <h3 style="margin-left:20%; margin-top:5%"></h3>
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
        Width="80%" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource1">

        <Columns>
              <asp:TemplateField HeaderText="Tickets ">
               <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1"  ToolTip='<%#Eval("ID")%>'  OnClick="linker_button_click" runat="server">Buy Ticket</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="MatchCategory" HeaderText="Match" SortExpression="MatchCategory"></asp:BoundField>
            <asp:BoundField DataField="Home" HeaderText="Home" SortExpression="Home"></asp:BoundField>
            <asp:BoundField DataField="Away" HeaderText="Away" SortExpression="Away"></asp:BoundField>
            <asp:BoundField DataField="StadiumName" HeaderText="StadiumName" SortExpression="StadiumName"></asp:BoundField>
            <asp:BoundField DataField="Starts" HeaderText="Starts" SortExpression="Starts"></asp:BoundField>
            <asp:BoundField DataField="Ends" HeaderText="Ends" SortExpression="Ends"></asp:BoundField>

        </Columns>

    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:PSLConnectionString %>' SelectCommand="Tickets_detail" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

</asp:Content>
