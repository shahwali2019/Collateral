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
    public partial class mcu_pending_records : System.Web.UI.Page
    {

        string Val1, Val2, Val3, Val4, Val5, Val6, Val7, Val8, Val9, Val10, Val11,Val12,Val13;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void insertCheck_CheckedChanged(object sender, EventArgs e)
        {
           
                GridView2.Visible = true;
                GridView3.Visible = false;
                updatedCheck.Checked = false;
                ApproveUpdateBtn.Enabled = false;
                ApproveBtnImg.Enabled = true;
                updateLbl.Visible = false;
                insertedPending();
          

        }

        protected void updatedCheck_CheckedChanged(object sender, EventArgs e)
        {
            GridView3.Visible = true;
            GridView2.Visible = false;
            insertCheck.Checked = false;
            ApproveBtnImg.Enabled = false;
            ApproveUpdateBtn.Enabled = true;
            insertLbl.Visible = false;
            UpdatedPending();
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            //insert Button Click Event()
            // Read The Current Id from mcu_tbl-----------------------------------------------
            string ConStr = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
            int CurmaxId;
            using (var conn = new SqlConnection(ConStr))
            using (var command = new SqlCommand("GetCurmaxID_mcu", conn)
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

                foreach (GridViewRow gw in GridView2.Rows)
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
                     // Val12 = (gw.FindControl("Label12") as Label).Text;//Approved By
                        Val13 = (gw.FindControl("Label13") as Label).Text;//Updated By
                        sqlCon.Open();

                        string query = "insert into  [mcu_tbl]" +
                                    "(" +
                                   "[Customre Name]" +
                                   ",[Currency] " +
                                   ",[Account Number] " +
                                   ",[Approval Number]" +
                                   ",[[Disburesement] " +
                                   ",[Due Date of MCU]" +
                                   ",[MCU Date]" +
                                   ",[Loan Status]" +
                                   ",[Remark]" +
                                   ",[Inserted By]" +
                                   ",[Approved By]" +
                                   ",[Updated By]" +
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
                                   "@Val12," +
                                   "@val13" +
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
                        sqlcmd.Parameters.AddWithValue("@val12", username);//
                        sqlcmd.Parameters.AddWithValue("@val13", Val13);// 



                        sqlcmd.ExecuteNonQuery();
                        sqlCon.Close();

                        using (SqlConnection sqlCon2 = new SqlConnection(ConStr))
                        {
                            string id = Val1;
                            sqlCon2.Open();
                            string Delquery = "DELETE FROM [mcu_tbl_insert] WHERE id='" + id + "'";
                            SqlCommand sqlcmdDel = new SqlCommand(Delquery, sqlCon2);

                            sqlcmdDel.ExecuteNonQuery();
                            sqlCon2.Close();
                        }
                        //----------------------------------FIND NEW ID---------------------------------------------------------
                        string ConStrr = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                        int maxIdd;
                        using (var conn = new SqlConnection(ConStrr))
                        using (var command = new SqlCommand("[GetNewID_mcu]", conn)
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
                                cmd2.CommandText = "SELECT *FROM mcu_tbl_id";

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
                            string queryy = "UPDATE mcu_tbl SET [approved By]='" + username + "' where id>'" + oldID + "' AND id <='" + NewID + "'";
                            SqlCommand sqlcmdd = new SqlCommand(queryy, sqlConn);
                            sqlcmdd.ExecuteNonQuery();

                            sqlConn.Close();
                        }
                        // break;
                    }//==========================================end of FOR
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
                       // Val12 = (gw.FindControl("Label12") as Label).Text;//Approved By
                        Val13 = (gw.FindControl("Label13") as Label).Text;//Updated By
                        sqlConn.Open();
                       
                        string queryy = "UPDATE [mcu_tbl] SET" +
                                  "[Customre Name] =@val2" +
                                  ",[Currency] =@val3" +
                                  ",[Account Number] =@val4" +
                                  ",[Approval Number]  =@val5" +
                                  ",[[Disburesement] =@val6" +
                                  ",[Due Date of MCU] =@val7" +
                                  ",[MCU Date]=@val8" +
                                  ",[Loan Status]=@val9" +
                                  ",[Remark]=@val10" +
                                  ",[Inserted By]=@val11" +
                                  ",[Approved By]='" + Session["Users"].ToString() + "'" +
                                  ",[Updated By]=@val13"+
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
                       // sqlcmd.Parameters.AddWithValue("@val12", Val11);// 
                        sqlcmd.Parameters.AddWithValue("@val13", Val13);// 
                         sqlcmd.ExecuteNonQuery();
                         sqlConn.Close();
                        using (SqlConnection sqlCon2 = new SqlConnection(connectionString))
                        {
                            string id = Val1; //Session["pid"].ToString();
                            sqlCon2.Open();
                            string Delquery = "DELETE FROM [mcu_tbl_update] WHERE id='" + id + "'";
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


        protected void GridView3_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void chkb2_CheckedChanged(object sender, EventArgs e)
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

        protected void chkb1_CheckedChanged(object sender, EventArgs e)
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
                    string query = "SELECT count(*) FROM [mcu_tbl_update]";
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

        protected void insertedPending()
        {

            if (GridView2.Rows.Count >= 1)
            {

                string ConStr = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                using (SqlConnection sqlCon2 = new SqlConnection(ConStr))
                {

                    sqlCon2.Open();
                    string query = "SELECT count(*) FROM [mcu_tbl_insert]";
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