using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PSL_WEBSITE.DAL;

namespace PSL_WEBSITE
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadGrid();
        }
        public void LoadGrid()
        {
            //MyDal objDal = new MyDal();
            //GridView1.DataSource = objDal.PointTable();
            //GridView1.DataBind();
        }
    }
}