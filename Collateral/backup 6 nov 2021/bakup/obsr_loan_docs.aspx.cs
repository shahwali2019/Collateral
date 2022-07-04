using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Collateral
{
    public partial class obsr_loan_docs : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void excelExporter_Click(object sender, ImageClickEventArgs e)
        {

        }

        protected void addNew_Click(object sender, ImageClickEventArgs e)
        {

        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "edit")
            {
                Session["olds_id"] = e.CommandArgument.ToString();
                SqlConnection sqlCon = new SqlConnection(connectionString);
                string query = "SELECT *FROM [OLDs] WHERE id = '" + Session["olds_id"].ToString() + "'";
                SqlCommand sqlcmd = new SqlCommand(query, sqlCon);
                sqlCon.Open();
                SqlDataReader rdr = sqlcmd.ExecuteReader();
                if (rdr.Read())
                {
                    //READ THE DATA FROM COLLATERAL DATABASE AND SAVE THEM INTO SESSION
                    Session["id"] = (string)rdr["id"].ToString();                            
                    Session["dcd"] = (string)rdr["Document checking date"].ToString();                  //  [Document checking date]
                    Session["borr"] = (string)rdr["Borrower"].ToString();                               //  [Borrower]
                    Session["cno"] = (string)rdr["Case Number"].ToString();                             //  [Case Number]
                    Session["ftype"] = (string)rdr["Facility type"].ToString();                         //  [Facility type]
                    Session["curr"] = (string)rdr["Currency"].ToString();                               //  [Currency]
                    Session["famount"] = (string)rdr["Facility amount"].ToString();                     //  [Facility amount]
                    Session["cust_type"] = (string)rdr["Customers type"].ToString();                    //  [Customers type]  
                    Session["ini_observ"] = (string)rdr["initial observations"].ToString();             //  [initial observations]   
                    Session["outs_observ"] = (string)rdr["Outstanding observations"].ToString();        //  [Outstanding observations]        
                    Session["stat_obsrv"] = (string)rdr["Status of Observation"].ToString();            //  [Status of Observation]
                    Session["stat_faci"] = (string)rdr["Status of Facility"].ToString();                //  [Status of Facility]
                    Session["first_check"] = (string)rdr["1st checker"].ToString();                     //  [1st checker]
                    Session["second_check"] = (string)rdr["2nd checker"].ToString();                    //  [2nd checker]
                    Session["remarks"] = (string)rdr["Remarks"].ToString();                             //  [Remarks]
                    Session["up_by"] = (string)rdr["Updated By"].ToString();                            //  [Updated By]

                    sqlCon.Close();
                    sqlCon.Dispose();
                    Response.Redirect("new-records_obsr_loan_docs.aspx");
                }
            }
        }

        protected void chkb1_CheckedChanged(object sender, EventArgs e)
        {

        }

        protected void searchBtn_Click(object sender, EventArgs e)
        {

        }
    }
}