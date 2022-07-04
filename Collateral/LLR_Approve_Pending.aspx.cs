using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Collateral
{
    public partial class LLR_Approve_Pending : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;

        string Val1,
                Val2,
                Val3,
                Val4,
                Val5,
                Val6,
                Val7,
                Val8,
                Val9,
                Val10,
                Val11,
                Val12,
                Val13,
                Val14,
                Val15,
                Val16;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Gridv_LR_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void Gridv_LR_RowDataBound(object sender, GridViewRowEventArgs e)
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
                    //ApproveBtnImg.Enabled = true;
                    //ApproveUpdateBtn.Enabled = true;

                }
                if (userType == "Admin")
                {
                    e.Row.Cells[0].Enabled = false;
                    //ApproveBtnImg.Enabled = true;
                    //ApproveUpdateBtn.Enabled = true;


                }

                if (userType == "Users")
                {
                    e.Row.Cells[0].Enabled = false;
                    ApproveBtnImg.Visible = false;
                    ApproveUpdateBtn.Visible = false;
                }
            }
        }

        protected void chkb2_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox ChkBoxHeader = (CheckBox)Gridv_LR.HeaderRow.FindControl("chkb2");
            foreach (GridViewRow row in Gridv_LR.Rows)
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

        protected void gv_update_RowDataBound(object sender, GridViewRowEventArgs e)
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
                    //ApproveBtnImg.Enabled = true;
                    //ApproveUpdateBtn.Enabled = true;

                }
                if (userType == "Admin")
                {
                    e.Row.Cells[0].Enabled = false;
                    //ApproveBtnImg.Enabled = true;
                    //ApproveUpdateBtn.Enabled = true;


                }

                if (userType == "Users")
                {
                    e.Row.Cells[0].Enabled = false;
                    ApproveBtnImg.Visible = false;
                    ApproveUpdateBtn.Visible = false;
                }
            }
        }

        protected void gv_update_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void chkb1_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox ChkBoxHeader = (CheckBox)gv_update.HeaderRow.FindControl("chkb1");
            foreach (GridViewRow row in gv_update.Rows)
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

        protected void insertCheck_CheckedChanged(object sender, EventArgs e)
        {
            Gridv_LR.Visible = true;
            //gv3.Visible = false;
            updatedCheck.Checked = false;
            ApproveUpdateBtn.Enabled = false;
            ApproveBtnImg.Enabled = true;
            updateLbl.Visible = false;
            insertedPending();
        }

        protected void insertedPending()
        {

            if (Gridv_LR.Rows.Count >= 1)
            {

                string ConStr = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                using (SqlConnection sqlCon2 = new SqlConnection(ConStr))
                {

                    sqlCon2.Open();
                    string query = "SELECT count(*) FROM [LoanDetail_Insert]";
                    SqlCommand sqlcmd = new SqlCommand(query, sqlCon2);
                    int count = Convert.ToInt16(sqlcmd.ExecuteScalar());
                    sqlCon2.Close();
                    insertLbl.Visible = true;
                    insertLbl.Text = count + " Inserted Pending Record(s).";
                }
            }
            else
            {
                insertLbl.Visible = true;
                updateLbl.Visible = false;
                insertLbl.Text = "No Inserted Pending Record(s)";
            }

        }

        protected void updatedCheck_CheckedChanged(object sender, EventArgs e)
        {
            gv_update.Visible = true;
            Gridv_LR.Visible = false;
            insertCheck.Checked = false;
            ApproveBtnImg.Enabled = false;
            ApproveUpdateBtn.Enabled = true;
            insertLbl.Visible = false;
            UpdatedPending();
        }
        protected void UpdatedPending()
        {

            if (gv_update.Rows.Count >= 1)
            {

                string ConStr = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                using (SqlConnection sqlCon2 = new SqlConnection(ConStr))
                {
                    sqlCon2.Open();
                    string query = "SELECT count(*) FROM [LoanRecoveryDetails_Update]";
                    SqlCommand sqlcmd = new SqlCommand(query, sqlCon2);
                    int count = Convert.ToInt32(sqlcmd.ExecuteScalar());
                    sqlCon2.Close();
                    updateLbl.Visible = true;
                    updateLbl.Text = count + " Loan Recovery Details.";
                }
            }
            else
            {
                updateLbl.Visible = true;
                updateLbl.Text = "No Loan Recovery Details";
            }

        }

        protected void ApproveUpdateBtn_Click(object sender, ImageClickEventArgs e)
        {
            string fullUsername = User.Identity.Name;
            int index_domain = fullUsername.IndexOf("AIB\\");
            string username = fullUsername.Substring(fullUsername.IndexOf("\\") + 1);
            string connectionString = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
            using (SqlConnection sqlConn = new SqlConnection(connectionString))
            {
                foreach (GridViewRow gw in gv_update.Rows)
                {
                    var chkSelect = gw.FindControl("chkSelect") as CheckBox;
                    if (chkSelect.Checked)
                    {
                        Val1 = (gw.FindControl("Label1") as Label).Text; //id
                        Val2 = (gw.FindControl("Label2") as Label).Text;
                        Val3 = (gw.FindControl("Label3") as Label).Text;
                        Val4 = (gw.FindControl("Label4") as Label).Text;
                        Val5 = (gw.FindControl("Label5") as Label).Text;
                        Val6 = (gw.FindControl("Label6") as Label).Text;
                        Val7 = (gw.FindControl("Label7") as Label).Text;
                        Val8 = (gw.FindControl("Label8") as Label).Text;
                        Val9 = (gw.FindControl("Label9") as Label).Text;
                        Val10 = (gw.FindControl("Label10") as Label).Text; //
                      ///  Val11 = (gw.FindControl("Label11") as Label).Text; //
                        Val12 = (gw.FindControl("Label12") as Label).Text; //
                     //  Val13 = (gw.FindControl("Label13") as Label).Text; //
                        sqlConn.Open();
                        //string query = "insert into  [LAR]" +
                        //    "(" +
                        //  "[Disbursementdate]" +
                        string queryy = "UPDATE [LoanRecoveryDetails_Update] SET" +
                        "[LoanID] =@val2" + //txtbod_req
                        ",[BorrowerName] =@val3" + //
                        ",[AccountNumber] =@val4" + //
                        ",[Recovery Date] =@val5" + //
                        ",[source Of Recovery]  =@val6" + //
                        ",[Recovery Amount]  =@val7" + //
                        ",[Expenses Occurred] =@val8" + //
                        ",[Claim To be Paid] =@val9" + //
                        ",[Net Loss]=@val10" + //CEO
                    //   ",[Inserted By]=@val11" + //CFO
                        ",[Updated By]=@val12" + //BODRequirement
                        ",[Approved By]= '" + username + "' " + //Approved by
                        " WHERE LoanRecoveryID=@val1";
                        SqlCommand sqlcmd = new SqlCommand(queryy, sqlConn);
                        //        //==========catch selected data=================================
                        sqlcmd.Parameters.AddWithValue("@val1", Val1); //
                        sqlcmd.Parameters.AddWithValue("@val2", Val2); //
                        sqlcmd.Parameters.AddWithValue("@val3", Val3); //
                        sqlcmd.Parameters.AddWithValue("@val4", Val4); //
                        sqlcmd.Parameters.AddWithValue("@val5", Val5); //
                        sqlcmd.Parameters.AddWithValue("@val6", Val6); //
                        sqlcmd.Parameters.AddWithValue("@val7", Val7); //
                        sqlcmd.Parameters.AddWithValue("@val8", Val8); //
                        sqlcmd.Parameters.AddWithValue("@val9", Val9); //
                        sqlcmd.Parameters.AddWithValue("@val10", Val10); // 
                      //  sqlcmd.Parameters.AddWithValue("@val11", Val11); //
                        sqlcmd.Parameters.AddWithValue("@val12", Val12); // 
                       // sqlcmd.Parameters.AddWithValue("@val13", Val13); // 

                        sqlcmd.ExecuteNonQuery();
                        sqlConn.Close();
                        using (SqlConnection SqlConUpdate = new SqlConnection(connectionString))
                        {
                            string LoanRecoveryID = Val1; //Session["pid"].ToString();
                            SqlConUpdate.Open();
                            string Delquery = "DELETE FROM [LoanRecoveryDetails_Update] WHERE LoanRecoveryID='" + LoanRecoveryID + "'";
                            SqlCommand sqlcmdDel = new SqlCommand(Delquery, SqlConUpdate);
                            sqlcmdDel.ExecuteNonQuery();
                            SqlConUpdate.Close();
                        }
                    }
                } //END of FOR
            }
            UpdatedPending();
            gv_update.DataSourceID = "SqlConUpdate";
            gv_update.DataBind();
        }

        protected void ApproveBtnImg_Click(object sender, ImageClickEventArgs e)
        {
            System.Threading.Thread.Sleep(1000);
            //insert Button Click Event()ApproveUpdateBtn_Click
            // Read The Current Id from mcu_tbl-----------------------------------------------
            string ConStr = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
            int CurmaxId;
            using (var conn = new SqlConnection(ConStr))
            using (var command = new SqlCommand("GetCurmaxID_LoanDetail", conn)
            {
                CommandType = CommandType.StoredProcedure
            })
            {
                conn.Open();
                CurmaxId = command.ExecuteNonQuery();
                conn.Close();
            }

            //--------------------------------------------------------------------------------------
            string strConnString = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
            string fullUsername = User.Identity.Name;
            int index_domain = fullUsername.IndexOf("AIB\\");
            string username = fullUsername.Substring(fullUsername.IndexOf("\\") + 1);
            string qry = string.Empty;
            qry = "select [Inserted By] from [LoanDetail_Insert] where [Inserted By]='" + username + "'";
            SqlConnection con1 = new SqlConnection(strConnString);
            con1.Open();
            SqlCommand cd = new SqlCommand(qry, con1);
            string Access_role = Convert.ToString(cd.ExecuteScalar());
            using (SqlConnection sqlCon = new SqlConnection(ConStr))
            {

                foreach (GridViewRow gw in Gridv_LR.Rows)
                {
                    var chkSelect = gw.FindControl("chkSelect") as CheckBox;
                    if ((chkSelect.Checked))
                    {
                        Val1 = (gw.FindControl("Label1") as Label).Text; //
                        Val2 = (gw.FindControl("Label2") as Label).Text; //
                        Val3 = (gw.FindControl("Label3") as Label).Text; //
                        Val4 = (gw.FindControl("Label4") as Label).Text; //
                        Val5 = (gw.FindControl("Label5") as Label).Text; //
                        Val6 = (gw.FindControl("Label6") as Label).Text; //
                        Val7 = (gw.FindControl("Label7") as Label).Text; //
                        Val8 = (gw.FindControl("Label8") as Label).Text; //
                        Val9 = (gw.FindControl("Label9") as Label).Text; //
                        Val10 = (gw.FindControl("Label10") as Label).Text; 
                        Val11 = (gw.FindControl("Label11") as Label).Text; 
                        Val12 = (gw.FindControl("Label12") as Label).Text;
                        Val13 = (gw.FindControl("Label13") as Label).Text;
                        Val14 = (gw.FindControl("Label14") as Label).Text;
                        Val15 = (gw.FindControl("Label15") as Label).Text;
                        Val16 = (gw.FindControl("Label16") as Label).Text;

                        sqlCon.Open();

                        string query = "insert into  [LoanDetail]" +
                            "(" +
                          "[BorrowerName]" +
                          ",[AccountNumber]" +
                          ",[Currency]" +
                          ",[Loan Number]" +
                          ",[Facility Type]" +
                          ",[Loan Disbursement Date]" +
                          ",[Disbursed Amount]" +
                          ",[Interest Stoped On]" +
                          ",[Doubtful Date]" +
                          ",[Charge off Date]" +
                          ",[Charge off Amount Original Currency]" +
                          ",[Charge off Amount Converted to USD]" +
                          ",[Inserted By]" +
                          ",[Updated By]" +
                          ",[Approved By]" +
                        ")" +
                        " VALUES" +
                        "(" +
                        "@val2," +
                        "@val3," +
                        "@val4," +
                        "@val5," +
                        "@val6," +
                        "@val7," +
                        "@val8," +
                        "@val9," +
                        "@val10," +
                        "@val11," +
                        "@val12," +
                        "@val13," +
                        "@val14," +
                        "@val15," +
                        "@val16" +
                             ")";
                        SqlCommand sqlcmd = new SqlCommand(query, sqlCon);
                        //==========catch selected data=================================
                        sqlcmd.Parameters.AddWithValue("@val1", Val1); //
                        sqlcmd.Parameters.AddWithValue("@val2", Val2); //
                        sqlcmd.Parameters.AddWithValue("@val3", Val3); //
                        sqlcmd.Parameters.AddWithValue("@val4", Val4); //
                        sqlcmd.Parameters.AddWithValue("@val5", Val5); //
                        sqlcmd.Parameters.AddWithValue("@val6", Val6); //
                        sqlcmd.Parameters.AddWithValue("@val7", Val7); //
                        sqlcmd.Parameters.AddWithValue("@val8", Val8); //
                        sqlcmd.Parameters.AddWithValue("@val9", Val9); //
                        sqlcmd.Parameters.AddWithValue("@val10", Val10); // 
                        sqlcmd.Parameters.AddWithValue("@val11", Val11); //
                        sqlcmd.Parameters.AddWithValue("@val12", Val12); //
                        sqlcmd.Parameters.AddWithValue("@val13", Val13); //
                        sqlcmd.Parameters.AddWithValue("@val14", Val14); //
                        sqlcmd.Parameters.AddWithValue("@val15", Val15); //
                        sqlcmd.Parameters.AddWithValue("@val16", username); //
                        sqlcmd.ExecuteNonQuery();
                        sqlCon.Close();

                        using (SqlConnection sqlCon2 = new SqlConnection(ConStr))
                        {
                            string LoanID = Val1;
                            sqlCon2.Open();
                            string Delquery = "DELETE FROM [LoanDetail_Insert] WHERE LoanID='" + LoanID + "'";
                            SqlCommand sqlcmdDel = new SqlCommand(Delquery, sqlCon2);
                            sqlcmdDel.ExecuteNonQuery();
                            sqlCon2.Close();
                        }
                        //----------------------------------FIND NEW ID---------------------------------------------------------
                        string ConStrr = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                        int maxIdd;
                        using (var conn = new SqlConnection(ConStrr))
                        using (var command = new SqlCommand("[GetNewID_LoanDetail]", conn)
                        {
                            CommandType = CommandType.StoredProcedure
                        })
                        {
                            conn.Open();
                            maxIdd = command.ExecuteNonQuery(); // find the last id after insertion
                            conn.Close();

                        }
                        //--------------------READ CURRENT ID AND NEW ID FROM WAK_TBL_ID----------------------------------------
                        string oldID,
                        NewID;
                        string constr2 = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                        using (SqlConnection con = new SqlConnection(constr2))
                        {
                            using (SqlCommand cmd2 = new SqlCommand())
                            {
                                cmd2.CommandText = "SELECT *FROM LoanDeatil_tbl_id";

                                cmd2.Connection = con;
                                con.Open();
                                using (SqlDataReader sdr = cmd2.ExecuteReader())
                                {
                                    sdr.Read();
                                    oldID = sdr["oldMaxid"].ToString();
                                    NewID = sdr["NewMaxid"].ToString();
                                }
                                con.Close();
                            }
                        }
                        //-----------------------------------------------------------------------
                        string connectionStringg = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                        using (SqlConnection sqlConn = new SqlConnection(connectionStringg))
                        {
                            sqlConn.Open();
                            string queryy = "UPDATE LoanDetail SET [Approved By]='" + username + "' where LoanID>'" + oldID + "' AND LoanID <='" + NewID + "'";
                            SqlCommand sqlcmdd = new SqlCommand(queryy, sqlConn);
                            sqlcmdd.ExecuteNonQuery();

                            sqlConn.Close();
                        }
                        // break;
                    } //==========================================end of FOR
                    else
                    {
                        //Response.Write ("You are not Authorized!");
                        Label26.Text = "You are not Authorized";
                    }





                }
            }
            Gridv_LR.DataSourceID = "SqlCon2";
            Gridv_LR.DataBind();
            insertedPending();
        }
    }
}