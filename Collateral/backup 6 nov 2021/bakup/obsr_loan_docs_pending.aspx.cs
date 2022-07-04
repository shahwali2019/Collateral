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
    public partial class obsr_loan_docs_pending : System.Web.UI.Page
    {

        string Val1, Val2, Val3, Val4, Val5, Val6, Val7, Val8, Val9, Val10, Val11, Val12, Val13, Val14, Val15, Val16;

        protected void ApproveUpdateBtn_Click(object sender, ImageClickEventArgs e)
        {
            string fullUsername = User.Identity.Name;
            int index_domain = fullUsername.IndexOf("AIB\\");
            string username = fullUsername.Substring(fullUsername.IndexOf("\\") + 1);
            string connectionString = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
            using (SqlConnection sqlConn = new SqlConnection(connectionString))
            {
                foreach (GridViewRow gw in gv3.Rows)
                {
                    var chkSelect = gw.FindControl("chkSelect") as CheckBox;
                    if (chkSelect.Checked)
                    {
                        Val1 = (gw.FindControl("Label1") as Label).Text;//id
                        Val2 = (gw.FindControl("Label2") as Label).Text;//[Document checking date]
                        Val3 = (gw.FindControl("Label3") as Label).Text;//[Borrower]
                        Val4 = (gw.FindControl("Label4") as Label).Text;//[Case Number]
                        Val5 = (gw.FindControl("Label5") as Label).Text;//[Facility type]
                        Val6 = (gw.FindControl("Label6") as Label).Text;//[Currency]
                        Val7 = (gw.FindControl("Label7") as Label).Text;//[Facility amount]
                        Val8 = (gw.FindControl("Label8") as Label).Text;//[Customers type]
                        Val9 = (gw.FindControl("Label9") as Label).Text;//[initial observations]
                        Val10 = (gw.FindControl("Label10") as Label).Text;//[Outstanding observations]
                        Val11 = (gw.FindControl("Label11") as Label).Text;//[Status of Observation]
                        Val12 = (gw.FindControl("Label12") as Label).Text;//[Status of Facility]
                        Val13 = (gw.FindControl("Label13") as Label).Text;//[1st checker]
                        Val14 = (gw.FindControl("Label14") as Label).Text;//Remark
                        Val15 = (gw.FindControl("Label15") as Label).Text;//[2nd checker]
                        Val16 = (gw.FindControl("Label16") as Label).Text;//[Updated By]
                        //Val11 = (gw.FindControl("Label11") as Label).Text;//Approved By
                        sqlConn.Open();

                        string queryy = "UPDATE [OLDs] SET" +
                                  "[Document checking date] =@val2" +  //Document checking date
                                  ",[Borrower] =@val3" +               //Borrower
                                  ",[Case Number] =@val4" +            //Case Number
                                  ",[Facility type]  =@val5" +           //Facility type
                                  ",[Currency]  =@val6" +           //Currency
                                  ",[Facility amount] =@val7" +              //Facility amount
                                  ",[Customers type] =@val8" +      //Customers type
                                  ",[initial observations]=@val9" +                 //initial observations
                                  ",[Outstanding observations]=@val10" +            //Outstanding observations
                                  ",[Status of Observation]=@val11" +            //Status of Observation
                                  ",[Status of Facility]=@val12" +            //Status of Observation
                                  ",[1st checker]=@val13" +
                                  ",[Updated By]=@val14 " + //Status of Observation
                                  ",[Remarks]=@val15" +            //Status of Observation
                                  ",[2nd checker]= '" + username + "'" +  //Approved By
                                  " WHERE id=@val1";
                        SqlCommand sqlcmd = new SqlCommand(queryy, sqlConn);
                        //==========catch selected data=================================

                        sqlcmd.Parameters.AddWithValue("@val1", Val1);//
                        sqlcmd.Parameters.AddWithValue("@val2", Val2);//
                        sqlcmd.Parameters.AddWithValue("@val3", Val3);//
                        sqlcmd.Parameters.AddWithValue("@val4", Val4);//
                        sqlcmd.Parameters.AddWithValue("@val5", Val5);//
                        sqlcmd.Parameters.AddWithValue("@val6", Val6);//
                        sqlcmd.Parameters.AddWithValue("@val7", Val7);//
                        sqlcmd.Parameters.AddWithValue("@val8", Val8);//
                        sqlcmd.Parameters.AddWithValue("@val9", Val9);//
                        sqlcmd.Parameters.AddWithValue("@val10", Val10);// 
                        sqlcmd.Parameters.AddWithValue("@val11", Val11);//
                        sqlcmd.Parameters.AddWithValue("@val12", Val12);// 
                        sqlcmd.Parameters.AddWithValue("@val13", Val13);// 
                        sqlcmd.Parameters.AddWithValue("@val14", Val14);//
                        sqlcmd.Parameters.AddWithValue("@val15", Val15);//
                        sqlcmd.Parameters.AddWithValue("@val16", Val16);//
                        sqlcmd.ExecuteNonQuery();
                        sqlConn.Close();
                        using (SqlConnection sqlCon2 = new SqlConnection(connectionString))
                        {
                            string id = Val1; //Session["pid"].ToString();
                            sqlCon2.Open();
                            string Delquery = "DELETE FROM [OLDs_Update] WHERE id='" + id + "'";
                            SqlCommand sqlcmdDel = new SqlCommand(Delquery, sqlCon2);
                            sqlcmdDel.ExecuteNonQuery();
                            sqlCon2.Close();
                        }
                    }
                }//END of FOR
            }
            UpdatedPending();
            gv3.DataSourceID = "SqlConUpdate";
            gv3.DataBind();
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void insertCheck_CheckedChanged(object sender, EventArgs e)
        {
            gvobservloan.Visible = true;
            //gv3.Visible = false;
            updatedCheck.Checked = false;
            ApproveUpdateBtn.Enabled = false;
            ApproveBtnImg.Enabled = true;
            updateLbl.Visible = false;
            insertedPending();
        }

        protected void updatedCheck_CheckedChanged(object sender, EventArgs e)
        {
            gv3.Visible = true;
            gvobservloan.Visible = false;
            insertCheck.Checked = false;
            ApproveBtnImg.Enabled = false;
            ApproveUpdateBtn.Enabled = true;
            insertLbl.Visible = false;
            UpdatedPending();
        }

        protected void UpdatedPending()
        {

            if (gv3.Rows.Count >= 1)
            {

                string ConStr = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                using (SqlConnection sqlCon2 = new SqlConnection(ConStr))
                {
                    sqlCon2.Open();
                    string query = "SELECT count(*) FROM [OLDs_Update]";
                    SqlCommand sqlcmd = new SqlCommand(query, sqlCon2);
                    int count = Convert.ToInt32(sqlcmd.ExecuteScalar());
                    sqlCon2.Close();
                    updateLbl.Visible = true;
                    updateLbl.Text = count + " Updated Pending Record(s).";
                }
            }
            else
            {
                updateLbl.Visible = true;
                updateLbl.Text = "No Updated Pending Record(s)";
            }

        }

        protected void gvobservloan_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void chkb2_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox ChkBoxHeader = (CheckBox)gvobservloan.HeaderRow.FindControl("chkb2");
            foreach (GridViewRow row in gvobservloan.Rows)
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

        protected void gv3_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void chkb1_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox ChkBoxHeader = (CheckBox)gv3.HeaderRow.FindControl("chkb1");
            foreach (GridViewRow row in gv3.Rows)
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

        protected void ApproveBtnImg_Click(object sender, ImageClickEventArgs e)
        {
            //insert Button Click Event()
            // Read The Current Id from mcu_tbl-----------------------------------------------
            string ConStr = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
            int CurmaxId;
            using (var conn = new SqlConnection(ConStr))
            using (var command = new SqlCommand("GetCurmaxID_OLDs", conn)
            {
                CommandType = CommandType.StoredProcedure
            })
            {
                conn.Open();
                CurmaxId = command.ExecuteNonQuery();
                conn.Close();
            }


            //--------------------------------------------------------------------------------------
            string fullUsername = User.Identity.Name;
            int index_domain = fullUsername.IndexOf("AIB\\");
            string username = fullUsername.Substring(fullUsername.IndexOf("\\") + 1);
            using (SqlConnection sqlCon = new SqlConnection(ConStr))
            {

                foreach (GridViewRow gw in gvobservloan.Rows)
                {
                    var chkSelect = gw.FindControl("chkSelect") as CheckBox;
                    if (chkSelect.Checked)
                    {
                        Val1 = (gw.FindControl("Label1") as Label).Text;//id
                        Val2 = (gw.FindControl("Label2") as Label).Text;//banme
                        Val3 = (gw.FindControl("Label3") as Label).Text;//currency
                        Val4 = (gw.FindControl("Label4") as Label).Text;//AN
                        Val5 = (gw.FindControl("Label5") as Label).Text;//[Approval Number]
                        Val6 = (gw.FindControl("Label6") as Label).Text;//Disburesement
                        Val7 = (gw.FindControl("Label7") as Label).Text;//[Due Date of MCU]
                        Val8 = (gw.FindControl("Label8") as Label).Text;//MCU Date
                        Val9 = (gw.FindControl("Label9") as Label).Text;//Loan Status
                        Val10 = (gw.FindControl("Label10") as Label).Text;//Remark
                        Val11 = (gw.FindControl("Label11") as Label).Text;//Inserted By
                        Val12 = (gw.FindControl("Label12") as Label).Text;//Approved By
                        Val13 = (gw.FindControl("Label13") as Label).Text;//Updated By
                        Val14 = (gw.FindControl("Label14") as Label).Text;//Updated By
                        Val15 = (gw.FindControl("Label15") as Label).Text;//Updated By
                        Val16 = (gw.FindControl("Label16") as Label).Text;//Updated By
                        sqlCon.Open();

                        string query = "insert into  [OLDs]" +
                                    "(" +
                                   "[Document checking date]" +
                                   ",[Borrower] " +
                                   ",[Case Number] " +
                                   ",[Facility type]" +
                                   ",[Currency] " +
                                   ",[Facility amount]" +
                                   ",[Customers type]" +
                                   ",[initial observations]" +
                                   ",[Outstanding observations]" +
                                   ",[Status of Observation]" +
                                   ",[Status of Facility]" +
                                   ",[1st checker]" +
                                   ",[Remarks]" +
                                   ",[Updated By]" +
                                   ",[2nd checker]" +
                                   ")" +
                                   "VALUES(" +
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
                                   "@val16"  +
                                   ")";
                        SqlCommand sqlcmd = new SqlCommand(query, sqlCon);
                        //==========catch selected data=================================

                        sqlcmd.Parameters.AddWithValue("@val1", Val1);//
                        sqlcmd.Parameters.AddWithValue("@val2", Val2);//
                        sqlcmd.Parameters.AddWithValue("@val3", Val3);//
                        sqlcmd.Parameters.AddWithValue("@val4", Val4);//
                        sqlcmd.Parameters.AddWithValue("@val5", Val5);//
                        sqlcmd.Parameters.AddWithValue("@val6", Val6);//
                        sqlcmd.Parameters.AddWithValue("@val7", Val7);//
                        sqlcmd.Parameters.AddWithValue("@val8", Val8);//
                        sqlcmd.Parameters.AddWithValue("@val9", Val9);//
                        sqlcmd.Parameters.AddWithValue("@val10", Val10);// 
                        sqlcmd.Parameters.AddWithValue("@val11", Val11);//
                        sqlcmd.Parameters.AddWithValue("@val12", Val12);//
                        sqlcmd.Parameters.AddWithValue("@val13", Val13);//
                        sqlcmd.Parameters.AddWithValue("@val14", Val14);// 
                        sqlcmd.Parameters.AddWithValue("@val15", Val15);//
                        sqlcmd.Parameters.AddWithValue("@val16", username);//



                        sqlcmd.ExecuteNonQuery();
                        sqlCon.Close();

                        using (SqlConnection sqlCon2 = new SqlConnection(ConStr))
                        {
                            string id = Val1;
                            sqlCon2.Open();
                            string Delquery = "DELETE FROM [OLDs_insert] WHERE id='" + id + "'";
                            SqlCommand sqlcmdDel = new SqlCommand(Delquery, sqlCon2);

                            sqlcmdDel.ExecuteNonQuery();
                            sqlCon2.Close();
                        }
                        //----------------------------------FIND NEW ID---------------------------------------------------------
                        string ConStrr = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                        int maxIdd;
                        using (var conn = new SqlConnection(ConStrr))
                        using (var command = new SqlCommand("[GetNewID_OLDs]", conn)
                        {
                            CommandType = CommandType.StoredProcedure
                        })
                        {
                            conn.Open();
                            maxIdd = command.ExecuteNonQuery(); // find the last id after insertion
                            conn.Close();

                        }
                        //--------------------READ CURRENT ID AND NEW ID FROM WAK_TBL_ID----------------------------------------

                        string oldID, NewID;
                        string constr2 = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                        using (SqlConnection con = new SqlConnection(constr2))
                        {
                            using (SqlCommand cmd2 = new SqlCommand())
                            {
                                cmd2.CommandText = "SELECT *FROM OLDs_tbl_id";

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
                            string queryy = "UPDATE OLDs SET [2nd checker]='" + username + "' where id>'" + oldID + "' AND id <='" + NewID + "'";
                            SqlCommand sqlcmdd = new SqlCommand(queryy, sqlConn);
                            sqlcmdd.ExecuteNonQuery();

                            sqlConn.Close();
                        }
                        // break;
                    }//==========================================end of FOR
                }
            }

            gvobservloan.DataSourceID = "SqlCon2";
            gvobservloan.DataBind();
            insertedPending();
        }


        protected void insertedPending()
        {

            if (gvobservloan.Rows.Count >= 1)
            {

                string ConStr = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                using (SqlConnection sqlCon2 = new SqlConnection(ConStr))
                {

                    sqlCon2.Open();
                    string query = "SELECT count(*) FROM [OLDs_insert]";
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
    }
}