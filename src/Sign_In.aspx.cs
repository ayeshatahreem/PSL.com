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
    public partial class Sign_In : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["PSLConnectionString"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void signin_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("dbo.USR_SIGNIN", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            SqlParameter name = new SqlParameter("@email", inputEmail.Text.Trim());
            SqlParameter pass = new SqlParameter("@password", inputPassword.Text.Trim());

            cmd.Parameters.Add(name);
            cmd.Parameters.Add(pass);

           

            con.Open();
            SqlDataReader rdr = cmd.ExecuteReader();

                if (rdr.Read())
                {
                    Session["user_name"] = rdr["UserName"].ToString();
                    Session["user_id"] = rdr["UserID"];
                    Response.Redirect("~/Home.aspx");
                }
                else
                {
                    Label1.Text = "You entered a wrong email or password!";
                }

            
        }
        protected void Admin_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("Admin_signIn", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            SqlParameter name = new SqlParameter("@email", inputEmail.Text.Trim());
            SqlParameter pass = new SqlParameter("@password", inputPassword.Text.Trim());

            cmd.Parameters.Add(name);
            cmd.Parameters.Add(pass);

            cmd.Parameters.Add("@Ret_admin", SqlDbType.Int).Direction = ParameterDirection.ReturnValue;

            con.Open();
            SqlDataReader rdr = cmd.ExecuteReader();

            int return_val = int.Parse(cmd.Parameters["@Ret_admin"].Value.ToString());


            if (return_val == 1)
            {
                Response.Redirect("~/admin_homeaspx.aspx");
            }
            else
            {
                Label1.Text = "You entered a wrong email or password!";
            }
        }
    }
}