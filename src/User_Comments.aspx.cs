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
    public partial class User_detail : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["PSLConnectionString"].ToString());
     
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string ret_id = Request.QueryString["ID"];

                SqlCommand cmd = new SqlCommand("User_comments", con);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlParameter User_ID = new SqlParameter("@User_id", ret_id);
                cmd.Parameters.Add(User_ID);

                con.Open();

                GridView1.DataSource = cmd.ExecuteReader();
                GridView1.DataBind();

                con.Close();

            }
        }
        protected void linker_button_click(object sender, EventArgs e)
        {
            string Comment_id = ((LinkButton)sender).ToolTip;

            SqlCommand cmd = new SqlCommand("delete_comment", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlParameter C_id = new SqlParameter("@Comment_id", Comment_id);
            cmd.Parameters.Add(C_id);

            con.Open();

            cmd.ExecuteNonQuery();

            string ret_id = Request.QueryString["ID"];

            Response.Redirect("~/User_Comments.aspx?ID=" + ret_id.ToString());


        }
    }
}