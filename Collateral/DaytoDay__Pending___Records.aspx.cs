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
    public partial class DaytoDay__Pending___Records : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
        string Val1, Val2, Val3, Val4, Val5, Val6, Val7, Val8, Val9, Val10, Val11, Val12, Val13, Val14, Val15, Val16;

        protected void GridView3_RowDataBound(object sender, GridViewRowEventArgs e)
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

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
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

        protected void ApproveBtnImg_Click(object sender, ImageClickEventArgs e)
        {
            //insert Button Click Event()
            // Read The Current Id from mcu_tbl-----------------------------------------------
            string ConStr = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
            int CurmaxId;
            using (var conn = new SqlConnection(ConStr))
            using (var command = new SqlCommand("GetCurmaxID_dtod", conn)
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
                        Val1 = (gw.FindControl("Label1") as Label).Text;     //id
                        Val2 = (gw.FindControl("Label2") as Label).Text;     //Account Name
                        Val3 = (gw.FindControl("Label3") as Label).Text;     //Approval Number
                        Val4 = (gw.FindControl("Label4") as Label).Text;     //Facility Type
                        Val5 = (gw.FindControl("Label5") as Label).Text;     //Facility Amount
                        Val6 = (gw.FindControl("Label6") as Label).Text;     //Currency
                        Val7 = (gw.FindControl("Label7") as Label).Text;     //Action Taken
                        Val8 = (gw.FindControl("Label8") as Label).Text;     //TFL Instructed On
                        Val9 = (gw.FindControl("Label9") as Label).Text;     //Confirmed By
                        Val10 = (gw.FindControl("Label10") as Label).Text;   //Date of Boking
                        Val11 = (gw.FindControl("Label11") as Label).Text;   //CMLA SignOff Date
                        Val12 = (gw.FindControl("Label12") as Label).Text;   //Remark
                        Val13 = (gw.FindControl("Label13") as Label).Text;   //
                        Val14 = (gw.FindControl("Label14") as Label).Text;   //
                    //    Val15 = (gw.FindControl("Label15") as Label).Text;   //
                        Val16 = (gw.FindControl("Label16") as Label).Text;   //



                        sqlCon.Open();

                        string query = "insert into  [DayToDayTbl]" +
                                    "(" +
                                   "[Account Name]" +
                                   ",[Approval Number] " +
                                   ",[Facility Type] " +
                                   ",[Facility Amount]" +
                                   ",[Currency] " +
                                   ",[Action Taken]" +
                                   ",[TFL Instructed On]" +
                                   ",[Confirmed By]" +
                                   ",[Date of Boking]" +
                                   ",[CMLA SignOff Date]"  +
                                   ",[Number of Extension Renewa]" +
                                   ",[Remark]"             +
                                   ",[Inserted By]"         +
                                //   ",[Updated By]"          +
                                   ",[Approved By]" +
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
                                  // "@val15," +
                                   "@val16" +
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
                      //  sqlcmd.Parameters.AddWithValue("@val15", Val15);//
                        sqlcmd.Parameters.AddWithValue("@val16", username);// 
                        sqlcmd.ExecuteNonQuery();
                        sqlCon.Close();

                        using (SqlConnection sqlCon2 = new SqlConnection(ConStr))
                        {
                            string id = Val1;
                            sqlCon2.Open();
                            string Delquery = "DELETE FROM [DayToDayTbl_ins] WHERE id='" + id + "'";
                            SqlCommand sqlcmdDel = new SqlCommand(Delquery, sqlCon2);

                            sqlcmdDel.ExecuteNonQuery();
                            sqlCon2.Close();
                        }
                        //----------------------------------FIND NEW ID---------------------------------------------------------
                        string ConStrr = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                        int maxIdd;
                        using (var conn = new SqlConnection(ConStrr))
                        using (var command = new SqlCommand("[GetNewID_dtod]", conn)
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
                                cmd2.CommandText = "SELECT *FROM dtod_tbl_id";

                                cmd2.Connection = con;
                                con.Open();
                                using (SqlDataReader sdr = cmd2.ExecuteReader())
                                {
                                    sdr.Read();
                                    oldID = sdr["odlMaxId"].ToString();
                                    NewID = sdr["NewMaxId"].ToString();
                                }
                                con.Close();
                            }
                        }
                        //-----------------------------------------------------------------------
                        string connectionStringg = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                        using (SqlConnection sqlConn = new SqlConnection(connectionStringg))
                        {
                            sqlConn.Open();
                            string queryy = "UPDATE DayToDayTbl SET [approved By]='" + username + "' where id>'" + oldID + "' AND id <='" + NewID + "'";
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
            string fullUsername = User.Identity.Name;
            int index_domain = fullUsername.IndexOf("AIB\\");
            string username = fullUsername.Substring(fullUsername.IndexOf("\\") + 1);
            string connectionString = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
            using (SqlConnection sqlConn = new SqlConnection(connectionString))
            {
                foreach (GridViewRow gw in GridView3.Rows)
                {
                    var chkSelect = gw.FindControl("chkSelect") as CheckBox;
                    if (chkSelect.Checked)
                    {
                        Val1 = (gw.FindControl("Label1") as Label).Text;     //id
                        Val2 = (gw.FindControl("Label2") as Label).Text;     //Account Name
                        Val3 = (gw.FindControl("Label3") as Label).Text;     //Approval Number
                        Val4 = (gw.FindControl("Label4") as Label).Text;     //Facility Type
                        Val5 = (gw.FindControl("Label5") as Label).Text;     //Facility Amount
                        Val6 = (gw.FindControl("Label6") as Label).Text;     //Currency
                        Val7 = (gw.FindControl("Label7") as Label).Text;     //Action Taken
                        Val8 = (gw.FindControl("Label8") as Label).Text;     //TFL Instructed On
                        Val9 = (gw.FindControl("Label9") as Label).Text;     //Confirmed By
                        Val10 = (gw.FindControl("Label10") as Label).Text;   //Date of Boking
                        Val11 = (gw.FindControl("Label11") as Label).Text;   //CMLA SignOff Date
                        Val12 = (gw.FindControl("Label12") as Label).Text;   //Remark
                        Val13 = (gw.FindControl("Label13") as Label).Text;   //Inserted By
                      // Val14 = (gw.FindControl("Label14") as Label).Text;   //Updated By
                         Val15 = (gw.FindControl("Label15") as Label).Text;   //Approved By
                        Val16 = (gw.FindControl("Label16") as Label).Text;   //
                        sqlConn.Open();

                        string queryy = "UPDATE [DayToDayTbl] SET" +
                                  "[Account Name] =@val2" +                  //Account Name
                                  ",[Approval Number] =@val3" +              //Approval Number
                                  ",[Facility Type] =@val4" +                //Facility Type
                                  ",[Facility Amount]  =@val5" +             //Facility Amount
                                  ",[Currency] =@val6" +                     //Currency
                                  ",[Action Taken] =@val7" +                 //Action Taken
                                  ",[TFL Instructed On]=@val8" +             //TFL Instructed On
                                  ",[Confirmed By]=@val9" +                  //Confirmed By
                                  ",[Date of Boking]=@val10" +               //Date of Boking
                                  ",[CMLA SignOff Date] =@val11 " +                   //CMLA SignOff Date
                                  ",[Number of Extension Renewa] = @val12" +
                                  ",[Remark] =@val13" +                              //Remark
                                 // ",[Inserted By] =@val14" +                         //Inserted By
                                  ",[Updated By] =@val15" +                          //Updated By
                                  ",[Approved By]= '" + username + "'" +     //Approved By
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
                       // sqlcmd.Parameters.AddWithValue("@val14", Val14);// 
                        sqlcmd.Parameters.AddWithValue("@val15", Val15);// 
                        sqlcmd.Parameters.AddWithValue("@val16", Val16);//

                        sqlcmd.ExecuteNonQuery();
                        sqlConn.Close();
                        using (SqlConnection sqlCon2 = new SqlConnection(connectionString))
                        {
                            string id = Val1; //Session["pid"].ToString();
                            sqlCon2.Open();
                            string Delquery = "DELETE FROM [DayToDayTbl_upd] WHERE id='" + id + "'";
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

        protected void UpdatedPending()
        {

            if (GridView3.Rows.Count >= 1)
            {

                string ConStr = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                using (SqlConnection sqlCon2 = new SqlConnection(ConStr))
                {
                    sqlCon2.Open();
                    string query = "SELECT count(*) FROM [DayToDayTbl_upd]";
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
                    string query = "SELECT count(*) FROM [DayToDayTbl_ins]";
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

        protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void GridView3_RowCommand(object sender, GridViewCommandEventArgs e)
        {

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
    }
}