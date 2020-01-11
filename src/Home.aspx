<%@ Page Title="" Language="C#" MasterPageFile="~/PSL.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="PSL_WEBSITE.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    
    <!-- Carousel
    ================================================== -->
    <div id="myCarousel" class="carousel slide" data-ride="carousel" style="transition-duration:1s">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1" class=""></li>
            <li data-target="#myCarousel" data-slide-to="2" class=""></li>
        </ol>
        <div class="carousel-inner" role="listbox">
            <div class="item active ">
                <img class="slide" src="images/1st.jpg" alt="First slide"style=" max-height:100%; max-width:100%; min-height:100%; min-width:100%;"/>
            </div>
            <div class="item">
                <img class="slide" src="images/2nd.jpg" alt="Second slide" style=" max-height:100%; max-width:100%; min-height:100%; min-width:100%;"/>
            </div>
            <div class="item">
                <img class="slide" src="images/3rd.jpg" alt="Third slide" style=" max-height:100%; max-width:100%; min-height:100%; min-width:100%;"/>
            </div>
        </div>
        <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
    <!-- /.carousel -->
    <!-- Marketing messaging and featurettes
    ================================================== -->
    <!-- Wrap the rest of the page in another container to center all the content. -->

    <div class="container marketing">

        <!-- Three columns of text below the carousel -->

        <div class="row" style="margin:6%">
            <div class="col-lg-4" style="text-align:center">
                <img class="img-square" src="images/islamabad.jpg" alt="Generic placeholder image" width="140" height="140"/>
                <h2>Islamabad United</h2>
                <p><a class="btn btn-default" href="islamabad.aspx" role="button">View details &raquo;</a></p>
            </div><!-- /.col-lg-4 -->
            <div class="col-lg-4" style="text-align:center">
                <img class="img-square" src="images/karachi.jpg" alt="Generic placeholder image" width="140" height="140"/>
                <h2>Karachi Kings</h2>
                <p><a class="btn btn-default" href="karachi.aspx" role="button">View details &raquo;</a></p>
            </div><!-- /.col-lg-4 -->
            <div class="col-lg-4" style="text-align:center">
                <img class="img-square" src="images/lahore.jpg" alt="Generic placeholder image" width="140" height="140"/>
                <h2>Lahore Qalenders</h2>
                <p><a class="btn btn-default" href="Lahore.aspx" role="button">View details &raquo;</a></p>
            </div><!-- /.col-lg-4 -->
            <div class="col-lg-4" style="margin-left:17% ;text-align:center">
                <img class="img-square" src="images/peshawar.jpg" alt="Generic placeholder image" width="140" height="140"/>
                <h2>Peshawar Zalmi</h2>
                <p><a class="btn btn-default" href="peshawar.aspx" role="button">View details &raquo;</a></p>
            </div><!-- /.col-lg-4 -->
            <div class="col-lg-4" style="text-align:center">
                <img class="img-square" src="images/quetta.jpg" alt="Generic placeholder image" width="140" height="140"/>
                <h2>Quetta Gladiators</h2>
                <p><a class="btn btn-default" href="Quetta.aspx" role="button">View details &raquo;</a></p>
            </div><!-- /.col-lg-4 -->
        </div><!-- /.row -->
    </div>
        <!-- START THE FEATURETTES -->

        <hr class="featurette-divider"/>

        <div class="row featurette" style="align-content:center">
            <h1 style="text-align:center">Points Table and Fixtures</h1>
            <div class="col-md-7 "style="align-content:center;margin-top:2%">
                <asp:GridView
                    ID="GridView1"
                    runat="server"
                    HeaderStyle-BackColor="Green"
                    BorderColor="Black"
                    RowStyle-BorderColor="Black"
                    HeaderStyle-BorderColor="Green"
                    Style="margin-left: 122px;"
                    RowStyle-ForeColor="White"
                    HeaderStyle-HorizontalAlign="Justify"
                    RowStyle-BorderWidth="0"
                    RowStyle-BackColor="black"
                    SortedAscendingCellStyle-Height="241px"
                    Width="421px" Height="248px"
                    AutoGenerateColumns="False"
                    DataSourceID="SqlDataSource1">
                    <Columns>
                        <asp:BoundField DataField="TeamName" HeaderText="TEAM" SortExpression="TeamName"></asp:BoundField>
                        <asp:BoundField DataField="TotalMatches" HeaderText="P" SortExpression="TotalMatches"></asp:BoundField>
                        <asp:BoundField DataField="WonMatches" HeaderText="W" SortExpression="WonMatches"></asp:BoundField>
                        <asp:BoundField DataField="LostMatches" HeaderText="L" SortExpression="LostMatches"></asp:BoundField>
                        <asp:BoundField DataField="DrawMatches" HeaderText="NR" SortExpression="DrawMatches"></asp:BoundField>
                        <asp:BoundField DataField="TotalPoints" HeaderText="P" SortExpression="TotalPoints"></asp:BoundField>
                        <asp:BoundField DataField="RunRate" HeaderText="RR" SortExpression="RunRate"></asp:BoundField>
                    </Columns>

                </asp:GridView>
            </div>
           <div style="margin-left:10%">
               <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:PSLConnectionString %>' SelectCommand="ViewPointsTable" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
               <img class="featurette-image img-responsive center-block" style="margin-top:2%" src="images/winner.jpg" alt="Generic placeholder image"/>   
           </div>
        </div>

</asp:Content>
