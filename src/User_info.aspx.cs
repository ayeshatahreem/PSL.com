using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PSL_WEBSITE
{
    public partial class User_info : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void linker_button_click(object sender, EventArgs e)
        {
            Response.Redirect("~/User_Comments.aspx?ID=" + ((LinkButton)sender).ToolTip);
        }
        
    }
}