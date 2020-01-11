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
    public partial class Add_match : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["PSLConnectionString"].ToString());
      
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSubmit(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("ADD_MATCH", con);
            cmd.CommandType = CommandType.StoredProcedure;
        
            if(DropDownList1.SelectedValue == DropDownList2.SelectedValue)
            {
                Label1.Text = "Please Select the correct teams!!!";
                return;
            }

            SqlParameter team1 = new SqlParameter("@team1",DropDownList1.SelectedValue);
            SqlParameter team2 = new SqlParameter("@team2",DropDownList2.SelectedValue);
            SqlParameter stadium = new SqlParameter("@stadium",DropDownList3.SelectedValue);
            SqlParameter date_time = new SqlParameter("@date_time",Calendar1.SelectedDate);
            SqlParameter time = new SqlParameter("@time",DropDownList4.SelectedValue);

             date_time.DbType = DbType.DateTime;

             cmd.Parameters.Add("@return_value", SqlDbType.Int).Direction = ParameterDirection.ReturnValue;

             cmd.Parameters.Add(team1);
             cmd.Parameters.Add(team2);
             cmd.Parameters.Add(stadium);
             cmd.Parameters.Add(date_time);
             cmd.Parameters.Add(time);

             con.Open();
             cmd.ExecuteNonQuery();

             int return_val = int.Parse(cmd.Parameters["@return_value"].Value.ToString());

            if(return_val == 0)
            {
              Label1.Text = "Cannot schedule a match on this date !!!!";
            }
            else if(return_val == 1)
            {
                Label1.Text = "Another match is already scheduled at same time!!!";
            }
            else
            {
                Label1.Text = "Match is added !!!!!!!";
                return;

            }
            
            
            

        }
    }
}