<%@ Page Title="" Language="C#" MasterPageFile="~/PSL.Master" AutoEventWireup="true" CodeBehind="islamabad.aspx.cs" Inherits="PSL_WEBSITE.islamabad" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3 style="margin-left:20%; margin-top:5%">TEAM INFORMATION</h3>
    <asp:GridView runat="server"
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
        AutoGenerateColumns="False"
        DataSourceID="ISLAMABAD_info" DataKeyNames="TeamID">

        <Columns>
            <asp:BoundField DataField="TeamName" HeaderText="TeamName" SortExpression="TeamName"></asp:BoundField>
            <asp:BoundField DataField="CityName" HeaderText="CityName" SortExpression="CityName"></asp:BoundField>
            <asp:BoundField DataField="TeamOwner" HeaderText="TeamOwner" SortExpression="TeamOwner"></asp:BoundField>
            <asp:BoundField DataField="Coach" HeaderText="Coach" SortExpression="Coach"></asp:BoundField>
            <asp:BoundField DataField="Captain" HeaderText="Captain" SortExpression="Captain"></asp:BoundField>
            <asp:TemplateField HeaderText="Pictues">
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" Height="100px" Width="100px"
                          ImageUrl='<%#"data:Image/png;base64," + Convert.ToBase64String((byte[])Eval("picture")) %>'
                         />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>

    </asp:GridView>
    <h3 style="margin-left:20%">PLAYERS</h3>
    <asp:GridView
        ID="GridView1"
        runat="server"
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
        AutoGenerateColumns="False" DataSourceID="ISL_palyers" DataKeyNames="PlayerID">

        <Columns>
             <asp:TemplateField HeaderText="MatchID">
               <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1"  ToolTip='<%#Eval("PlayerID")%>'  OnClick="linker_button_click" runat="server">viewDetail</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="PlayerName" HeaderText="PlayerName" SortExpression="PlayerName"></asp:BoundField>
            <asp:BoundField DataField="TeamName" HeaderText="TeamName" SortExpression="TeamName"></asp:BoundField>
            <asp:BoundField DataField="PlayerCategory" HeaderText="PlayerCategory" SortExpression="PlayerCategory"></asp:BoundField>
            <asp:BoundField DataField="PlayerType" HeaderText="PlayerType" SortExpression="PlayerType"></asp:BoundField>
            <asp:BoundField DataField="PlayerType1" HeaderText="PlayerType1" SortExpression="PlayerType1"></asp:BoundField>
              <asp:TemplateField HeaderText="Pictues">
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" Height="100px" Width="100px"
                          ImageUrl='<%#"data:Image/png;base64," + Convert.ToBase64String((byte[])Eval("picture")) %>'
                         />
                </ItemTemplate>
            </asp:TemplateField>



        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="ISLAMABAD_info" runat="server" ConnectionString='<%$ ConnectionStrings:PSLConnectionString %>' SelectCommand="ViewTeamInfo" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:Parameter DefaultValue="1" Name="ID" Type="Int32"></asp:Parameter>
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="ISL_palyers" runat="server" ConnectionString='<%$ ConnectionStrings:PSLConnectionString %>' SelectCommand="ViewPlayerInfo" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:Parameter DefaultValue="1" Name="ID" Type="Int32"></asp:Parameter>
        </SelectParameters>
    </asp:SqlDataSource>

 </asp:Content>
