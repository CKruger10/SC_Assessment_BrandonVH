using System;
using System.Web;

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