using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Interview
{
    public partial class Index : System.Web.UI.Page
    {
        public static string AppUrl = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            AppUrl = HttpContext.Current.Request.Url.ToString().Replace("/Index.aspx", "");
        }
    }
}