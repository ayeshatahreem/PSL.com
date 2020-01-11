<%@ Page Title="" Language="C#" MasterPageFile="~/ADMIN_USER.Master" AutoEventWireup="true" CodeBehind="User_Comments.aspx.cs" Inherits="PSL_WEBSITE.User_detail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <h3 style="margin-left:20%; margin-top:5%">UserComments</h3>
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
        Width="60%" AutoGenerateColumns="False"
        >
        <Columns>
             <asp:TemplateField HeaderText="DelelteComment">
               <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1"  ToolTip='<%#Eval("CommentID")%>'  OnClick="linker_button_click" runat="server">Delete</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="MatchID" HeaderText="MatchID" SortExpression="MatchID"></asp:BoundField>
            <asp:BoundField DataField="Comment" HeaderText="Comment" SortExpression="Comment"></asp:BoundField>
        </Columns>

    </asp:GridView>
</asp:Content>
