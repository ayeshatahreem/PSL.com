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
    public partial class Ticket_sale : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["PSLConnectionString"].ToString());
     
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               
                 if (Session["user_id"] == null)
                {
                    Response.Redirect("~/Sign_In.aspx");
                }

               
            }

        }

        protected void buy_Click(object sender,EventArgs e)
        {
            if(TextBox1.Text.Length <= 2)
            {
                Label1.Text = "Please enter your address!";
                return;
            }
            
            
            string ret_id = Request.QueryString["ID"];

            SqlCommand cmd = new SqlCommand("Tickets_Sale", con);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlParameter MatchID = new SqlParameter("@MatchID", ret_id);
            cmd.Parameters.Add(MatchID);
            SqlParameter UserId = new SqlParameter("@User_id", Session["user_id"]);
            cmd.Parameters.Add(UserId);
            SqlParameter address = new SqlParameter("@Postal", TextBox1.Text.Trim());
            cmd.Parameters.Add(address);

            cmd.Parameters.Add("@return_value", SqlDbType.Int).Direction = ParameterDirection.ReturnValue;

            con.Open();

            cmd.ExecuteNonQuery();

            int return_val = int.Parse(cmd.Parameters["@return_value"].Value.ToString());


            if (return_val == 1)
            {
                Label1.Text = "Match is already played !!!!!";
                return;
            }
            else if (return_val == 2)
            {
                Label1.Text = "Sorry,All Tickets are Sold!!!!";
                return;
            }
            else
            {
                Label1.Text = "Thankyou! for Buying Tickets.Hope you enjoy the match!!";
                
            }

        }
    }
}