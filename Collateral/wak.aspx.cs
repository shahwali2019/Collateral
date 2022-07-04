using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Configuration;
using OfficeOpenXml;
using System.IO;

namespace Collateral_int
{
    public partial class wak : System.Web.UI.Page
    {

        string connectionString = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GridView1.DataSourceID = "DbCon";
            }
            //URL Restriction
            if (!IsPostBack)
            {
                string fullUsername = User.Identity.Name;
                int index_domain = fullUsername.IndexOf("AIB\\");
                string username = fullUsername.Substring(fullUsername.IndexOf("\\") + 1);
                string qry = string.Empty;
                qry = "select Access_role from [userMng] where username='" + username + "'";
                string strConnString = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;

                SqlConnection con = new SqlConnection(strConnString);
                con.Open();
                SqlCommand cd = new SqlCommand(qry, con);

                string Access_role = Convert.ToString(cd.ExecuteScalar());

                if (string.IsNullOrEmpty(Access_role))
                {
                    Response.Redirect("NotAuthorize.aspx?ReturnPath=" + Server.UrlEncode(Request.Url.AbsoluteUri));
                }

                if (Access_role == null)
                {
                    Response.Redirect("Loging.aspx");
                    Session.Remove("loading");
                }
                //===================Validate back btn while updating records
                if (Session["id"] != null)
                {
                    Session.Remove("id");
                }
            }
        }
        protected void addNew_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("new_wak.aspx");
        }
        protected void searchBtn_Click(object sender, EventArgs e)
        {

            //CASE x x x x x
            if (string.IsNullOrEmpty(txtSafeNo.Text) && StatusListbox.SelectedValue == "DocSta" && FacilityTypeList.SelectedValue == "FacType" && txtDate1.Text == "" && txtDate2.Text == "")
            {
                GridView1.DataSourceID = null;
                string sqlQuery;
                SqlConnection sqlCon = new SqlConnection(connectionString);
                sqlCon.Open();
                sqlQuery = "SELECT *FROM wak_tbl";
                SqlCommand cmd = new SqlCommand(sqlQuery, sqlCon);
                SqlDataAdapter DA = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                DA.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();
                sqlCon.Close();
                int counter = GridView1.Rows.Count;
                resultLbl.Visible = true;
                resultLbl.Text = "Found " + counter + " record(s)";
            }
            //---------Case 1 x x x x-----------------------------------------------------------
            if (string.IsNullOrEmpty(txtSafeNo.Text) && StatusListbox.SelectedValue == "DocSta" && FacilityTypeList.SelectedValue == "FacType" && txtDate1.Text != "" && txtDate2.Text == "")
            {
                GridView1.DataSourceID = null;
                string sqlQuery;
                SqlConnection sqlCon = new SqlConnection(connectionString);
                sqlCon.Open();
                sqlQuery = "SELECT *FROM wak_tbl where SafeInDate ='" + txtDate1.Text + "'";
                SqlCommand cmd = new SqlCommand(sqlQuery, sqlCon);
                SqlDataAdapter DA = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                DA.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();
                sqlCon.Close();
                int counter = GridView1.Rows.Count;
                resultLbl.Visible = true;
                resultLbl.Text = "Found " + counter + " record(s)";
            }
            //---------Case 1 2 x x x-----------------------------------------------------------
            if (string.IsNullOrEmpty(txtSafeNo.Text) && StatusListbox.SelectedValue == "DocSta" && FacilityTypeList.SelectedValue == "FacType" && txtDate1.Text != "" && txtDate2.Text != "")
            {
                TextBox2_TextChanged(sender, null);
            }
            //---------Case 1 2 3 x x-----------------------------------------------------------
            if (!string.IsNullOrEmpty(txtSafeNo.Text) && StatusListbox.SelectedValue == "DocSta" && FacilityTypeList.SelectedValue == "FacType" && txtDate1.Text != "" && txtDate2.Text != "")
            {
                GridView1.DataSourceID = null;
                string sqlQuery;
                SqlConnection sqlCon = new SqlConnection(connectionString);
                sqlCon.Open();
                sqlQuery = "SELECT *FROM wak_tbl where [ClientName] LIKE '%" + txtSafeNo.Text + "%' AND  SafeInDate between '" + txtDate1.Text + "' AND '" + txtDate2.Text + "'";
                SqlCommand cmd = new SqlCommand(sqlQuery, sqlCon);
                SqlDataAdapter DA = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                DA.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();
                sqlCon.Close();
                int counter = GridView1.Rows.Count;
                resultLbl.Visible = true;
                resultLbl.Text = "Found " + counter + " record(s)";
            }

            //---------Case 1 2 3 4 x-----------------------------------------------------------
            if (!string.IsNullOrEmpty(txtSafeNo.Text) && StatusListbox.SelectedValue != "DocSta" && FacilityTypeList.SelectedValue == "FacType" && txtDate1.Text != "" && txtDate2.Text != "")
            {
                GridView1.DataSourceID = null;
                string sqlQuery;
                SqlConnection sqlCon = new SqlConnection(connectionString);
                sqlCon.Open();
                sqlQuery = "SELECT *FROM wak_tbl where DocStatus='" + StatusListbox.SelectedValue + "' AND [ClientName] LIKE '%" + txtSafeNo.Text + "%'  AND  SafeInDate between '" + txtDate1.Text + "' AND '" + txtDate2.Text + "'";
                SqlCommand cmd = new SqlCommand(sqlQuery, sqlCon);
                SqlDataAdapter DA = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                DA.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();
                sqlCon.Close();
                int counter = GridView1.Rows.Count;
                resultLbl.Visible = true;
                resultLbl.Text = "Found " + counter + " record(s)";
            }

            //---------Case 1 2 3 4 5-----------------------------------------------------------
            if (!string.IsNullOrEmpty(txtSafeNo.Text) && StatusListbox.SelectedValue != "DocSta" && FacilityTypeList.SelectedValue != "FacType" && txtDate1.Text != "" && txtDate2.Text != "")
            {
                GridView1.DataSourceID = null;
                string sqlQuery;
                SqlConnection sqlCon = new SqlConnection(connectionString);
                sqlCon.Open();
                sqlQuery = "SELECT *FROM wak_tbl where FacilityType='" + FacilityTypeList.SelectedValue + "' AND DocStatus='" + StatusListbox.SelectedValue + "' AND [ClientName] LIKE '%" + txtSafeNo.Text + "%' AND  SafeInDate between '" + txtDate1.Text + "' AND '" + txtDate2.Text + "'";
                SqlCommand cmd = new SqlCommand(sqlQuery, sqlCon);
                SqlDataAdapter DA = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                DA.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();
                sqlCon.Close();
                int counter = GridView1.Rows.Count;
                resultLbl.Visible = true;
                resultLbl.Text = "Found " + counter + " record(s)";
            }

            //---------Case x 2 x x x-----------------------------------------------------------
            if (string.IsNullOrEmpty(txtSafeNo.Text) && StatusListbox.SelectedValue == "DocSta" && FacilityTypeList.SelectedValue == "FacType" && txtDate1.Text == "" && txtDate2.Text != "")
            {
                GridView1.DataSourceID = null;
                string sqlQuery;
                SqlConnection sqlCon = new SqlConnection(connectionString);
                sqlCon.Open();
                sqlQuery = "SELECT *FROM wak_tbl where  SafeInDate = '" + txtDate2.Text + "'";
                SqlCommand cmd = new SqlCommand(sqlQuery, sqlCon);
                SqlDataAdapter DA = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                DA.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();
                sqlCon.Close();
                int counter = GridView1.Rows.Count;
                resultLbl.Visible = true;
                resultLbl.Text = "Found " + counter + " record(s)";
            }
            //---------Case x x 3 x x-----------------------------------------------------------
            if (!string.IsNullOrEmpty(txtSafeNo.Text) && StatusListbox.SelectedValue == "DocSta" && FacilityTypeList.SelectedValue == "FacType" && txtDate1.Text == "" && txtDate2.Text == "")
            {
                GridView1.DataSourceID = null;
                string sqlQuery;
                SqlConnection sqlCon = new SqlConnection(connectionString);
                sqlCon.Open();
                sqlQuery = "SELECT *FROM wak_tbl WHERE [ClientName] LIKE '%" + txtSafeNo.Text + "%'";
                SqlCommand cmd = new SqlCommand(sqlQuery, sqlCon);
                SqlDataAdapter DA = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                DA.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();
                sqlCon.Close();
                int counter = GridView1.Rows.Count;
                resultLbl.Visible = true;
                resultLbl.Text = "Found " + counter + " record(s)";
            }
            //---------Case 1 x 3 x x-----------------------------------------------------------
            if (!string.IsNullOrEmpty(txtSafeNo.Text) && StatusListbox.SelectedValue == "DocSta" && FacilityTypeList.SelectedValue == "FacType" && txtDate1.Text != "" && txtDate2.Text == "")
            {
                GridView1.DataSourceID = null;
                string sqlQuery;
                SqlConnection sqlCon = new SqlConnection(connectionString);
                sqlCon.Open();
                sqlQuery = "SELECT *FROM wak_tbl WHERE [ClientName] LIKE '%" + txtSafeNo.Text + "%'  AND SafeInDate='" + txtDate1.Text + "'";
                SqlCommand cmd = new SqlCommand(sqlQuery, sqlCon);
                SqlDataAdapter DA = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                DA.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();
                sqlCon.Close();
                int counter = GridView1.Rows.Count;
                resultLbl.Visible = true;
                resultLbl.Text = "Found " + counter + " record(s)";
            }

            //---------Case x x x 4 x-----------------------------------------------------------
            if (string.IsNullOrEmpty(txtSafeNo.Text) && StatusListbox.SelectedValue != "DocSta" && FacilityTypeList.SelectedValue == "FacType" && txtDate1.Text == "" && txtDate2.Text == "")
            {
                GridView1.DataSourceID = null;
                string sqlQuery;
                SqlConnection sqlCon = new SqlConnection(connectionString);
                sqlCon.Open();
                sqlQuery = "SELECT *FROM wak_tbl WHERE DocStatus='" + StatusListbox.SelectedValue + "'";
                SqlCommand cmd = new SqlCommand(sqlQuery, sqlCon);
                SqlDataAdapter DA = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                DA.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();
                sqlCon.Close();
                int counter = GridView1.Rows.Count;
                resultLbl.Visible = true;
                resultLbl.Text = "Found " + counter + " record(s)";
            }

            //---------Case 1 x x 4 x-----------------------------------------------------------
            if (string.IsNullOrEmpty(txtSafeNo.Text) && StatusListbox.SelectedValue != "DocSta" && FacilityTypeList.SelectedValue == "FacType" && txtDate1.Text != "" && txtDate2.Text == "")
            {
                GridView1.DataSourceID = null;
                string sqlQuery;
                SqlConnection sqlCon = new SqlConnection(connectionString);
                sqlCon.Open();
                sqlQuery = "SELECT *FROM wak_tbl WHERE DocStatus='" + StatusListbox.SelectedValue + "' and SafeInDate='" + txtDate1.Text + "'";
                SqlCommand cmd = new SqlCommand(sqlQuery, sqlCon);
                SqlDataAdapter DA = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                DA.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();
                sqlCon.Close();
                int counter = GridView1.Rows.Count;
                resultLbl.Visible = true;
                resultLbl.Text = "Found " + counter + " record(s)";
            }

            //---------Case 1 2 x 4 x-----------------------------------------------------------
            if (string.IsNullOrEmpty(txtSafeNo.Text) && StatusListbox.SelectedValue != "DocSta" && FacilityTypeList.SelectedValue == "FacType" && txtDate1.Text != "" && txtDate2.Text != "")
            {
                GridView1.DataSourceID = null;
                string sqlQuery;
                SqlConnection sqlCon = new SqlConnection(connectionString);
                sqlCon.Open();
                sqlQuery = "SELECT *FROM wak_tbl WHERE DocStatus='" + StatusListbox.SelectedValue + "' AND SafeInDate BETWEEN'" + txtDate1.Text + "' AND '" + txtDate2.Text + "'";
                SqlCommand cmd = new SqlCommand(sqlQuery, sqlCon);
                SqlDataAdapter DA = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                DA.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();
                sqlCon.Close();
                int counter = GridView1.Rows.Count;
                resultLbl.Visible = true;
                resultLbl.Text = "Found " + counter + " record(s)";
            }
            //---------Case x x x x 5-----------------------------------------------------------
            if (string.IsNullOrEmpty(txtSafeNo.Text) && StatusListbox.SelectedValue == "DocSta" && FacilityTypeList.SelectedValue != "FacType" && txtDate1.Text == "" && txtDate2.Text == "")
            {
                GridView1.DataSourceID = null;
                string sqlQuery;
                SqlConnection sqlCon = new SqlConnection(connectionString);
                sqlCon.Open();
                sqlQuery = "SELECT *FROM wak_tbl WHERE FacilityType='" + FacilityTypeList.SelectedValue + "'";
                SqlCommand cmd = new SqlCommand(sqlQuery, sqlCon);
                SqlDataAdapter DA = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                DA.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();
                sqlCon.Close();
                int counter = GridView1.Rows.Count;
                resultLbl.Visible = true;
                resultLbl.Text = "Found " + counter + " record(s)";
            }
            //---------Case 1 x x x 5-----------------------------------------------------------
            if (string.IsNullOrEmpty(txtSafeNo.Text) && StatusListbox.SelectedValue == "DocSta" && FacilityTypeList.SelectedValue != "FacType" && txtDate1.Text != "" && txtDate2.Text == "")
            {
                GridView1.DataSourceID = null;
                string sqlQuery;
                SqlConnection sqlCon = new SqlConnection(connectionString);
                sqlCon.Open();
                sqlQuery = "SELECT *FROM wak_tbl WHERE FacilityType='" + FacilityTypeList.SelectedValue + "' AND SafeInDate='" + txtDate1.Text + "'";
                SqlCommand cmd = new SqlCommand(sqlQuery, sqlCon);
                SqlDataAdapter DA = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                DA.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();
                sqlCon.Close();
                int counter = GridView1.Rows.Count;
                resultLbl.Visible = true;
                resultLbl.Text = "Found " + counter + " record(s)";
            }

            //---------Case 1 2 x x 5-----------------------------------------------------------
            if (string.IsNullOrEmpty(txtSafeNo.Text) && StatusListbox.SelectedValue == "DocSta" && FacilityTypeList.SelectedValue != "FacType" && txtDate1.Text != "" && txtDate2.Text != "")
            {
                GridView1.DataSourceID = null;
                string sqlQuery;
                SqlConnection sqlCon = new SqlConnection(connectionString);
                sqlCon.Open();
                sqlQuery = "SELECT *FROM wak_tbl WHERE FacilityType='" + FacilityTypeList.SelectedValue + "' AND SafeInDate BETWEEN '" + txtDate1.Text + "' AND '" + txtDate2.Text + "'";
                SqlCommand cmd = new SqlCommand(sqlQuery, sqlCon);
                SqlDataAdapter DA = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                DA.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();
                sqlCon.Close();
                int counter = GridView1.Rows.Count;
                resultLbl.Visible = true;
                resultLbl.Text = "Found " + counter + " record(s)";
            }

            //---------Case 1 2 3 x 5-----------------------------------------------------------
            if (!string.IsNullOrEmpty(txtSafeNo.Text) && StatusListbox.SelectedValue == "DocSta" && FacilityTypeList.SelectedValue != "FacType" && txtDate1.Text != "" && txtDate2.Text != "")
            {
                GridView1.DataSourceID = null;
                string sqlQuery;
                SqlConnection sqlCon = new SqlConnection(connectionString);
                sqlCon.Open();
                sqlQuery = "SELECT *FROM wak_tbl WHERE FacilityType='" + FacilityTypeList.SelectedValue + "' AND [ClientName] LIKE '%" + txtSafeNo.Text + "%'  AND SafeInDate BETWEEN '" + txtDate1.Text + "' AND '" + txtDate2.Text + "'";
                SqlCommand cmd = new SqlCommand(sqlQuery, sqlCon);
                SqlDataAdapter DA = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                DA.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();
                sqlCon.Close();
                int counter = GridView1.Rows.Count;
                resultLbl.Visible = true;
                resultLbl.Text = "Found " + counter + " record(s)";
            }
            //--------------------Case x x x x 5 is covered
            //--------------------Case x x x 4 5
            if (string.IsNullOrEmpty(txtSafeNo.Text) && StatusListbox.SelectedValue != "DocSta" && FacilityTypeList.SelectedValue != "FacType" && txtDate1.Text == "" && txtDate2.Text == "")
            {
                GridView1.DataSourceID = null;
                string sqlQuery;
                SqlConnection sqlCon = new SqlConnection(connectionString);
                sqlCon.Open();
                sqlQuery = "SELECT *FROM wak_tbl WHERE FacilityType='" + FacilityTypeList.SelectedValue + "' AND DocStatus='" + StatusListbox.SelectedValue + "'";
                SqlCommand cmd = new SqlCommand(sqlQuery, sqlCon);
                SqlDataAdapter DA = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                DA.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();
                sqlCon.Close();
                int counter = GridView1.Rows.Count;
                resultLbl.Visible = true;
                resultLbl.Text = "Found " + counter + " record(s)";
            }

            //--------------------Case x x 3 4 5
            if (!string.IsNullOrEmpty(txtSafeNo.Text) && StatusListbox.SelectedValue != "DocSta" && FacilityTypeList.SelectedValue != "FacType" && txtDate1.Text == "" && txtDate2.Text == "")
            {
                GridView1.DataSourceID = null;
                string sqlQuery;
                SqlConnection sqlCon = new SqlConnection(connectionString);
                sqlCon.Open();
                sqlQuery = "SELECT *FROM wak_tbl WHERE FacilityType='" + FacilityTypeList.SelectedValue + "' AND DocStatus='" + StatusListbox.SelectedValue + "' AND [ClientName] LIKE '%" + txtSafeNo.Text + "%'";
                SqlCommand cmd = new SqlCommand(sqlQuery, sqlCon);
                SqlDataAdapter DA = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                DA.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();
                sqlCon.Close();
                int counter = GridView1.Rows.Count;
                resultLbl.Visible = true;
                resultLbl.Text = "Found " + counter + " record(s)";
            }

            //--------------------Case x 2 3 4 5
            if (!string.IsNullOrEmpty(txtSafeNo.Text) && StatusListbox.SelectedValue != "DocSta" && FacilityTypeList.SelectedValue != "FacType" && txtDate1.Text == "" && txtDate2.Text != "")
            {
                GridView1.DataSourceID = null;
                string sqlQuery;
                SqlConnection sqlCon = new SqlConnection(connectionString);
                sqlCon.Open();
                sqlQuery = "SELECT *FROM wak_tbl WHERE FacilityType='" + FacilityTypeList.SelectedValue + "' AND DocStatus='" + StatusListbox.SelectedValue + "' AND [ClientName] LIKE '%" + txtSafeNo.Text + "%' AND SafeInDate='" + txtDate2.Text + "'";
                SqlCommand cmd = new SqlCommand(sqlQuery, sqlCon);
                SqlDataAdapter DA = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                DA.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();
                sqlCon.Close();
                int counter = GridView1.Rows.Count;
                resultLbl.Visible = true;
                resultLbl.Text = "Found " + counter + " record(s)";
            }
        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                Session["id"] = e.CommandArgument.ToString();
                SqlConnection sqlCon = new SqlConnection(connectionString);
                string query = "SELECT *FROM Wak_tbl where id = '" + Session["id"].ToString() + "'";
                SqlCommand sqlcmd = new SqlCommand(query, sqlCon);
                sqlCon.Open();
                SqlDataReader rdr = sqlcmd.ExecuteReader();
                if (rdr.Read())
                {
                    Session["id"] = (string)rdr["id"].ToString();
                    Session["ClientName"] = (string)rdr["Clientname"].ToString();
                    Session["FacilityApp"] = (string)rdr["FacilityApproval"].ToString();
                    Session["FacilityType"] = (string)rdr["FacilityType"].ToString();
                    Session["FacStatus"] = (string)rdr["FacilityStatus"].ToString();
                    Session["SafeNo"] = (string)rdr["SafeNo"].ToString();
                    Session["Drawer"] = (string)rdr["drawer"].ToString();
                    Session["FNO"] = (string)rdr["FolderNo"].ToString();
                    Session["Extention"] = (string)rdr["Extention"].ToString();
                    Session["Modification"] = (string)rdr["modification"].ToString();
                    Session["SafeInDate"] = (string)rdr["SafeInDate"].ToString();
                    Session["DocStatus"] = (string)rdr["DocStatus"].ToString();
                    Session["SafeoutDate"] = (string)rdr["SafeOutDate"].ToString();
                    Session["Remark"] = (string)rdr["Remark"].ToString();
                    Session["InsertedBy"] = (string)rdr["InsertedBy"].ToString();
                    Session["ApprovedBy"] = (string)rdr["ApprovedBy"].ToString();
                    Session["updatedBy"] = (string)rdr["updatedBy"].ToString();
                    Session["ArchDoc"] = (string)rdr["ArchDoc"].ToString();
                    Session["SafeRef"] = (string)rdr["SafeRef"].ToString();
                    Session["ArchDate"] = (string)rdr["ArchDate"].ToString();
                    sqlCon.Close();
                    Response.Redirect("New_wak.aspx");
                }
            }
        }
        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {
            //GridView1.DataSourceID = null;
            //string sqlQuery;
            //SqlConnection sqlCon = new SqlConnection(connectionString);
            //sqlCon.Open();
            ////sqlQuery = "insert into wak_tbl (SafeInDate,SafeOutDate) values (@date1,@date2)";
            //sqlQuery = "SELECT *FROM Wak_tbl WHERE SafeInDate  BETWEEN @date1 AND @date2 ORDER BY SafeInDate ASC";
            //SqlCommand cmd = new SqlCommand(sqlQuery, sqlCon);
            //cmd.Parameters.AddWithValue("@date1", txtDate1.Text);
            //cmd.Parameters.AddWithValue("@date2", txtDate2.Text);
            //cmd.ExecuteNonQuery();
            //SqlDataAdapter DA = new SqlDataAdapter(cmd);
            //DataSet ds = new DataSet();
            //DA.Fill(ds);
            //GridView1.DataSource = ds;
            //GridView1.DataBind();
            //sqlCon.Close();
            //int counter = GridView1.Rows.Count;
            //resultLbl.Visible = true;
            //resultLbl.Text = "Found " + counter + " Record(s)";

        }
        protected void FacilityTypeList_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtSafeNo.Text) && StatusListbox.SelectedValue == "DocSta")
            {
                //=======================================Case 1.1
                GridView1.DataSourceID = null;
                string sqlQuery;
                SqlConnection sqlCon = new SqlConnection(connectionString);
                sqlCon.Open();
                sqlQuery = "SELECT *FROM wak_tbl WHERE FacilityType='" + FacilityTypeList.SelectedValue + "'";
                SqlCommand cmd = new SqlCommand(sqlQuery, sqlCon);
                SqlDataAdapter DA = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                DA.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();
                sqlCon.Close();
                int counter = GridView1.Rows.Count;
                resultLbl.Visible = true;
                resultLbl.Text = "Found " + counter + " record(s)";
            }
            //----------------------------------------END CASE 1.1
            if (!string.IsNullOrEmpty(txtSafeNo.Text) && StatusListbox.SelectedValue == "DocSta")
            {
                //=======================================Case 1.3
                GridView1.DataSourceID = null;
                string sqlQuery;
                SqlConnection sqlCon = new SqlConnection(connectionString);
                sqlCon.Open();
                sqlQuery = "SELECT *FROM wak_tbl WHERE FacilityType='" + FacilityTypeList.SelectedValue + "' and SafeNo='" + txtSafeNo.Text + "'";
                SqlCommand cmd = new SqlCommand(sqlQuery, sqlCon);
                SqlDataAdapter DA = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                DA.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();
                sqlCon.Close();
                int counter = GridView1.Rows.Count;
                resultLbl.Visible = true;
                resultLbl.Text = "Found " + counter + " record(s)";
            }
            //----------------------------------------END CASE 1.3
            if (string.IsNullOrEmpty(txtSafeNo.Text) && StatusListbox.SelectedValue != "DocSta")
            {
                //=======================================Case 1.4
                GridView1.DataSourceID = null;
                string sqlQuery;
                SqlConnection sqlCon = new SqlConnection(connectionString);
                sqlCon.Open();
                sqlQuery = "SELECT *FROM wak_tbl WHERE FacilityType='" + FacilityTypeList.SelectedValue + "' and DocStatus='" + StatusListbox.SelectedValue + "'";
                SqlCommand cmd = new SqlCommand(sqlQuery, sqlCon);
                SqlDataAdapter DA = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                DA.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();
                sqlCon.Close();
                int counter = GridView1.Rows.Count;
                resultLbl.Visible = true;
                resultLbl.Text = "Found " + counter + " record(s)";
            }
            //----------------------------------------END CASE 1.4

        }

        protected void txtSafeInDate_TextChanged(object sender, EventArgs e)
        {

        }

        protected void StatusListbox_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void chkb1_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox ChkBoxHeader = (CheckBox)GridView1.HeaderRow.FindControl("chkb1");
            foreach (GridViewRow row in GridView1.Rows)
            {
                CheckBox ChkBoxRows = (CheckBox)row.FindControl("chkSelect");
                if (ChkBoxHeader.Checked == true)
                {
                    ChkBoxRows.Checked = true;
                }
                else
                {
                    ChkBoxRows.Checked = false;
                }
            }
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {

            DataTable dt = new DataTable();
            dt.Columns.Add("id");
            dt.Columns.Add("ClientName");
            dt.Columns.Add("FacilityApproval");
            dt.Columns.Add("FacilityType");
            dt.Columns.Add("FacilityStatus");
            dt.Columns.Add("SafeNo");
            dt.Columns.Add("drawer");
            dt.Columns.Add("FolderNo");
            dt.Columns.Add("Extention");
            dt.Columns.Add("modification");
            dt.Columns.Add("SafeInDate");
            dt.Columns.Add("DocStatus");
            dt.Columns.Add("SafeOutDate");
            dt.Columns.Add("Remark");
            dt.Columns.Add("InsertedBy");
            dt.Columns.Add("updatedBy");
            dt.Columns.Add("approvedBy");
            dt.Columns.Add("ArchDoc");
            dt.Columns.Add("SafeRef");
            dt.Columns.Add("ArchDate");
            foreach (GridViewRow gw in GridView1.Rows)
            {

                var chkSelect = gw.FindControl("chkSelect") as CheckBox;
                if (chkSelect.Checked)
                {
                    string Val1 = (gw.FindControl("Label1") as Label).Text; //
                    string Val2 = (gw.FindControl("Label2") as Label).Text; //
                    string Val3 = (gw.FindControl("Label3") as Label).Text; //
                    string Val4 = (gw.FindControl("Label4") as Label).Text; //
                    string Val5 = (gw.FindControl("Label5") as Label).Text; //
                    string Val6 = (gw.FindControl("Label6") as Label).Text; //
                    string Val7 = (gw.FindControl("Label7") as Label).Text; //
                    string Val8 = (gw.FindControl("Label8") as Label).Text; //
                    string Val9 = (gw.FindControl("Label9") as Label).Text; //
                    string Val10 = (gw.FindControl("Label10") as Label).Text; //
                    string Val11 = (gw.FindControl("Label11") as Label).Text; //
                    string Val12 = (gw.FindControl("Label12") as Label).Text; //
                    string Val13 = (gw.FindControl("Label13") as Label).Text; //
                    string Val14 = (gw.FindControl("Label14") as Label).Text; //
                    string Val15 = (gw.FindControl("Label15") as Label).Text; //
                    string Val16 = (gw.FindControl("Label16") as Label).Text; //
                    string Val17 = (gw.FindControl("Label17") as Label).Text; //
                    string Val18 = (gw.FindControl("Label18") as Label).Text; //
                    string Val19 = (gw.FindControl("Label19") as Label).Text; //
                    string Val20 = (gw.FindControl("Label20") as Label).Text; //
                    dt.Rows.Add(Val1, Val2, Val3, Val4, Val5, Val6, Val7, Val8, Val9, Val10, Val11, Val12, Val13, Val14, Val15, Val16, Val17, Val18, Val19, Val20);
                }
            }

            //--------------------------------
            var products = dt;
            ExcelPackage excel = new ExcelPackage();
            var workSheet = excel.Workbook.Worksheets.Add("Wazir_Akbarkhan");
            var totalCols = products.Columns.Count;
            var totalRows = products.Rows.Count;

            for (var col = 1; col <= totalCols; col++)
            {
                workSheet.Cells[1, col].Value = products.Columns[col - 1].ColumnName;
            }
            for (var row = 1; row <= totalRows; row++)
            {
                for (var col = 0; col < totalCols; col++)
                {
                    workSheet.Cells[row + 1, col + 1].Value = products.Rows[row - 1][col];
                }
            }
            using (var memoryStream = new MemoryStream())
            {
                Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                Response.AddHeader("content-disposition", "attachment;  filename=WAK_records.xlsx");
                excel.SaveAs(memoryStream);
                memoryStream.WriteTo(Response.OutputStream);
                Response.Flush();
                Response.End();
            }

        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            txtDate1.Text = "";
            txtDate1.TextMode = TextBoxMode.Date;
            txtDate2.Text = "";
            txtDate2.TextMode = TextBoxMode.Date;
        }

        protected void txtDate1_TextChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            string fullUsername = User.Identity.Name;
            string username = fullUsername.Substring(fullUsername.IndexOf("\\") + 1);

            SqlDataAdapter sda = new SqlDataAdapter("select * from [userMng] where username= '" + username + "'", connectionString);
            DataTable dtResult = new DataTable();
            sda.Fill(dtResult);

            string userType = dtResult.Rows[0]["Access_role"].ToString();

            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                if (userType == "Supper Admin")
                {
                    e.Row.Cells[1].Enabled = false;
                    addNew.Enabled = false;

                }
                if (userType == "Admin")
                {
                    e.Row.Cells[1].Enabled = false;
                    addNew.Enabled = false;
                }

                if (userType == "Users")
                {
                    e.Row.Cells[1].Enabled = true;
                    addNew.Enabled = true;
                }
            }
        }
    }
}