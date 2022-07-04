using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Drawing;
using System.Data.SqlClient;
using System.Configuration;
using OfficeOpenXml;
using System.IO;

namespace Collateral
{
    public partial class LAR : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
        //string str, UserName, Password;
        //SqlCommand com;
        //SqlDataAdapter sqlda;
        //DataTable dt;
        //int RowCount;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                //this.BindGrid();
                Pupulategv();
            }

        }

        //private void BindGrid()
        //{
        //string constr = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
        //using (SqlConnection con = new SqlConnection(constr))
        //{
        //    using (SqlCommand cmd = new SqlCommand("SELECT * FROM [LAR]"))
        //    {
        //        using (SqlDataAdapter sda = new SqlDataAdapter())
        //        {
        //            cmd.Connection = con;
        //            sda.SelectCommand = cmd;
        //            using (DataTable dt = new DataTable())
        //            {
        //                sda.Fill(dt);
        //                GridView1.DataSource = dt;
        //                GridView1.DataBind();
        //            }
        //        }
        //    }
        //}
        //}
        protected void OnDataBound(object sender, EventArgs e)
        {

            //GridViewRow roww = new GridViewRow(-1, -1, DataControlRowType.DataRow, DataControlRowState.Normal);

            //TableCell right = new TableHeaderCell();
            //right.ColumnSpan = 11;

            //roww.Cells.Add(right);
            //TableHeaderCell cell = new TableHeaderCell();
            //cell.Text = "BOD members";
            //cell.Style.Add("text-align", "center");
            //cell.ColumnSpan = 2;
            //cell.RowSpan = 10;
            //roww.Controls.Add(cell);


            //TableCell left = new TableHeaderCell();
            //left.ColumnSpan = 2;
            //roww.Cells.Add(left);

            //TableHeaderCell cell1 = new TableHeaderCell();
            //cell1.Text = "HOCC members";
            //cell1.Style.Add("text-align", "center");
            //cell1.ColumnSpan = 7;
            //roww.Controls.Add(cell1);

            //roww.ForeColor = System.Drawing.Color.Green;
            //TableCell left1 = new TableHeaderCell();
            //left1.ColumnSpan = 5;
            //roww.Cells.Add(left1);

            //roww.BackColor = ColorTranslator.FromHtml("#3AC0F2");
            //GridView1.Controls[0].Controls.AddAt(0, roww);

            //GridView1.HeaderRow.Parent.Controls.AddAt(-1, roww);


        }

        void Pupulategv()

        {
            DataTable dt = new DataTable();
            using (SqlConnection sql = new SqlConnection(connectionString))
            {
                sql.Open();
                SqlDataAdapter sqlda = new SqlDataAdapter("select * from LAR ", sql);
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
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            
            string fullUsername = User.Identity.Name;
            int index_domain = fullUsername.IndexOf("AIB\\");
            string username = fullUsername.Substring(fullUsername.IndexOf("\\") + 1);

            string id = e.CommandArgument.ToString();
            string employees_name = fullUsername.Substring(fullUsername.IndexOf("\\") + 1);
            //if (e.CommandName != "edit")
            //{
            //    Response.Write("dddddddd");
            //}

            if (e.CommandName == "edit")
            {
                Session["olds_id"] = e.CommandArgument.ToString();
                SqlConnection sqlCon = new SqlConnection(connectionString);
                string query = "SELECT *FROM [LAR] WHERE Id = '" + Session["olds_id"].ToString() + "'";
                SqlCommand sqlcmd = new SqlCommand(query, sqlCon);
                sqlCon.Open();
                SqlDataReader rdr = sqlcmd.ExecuteReader();
                if (rdr.Read())
                {
                    //READ THE DATA FROM COLLATERAL DATABASE AND SAVE THEM INTO SESSION
                    Session["Id"] = (string)rdr["Id"].ToString();
                    Session["txtdate"] = (string)rdr["Disbursementdate"].ToString(); //  [Document checking date]
                    Session["txtBorrower"] = (string)rdr["Borrower"].ToString(); //  [Borrower]
                    Session["txtCaseNo"] = (string)rdr["CaseNumber"].ToString(); //  [Borrower]
                    Session["txtFacilityTypeList"] = (string)rdr["FacilityType"].ToString(); //  [Case Number]
                    Session["txtfacilityevent"] = (string)rdr["facilityevent"].ToString(); //  [Facility type]
                    Session["txtDropDownListCurrency"] = (string)rdr["Ccy"].ToString(); //  [Currency]
                    Session["txtfamount"] = (string)rdr["FacilityAmount"].ToString(); //  [Facility amount]
                    Session["txtHOCCApprovalDate"] = (string)rdr["HOCCApprovalDate"].ToString(); //  [Customers type]  
                    Session["txtceo"] = (string)rdr["CEO"].ToString(); //  [initial observations]   
                    Session["txtcfo"] = (string)rdr["CFO"].ToString(); //  [Outstanding observations]        
                    Session["txtBODRequirement"] = (string)rdr["BODRequirement"].ToString(); //  [Status of Observation]
                    Session["txtBoDApprovalDate"] = (string)rdr["BoDApprovalDate"].ToString(); //  [Status of Facility]
                    Session["txtLutfullahRahmat"] = (string)rdr["LutfullahRahmat"].ToString(); //  [1st checker]
                    Session["txtHamidullahMohib"] = (string)rdr["HamidullahMohib"].ToString(); //  [2nd checker]
                    Session["txtHugoMinderhod"] = (string)rdr["HugoMinderhod"].ToString(); //  [Remarks]
                    Session["txtRS"] = (string)rdr["RS"].ToString(); //  [Updated By]
                    Session["txtSS"] = (string)rdr["SS"].ToString(); //  [Status of Facility]
                    Session["txtMT"] = (string)rdr["MT"].ToString(); //  [1st checker]
                    Session["txtAS"] = (string)rdr["AS"].ToString(); //  [2nd checker]
                    Session["txtFacilityStatus"] = (string)rdr["FacilityStatus"].ToString(); //  [Remarks]
                    Session["txtRemarks"] = (string)rdr["Remarks"].ToString(); //  [Remarks]
                    //Session["ins_by"] = (string)rdr["Inserted By"].ToString(); //  [Inserted By]
                    Session["up_by"] = (string)rdr["Updated By"].ToString(); //  [Updated By]
                                                                             //Session["app_by"] = (string)rdr["Approved By"].ToString(); //  [Approved By]

                    sqlCon.Close();
                    sqlCon.Dispose();

                    Response.Redirect("LAR_Update.aspx");
                }
            }

   
                if (e.CommandName == "Delete")
                {
                    using (SqlConnection conn = new SqlConnection(connectionString))
                    {
                        using (SqlCommand comm = new SqlCommand())
                        {
                            comm.Connection = conn;
                            conn.Open();
                            comm.CommandType = CommandType.StoredProcedure;
                            comm.CommandText = "sp_deletelog";
                            comm.Parameters.AddWithValue("@Id", id);
                            comm.Parameters.AddWithValue("@employees_name", employees_name);
                            GridView1.EditIndex = -1;

                        lblerrormessage.Text = "Selected Row Deleted";

                        if (comm.ExecuteNonQuery() > 0)
                            {
                                Pupulategv();
                            }
                            else
                            {
                                Response.Write("<script>alert('Failed')</script>");
                            }
                            conn.Close();
                        }
                    }
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

        protected void addNew_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Insert_LAR");
            
        }

        protected void excelExporter_Click(object sender, ImageClickEventArgs e)
        {

            DataTable dt = new DataTable();

            dt.Columns.Add("Id");
            dt.Columns.Add("Disbursementdate");
            dt.Columns.Add("Borrower");
            dt.Columns.Add("CaseNumber");
            dt.Columns.Add("FacilityType");
            dt.Columns.Add("facilityevent");
            dt.Columns.Add("Ccy");
            dt.Columns.Add("FacilityAmount");
            dt.Columns.Add("HOCCApprovalDate");
            dt.Columns.Add("CEO");
            dt.Columns.Add("CFO");
            dt.Columns.Add("BODRequirement");
            dt.Columns.Add("BoDApprovalDate");
            dt.Columns.Add("BOD chairman");
            dt.Columns.Add("BOD1");
            dt.Columns.Add("BOD2");
            dt.Columns.Add("BOD3");
            dt.Columns.Add("BOD4");
            dt.Columns.Add("BOD5");
            dt.Columns.Add("BOD6");
            dt.Columns.Add("FacilityStatus");
            dt.Columns.Add("Remarks");
            dt.Columns.Add("Inserted By");
            dt.Columns.Add("Updated By");
            dt.Columns.Add("Approved By");

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
                    string Val21 = (gw.FindControl("Label21") as Label).Text; //
                    string Val22 = (gw.FindControl("Label22") as Label).Text; //
                    string Val23 = (gw.FindControl("Label23") as Label).Text; //
                    string Val24 = (gw.FindControl("Label24") as Label).Text; //
                    string Val25 = (gw.FindControl("Label25") as Label).Text; //
                    dt.Rows.Add(Val1, Val2, Val3, Val4, Val5, Val6, Val7, Val8, Val9, Val10, Val11, Val12, Val13, Val14, Val15, Val16, Val17, Val18, Val19, Val20, Val21, Val22, Val23, Val24, Val25);
                }
            }
            //--------------------------------
            var products = dt;
            ExcelPackage excel = new ExcelPackage();

            var workSheet = excel.Workbook.Worksheets.Add("excel");
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
                Response.Clear();
                Response.Buffer = true;
                Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                Response.AddHeader("content-disposition", "attachment;  filename=LAR_Report.xlsx");
                excel.SaveAs(memoryStream);
                memoryStream.WriteTo(Response.OutputStream);
                Response.Flush();
                Response.End();
            }
        }

        protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                GridView HeaderGrid = (GridView)sender;
                GridViewRow HeaderGridRow = new GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Insert);
                TableCell HeaderCell = new TableCell();
                HeaderCell.ColumnSpan = 12;
                HeaderGridRow.Cells.Add(HeaderCell);

                HeaderCell = new TableCell();
                HeaderCell.Text = "HOCC members";
                HeaderCell.ColumnSpan = 2;
                HeaderGridRow.Cells.Add(HeaderCell);

                HeaderCell = new TableCell();
                HeaderCell.ColumnSpan = 2;
                HeaderGridRow.Cells.Add(HeaderCell);

                HeaderCell = new TableCell();
                HeaderCell.Text = "BOD members";
                HeaderCell.Style.Add("text-align", "center");
                HeaderCell.ColumnSpan = 7;
                HeaderGridRow.Cells.Add(HeaderCell);
                HeaderCell = new TableCell();
                HeaderCell.ColumnSpan = 5;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);
            }
        }

        protected void searchBtn_Click(object sender, EventArgs e)
        {
            txtcustcase.Visible = false;
            if (string.IsNullOrEmpty(txtcustcase.Text) && string.IsNullOrEmpty(txtcustcase.Text))
            {
                string connectionString = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                GridView1.DataSourceID = null;
                string sqlQuery;
                SqlConnection sqlCon = new SqlConnection(connectionString);
                sqlCon.Open();
                sqlQuery = "SELECT *FROM [LAR]";
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
            //----------------------

            if (!string.IsNullOrEmpty(txtcustcase.Text) &&  txtcustcase.Text != "")
            {
                string connectionString = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                GridView1.DataSourceID = null;
                string sqlQuery;
                SqlConnection sqlCon = new SqlConnection(connectionString);
                sqlCon.Open();
                sqlQuery = "SELECT *FROM [LAR] where [CaseNumber] LIKE '%" + txtcustcase.Text + "%' ";
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

            if (string.IsNullOrEmpty(txtcustcase.Text) && txtbod_req.SelectedValue != "sor")
            {
                string connectionString = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                GridView1.DataSourceID = null;
                string sqlQuery;
                SqlConnection sqlCon = new SqlConnection(connectionString);
                sqlCon.Open();
                sqlQuery = "SELECT *FROM [LAR] where [BODRequirement] = '" + txtbod_req.SelectedValue + "'";
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
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
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
                    e.Row.Cells[0].Enabled = true;
                    e.Row.Cells[1].Enabled = true;
                    e.Row.Cells[2].Enabled = false;
                    addNew.Enabled = false;

                }
                if (userType == "Admin")
                {
                    e.Row.Cells[0].Enabled = false;
                    e.Row.Cells[1].Enabled = true;
                    e.Row.Cells[2].Enabled = false;
                    addNew.Enabled = false;
                }

                if (userType == "Users")
                {
                    e.Row.Cells[0].Enabled = false;
                    e.Row.Cells[1].Enabled = true;
                }
            }
        }


    }

}
