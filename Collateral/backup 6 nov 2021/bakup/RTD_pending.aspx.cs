using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Collateral_int
{

    public partial class RTD_pending : System.Web.UI.Page
    {
        string Val34,Val1, Val2, Val3, Val4, Val5, Val6, Val7, Val8, Val9, Val10, Val11, Val12, Val13, Val14, Val15, Val16, Val17, Val18, Val19, Val20,Val21,Val22,Val23,Val24,Val25,Val26,Val27,Val28,Val29,Val30,Val31,Val32,Val33;

        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {
            if (GridView2.Visible)
            {
                if (!CheckBox1.Checked)
                {
                    GridView2.Columns[11].Visible = false;
                    GridView2.Columns[12].Visible = false;
                    GridView2.Columns[13].Visible = false;
                    GridView2.Columns[14].Visible = false;
                    GridView2.Columns[15].Visible = false;
                    GridView2.Columns[16].Visible = false;
                    GridView2.Columns[17].Visible = false;
                    GridView2.Columns[18].Visible = false;
                    GridView2.Columns[19].Visible = false;
                    GridView2.Columns[20].Visible = false;
                    GridView2.Columns[21].Visible = false;
                    GridView2.Columns[22].Visible = false;
                    GridView2.Columns[23].Visible = false;
                    GridView2.Columns[24].Visible = false;
                    GridView2.Columns[25].Visible = false;
                    GridView2.Columns[26].Visible = false;
                    GridView2.Columns[27].Visible = false;
                    GridView2.Columns[28].Visible = false;
                    GridView2.Columns[29].Visible = false;
                    GridView2.Columns[30].Visible = false;
                }
                else
                {

                    GridView2.Columns[0].Visible = true;
                    GridView2.Columns[1].Visible = true;
                    GridView2.Columns[2].Visible = true;
                    GridView2.Columns[3].Visible = true;
                    GridView2.Columns[4].Visible = true;
                    GridView2.Columns[5].Visible = true;
                    GridView2.Columns[6].Visible = true;
                    GridView2.Columns[7].Visible = true;
                    GridView2.Columns[8].Visible = true;
                    GridView2.Columns[9].Visible = true;
                    GridView2.Columns[10].Visible = true;
                    GridView2.Columns[11].Visible = true;
                    GridView2.Columns[12].Visible = true;
                    GridView2.Columns[13].Visible = true;
                    GridView2.Columns[14].Visible = true;
                    GridView2.Columns[15].Visible = true;
                    GridView2.Columns[16].Visible = true;
                    GridView2.Columns[17].Visible = true;
                    GridView2.Columns[18].Visible = true;
                    GridView2.Columns[19].Visible = true;
                    GridView2.Columns[20].Visible = true;
                    GridView2.Columns[21].Visible = true;
                    GridView2.Columns[22].Visible = true;
                    GridView2.Columns[23].Visible = true;
                    GridView2.Columns[24].Visible = true;
                    GridView2.Columns[25].Visible = true;
                    GridView2.Columns[26].Visible = true;
                    GridView2.Columns[27].Visible = true;
                    GridView2.Columns[28].Visible = true;
                    GridView2.Columns[29].Visible = true;
                    GridView2.Columns[30].Visible = true;

                }

                } // END OF GRIDVIEW2
                  //-----------------------------------------------------------------------------

            if (GridView3.Visible)
            {
                if (!CheckBox1.Checked)
                {
                    GridView3.Columns[11].Visible = false;
                    GridView3.Columns[12].Visible = false;
                    GridView3.Columns[13].Visible = false;
                    GridView3.Columns[14].Visible = false;
                    GridView3.Columns[15].Visible = false;
                    GridView3.Columns[16].Visible = false;
                    GridView3.Columns[17].Visible = false;
                    GridView3.Columns[18].Visible = false;
                    GridView3.Columns[19].Visible = false;
                    GridView3.Columns[20].Visible = false;
                    GridView3.Columns[21].Visible = false;
                    GridView3.Columns[22].Visible = false;
                    GridView3.Columns[23].Visible = false;
                    GridView3.Columns[24].Visible = false;
                    GridView3.Columns[25].Visible = false;
                    GridView3.Columns[26].Visible = false;
                    GridView3.Columns[27].Visible = false;
                    GridView3.Columns[28].Visible = false;
                    GridView3.Columns[29].Visible = false;
                    GridView3.Columns[30].Visible = false;
                }
                else
                {

                    GridView3.Columns[0].Visible = true;
                    GridView3.Columns[1].Visible = true;
                    GridView3.Columns[2].Visible = true;
                    GridView3.Columns[3].Visible = true;
                    GridView3.Columns[4].Visible = true;
                    GridView3.Columns[5].Visible = true;
                    GridView3.Columns[6].Visible = true;
                    GridView3.Columns[7].Visible = true;
                    GridView3.Columns[8].Visible = true;
                    GridView3.Columns[9].Visible = true;
                    GridView3.Columns[10].Visible = true;
                    GridView3.Columns[11].Visible = true;
                    GridView3.Columns[12].Visible = true;
                    GridView3.Columns[13].Visible = true;
                    GridView3.Columns[14].Visible = true;
                    GridView3.Columns[15].Visible = true;
                    GridView3.Columns[16].Visible = true;
                    GridView3.Columns[17].Visible = true;
                    GridView3.Columns[18].Visible = true;
                    GridView3.Columns[19].Visible = true;
                    GridView3.Columns[20].Visible = true;
                    GridView3.Columns[21].Visible = true;
                    GridView3.Columns[22].Visible = true;
                    GridView3.Columns[23].Visible = true;
                    GridView3.Columns[24].Visible = true;
                    GridView3.Columns[25].Visible = true;
                    GridView3.Columns[26].Visible = true;
                    GridView3.Columns[27].Visible = true;
                    GridView3.Columns[28].Visible = true;
                    GridView3.Columns[29].Visible = true;
                    GridView3.Columns[30].Visible = true;

                }

            } // END OF GRIDVIEW2

        }

        protected void ApproveUpdateBtn_Click(object sender, ImageClickEventArgs e)
        {
            string fullUsername = User.Identity.Name;
            int index_domain = fullUsername.IndexOf("AIB\\");
            string username = fullUsername.Substring(fullUsername.IndexOf("\\") + 1);
            string connectionString = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                foreach (GridViewRow gw in GridView3.Rows)
                {
                    var chkSelect = gw.FindControl("chkSelect") as CheckBox;
                    if (chkSelect.Checked)
                    {
                        Val1 = (gw.FindControl("Label1") as Label).Text;//id
                        Val2 = (gw.FindControl("Label2") as Label).Text;//ClientName
                        Val3 = (gw.FindControl("Label3") as Label).Text;//Loan type
                        Val4 = (gw.FindControl("Label4") as Label).Text;//Qabala Type
                        Val5 = (gw.FindControl("Label5") as Label).Text;//Qabala Number
                        Val6 = (gw.FindControl("Label6") as Label).Text;//Qabala Date
                        Val7 = (gw.FindControl("Label7") as Label).Text;//Owner of Qabala
                        Val8 = (gw.FindControl("Label8") as Label).Text;//Type of Property
                        Val9 = (gw.FindControl("Label9") as Label).Text;//Value of Property
                        Val10 = (gw.FindControl("Label10") as Label).Text;//Currency
                        Val11 = (gw.FindControl("Label11") as Label).Text;//Property Evaluator
                        Val12 = (gw.FindControl("Label12") as Label).Text;//address
                        Val13 = (gw.FindControl("Label13") as Label).Text;//LED
                        Val14 = (gw.FindControl("Label14") as Label).Text;//RMN
                        Val15 = (gw.FindControl("Label15") as Label).Text;//RMD
                        Val16 = (gw.FindControl("Label16") as Label).Text;//MV
                        Val17 = (gw.FindControl("Label17") as Label).Text;//HKN
                        Val18 = (gw.FindControl("Label18") as Label).Text;//hkd
                        Val19 = (gw.FindControl("Label19") as Label).Text;//hkv
                        Val20 = (gw.FindControl("Label20") as Label).Text;//EMN
                        Val21 = (gw.FindControl("Label21") as Label).Text;//EMD
                        Val22 = (gw.FindControl("Label22") as Label).Text;//Released Date
                        Val23 = (gw.FindControl("Label23") as Label).Text;//Released By
                        Val24 = (gw.FindControl("Label24") as Label).Text;//Released title deeds
                        Val25 = (gw.FindControl("Label25") as Label).Text;//Based On
                        Val26 = (gw.FindControl("Label26") as Label).Text;//PIFA
                        Val27 = (gw.FindControl("Label27") as Label).Text;//Recieved By
                        Val28 = (gw.FindControl("Label28") as Label).Text;//Status
                        Val29 = (gw.FindControl("Label29") as Label).Text;//Remark
                        Val30 = (gw.FindControl("Label30") as Label).Text;//Inserted by
                        Val31 = (gw.FindControl("Label31") as Label).Text;//Updated By
                        Val32 = (gw.FindControl("Label32") as Label).Text;//Approved By
                        Val33 = (gw.FindControl("Label33") as Label).Text;//Inserted Date
                        //********************************************************
                        sqlCon.Open();
                        string queryy = "UPDATE[dbo].[RTD] " +
                           " SET " +
                           "[Client Name] =@val2" + // 2
                          ",[Loan Type] =@val3" +//3
                           ",[Qabala Type] =@val4" +//4
                          ",[Qabala Number] =@val5" +//5
                          ",[Qabala Date] =@val6" +
                          ",[Owner of Qabala] =@val7" +
                          ",[Type of Property] =@val8" +
                          ",[Value of Property] =@val9" +
                          ",[Currency] =@val10" +
                          ",[Property Evaluator] =@val11" +
                           ",[Address] =@val12" +
                           ",[Last Evaluation Date] =@val13" +
                            ",[Registered Mortgage No] =@val14" +
                            ",[Registered Mortgage Date] =@val15" + // tested
                              ",[Mortgage Value] =@val16" +
                              ",[Hujat Khaat Number] =@val17" +
                              ",[Hujat Khaat Date] =@val18" +
                              ",[Hujat Khaat Vallue] =@val19" +
                              ",[Equitable Mortgage Number] =@val20" +
                              ",[Equitable Mortgage Date] =@val21" +
                              ",[Released Date] =@val22" +//tested
                              ",[Released By] =@val23" +//tested
                              ",[Released Title Deeds] =@val24" +//tested
                             ",[Based On] =@val25" +//tested
                              ",[Pending Item For Accomplishment] =@val26" +
                              ",[Received By] =@val27" +
                              ",[Status] =@val28" +
                              ",[Remark] =@val29" +
                              ",[Inserted By] =@val30" +
                              ",[Updated By] =@val31" +
                              ",[Approved By] =@val32" +
                              ",[Inserted Date] =@val33" +
                            " WHERE id=@val1";
        

         SqlCommand sqlcmd = new SqlCommand(queryy, sqlCon);
                        //==========catch selected data=================================
                        sqlcmd.Parameters.AddWithValue("@val1", Val1);
                        sqlcmd.Parameters.AddWithValue("@val2", Val2);//Client Name
                        sqlcmd.Parameters.AddWithValue("@val3", Val3);//loan type
                        sqlcmd.Parameters.AddWithValue("@val4", Val4);// qabala type
                        sqlcmd.Parameters.AddWithValue("@val5", Val5);//  
                        sqlcmd.Parameters.AddWithValue("@val6", Val6);// 
                        sqlcmd.Parameters.AddWithValue("@val7", Val7);
                        sqlcmd.Parameters.AddWithValue("@val8", Val8);
                        sqlcmd.Parameters.AddWithValue("@val9", Val9);
                        sqlcmd.Parameters.AddWithValue("@val10", Val10);
                        sqlcmd.Parameters.AddWithValue("@val11", Val11);
                        sqlcmd.Parameters.AddWithValue("@val12", Val12);
                        sqlcmd.Parameters.AddWithValue("@val13", Val13);
                        sqlcmd.Parameters.AddWithValue("@val14", Val14);
                        sqlcmd.Parameters.AddWithValue("@val15", Val15);
                        sqlcmd.Parameters.AddWithValue("@val16", Val16);
                        sqlcmd.Parameters.AddWithValue("@val17", Val17);
                        sqlcmd.Parameters.AddWithValue("@val18", Val18);
                        sqlcmd.Parameters.AddWithValue("@val19", Val19);
                        sqlcmd.Parameters.AddWithValue("@val20", Val20);
                        sqlcmd.Parameters.AddWithValue("@val21", Val21);
                        sqlcmd.Parameters.AddWithValue("@val22", Val22);
                        sqlcmd.Parameters.AddWithValue("@val23", Val23);
                        sqlcmd.Parameters.AddWithValue("@val24", Val24);
                       sqlcmd.Parameters.AddWithValue("@val25", Val25);
                        sqlcmd.Parameters.AddWithValue("@val26", Val26);//tested
                        sqlcmd.Parameters.AddWithValue("@val27", Val27);
                        sqlcmd.Parameters.AddWithValue("@val28", Val28);
                        sqlcmd.Parameters.AddWithValue("@val29", Val29);
                        sqlcmd.Parameters.AddWithValue("@val30", Val30);//tested
                        sqlcmd.Parameters.AddWithValue("@val31", Val31);
                        sqlcmd.Parameters.AddWithValue("@val32", username);
                        sqlcmd.Parameters.AddWithValue("@val33", Val33);

                        sqlcmd.ExecuteNonQuery();
                    
                        sqlCon.Close();
                        using (SqlConnection sqlCon2 = new SqlConnection(connectionString))
                        {
                            string id = Val1; //Session["pid"].ToString();
                            sqlCon2.Open();
                            string Delquery = "DELETE FROM [RTD_Pending_Update] WHERE id='" + id + "'";
                            SqlCommand sqlcmdDel = new SqlCommand(Delquery, sqlCon2);

                            sqlcmdDel.ExecuteNonQuery();
                            sqlCon2.Close();
                        }
                        // break;
                    }
                }//==========================================end of FOR
            }
            UpdatedPending();
            GridView3.DataSourceID = "SqlConUpdate";
            GridView3.DataBind();
        }

        protected void chkb2_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox ChkBoxHeader = (CheckBox)GridView3.HeaderRow.FindControl("chkb2");
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

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {

            //find out the max id from current data for iditify whome inserted the new rocord(s)
            string ConStr = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
            int maxId;
            using (var conn = new SqlConnection(ConStr))
            using (var command = new SqlCommand("GetCurMaxID_RTD", conn)
            {
                CommandType = CommandType.StoredProcedure
            })
            {
                conn.Open();
                maxId = command.ExecuteNonQuery();
                conn.Close();
            }
            //=====================================================================
            string connectionString = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                string fullUsername = User.Identity.Name;
                int index_domain = fullUsername.IndexOf("AIB\\");
                string username = fullUsername.Substring(fullUsername.IndexOf("\\") + 1);
                foreach (GridViewRow gw in GridView2.Rows)
                {
                    var chkSelect = gw.FindControl("chkSelect") as CheckBox;
                    if (chkSelect.Checked)
                    {
                        Val1 = (gw.FindControl("Label1") as Label).Text;//ID
                        Val2 = (gw.FindControl("Label2") as Label).Text;//Client Name
                        Val3 = (gw.FindControl("Label3") as Label).Text;//Loan Type
                        Val4 = (gw.FindControl("Label4") as Label).Text;//Qabala Type
                        Val5 = (gw.FindControl("Label5") as Label).Text;//Qabala Number
                        Val6 = (gw.FindControl("Label6") as Label).Text;//Qabala Date
                        Val7 = (gw.FindControl("Label7") as Label).Text;//Owner of Qabala
                        Val8 = (gw.FindControl("Label8") as Label).Text;//Type of Property
                        Val9 = (gw.FindControl("Label9") as Label).Text;//value of Property
                        Val10 = (gw.FindControl("Label10") as Label).Text;//Currency
                        Val11 = (gw.FindControl("Label11") as Label).Text;//Property Evaluator
                        Val12 = (gw.FindControl("Label12") as Label).Text;//Address
                        Val13 = (gw.FindControl("Label13") as Label).Text;//Last Evaluation Date
                        Val14 = (gw.FindControl("Label14") as Label).Text;//Registered Mortgage No
                        Val15 = (gw.FindControl("Label15") as Label).Text;//Register mortgage Date
                        Val16 = (gw.FindControl("Label16") as Label).Text;//Mortage Vlue
                        Val17 = (gw.FindControl("Label17") as Label).Text;//Hujat Khat No
                        Val18 = (gw.FindControl("Label18") as Label).Text;//Hujat Khat Date
                        Val19 = (gw.FindControl("Label19") as Label).Text;//Hujat Khat Vallue
                        Val20 = (gw.FindControl("Label20") as Label).Text;//Equitable Mortgage Number
                        Val21 = (gw.FindControl("Label21") as Label).Text;//Equitable Mortgage Date
                        Val22 = (gw.FindControl("Label22") as Label).Text;//Released Date
                        Val23 = (gw.FindControl("Label23") as Label).Text;//Released By
                        Val24 = (gw.FindControl("Label24") as Label).Text;//RTD
                        Val25 = (gw.FindControl("Label25") as Label).Text;//Based On
                        Val26 = (gw.FindControl("Label26") as Label).Text;//PIFA
                        Val27 = (gw.FindControl("Label27") as Label).Text;//Due Date
                        Val28 = (gw.FindControl("Label28") as Label).Text;//Received By
                        Val29 = (gw.FindControl("Label29") as Label).Text;//Status
                        Val30 = (gw.FindControl("Label30") as Label).Text;//Remark
                        Val31 = (gw.FindControl("Label31") as Label).Text;//Add Loan Status
                        Val32 = (gw.FindControl("Label32") as Label).Text;//Inserted By
                        Val33 = (gw.FindControl("Label33") as Label).Text;//Updated By
                     

                        //********************************************************
                        sqlCon.Open();
                        string query = "INSERT INTO [RTD]"+
           "(" +
           " [Client Name]"+
           ",[Loan Type]" +
           ",[Qabala Type]" +
           ",[Qabala Number]" +
           ",[Qabala Date]" +
           ",[Owner of Qabala]" +
           ",[Type of Property]" +
           ",[Value of Property]" +
           ",[Currency]" +
           ",[Property Evaluator]" +
           ",[Address]" +
           ",[Last Evaluation Date]" +
           ",[Registered Mortgage No]" +
           ",[Registered Mortgage Date]" +
           ",[Mortgage Value]" +
           ",[Hujat Khaat Number]" +
           ",[Hujat Khaat Date]" +
           ",[Hujat Khaat Vallue]" +
           ",[Equitable Mortgage Number]" +
           ",[Equitable Mortgage Date]" +
           ",[Based On]" +
           ",[Pending Item For Accomplishment]" +
           ",[Due Date]" +//27
           ",[Received By]" +//28
           ",[Status]" +
           ",[Remark]" +
           ",[Add Loan Status]" +
           ",[Inserted By]" +
           ",[Approved By]" +
           ",[Inserted Date]" +
           ")" +
              "VALUES" +
           "(   @ClientName"+
            ",  @LoanType" +
            ",  @QabalaType" +
            ",  @QabalaNumber" +
            ",  @QabalaDate" +
            ",  @OwnerofQabala" +
            ",  @TypeofProperty" +
            ",  @ValueofProperty" +
            ",  @Currency" +
            ",  @PropertyEvaluator" +
            ",  @Address" +
            ",  @LastEvaluationDate" +
            ",  @RegisteredMortgageNo" +
            ",  @RegisteredMortgageDate" +
            ",  @MortgageValue" +
            ",  @HujatKhaatNumber" +
            ",  @HujatKhaatDate" +
            ",  @HujatKhaatVallue" +
            ",  @EquitableMortgageNumber" +
            ",  @EquitableMortgageDate" +
            ",  @BasedOn" +
            ",  @PendingItemForAccomplishment" +
            ",  @DueDate" +
            ",  @ReceivedBy" +
            ",  @Status" +
            ",  @Remark" +
            ",  @AddLoanStatus" +
           ",  @InsertedBy" +
           ",  @ApprovedBy" +
          " ,  @InsertedDate" +
          ")";
                        SqlCommand sqlcmd = new SqlCommand(query, sqlCon);
                        //==========catch selected data=================================
                   
                        sqlcmd.Parameters.AddWithValue("@ClientName", Val2);
                        sqlcmd.Parameters.AddWithValue("@LoanType", Val3);
                        sqlcmd.Parameters.AddWithValue("@QabalaType", Val4);
                        sqlcmd.Parameters.AddWithValue("@QabalaNumber", Val5);
                        sqlcmd.Parameters.AddWithValue("@QabalaDate", Val6);
                        sqlcmd.Parameters.AddWithValue("@OwnerofQabala", Val7);
                        sqlcmd.Parameters.AddWithValue("@TypeofProperty", Val8);
                        sqlcmd.Parameters.AddWithValue("@ValueofProperty", Val9);
                        sqlcmd.Parameters.AddWithValue("@Currency", Val10);
                        sqlcmd.Parameters.AddWithValue("@PropertyEvaluator", Val11);
                        sqlcmd.Parameters.AddWithValue("@Address", Val12);
                        sqlcmd.Parameters.AddWithValue("@LastEvaluationDate", Val13);
                        sqlcmd.Parameters.AddWithValue("RegisteredMortgageNo", Val14);
                        sqlcmd.Parameters.AddWithValue("@RegisteredMortgageDate", Val15);
                        sqlcmd.Parameters.AddWithValue("@MortgageValue", Val16);
                        sqlcmd.Parameters.AddWithValue("@HujatKhaatNumber", Val17);
                        sqlcmd.Parameters.AddWithValue("@HujatKhaatDate", Val18);
                        sqlcmd.Parameters.AddWithValue("@HujatKhaatVallue", Val19);
                        sqlcmd.Parameters.AddWithValue("@EquitableMortgageNumber", Val20);// EMN
                        sqlcmd.Parameters.AddWithValue("@EquitableMortgageDate", Val21);// EMD
                        sqlcmd.Parameters.AddWithValue("@BasedOn", Val25);
                        sqlcmd.Parameters.AddWithValue("@PendingItemForAccomplishment", Val26);
                        sqlcmd.Parameters.AddWithValue("@DueDate", Val27);
                        sqlcmd.Parameters.AddWithValue("@ReceivedBy", Val28);
                        sqlcmd.Parameters.AddWithValue("@Status", Val29);
                        sqlcmd.Parameters.AddWithValue("@Remark", Val30);
                        sqlcmd.Parameters.AddWithValue("@AddLoanStatus", Val31);
                        sqlcmd.Parameters.AddWithValue("@InsertedBy", Val32);
                        sqlcmd.Parameters.AddWithValue("@ApprovedBy", username);
                        sqlcmd.Parameters.AddWithValue("@InsertedDate", DateTime.Now.ToShortDateString());
                        sqlcmd.ExecuteNonQuery();
                        sqlCon.Close();
                        //CODE BLOCK TO DELETE SELECTED RECORD FROM INSERT PENDING TABLE
                        using (SqlConnection sqlCon2 = new SqlConnection(connectionString))
                        {
                            string id = Val1;  
                            sqlCon2.Open();
                            string Delquery = "DELETE FROM [RTD_Temp_Insert] WHERE id='" + id + "'";
                            SqlCommand sqlcmdDel = new SqlCommand(Delquery, sqlCon2);
                            sqlcmdDel.ExecuteNonQuery();
                            sqlCon2.Close();
                        }
                        //FIND NEW ID AFTER DATA INSERTED TO RTD TABLE  (PENDING TO PRIMARY TABLE)
                        string ConStrr = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                        int maxIdd;
                        using (var conn = new SqlConnection(ConStrr))
                        using (var command = new SqlCommand("[GetNewID_RTD]", conn)
                        {
                            CommandType = CommandType.StoredProcedure
                        })
                        {
                            conn.Open();
                            maxIdd = command.ExecuteNonQuery();
                            conn.Close();
                        }
                        //--------------------READ CURRENT ID AND NEW ID FROM RTD table----------------------------------------
                        string oldID, NewID;
                        string constr2 = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                        using (SqlConnection con = new SqlConnection(constr2))
                        {
                            using (SqlCommand cmd2 = new SqlCommand())
                            {
                                cmd2.CommandText = "SELECT *FROM RTD_tbl_ID";
                                cmd2.Connection = con;
                                con.Open();
                                using (SqlDataReader sdr = cmd2.ExecuteReader())
                                {
                                    sdr.Read();
                                    oldID = sdr["oldMaxid"].ToString();
                                    NewID = sdr["NewMaxid"].ToString();
                                }
                                con.Close();
                                con.Dispose();
                            }
                        }
                        //-----------------------------------------------------------------------
                        string connectionStringg = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                        using (SqlConnection sqlConn = new SqlConnection(connectionStringg))
                        {
                            sqlConn.Open();
                            string queryy = "UPDATE RTD SET [Approved By]='" + username + "' WHERE id= '" + oldID + "' AND id  ='" + NewID + "'";
                            SqlCommand sqlcmdd = new SqlCommand(queryy, sqlConn);
                            sqlcmdd.ExecuteNonQuery();
                            sqlConn.Close();
                            sqlConn.Dispose();
                        }
                        // break;
                    }//END OF FOR
                }
            }

            GridView2.DataSourceID = "SqlCon2";
            GridView2.DataBind();
            insertedPending();
        }

        protected void chkb1_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox ChkBoxHeader = (CheckBox)GridView2.HeaderRow.FindControl("chkb1");
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

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridView3_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void updatedCheck_CheckedChanged(object sender, EventArgs e)
        {
            if (updatedCheck.Checked)
            {
                insertCheck.Checked = false;
                GridView2.Visible = false;
                GridView3.Visible = true;
           
                insertLbl.Visible = false;
                updateLbl.Visible = true;
                ApproveUpdateBtn.Enabled = true;
                ApproveBtnImg.Enabled = false;
                UpdatedPending();

            }
        }

        protected void insertCheck_CheckedChanged(object sender, EventArgs e)
        {
            if (insertCheck.Checked)
            {
                updatedCheck.Checked = false;
                GridView3.Visible = false;
                GridView2.Visible = true;
                updateLbl.Visible = false;
                insertedPending();
                ApproveBtnImg.Enabled = true;
                ApproveUpdateBtn.Enabled = false;
                insertLbl.Visible = true;
            }
        }


        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                //if (Session["sid"] == null)
                //{
                //    Response.Redirect("Loging.aspx");
                //    Session.Remove("loading");
                //}
            }
            //-------------------------------------------

           
              //-----------------------------------------------------------------------------

            



            //----------------------------------

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Insert")
            {
                Session["pid"] = e.CommandArgument.ToString();
                //-----------------------------FIND CURRENT ID before any insertion--------------------------------------------

                string ConStr =  ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                int maxId;
                using (var conn = new SqlConnection(ConStr))
                using (var command = new SqlCommand("GetCurMaxID", conn)
                {
                    CommandType = CommandType.StoredProcedure
                })
                {
                    conn.Open();
                    maxId = command.ExecuteNonQuery();
                    conn.Close();
                    conn.Dispose();
                }

                //=====================================================================
                string connectionString = @"Data Source=AIBW8CAMS02;Initial Catalog=collateral;Persist Security Info=True;User ID=sma;Password=1111";
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    string fullUsername = User.Identity.Name;
                    int index_domain = fullUsername.IndexOf("AIB\\");
                    string username = fullUsername.Substring(fullUsername.IndexOf("\\") + 1);
                    foreach (GridViewRow gw in GridView2.Rows)
                    {
                        var chkSelect = gw.FindControl("chkSelect") as CheckBox;
                        if (chkSelect.Checked)
                        {
                            //for (int i = 0; i   GridView2.Rows.Count; i++)
                            //{

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
                            Val13 = (gw.FindControl("Label13") as Label).Text;
                            Val14 = (gw.FindControl("Label14") as Label).Text;
                            Val15 = (gw.FindControl("Label15") as Label).Text;
                            //********************************************************
                            sqlCon.Open();
                            string query = "INSERT INTO[dbo].[Wak_Tbl] (" +
                                "[ClientName]," +
                                "[FacilityApproval] ," +
                                "[FacilityType] ," +
                                "[FacilityStatus] ," +
                                "[SafeNo] ," +
                                "[drawer]," +
                                "[FolderNo]," +
                                "[Extention] ," +
                                "[modification]," +
                                "[SafeInDate] ," +
                                "[DocStatus] ," +
                                "[SafeOutDate] ," +
                                "[Remark]," +
                                "[InsertedBy]" +
                                ") values(@val2,@val3,@val4,@val5,@val6,@val7,@val8,@val9,@val10,@val11,@val12,@val13,@val14,@val15)";

                            SqlCommand sqlcmd = new SqlCommand(query, sqlCon);
                            //==========catch selected data=================================
                            sqlcmd.Parameters.AddWithValue("@val2", Val2);//clinename
                            sqlcmd.Parameters.AddWithValue("@val3", Val3);//facilityApprovll
                            sqlcmd.Parameters.AddWithValue("@val4", Val4);//FacilityType
                            sqlcmd.Parameters.AddWithValue("@val5", Val5);//Facility Status
                            sqlcmd.Parameters.AddWithValue("@val6", Val6);//SafeNo
                            sqlcmd.Parameters.AddWithValue("@val7", Val7);//drawer
                            sqlcmd.Parameters.AddWithValue("@val8", Val8);//folderNO
                            sqlcmd.Parameters.AddWithValue("@val9", Val9);//Extention
                            sqlcmd.Parameters.AddWithValue("@val10", Val10);//Modification
                            sqlcmd.Parameters.AddWithValue("@val11", Val11);//SafeIn
                            sqlcmd.Parameters.AddWithValue("@val12", Val12);//DocStatus
                            sqlcmd.Parameters.AddWithValue("@val13", Val13);//SafeOutDate
                            sqlcmd.Parameters.AddWithValue("@val14", Val14);//Remark
                            sqlcmd.Parameters.AddWithValue("@val15", Val15);//Remark
                            sqlcmd.ExecuteNonQuery();
                            //Lblresult.Text = "Pending record updated successfully!";
                            //Lblresult.ForeColor = System.Drawing.Color.Blue;
                            //Lblresult.Visible = true;
                            sqlCon.Close();
                            using (SqlConnection sqlCon2 = new SqlConnection(connectionString))
                            {
                                string id = Val1; //Session["pid"].ToString();
                                sqlCon2.Open();
                                string Delquery = "DELETE FROM [Wak_Tbl_temp] WHERE id='" + id + "'";
                                SqlCommand sqlcmdDel = new SqlCommand(Delquery, sqlCon2);

                                sqlcmdDel.ExecuteNonQuery();
                                sqlCon2.Close();
                            }
                            //----------------------------------FIND NEW ID---------------------------------------------------------
                            string ConStrr =  ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                            int maxIdd;
                            using (var conn = new SqlConnection(ConStrr))
                            using (var command = new SqlCommand("GetNewID", conn)
                            {
                                CommandType = CommandType.StoredProcedure
                            })
                            {
                                conn.Open();
                                maxIdd = command.ExecuteNonQuery();
                                conn.Close();
                                conn.Dispose();
                            }
                            //--------------------READ CURRENT ID AND NEW ID FROM WAK_TBL_ID----------------------------------------

                            string oldID, NewID;
                            string constr2 = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                            using (SqlConnection con = new SqlConnection(constr2))
                            {
                                using (SqlCommand cmd2 = new SqlCommand())
                                {
                                    cmd2.CommandText = "SELECT *FROM Wak_Tbl_ID";

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
                            string connectionStringg = @"Data Source=AIBW8CAMS02;Initial Catalog=collateral;Persist Security Info=True;User ID=sma;Password=1111";
                            using (SqlConnection sqlConn = new SqlConnection(connectionStringg))
                            {
                                sqlConn.Open();
                                string queryy = "UPDATE wak_tbl SET approvedBy='" + username+ "' where id '" + oldID + "' and id  ='" + NewID + "'";
                                SqlCommand sqlcmdd = new SqlCommand(queryy, sqlConn);
                                sqlcmdd.ExecuteNonQuery();
                                sqlConn.Close();
                                sqlConn.Dispose();
                            }
                            // break;
                        }//==========================================end of FOR
                    }
                }

                GridView2.DataSourceID = "SqlCon2";
                GridView2.DataBind();
                insertedPending();
            }

            if (e.CommandName == "delete")
            {
                insertedPending();
                GridView2.DataBind();
                Response.Redirect("wak_pending.aspx");
            }
        }
        //--------------------------------------------------------------------------------------------------------

        protected void GridView3_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            //     if (e.CommandName == "Insert")
            //     {
            //         Session["pid"] = e.CommandArgument.ToString();


            //         //=====================================================================
            //         string connectionString = @"Data Source=AIBW8CAMS02;Initial Catalog=collateral;Persist Security Info=True;User ID=sma;Password=1111";
            //         using (SqlConnection sqlCon = new SqlConnection(connectionString))
            //         {

            //             foreach (GridViewRow gw in GridView3.Rows)
            //             {

            //                 for (int i = 0; i   GridView3.Rows.Count; i++)
            //                 {

            //                     Val1 = (gw.FindControl("Label1") as Label).Text;
            //                     Val2 = (gw.FindControl("Label2") as Label).Text;
            //                     Val3 = (gw.FindControl("Label3") as Label).Text;
            //                     Val4 = (gw.FindControl("Label4") as Label).Text;
            //                     Val5 = (gw.FindControl("Label5") as Label).Text;
            //                     Val6 = (gw.FindControl("Label6") as Label).Text;
            //                     Val7 = (gw.FindControl("Label7") as Label).Text;
            //                     Val8 = (gw.FindControl("Label8") as Label).Text;
            //                     Val9 = (gw.FindControl("Label9") as Label).Text;
            //                     Val10 = (gw.FindControl("Label10") as Label).Text;
            //                     Val11 = (gw.FindControl("Label11") as Label).Text;
            //                     Val12 = (gw.FindControl("Label12") as Label).Text;
            //                     Val13 = (gw.FindControl("Label13") as Label).Text;
            //                     Val14 = (gw.FindControl("Label14") as Label).Text;
            //                     Val15 = (gw.FindControl("Label15") as Label).Text;
            //                     //********************************************************
            //                     sqlCon.Open();
            //                     string queryy = "UPDATE [dbo].[Wak_tbl] SET " +
            //                               "[ClientName] =@val2" +
            //                               ",[FacilityApproval] =@val3" +
            //                               ",[FacilityType] =@val4" +
            //                               ",[FacilityStatus] =@val5" +
            //                               ",[SafeNo] =@val6" +
            //                               ",[drawer] =@val7" +
            //                               ",[FolderNo] =@val8" +
            //                               ",[Extention] =@val9" +
            //                               ",[modification]=@val10" +
            //                               ",[SafeInDate] =@val11" +
            //                               ",[DocStatus] =@val12," +
            //                               "[SafeOutDate] =@val13," +
            //                               "[Remark] =@val14," +
            //                               "[UpdatedBy]=@val15," +
            //                               "[approvedBy]='" + Session["Users"].ToString() + "' WHERE id='" + Val1 + "'";

            //                     SqlCommand sqlcmd = new SqlCommand(queryy, sqlCon);
            //                     //==========catch selected data=================================
            //                     sqlcmd.Parameters.AddWithValue("@val2", Val2);//clinename
            //                     sqlcmd.Parameters.AddWithValue("@val3", Val3);//facilityApprovll
            //                     sqlcmd.Parameters.AddWithValue("@val4", Val4);//FacilityType
            //                     sqlcmd.Parameters.AddWithValue("@val5", Val5);//Facility Status
            //                     sqlcmd.Parameters.AddWithValue("@val6", Val6);//SafeNo
            //                     sqlcmd.Parameters.AddWithValue("@val7", Val7);//drawer
            //                     sqlcmd.Parameters.AddWithValue("@val8", Val8);//folderNO
            //                     sqlcmd.Parameters.AddWithValue("@val9", Val9);//Extention
            //                     sqlcmd.Parameters.AddWithValue("@val10", Val10);//Modification
            //                     sqlcmd.Parameters.AddWithValue("@val11", Val11);//SafeIn
            //                     sqlcmd.Parameters.AddWithValue("@val12", Val12);//DocStatus
            //                     sqlcmd.Parameters.AddWithValue("@val13", Val13);//SafeOutDate
            //                     sqlcmd.Parameters.AddWithValue("@val14", Val14);//Remark
            //                     sqlcmd.Parameters.AddWithValue("@val15", Val15);//Updated By
            //                     sqlcmd.ExecuteNonQuery();
            //                     //Lblresult.Text = "Pending record updated successfully!";
            //                     //Lblresult.ForeColor = System.Drawing.Color.Blue;
            //                     //Lblresult.Visible = true;
            //                     sqlCon.Close();
            //                     using (SqlConnection sqlCon2 = new SqlConnection(connectionString))
            //                     {
            //                         string id = Val1; //Session["pid"].ToString();
            //                         sqlCon2.Open();
            //                         string Delquery = "DELETE FROM [Wak_update_temp] WHERE id='" + id + "'";
            //                         SqlCommand sqlcmdDel = new SqlCommand(Delquery, sqlCon2);

            //                         sqlcmdDel.ExecuteNonQuery();
            //                         sqlCon2.Close();
            //                     }
            //                     break;
            //                 }
            //             }//==========================================end of FOREACH
            //         }
            //         UpdatedPending();
            //         GridView3.DataSourceID = "SqlConUpdate";
            //         GridView3.DataBind();
            //     }
            if (e.CommandName == "delete")
            {
                GridView3.DataSourceID = "SqlConUpdate";
                Response.Redirect("RTD_pending.aspx");
            }
     }

            protected void insertedPending()
        {
            //-------------------------

            if (GridView2.Visible)
            {

                GridView2.Columns[11].Visible = false;
                GridView2.Columns[12].Visible = false;
                GridView2.Columns[13].Visible = false;
                GridView2.Columns[14].Visible = false;
                GridView2.Columns[15].Visible = false;
                GridView2.Columns[16].Visible = false;
                GridView2.Columns[17].Visible = false;
                GridView2.Columns[18].Visible = false;
                GridView2.Columns[19].Visible = false;
                GridView2.Columns[20].Visible = false;
                GridView2.Columns[21].Visible = false;
                GridView2.Columns[22].Visible = false;
                GridView2.Columns[23].Visible = false;
                GridView2.Columns[24].Visible = false;
                GridView2.Columns[25].Visible = false;
                GridView2.Columns[26].Visible = false;
                GridView2.Columns[27].Visible = false;
                GridView2.Columns[28].Visible = false;
                GridView2.Columns[29].Visible = false;
                GridView2.Columns[30].Visible = false;
            }
            else
            {

                GridView2.Columns[0].Visible = true;
                GridView2.Columns[1].Visible = true;
                GridView2.Columns[2].Visible = true;
                GridView2.Columns[3].Visible = true;
                GridView2.Columns[4].Visible = true;
                GridView2.Columns[5].Visible = true;
                GridView2.Columns[6].Visible = true;
                GridView2.Columns[7].Visible = true;
                GridView2.Columns[8].Visible = true;
                GridView2.Columns[9].Visible = true;
                GridView2.Columns[10].Visible = true;
                GridView2.Columns[11].Visible = true;
                GridView2.Columns[12].Visible = true;
                GridView2.Columns[13].Visible = true;
                GridView2.Columns[14].Visible = true;
                GridView2.Columns[15].Visible = true;
                GridView2.Columns[16].Visible = true;
                GridView2.Columns[17].Visible = true;
                GridView2.Columns[18].Visible = true;
                GridView2.Columns[19].Visible = true;
                GridView2.Columns[20].Visible = true;
                GridView2.Columns[21].Visible = true;
                GridView2.Columns[22].Visible = true;
                GridView2.Columns[23].Visible = true;
                GridView2.Columns[24].Visible = true;
                GridView2.Columns[25].Visible = true;
                GridView2.Columns[26].Visible = true;
                GridView2.Columns[27].Visible = true;
                GridView2.Columns[28].Visible = true;
                GridView2.Columns[29].Visible = true;
                GridView2.Columns[30].Visible = true;



            } // END OF GRIDVIEW2



            //--------------------------
            if (GridView2.Rows.Count  >= 1)
            {

                string ConStr = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                using (SqlConnection sqlCon2 = new SqlConnection(ConStr))
                {

                    sqlCon2.Open();
                    string query = "SELECT count(*) FROM [RTD_Temp_Insert]";
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
                insertLbl.Text = "No Inserted Pending Record(s)";
            }

        }
        //------------------------------------------------------------

        protected void UpdatedPending()
        {
            //----------------------------
            if (GridView3.Visible)
            {

                GridView3.Columns[11].Visible = false;
                GridView3.Columns[12].Visible = false;
                GridView3.Columns[13].Visible = false;
                GridView3.Columns[14].Visible = false;
                GridView3.Columns[15].Visible = false;
                GridView3.Columns[16].Visible = false;
                GridView3.Columns[17].Visible = false;
                GridView3.Columns[18].Visible = false;
                GridView3.Columns[19].Visible = false;
                GridView3.Columns[20].Visible = false;
                GridView3.Columns[21].Visible = false;
                GridView3.Columns[22].Visible = false;
                GridView3.Columns[23].Visible = false;
                GridView3.Columns[24].Visible = false;
                GridView3.Columns[25].Visible = false;
                GridView3.Columns[26].Visible = false;
                GridView3.Columns[27].Visible = false;
                GridView3.Columns[28].Visible = false;
                GridView3.Columns[29].Visible = false;
                GridView3.Columns[30].Visible = false;
            }
            else
            {

                GridView3.Columns[0].Visible = true;
                GridView3.Columns[1].Visible = true;
                GridView3.Columns[2].Visible = true;
                GridView3.Columns[3].Visible = true;
                GridView3.Columns[4].Visible = true;
                GridView3.Columns[5].Visible = true;
                GridView3.Columns[6].Visible = true;
                GridView3.Columns[7].Visible = true;
                GridView3.Columns[8].Visible = true;
                GridView3.Columns[9].Visible = true;
                GridView3.Columns[10].Visible = true;
                GridView3.Columns[11].Visible = true;
                GridView3.Columns[12].Visible = true;
                GridView3.Columns[13].Visible = true;
                GridView3.Columns[14].Visible = true;
                GridView3.Columns[15].Visible = true;
                GridView3.Columns[16].Visible = true;
                GridView3.Columns[17].Visible = true;
                GridView3.Columns[18].Visible = true;
                GridView3.Columns[19].Visible = true;
                GridView3.Columns[20].Visible = true;
                GridView3.Columns[21].Visible = true;
                GridView3.Columns[22].Visible = true;
                GridView3.Columns[23].Visible = true;
                GridView3.Columns[24].Visible = true;
                GridView3.Columns[25].Visible = true;
                GridView3.Columns[26].Visible = true;
                GridView3.Columns[27].Visible = true;
                GridView3.Columns[28].Visible = true;
                GridView3.Columns[29].Visible = true;
                GridView3.Columns[30].Visible = true;

            } // END OF GRIDVIEW2
           
//----------------------------------

            if (GridView3.Rows.Count  >= 1)
            {

                string ConStr = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                using (SqlConnection sqlCon2 = new SqlConnection(ConStr))
                {
                    sqlCon2.Open();
                    string query = "SELECT count(*) FROM [RTD_Pending_Update]";
                    SqlCommand sqlcmd = new SqlCommand(query, sqlCon2);
                    int count = Convert.ToInt16(sqlcmd.ExecuteScalar());
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


    }
}