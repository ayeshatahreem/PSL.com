using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PSL_WEBSITE.DAL;
using System.Data;
using System.Data.SqlClient;
namespace PSL_WEBSITE
{
    public partial class Lahore : System.Web.UI.Page
    {  
         protected void Page_Load(object sender, EventArgs e)
        {

        }
         protected void linker_button_click(object sender, EventArgs e)
         {
             Response.Redirect("~/Player_detail.aspx?ID=" + ((LinkButton)sender).ToolTip);
         }
      
    }

     
}