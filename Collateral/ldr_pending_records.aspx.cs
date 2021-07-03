using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Collateral_int
{
    public partial class ldr_pending_records : System.Web.UI.Page
    {
        string Val1, Val2, Val3, Val4, Val5, Val6, Val7, Val8, Val9, Val10, Val11, Val12, Val13;

        protected void chkb2_CheckedChanged1(object sender, EventArgs e)
        {
            CheckBox ChkBoxHeader = (CheckBox)GridView2.HeaderRow.FindControl("chkb2");
            foreach (GridViewRow row in GridView2.Rows)
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

        protected void chkb1_CheckedChanged2(object sender, EventArgs e)
        {

        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void insertCheck_CheckedChanged(object sender, EventArgs e)
        {
            GridView3.Visible = false;
            GridView2.Visible = true;
            ApproveUpdateBtn.Enabled = false;
            ApproveBtnImg.Enabled = true;
            updatedCheck.Checked = false;
            updateLbl.Visible = false;
        }

        protected void updatedCheck_CheckedChanged(object sender, EventArgs e)
        {
            GridView3.Visible = true;
            GridView2.Visible = false;
            ApproveUpdateBtn.Enabled = true;
            ApproveBtnImg.Enabled = false;
            insertCheck.Checked = false;
            insertLbl.Visible = false;
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {

            string ConStr = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
            int CurmaxId;
            using (var conn = new SqlConnection(ConStr))
            using (var command = new SqlCommand("[GetCurmaxID_ldr]", conn)
            {
                CommandType = CommandType.StoredProcedure
            })
            {
                conn.Open();
                CurmaxId = command.ExecuteNonQuery();
                conn.Close();
            }
            //--------------------------------------------------------------------------------------
            using (SqlConnection sqlCon = new SqlConnection(ConStr))
            {

                foreach (GridViewRow gw in GridView2.Rows)
                {
                    string fullUsername = User.Identity.Name;
                    int index_domain = fullUsername.IndexOf("AIB\\");
                    string username = fullUsername.Substring(fullUsername.IndexOf("\\") + 1);
                    var chkSelect = gw.FindControl("chkSelect") as CheckBox;
                    if (chkSelect.Checked)
                    {
                        Val1 = (gw.FindControl("Label1") as Label).Text;
                        Val2 = (gw.FindControl("Label2") as Label).Text;
                        Val3 = (gw.FindControl("Label3") as Label).Text;
                        Val4 = (gw.FindControl("Label4") as Label).Text;
                        Val5 = (gw.FindControl("Label5") as Label).Text;
                        Val6 = (gw.FindControl("Label6") as Label).Text;
                        Val7 = (gw.FindControl("Label7") as Label).Text;
                        Val8 = (gw.FindControl("Label8") as Label).Text;
                        Val9 = (gw.FindControl("Label9") as Label).Text;
                        Val10 = (gw.FindControl("Label10") as Label).Text;
                        Val11 = (gw.FindControl("Label11") as Label).Text;

                        Val12 = (gw.FindControl("Label12") as Label).Text;
                        Val13= (gw.FindControl("Label13") as Label).Text;




                        //********************************************************
                        sqlCon.Open();
                        string query = "INSERT INTO[dbo].[LoanReg_tbl]"+
                                           "([Received Date]" + //lbl2
                                           ",[Company Name]" +//lbl3
                                           ",[Approval Number]" +//lbl4
                                           ",[Facility Type]" +//lbl5
                                           ",[Document Received]" +//lbl6
                                           ",[Enter By]" +//lbl7
                                           ",[Second Verifier]" +//lbl8
                                           ",[Completion Date]" +//lbl9
                                           ",[Remark]" +//lbl 10
                                           ",[Inserted By]" + //lbl 11
                                           ",[Updated By]" +//lbl12
                                           ",[Approved By])" + //lbl13
                                     "VALUES" +
                                      "(" +
                                        "@val2," +//  
                                        "@val3," +// 
                                        "@val4," +// 
                                        "@val5," +// 
                                        "@val6," +// 
                                        "@val7," +// 
                                        "@val8," +// 
                                        "@val9," +// 
                                        "@val10," +// 
                                        "@val11," +
                                        "@val12," +
                                         "@val13"+
                                        ")";
                        SqlCommand sqlcmd = new SqlCommand(query, sqlCon);
                        //==========catch selected data=================================
                        sqlcmd.Parameters.AddWithValue("@val2", Val2);// 
                        sqlcmd.Parameters.AddWithValue("@val3", Val3);// 
                        sqlcmd.Parameters.AddWithValue("@val4", Val4);// 
                        sqlcmd.Parameters.AddWithValue("@val5", Val5);// 
                        sqlcmd.Parameters.AddWithValue("@val6", Val6);// 
                        sqlcmd.Parameters.AddWithValue("@val7", Val7);// 
                        sqlcmd.Parameters.AddWithValue("@val8", Val8);// 
                        sqlcmd.Parameters.AddWithValue("@val9", DateTime.Now.ToShortDateString());// 
                        sqlcmd.Parameters.AddWithValue("@val10", Val10);//   
                        sqlcmd.Parameters.AddWithValue("@val11", Val11);//   
                        sqlcmd.Parameters.AddWithValue("@val12", Val12);//   
                        sqlcmd.Parameters.AddWithValue("@val13", username);//   

                        sqlcmd.ExecuteNonQuery();
                        sqlCon.Close();

                        using (SqlConnection sqlCon2 = new SqlConnection(ConStr))
                        {
                            string id = Val1;
                            sqlCon2.Open();
                            string Delquery = "DELETE FROM [LoanReg_tbl_insert] WHERE id='" + id + "'";
                            SqlCommand sqlcmdDel = new SqlCommand(Delquery, sqlCon2);

                            sqlcmdDel.ExecuteNonQuery();
                            sqlCon2.Close();
                        }
                        //----------------------------------FIND NEW ID---------------------------------------------------------
                        string ConStrr = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                        int maxIdd;
                        using (var conn = new SqlConnection(ConStrr))
                        using (var command = new SqlCommand("[GetNewID_lrd]", conn)
                        {
                            CommandType = CommandType.StoredProcedure
                        })
                        {
                            conn.Open();
                            maxIdd = command.ExecuteNonQuery();
                            conn.Close();

                        }
                        //--------------------READ CURRENT ID AND NEW ID FROM WAK_TBL_ID----------------------------------------

                        string oldID, NewID;
                        string constr2 = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                        using (SqlConnection con = new SqlConnection(constr2))
                        {
                            using (SqlCommand cmd2 = new SqlCommand())
                            {
                                cmd2.CommandText = "SELECT *FROM [ldr_tbl_id]";

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
                        //-----------------------------------------
                        string connectionStringg = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                        using (SqlConnection sqlConn = new SqlConnection(connectionStringg))
                        {
                            sqlConn.Open();
                            string queryy = "UPDATE [LoanReg_tbl] SET [approved By]='" + username + "' WHERE id>'" + oldID + "' and id <='" + NewID + "'";
                            SqlCommand sqlcmdd = new SqlCommand(queryy, sqlConn);
                            sqlcmdd.ExecuteNonQuery();
                            sqlConn.Close();
                        }
                        // break;
                    }//==========================================
                }
            }

            GridView2.DataSourceID = "SqlCon2";
            GridView2.DataBind();
            insertedPending();
        }

        protected void ApproveUpdateBtn_Click(object sender, ImageClickEventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
            using (SqlConnection sqlConn = new SqlConnection(connectionString))
            {
                foreach (GridViewRow gw in GridView3.Rows)
                {
                    string fullUsername = User.Identity.Name;
                    int index_domain = fullUsername.IndexOf("AIB\\");
                    string username = fullUsername.Substring(fullUsername.IndexOf("\\") + 1);
                    var chkSelect = gw.FindControl("chkSelect") as CheckBox;
                    if (chkSelect.Checked)
                    {
                        Val1 = (gw.FindControl("Label1") as Label).Text;//id
                        Val2 = (gw.FindControl("Label2") as Label).Text;//received Date
                        Val3 = (gw.FindControl("Label3") as Label).Text;//Company Name
                        Val4 = (gw.FindControl("Label4") as Label).Text;//Approval Number
                        Val5 = (gw.FindControl("Label5") as Label).Text;//Facility Type
                        Val6 = (gw.FindControl("Label6") as Label).Text;//Document Received
                        Val7 = (gw.FindControl("Label7") as Label).Text;//Enter By
                        Val8 = (gw.FindControl("Label8") as Label).Text;//Second Verifier
                        Val9 = (gw.FindControl("Label9") as Label).Text;//Completion Date
                        Val10 = (gw.FindControl("Label10") as Label).Text;//remark
                        Val11 = (gw.FindControl("Label11") as Label).Text;//Inserted By
                        Val12 = (gw.FindControl("Label12") as Label).Text;//Updated By
                        Val13 = (gw.FindControl("Label13") as Label).Text;//Approved By


                        sqlConn.Open();
                        //string queryy = "UPDATE acgf SET [Approved By]='Alawi Nahoori' WHERE id='1'";
                        string queryy = "UPDATE [dbo].[LoanReg_tbl]" +
                              "SET" +
                              "[Received Date] =@val2" +
                              ",[Company Name] = @val3" +
                              ",[Approval Number] =@val4" +
                              ",[Facility Type] = @val5" +
                              ",[Document Received] =@val6" +
                              ",[Enter By] = @val7" +
                              ",[Second Verifier] = @val8" +
                              ",[Completion Date] =@val9" +
                              ",[Remark] =@val10" +
                              ",[Inserted By] = @val11" +
                              ",[Updated By] = @val12" +
                              ",[Approved By] = @val13 WHERE id='"+Val1+"'";
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
                        sqlcmd.Parameters.AddWithValue("@val13", username);// 
                        sqlcmd.ExecuteNonQuery();


                        sqlConn.Close();
                        using (SqlConnection sqlCon2 = new SqlConnection(connectionString))
                        {
                            string id = Val1; //Session["pid"].ToString();
                            sqlCon2.Open();
                            string Delquery = "DELETE FROM [LoanReg_tbl_Update] WHERE id='" + id + "'";
                            SqlCommand sqlcmdDel = new SqlCommand(Delquery, sqlCon2);
                            sqlcmdDel.ExecuteNonQuery();
                            sqlCon2.Close();
                        }
                    }
                }//END of FOR
            }
            UpdatedPending();
            GridView3.DataSourceID = "SqlConUpdate";
            GridView3.DataBind();
        }
    
        protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void chkb2_CheckedChanged(object sender, EventArgs e)
        {

        }

        protected void GridView3_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void chkb1_CheckedChanged(object sender, EventArgs e)
        {

        }

        protected void chkb1_CheckedChanged1(object sender, EventArgs e)
        {
            CheckBox ChkBoxHeader = (CheckBox)GridView3.HeaderRow.FindControl("chkb1");
            foreach (GridViewRow row in GridView3.Rows)
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

        protected void UpdatedPending()
        {

            if (GridView3.Rows.Count >= 1)
            {

                string ConStr = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                using (SqlConnection sqlCon2 = new SqlConnection(ConStr))
                {
                    sqlCon2.Open();
                    string query = "SELECT count(*) FROM [LoanReg_tbl_Update]";
                    SqlCommand sqlcmd = new SqlCommand(query, sqlCon2);
                    int count = Convert.ToInt32(sqlcmd.ExecuteScalar());
                    sqlCon2.Close();
                    updateLbl.Visible = true;
                    updateLbl.Text = count + " Updated Pending Record(s)";
                }
            }
            else
            {
                updateLbl.Visible = true;
                updateLbl.Text = "No Updated Pending Record(s)";
            }

        }
        protected void insertedPending()
        {

            if (GridView2.Rows.Count >= 1)
            {

                string ConStr = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                using (SqlConnection sqlCon2 = new SqlConnection(ConStr))
                {

                    sqlCon2.Open();
                    string query = "SELECT count(*) FROM [acgf_insert]";
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