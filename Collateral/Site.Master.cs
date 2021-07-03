using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Collateral
{
    public partial class SiteMaster : MasterPage
    {
        public string LoginName { get; private set; }

        protected void Page_Load(object sender, EventArgs e)
        {

            string fullUsername = HttpContext.Current.User.Identity.Name;
            int index_domain = fullUsername.IndexOf("AIB\\");
            string username = fullUsername.Substring(fullUsername.IndexOf("\\") + 1);

            Label3.Text = username;


        }
    }
}