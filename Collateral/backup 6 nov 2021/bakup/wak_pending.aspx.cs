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

    public partial class wak_pending : System.Web.UI.Page
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
                foreach (GridViewRow gw in GridView3.Rows)
                {
                    var chkSelect = gw.FindControl("chkSelect") as CheckBox;
                    if (chkSelect.Checked)
                    {
                        Val1 = (gw.FindControl("Label1") as Label).Text;//id
                        Val2 = (gw.FindControl("Label2") as Label).Text;//Client Name
                        Val3 = (gw.FindControl("Label3") as Label).Text;//Facility Approval
                        Val4 = (gw.FindControl("Label4") as Label).Text;//FacilityType
                        Val5 = (gw.FindControl("Label5") as Label).Text;//FacilityStatus
                        Val6 = (gw.FindControl("Label6") as Label).Text;//SafeNo
                        Val7 = (gw.FindControl("Label7") as Label).Text;//drawer
                        Val8 = (gw.FindControl("Label8") as Label).Text;//FolderNo
                        Val9 = (gw.FindControl("Label9") as Label).Text;//Extention
                        Val10 = (gw.FindControl("Label10") as Label).Text;//Modification
                        Val11 = (gw.FindControl("Label11") as Label).Text;//SafeInDate
                        Val12 = (gw.FindControl("Label12") as Label).Text;//DocStatus
                        Val13 = (gw.FindControl("Label13") as Label).Text;//SafeOutDate
                        Val14 = (gw.FindControl("Label14") as Label).Text;//Remark
                        //Inserted by is not involved
                        Val15 = (gw.FindControl("Label15") as Label).Text;//UpatedBy
                        Val16 = (gw.FindControl("Label16") as Label).Text;//ArchDoc
                        //Val17 = (gw.FindControl("Label17") as Label).Text;//Archdate
                        //Val18 = (gw.FindControl("Label18") as Label).Text;//SafeReference
                        sqlConn.Open();
                        string queryy = "UPDATE [dbo].[Wak_tbl] SET" +
                                  // "id=@val1"+
                                  "[ClientName] =@val2" +
                                  ",[FacilityApproval] =@val3" +
                                  ",[FacilityType] =@val4" +
                                  ",[FacilityStatus] =@val5" +
                                  ",[SafeNo] =@val6" +
                                  ",[drawer] =@val7" +
                                  ",[FolderNo] =@val8" +
                                  ",[Extention] =@val9" +
                                  ",[modification]=@val10" +
                                  ",[SafeInDate] =@val11" +
                                  ",[DocStatus] =@val12" +
                                  ",[SafeOutDate] =@val13" +
                                  ",[Remark] =@val14" +
                                  ",[approvedBy]='" + username + "'" +
                                  ",[UpdatedBy]=@val15" +
                                  ",[ArchDate]=@val16" +
                                  //",[SafeRef]=@val18" +
                                  //",[ArchDate]=@val17" +

                                  " WHERE id='" + Val1 + "'";

                        SqlCommand sqlcmd = new SqlCommand(queryy, sqlConn);
                        //==========catch selected data=================================

                        // sqlcmd.Parameters.AddWithValue("@val1", Val1);//clinename
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
                        sqlcmd.Parameters.AddWithValue("@val15", Val15);//Updated By
                        sqlcmd.Parameters.AddWithValue("@val16", Val16);//Archdate


                        sqlcmd.ExecuteNonQuery();
                        sqlConn.Close();
                        using (SqlConnection sqlCon2 = new SqlConnection(connectionString))
                        {
                            string id = Val1; //Session["pid"].ToString();
                            sqlCon2.Open();
                            string Delquery = "DELETE FROM [Wak_update_temp] WHERE id='" + id + "'";
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
            string fullUsername = User.Identity.Name;
            int index_domain = fullUsername.IndexOf("AIB\\");
            string username = fullUsername.Substring(fullUsername.IndexOf("\\") + 1);
            string ConStr = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
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

            }
            //string connectionString = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
            using (SqlConnection sqlCon = new SqlConnection(ConStr))
            {

                foreach (GridViewRow gw in GridView2.Rows)
                {
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
                        Val13 = (gw.FindControl("Label13") as Label).Text;
                        Val14 = (gw.FindControl("Label14") as Label).Text;
                        Val15 = (gw.FindControl("Label15") as Label).Text;
                        //********************************************************
                        sqlCon.Open();
                        string query = "INSERT INTO[dbo].[Wak_Tbl] (" +
                            "[ClientName]," +
                            "[FacilityApproval]," +
                            "[FacilityType]," +
                            "[FacilityStatus]," +
                            "[SafeNo]," +
                            "[drawer]," +
                            "[FolderNo]," +
                            "[Extention]," +
                            "[modification]," +
                            "[SafeInDate]," +
                            "[DocStatus]," +
                            "[SafeOutDate] ," +
                            "[Remark]," +
                            "[InsertedBy]" +
                            ")" +
                            " VALUES(" +
                            "@val2,@val3,@val4,@val5,@val6,@val7," +
                            "@val8,@val9,@val10,@val11,@val12," +
                            "@val13,@val14,@val15)";

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

                        sqlCon.Close();


                        using (SqlConnection sqlCon2 = new SqlConnection(ConStr))
                        {
                            string id = Val1; //Session["pid"].ToString();
                            sqlCon2.Open();
                            string Delquery = "DELETE FROM [Wak_Tbl_temp] WHERE id='" + id + "'";
                            SqlCommand sqlcmdDel = new SqlCommand(Delquery, sqlCon2);

                            sqlcmdDel.ExecuteNonQuery();
                            sqlCon2.Close();
                        }
                        //----------------------------------FIND NEW ID---------------------------------------------------------
                        string ConStrr = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
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
                        string connectionStringg = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                        using (SqlConnection sqlConn = new SqlConnection(connectionStringg))
                        {
                            sqlConn.Open();
                            string queryy = "UPDATE wak_tbl SET approvedBy='" + username + "' where id>'" + oldID + "' and id <='" + NewID + "'";
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
            GridView3.Visible = true;
            GridView2.Visible = false;
            ApproveUpdateBtn.Enabled = true;
            ApproveBtnImg.Enabled = false;
            insertCheck.Checked = false;
            insertLbl.Visible = false;
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
                    //Response.Redirect("Loging.aspx");
                    //Session.Remove("loading");
                    Response.Redirect("NotAuthorize.aspx?ReturnPath=" + Server.UrlEncode(Request.Url.AbsoluteUri));

                }
            }



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

                string ConStr = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
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
                }
                string fullUsername = User.Identity.Name;
                int index_domain = fullUsername.IndexOf("AIB\\");
                string username = fullUsername.Substring(fullUsername.IndexOf("\\") + 1);
                //=====================================================================
                string connectionString = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {

                    foreach (GridViewRow gw in GridView2.Rows)
                    {
                        var chkSelect = gw.FindControl("chkSelect") as CheckBox;
                        if (chkSelect.Checked)
                        {
                            //for (int i = 0; i < GridView2.Rows.Count; i++)
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
                            //FIND NEW ID
                            string ConStrr = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
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
                            string connectionStringg = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                            using (SqlConnection sqlConn = new SqlConnection(connectionStringg))
                            {
                                sqlConn.Open();
                                string queryy = "UPDATE wak_tbl SET approvedBy='" + username + "' where id>'" + oldID + "' and id <='" + NewID + "'";
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

            if (e.CommandName == "delete")
            {
                insertedPending();
                GridView2.DataBind();
                //Response.Redirect("wak_pending.aspx");
            }
        }
        //--------------------------------------------------------------------------------------------------------

        protected void GridView3_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string fullUsername = User.Identity.Name;
            int index_domain = fullUsername.IndexOf("AIB\\");
            string username = fullUsername.Substring(fullUsername.IndexOf("\\") + 1);
            if (e.CommandName == "Insert")
            {
                Session["pid"] = e.CommandArgument.ToString();


                //=====================================================================
                string connectionString = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {

                    foreach (GridViewRow gw in GridView3.Rows)
                    {

                        for (int i = 0; i < GridView3.Rows.Count; i++)
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
                            Val13 = (gw.FindControl("Label13") as Label).Text;
                            Val14 = (gw.FindControl("Label14") as Label).Text;
                            Val15 = (gw.FindControl("Label15") as Label).Text;
                            Val16 = (gw.FindControl("Label16") as Label).Text;//Archdate
                            //********************************************************
                            sqlCon.Open();
                            string queryy = "UPDATE [dbo].[Wak_tbl] SET " +
                                      "[ClientName] =@val2" +
                                      ",[FacilityApproval] =@val3" +
                                      ",[FacilityType] =@val4" +
                                      ",[FacilityStatus] =@val5" +
                                      ",[SafeNo] =@val6" +
                                      ",[drawer] =@val7" +
                                      ",[FolderNo] =@val8" +
                                      ",[Extention] =@val9" +
                                      ",[modification]=@val10" +
                                      ",[SafeInDate] =@val11" +
                                      ",[DocStatus] =@val12," +
                                      "[SafeOutDate] =@val13," +
                                      "[Remark] =@val14," +
                                      "[UpdatedBy]=@val15," +
                                      "[ArchDate]=@val16," +
                                      "[approvedBy]='" + username + "' WHERE id='" + Val1 + "'";

                            SqlCommand sqlcmd = new SqlCommand(queryy, sqlCon);
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
                            sqlcmd.Parameters.AddWithValue("@val15", Val15);//Updated By
                            sqlcmd.Parameters.AddWithValue("@val16", Val16);//archdate
                            sqlcmd.ExecuteNonQuery();
                            //Lblresult.Text = "Pending record updated successfully!";
                            //Lblresult.ForeColor = System.Drawing.Color.Blue;
                            Lblresult.Visible = true;
                            sqlCon.Close();
                            using (SqlConnection sqlCon2 = new SqlConnection(connectionString))
                            {
                                string id = Val1; //Session["pid"].ToString();
                                sqlCon2.Open();
                                string Delquery = "DELETE FROM [Wak_update_temp] WHERE id='" + id + "'";
                                SqlCommand sqlcmdDel = new SqlCommand(Delquery, sqlCon2);

                                sqlcmdDel.ExecuteNonQuery();
                                sqlCon2.Close();
                            }
                            break;
                        }
                    }//==========================================end of FOREACH
                }
                UpdatedPending();
                GridView3.DataSourceID = "SqlConUpdate";
                GridView3.DataBind();
            }
            if (e.CommandName == "delete")
            {

                GridView3.DataSourceID = "SqlConUpdate";
                Response.Redirect("wak_pending.aspx");
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
                    string query = "SELECT count(*) FROM [Wak_Tbl_temp]";
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

            if (GridView3.Rows.Count >= 1)
            {

                string ConStr = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                using (SqlConnection sqlCon2 = new SqlConnection(ConStr))
                {
                    sqlCon2.Open();
                    string query = "SELECT count(*) FROM [Wak_update_temp]";
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