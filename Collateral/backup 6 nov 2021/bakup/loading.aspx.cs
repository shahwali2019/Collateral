using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Collateral_int
{
    public partial class loading : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["loading"] = "yes";
            // Response.Redirect("Login.aspx");
            ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "redirectJS",
         "setTimeout(function() { window.location.replace('loging.aspx') }, 2000);", true);

        }
    }
}