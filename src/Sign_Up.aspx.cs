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
    public partial class Sign_Up : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["PSLConnectionString"].ToString());
       
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSubmit(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("dbo.AddUser", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            SqlParameter Name = new SqlParameter("@name", name.Text.ToUpper().ToString());
            SqlParameter email = new SqlParameter("@email", inputEmail.Text.ToUpper().ToString());
            SqlParameter password = new SqlParameter("@password", inputPassword.Text.ToString());
            SqlParameter b_date = new SqlParameter("@bdate", date.Text.ToString());
            SqlParameter occu = new SqlParameter("@occupation", occupation.Text.ToUpper().ToString());
            SqlParameter reg = new SqlParameter("@region", region.Text.ToUpper().ToString());
            SqlParameter GE = new SqlParameter("@gender", Gender.SelectedValue.ToUpper().ToString());

            cmd.Parameters.Add("@return_val", SqlDbType.Int).Direction = ParameterDirection.ReturnValue;


            cmd.Parameters.Add(Name);
            cmd.Parameters.Add(email);
            cmd.Parameters.Add(password);
            cmd.Parameters.Add(b_date);
            cmd.Parameters.Add(occu);
            cmd.Parameters.Add(reg);
            cmd.Parameters.Add(GE);

            con.Open();
            cmd.ExecuteNonQuery();

            int return_val = int.Parse(cmd.Parameters["@return_val"].Value.ToString());

            if(return_val == 0)
            {
                Label1.Text = "Username or EmailID already exist!!";
            }
            else
            {
                Response.Redirect("~/Sign_In.aspx");
            }


        }
    }
}
