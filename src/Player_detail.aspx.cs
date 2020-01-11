using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace PSL_WEBSITE
{
    public partial class Player_detail : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["PSLConnectionString"].ToString());
     
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                con.Open();

                string ret_id = Request.QueryString["ID"];

                SqlCommand cmd = new SqlCommand("Basic_player_info", con);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlParameter ID = new SqlParameter("@id", ret_id);
                cmd.Parameters.Add(ID);

                GridView1.DataSource = cmd.ExecuteReader();
                GridView1.DataBind();

                con.Close();

                SqlCommand cmd2 = new SqlCommand("Player_batting", con);
                cmd2.CommandType = CommandType.StoredProcedure;
                SqlParameter ID2 = new SqlParameter("@id", ret_id);
                cmd2.Parameters.Add(ID2);

                con.Open();

                GridView2.DataSource = cmd2.ExecuteReader();
                GridView2.DataBind();

                con.Close();

                con.Open();

                SqlCommand cmd3 = new SqlCommand("Player_bownling", con);
                cmd3.CommandType = CommandType.StoredProcedure;
                SqlParameter ID3 = new SqlParameter("@id", ret_id);
                cmd3.Parameters.Add(ID3);

                GridView3.DataSource = cmd3.ExecuteReader();
                GridView3.DataBind();

                con.Close();


            }
        }
    }
}