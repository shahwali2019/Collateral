using OfficeOpenXml;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Collateral_int
{

    public partial class mcu_record : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
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
            }
        }

        protected void searchBtn_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtbname.Text) && string.IsNullOrEmpty(txtCode.Text) && string.IsNullOrEmpty(txtLog.Text) && statusList.SelectedValue == "LS")
            {
                string connectionString = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                GridView1.DataSourceID = null;
                string sqlQuery;
                SqlConnection sqlCon = new SqlConnection(connectionString);
                sqlCon.Open();
                sqlQuery = "SELECT *FROM mcu_tbl";
                SqlCommand cmd = new SqlCommand(sqlQuery, sqlCon);
                cmd.ExecuteNonQuery();
                SqlDataAdapter DA = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                DA.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();
                sqlCon.Close();
                int counter = GridView1.Rows.Count;
                resultLbl.Visible = true;
                if (counter <= 1)
                {
                    resultLbl.Text = "Found " + counter + " Record.";
                }
                else

                    resultLbl.Text = "Found " + counter + " Record(s).";
            }
            //----------Search by Customer Name-----------------------------------------------------------------
            if (!string.IsNullOrEmpty(txtbname.Text) && string.IsNullOrEmpty(txtCode.Text) && string.IsNullOrEmpty(txtLog.Text) && statusList.SelectedValue == "LS")
            {
                string connectionString = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                GridView1.DataSourceID = null;
                string sqlQuery;
                SqlConnection sqlCon = new SqlConnection(connectionString);
                sqlCon.Open();
                sqlQuery = "SELECT *FROM mcu_tbl where [Customre Name] LIKE '%" + txtbname.Text.Trim() + "%'";
                SqlCommand cmd = new SqlCommand(sqlQuery, sqlCon);
                cmd.ExecuteNonQuery();
                SqlDataAdapter DA = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                DA.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();
                sqlCon.Close();
                int counter = GridView1.Rows.Count;
                resultLbl.Visible = true;
                if (counter <= 1)
                {
                    resultLbl.Text = "Found " + counter + " Record.";
                }
                else resultLbl.Text = "Found " + counter + " Record(s).";
            }

            //----------Search by AccountNumber-----------------------------------------------------------------
            if (string.IsNullOrEmpty(txtbname.Text) && !string.IsNullOrEmpty(txtCode.Text) && string.IsNullOrEmpty(txtLog.Text) && statusList.SelectedValue == "LS")
            {
                string connectionString = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                GridView1.DataSourceID = null;
                string sqlQuery;
                SqlConnection sqlCon = new SqlConnection(connectionString);
                sqlCon.Open();
                sqlQuery = "SELECT *FROM mcu_tbl where [Account Number] LIKE '%" + txtCode.Text.Trim() + "%'";
                SqlCommand cmd = new SqlCommand(sqlQuery, sqlCon);
                cmd.ExecuteNonQuery();
                SqlDataAdapter DA = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                DA.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();
                sqlCon.Close();
                int counter = GridView1.Rows.Count;
                resultLbl.Visible = true;
                if (counter <= 1)
                {
                    resultLbl.Text = "Found " + counter + " Record.";
                }
                else resultLbl.Text = "Found " + counter + " Record(s).";
            }

            //----------Search by Approval Number-----------------------------------------------------------------
            if (string.IsNullOrEmpty(txtbname.Text) && string.IsNullOrEmpty(txtCode.Text) && !string.IsNullOrEmpty(txtLog.Text) && statusList.SelectedValue == "LS")
            {
                string connectionString = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                GridView1.DataSourceID = null;
                string sqlQuery;
                SqlConnection sqlCon = new SqlConnection(connectionString);
                sqlCon.Open();
                sqlQuery = "SELECT * FROM mcu_tbl where [Approval Number] LIKE '%" + txtLog.Text.Trim() + "%'";
                SqlCommand cmd = new SqlCommand(sqlQuery, sqlCon);
                cmd.ExecuteNonQuery();
                SqlDataAdapter DA = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                DA.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();
                sqlCon.Close();
                int counter = GridView1.Rows.Count;
                resultLbl.Visible = true;
                if (counter <= 1)
                {
                    resultLbl.Text = "Found " + counter + " Record.";
                }
                else resultLbl.Text = "Found " + counter + " Record(s).";
            }
            //-------------------------------------------------------
            //----------Search by AccountNumber-----------------------------------------------------------------
            if (string.IsNullOrEmpty(txtbname.Text) && string.IsNullOrEmpty(txtCode.Text) && string.IsNullOrEmpty(txtLog.Text) && statusList.SelectedValue != "LS")
            {
                string connectionString = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                GridView1.DataSourceID = null;
                string sqlQuery;
                SqlConnection sqlCon = new SqlConnection(connectionString);
                sqlCon.Open();
                sqlQuery = "SELECT *FROM mcu_tbl where [Loan Status] = '" + statusList.SelectedValue + "'";
                SqlCommand cmd = new SqlCommand(sqlQuery, sqlCon);
                cmd.ExecuteNonQuery();
                SqlDataAdapter DA = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                DA.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();
                sqlCon.Close();
                int counter = GridView1.Rows.Count;
                resultLbl.Visible = true;
                if (counter <= 1)
                {
                    resultLbl.Text = "Found " + counter + " Record.";
                }
                else resultLbl.Text = "Found " + counter + " Record(s).";
            }

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

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                Session["mcu_id"] = e.CommandArgument.ToString();
                string connectionString = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                SqlConnection sqlCon = new SqlConnection(connectionString);
                string query = "SELECT *FROM mcu_tbl where id = '" + Session["mcu_id"].ToString() + "'";
                SqlCommand sqlcmd = new SqlCommand(query, sqlCon);
                sqlCon.Open();
                SqlDataReader rdr = sqlcmd.ExecuteReader();
                if (rdr.Read())
                {
                    Session["id"] = (string)rdr["id"].ToString();
                    Session["cn"] = (string)rdr["Customre Name"].ToString();
                    Session["cur"] = (string)rdr["Currency"].ToString();
                    Session["account"] = (string)rdr["Account Number"].ToString();
                    Session["appNo"] = (string)rdr["Approval Number"].ToString();
                    Session["Dis"] = (string)rdr["Disburesement"].ToString();
                    Session["DDM"] = (string)rdr["Due Date of MCU"].ToString();
                    Session["MCUD"] = (string)rdr["MCU Date"].ToString();
                    Session["LS"] = (string)rdr["Loan Status"].ToString();
                    Session["Remark"] = (string)rdr["Remark"].ToString();
                    Session["InsertedBy"] = (string)rdr["Inserted By"].ToString();
                    sqlCon.Close();

                }
                Response.Redirect("new_mcu_record.aspx");
            }

        }

        protected void addNew_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("new_mcu_record.aspx");
        }

        protected void excelExporter_Click(object sender, ImageClickEventArgs e)
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("id");
            dt.Columns.Add("Customre Name");
            dt.Columns.Add("Currency");
            dt.Columns.Add("Account Number");
            dt.Columns.Add("Approval Number");
            dt.Columns.Add("Disburesement");
            dt.Columns.Add("Due Date of MCU");
            dt.Columns.Add("MCU Date");
            dt.Columns.Add("Loan Status");
            dt.Columns.Add("Remark");
            dt.Columns.Add("Inserted By");
            dt.Columns.Add("Approved By");
            dt.Columns.Add("Updated By");

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
                    dt.Rows.Add(Val1, Val2, Val3, Val4, Val5, Val6, Val7, Val8, Val9, Val10, Val11, Val12, Val13);
                }
            }
            //--------------------------------
            var products = dt;
            ExcelPackage excel = new ExcelPackage();
            var workSheet = excel.Workbook.Worksheets.Add("MCU");
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
                Response.AddHeader("content-disposition", "attachment;  filename=mcu.xlsx");
                excel.SaveAs(memoryStream);
                memoryStream.WriteTo(Response.OutputStream);
                Response.Flush();
                Response.End();
            }

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
                }
            }
        }
    }
}