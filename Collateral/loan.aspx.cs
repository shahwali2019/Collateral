using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data.SqlClient;
using System.Web.UI.HtmlControls;
using System.Data;
using System.IO;
using System.Drawing;
using System.Configuration;
using System.Text;
using GemBox.Spreadsheet;

namespace Collateral_int
{
    public partial class loan1 : System.Web.UI.Page
    {
        string Val11,
        Val12,
        Val13,
        Val14,
        Val15,
        Val16,
        Val17,
        Val18,
        Val19,
        Val110,
        Val111,
        Val112,
        Val113,
        Val114;


        string connectionString = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                //this.BindGrid();
                Pupulategv();
            }
            string fullUsername = User.Identity.Name;
            int index_domain = fullUsername.IndexOf("AIB\\");
            string username = fullUsername.Substring(fullUsername.IndexOf("\\") + 1);
        }
        //=============================================End of page load

        void Pupulategv()

        {
            DataTable dt = new DataTable();
            using (SqlConnection sql = new SqlConnection(connectionString))
            {
                sql.Open();
                SqlDataAdapter sqlda = new SqlDataAdapter("select * from [Loanadder_tbl] ", sql);
                sqlda.Fill(dt);
            }

            if (dt.Rows.Count > 0)
            {
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            else
            {
                dt.Rows.Add(dt.NewRow());
                GridView1.DataSource = dt;
                GridView1.DataBind();
                GridView1.Rows[0].Cells.Clear();
                GridView1.Rows[0].Cells.Add(new TableCell());
                GridView1.Rows[0].Cells[0].ColumnSpan = dt.Columns.Count;
                GridView1.Rows[0].Cells[0].Text = " no data found";
                GridView1.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
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
                    ImageButton2.Enabled = false;
                    ImageButton3.Enabled = false;
                }
                if (userType == "Admin")
                {
                    e.Row.Cells[1].Enabled = false;
                    ImageButton2.Enabled = false;
                    ImageButton3.Enabled = false;
                }

                if (userType == "Users")
                {
                    e.Row.Cells[1].Enabled = true;
                    ImageButton2.Enabled = true;
                    ImageButton3.Enabled = true;
                }
            }
        }

        protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("bulkRelease.aspx");
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
            dt.Columns.Add("CID"); //
            dt.Columns.Add("bname"); //
            dt.Columns.Add("pdate"); //
            dt.Columns.Add("telecom"); //
            dt.Columns.Add("dino"); //
            dt.Columns.Add("ourRef"); //
            dt.Columns.Add("CardSerialStart");
            dt.Columns.Add("CardSerialEnd");
            dt.Columns.Add("Qty");
            dt.Columns.Add("CartonValAfn");
            dt.Columns.Add("status");
            dt.Columns.Add("ReleaseDate");
            dt.Columns.Add("RotationDate");
            dt.Columns.Add("SecRotationDate");
            dt.Columns.Add("ThirdRotationDate");

            foreach (GridViewRow gw in GridView1.Rows)
            {
                var chkSelect = gw.FindControl("chkSelect") as CheckBox;
                if (chkSelect.Checked)
                {
                    string Val16 = (gw.FindControl("Label19") as Label).Text; // id
                    string Val1 = (gw.FindControl("Label1") as Label).Text; //CID
                    string Val2 = (gw.FindControl("Label2") as Label).Text; //BNAME
                    string Val3 = (gw.FindControl("Label3") as Label).Text; //pdate
                    string Val4 = (gw.FindControl("Label4") as Label).Text; //telecom
                    string Val5 = (gw.FindControl("Label5") as Label).Text; //dino
                    string Val6 = (gw.FindControl("Label6") as Label).Text; //ourRef
                    string Val7 = (gw.FindControl("Label7") as Label).Text; //CSS
                    string Val8 = (gw.FindControl("Label8") as Label).Text; //CSE
                    string Val9 = (gw.FindControl("Label9") as Label).Text; //qty
                    string Val10 = (gw.FindControl("Label10") as Label).Text; //CardValAfn
                    string Val11 = (gw.FindControl("Label11") as Label).Text; //Status
                    string Val12 = (gw.FindControl("Label12") as Label).Text; //ReleaseDate
                    string Val13 = (gw.FindControl("Label13") as Label).Text; //Rotation Date
                    string Val14 = (gw.FindControl("Label14") as Label).Text; //2nd RD
                    string Val15 = (gw.FindControl("Label15") as Label).Text; //3rd RD
                    dt.Rows.Add(Val1, Val2, Val3, Val4, Val5, Val6, Val7, Val8, Val9, Val10, Val11, Val12, Val13, Val14, Val15);
                }
            }
            //============================================================

            var products = dt;
            OfficeOpenXml.ExcelPackage excel = new OfficeOpenXml.ExcelPackage();

            var workSheet = excel.Workbook.Worksheets.Add("LoanTracker");

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
                Response.AddHeader("content-disposition", "attachment;  filename=PledgeRecords.xlsx");
                excel.SaveAs(memoryStream);
                memoryStream.WriteTo(Response.OutputStream);
                Response.Flush();
                Response.End();

            }
            //-------------------------------------

        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "bselect")
            {
                Session["bid"] = e.CommandArgument.ToString();
                Response.Redirect("addnew.aspx");

            }
            //------------------------------------------------
            if (e.CommandName == "Select")
            {
                Session["id"] = e.CommandArgument.ToString();

                Response.Redirect("PledgeEditMode.aspx");
            }
        }

        protected void searchBtn_Click(object sender, EventArgs e)
        {
            GridView1.Visible = true;
            if (string.IsNullOrEmpty(searchbarTxt.Text) && string.IsNullOrEmpty(txtDino.Text) && string.IsNullOrEmpty(txtPdate.Text) && statusList.SelectedValue == "status")
            {
                string sqlQuery;
                SqlConnection sqlCon = new SqlConnection(connectionString);
                sqlCon.Open();
                sqlQuery = "select *from Loanadder_tbl";

                SqlCommand cmd = new SqlCommand(sqlQuery, sqlCon);
                SqlDataAdapter DA = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                DA.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();
                sqlCon.Close();
                int counter = GridView1.Rows.Count;
                if (counter <= 1)
                {
                    resultLbl.Visible = true;
                    resultLbl.Text = "Found " + counter + " record for : " + searchbarTxt.Text;
                }
                else
                {
                    resultLbl.Visible = true;
                    resultLbl.Text = "Found " + counter + " record(s) for : " + searchbarTxt.Text;
                }
                if (string.IsNullOrEmpty(searchbarTxt.Text) && string.IsNullOrEmpty(txtDino.Text) && string.IsNullOrEmpty(txtPdate.Text))
                {
                    resultLbl.Visible = true;
                    resultLbl.Text = "All Records";
                }

            }
            //END of SHOW ALL
            //--------------------------Customer Name---------------------------------------------------------
            if (!string.IsNullOrEmpty(searchbarTxt.Text) && string.IsNullOrEmpty(txtDino.Text) && string.IsNullOrEmpty(txtPdate.Text) && statusList.SelectedValue == "status")
            {
                string sqlQuery;
                SqlConnection sqlCon = new SqlConnection(connectionString);
                sqlCon.Open();
                sqlQuery = "SELECT *FROM Loanadder_tbl WHERE bname LIKE '%" + searchbarTxt.Text.Trim() + "%'";

                SqlCommand cmd = new SqlCommand(sqlQuery, sqlCon);
                SqlDataAdapter DA = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                DA.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();
                sqlCon.Close();
                int counter = GridView1.Rows.Count;

                resultLbl.Visible = true;
                resultLbl.Visible = true;
                resultLbl.Text = "Customer Name Found " + counter + " record(s) for : " + searchbarTxt.Text;

            }
            //--------------------------Customer Name and Dinomination---------------------------------------------------------
            if (!string.IsNullOrEmpty(searchbarTxt.Text) && !string.IsNullOrEmpty(txtDino.Text) && string.IsNullOrEmpty(txtPdate.Text) && statusList.SelectedValue == "status")
            {
                string sqlQuery;
                SqlConnection sqlCon = new SqlConnection(connectionString);
                sqlCon.Open();
                sqlQuery = "SELECT *FROM Loanadder_tbl where bname LIKE '%" + searchbarTxt.Text + "%' AND dino='" + txtDino.Text + "'";

                SqlCommand cmd = new SqlCommand(sqlQuery, sqlCon);
                SqlDataAdapter DA = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                DA.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();
                sqlCon.Close();
                int counter = GridView1.Rows.Count;
                resultLbl.Visible = true;
                resultLbl.Text = "Customer Name and Dino Found " + counter + " record(s).";

            }
            //--------------------------Customer Name and Dinomination and Pledge Date---------------------------------------------------------
            if (!string.IsNullOrEmpty(searchbarTxt.Text) && !string.IsNullOrEmpty(txtDino.Text) && !string.IsNullOrEmpty(txtPdate.Text) && statusList.SelectedValue == "status")
            {
                string sqlQuery;
                SqlConnection sqlCon = new SqlConnection(connectionString);
                sqlCon.Open();
                sqlQuery = "SELECT *FROM Loanadder_tbl where bname LIKE '%" + searchbarTxt.Text + "%' AND dino='" + txtDino.Text + "' AND pdate='" + txtPdate.Text + "'";

                SqlCommand cmd = new SqlCommand(sqlQuery, sqlCon);
                SqlDataAdapter DA = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                DA.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();
                sqlCon.Close();
                int counter = GridView1.Rows.Count;
                resultLbl.Visible = true;
                resultLbl.Text = "Customer Name and Dino on " + txtPdate.Text + " Found " + counter + " record(s) for : " + searchbarTxt.Text;

            }
            //--------------------------Status Search---------------------------------------------------------
            if (string.IsNullOrEmpty(searchbarTxt.Text) && string.IsNullOrEmpty(txtDino.Text) && string.IsNullOrEmpty(txtPdate.Text) && statusList.SelectedValue != "status")
            {
                string sqlQuery;
                SqlConnection sqlCon = new SqlConnection(connectionString);
                sqlCon.Open();
                sqlQuery = "SELECT *FROM Loanadder_tbl WHERE status='" + statusList.SelectedValue + "'";
                SqlCommand cmd = new SqlCommand(sqlQuery, sqlCon);
                SqlDataAdapter DA = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                DA.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();
                sqlCon.Close();
                int counter = GridView1.Rows.Count;
                resultLbl.Visible = true;
                resultLbl.Text = "Customer Name and Dino on " + txtPdate.Text + " Found " + counter + " record(s) for : " + searchbarTxt.Text;

            }
            ////---------------------------------------------------------

        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("addnew.aspx");
        }

        protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Insert")
            {
                Session["pid"] = e.CommandArgument.ToString();
                int id = Int32.Parse(Session["pid"].ToString());
                //-------------------------------------------
                //    //= --------------Get data from--------------------
                string connectionString2 = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                using (SqlConnection sqlCon2 = new SqlConnection(connectionString2))
                {
                    sqlCon2.Open();

                    string query = "SELECT *FROM loanadder_tbl2 WHERE id='" + id + "'";
                    SqlCommand sqlcmd = new SqlCommand(query, sqlCon2);
                    SqlDataReader dr;
                    dr = sqlcmd.ExecuteReader();
                    while (dr.Read())
                    {
                        Val11 = dr["id"].ToString();
                        Val12 = dr["CID"].ToString();
                        Val13 = dr["bname"].ToString();
                        Val14 = dr["pdate"].ToString();
                        Val15 = dr["Telecom"].ToString();
                        Val16 = dr["dino"].ToString();
                        Val17 = dr["ourRef"].ToString();
                        Val18 = dr["CardSerialStart"].ToString();
                        Val19 = dr["CardSerialEnd"].ToString();
                        Val110 = dr["Qty"].ToString();
                        Val111 = dr["CartonValAfn"].ToString();
                        Val112 = dr["status"].ToString();
                        Val113 = dr["ReleaseDate"].ToString();
                        Val114 = dr["RotationDate"].ToString();
                    }
                    dr.Close();
                    sqlCon2.Close();
                    sqlCon2.Dispose();
                }
                //    //=====================================================================
                string connectionString = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    sqlCon.Open();
                    string query = "INSERT INTO [dbo].[Loanadder_tbl](" + 
                        "[CID]," +
                        "[bname]," + 
                        "[pdate]," + 
                        "[Telecom]," +
                        "[dino]," +
                        "[ourRef]," + 
                        "[CardSerialStart]," + 
                        "[CardSerialEnd]," + 
                        "[Qty]," + 
                        "[CartonValAfn]," + 
                        "[status]," + 
                        "[ReleaseDate]," + 
                        "[RotationDate])" + 
                        "VALUES " + 
                        "(@CID," +
                        "@bname," + 
                        "@pdate," +
                        "@telecom," +
                        "@dino," + 
                        "@ourRef," + 
                        "@css," + 
                        "@CSE," +
                        "@qty," +
                        "@Carton," + 
                        "@status," +
                        "@ReleaseDate," + 
                        "@rotation)";
                    SqlCommand sqlcmd = new SqlCommand(query, sqlCon);
                    //--------------------------------------------------
                    sqlcmd.Parameters.AddWithValue("@CID", Val12);
                    sqlcmd.Parameters.AddWithValue("@bname", Val13);
                    sqlcmd.Parameters.AddWithValue("@pdate", Val14);
                    sqlcmd.Parameters.AddWithValue("@telecom", Val15);
                    sqlcmd.Parameters.AddWithValue("@dino", Val16);
                    sqlcmd.Parameters.AddWithValue("@ourRef", Val17);
                    sqlcmd.Parameters.AddWithValue("@css", Val18);
                    sqlcmd.Parameters.AddWithValue("@CSE", Val19);
                    sqlcmd.Parameters.AddWithValue("@qty", Val110);
                    sqlcmd.Parameters.AddWithValue("@Carton", Val111);
                    sqlcmd.Parameters.AddWithValue("@status", Val112);
                    sqlcmd.Parameters.AddWithValue("@ReleaseDate", Val113);
                    sqlcmd.Parameters.AddWithValue("@rotation", Val114);
                    sqlcmd.ExecuteNonQuery();
                    resultLbl.Text = "Pending record inserted successfully!";
                    resultLbl.ForeColor = System.Drawing.Color.Blue;
                    resultLbl.Visible = true;
                    //----------------------------------------------
                    sqlCon.Close();
                }

            } //==========================================end of insert
            using (SqlConnection sqlCon2 = new SqlConnection(connectionString))
            {
                string rid = Session["pid"].ToString();
                sqlCon2.Open();
                string query = "delete FROM Loanadder_tbl2 where id='" + rid + "'";
                SqlCommand sqlcmd = new SqlCommand(query, sqlCon2);
                sqlcmd.ExecuteNonQuery();
                sqlCon2.Close();
                Session.Remove("pid");
            }
            GridView2.DataSourceID = "SqlCon2";
            GridView2.DataBind();
        }
    }
}