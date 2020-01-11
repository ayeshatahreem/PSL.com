using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PSL_WEBSITE
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["user_name"] != null)
            {
                User_name_label.Text = Session["user_name"].ToString();

            }

        }
    }
}