using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace PSL_WEBSITE
{
    public partial class MatchDetail : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["PSLConnectionString"].ToString());
     
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                con.Open();

                string ret_id = Request.QueryString["ID"];
                SqlCommand cmd = new SqlCommand("match_toss",con);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlParameter ID = new SqlParameter("@id", ret_id);
                cmd.Parameters.Add(ID);

                GridView1.DataSource = cmd.ExecuteReader();
                GridView1.DataBind();

                con.Close();

                con.Open();

                SqlCommand cmd2 = new SqlCommand("HOME_INNING ", con);
                cmd2.CommandType = CommandType.StoredProcedure;
                SqlParameter ID2 = new SqlParameter("@id", ret_id);
                cmd2.Parameters.Add(ID2);

                GridView2.DataSource = cmd2.ExecuteReader();
                GridView2.DataBind();

                SqlCommand cmd3 = new SqlCommand("AWAY_INNING ", con);
                cmd3.CommandType = CommandType.StoredProcedure;
                SqlParameter ID3 = new SqlParameter("@id", ret_id);
                cmd3.Parameters.Add(ID3);

                con.Close();

                con.Open();

                GridView3.DataSource = cmd3.ExecuteReader();
                GridView3.DataBind();

                con.Close();

                con.Open();

                SqlCommand cmd4 = new SqlCommand("Winner", con);
                cmd4.CommandType = CommandType.StoredProcedure;
                SqlParameter ID4 = new SqlParameter("@id", ret_id);
                cmd4.Parameters.Add(ID4);

                GridView4.DataSource = cmd4.ExecuteReader();
                GridView4.DataBind();

                con.Close();

               
                SqlCommand cmd5 = new SqlCommand("Retrieve_comment", con);
                cmd5.CommandType = CommandType.StoredProcedure;
                SqlParameter ID5 = new SqlParameter("@matchID",ret_id);
                cmd5.Parameters.Add(ID5);

                con.Open();
                SqlDataReader rdr = cmd5.ExecuteReader();
            
                if (rdr.Read())
                {
                    con.Close();
                    con.Open();
                    GridView5.DataSource = cmd5.ExecuteReader(); ;
                    GridView5.DataBind();
                }
                else
                {
                    Label1.Text = "No Comment is found !!!!";
                }
                con.Close();

               

            }

        }

        protected void post_Click(object sender, EventArgs e)
        {
            string ret_id = Request.QueryString["ID"];
            if (Session["user_id"] == null)
            {
                Response.Redirect("~/Sign_In.aspx");
            }
            else
            {
                SqlCommand cmd6 = new SqlCommand("User_comment ", con);
                cmd6.CommandType = CommandType.StoredProcedure;
                SqlParameter MID = new SqlParameter("@matchID", ret_id);
                cmd6.Parameters.Add(MID);
                SqlParameter UD = new SqlParameter("@userId",(int)Session["user_id"]);
                cmd6.Parameters.Add(UD);
                
                SqlParameter com = new SqlParameter("@Comment",TextBox1.Text.Trim());
                cmd6.Parameters.Add(com);

                con.Open();

                cmd6.ExecuteNonQuery();

                Response.Redirect("~/MatchDetail.aspx?ID=" + ret_id.ToString());
                

            }
        }
    }
}