using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace PSL_WEBSITE
{
    public partial class islamabad : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //LoadGrid();
        }
        protected void linker_button_click(object sender, EventArgs e)
        {
            Response.Redirect("~/Player_detail.aspx?ID=" + ((LinkButton)sender).ToolTip);
        }
    }
}