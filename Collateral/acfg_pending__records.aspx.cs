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
    public partial class acfg_pending__records : System.Web.UI.Page
    {
        string Val1, Val2, Val3, Val4, Val5, Val6, Val7, Val8, Val9, Val10, Val11;

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
                    Response.Redirect("Loging.aspx");
                    Session.Remove("loading");
                }
            }
        
        }

        protected void insertCheck_CheckedChanged(object sender, EventArgs e)
        {
            if (insertCheck.Checked)
            {
                updatedCheck.Checked = false;
                GridView2.Visible = true;
                GridView3.Visible = false;
                ApproveUpdateBtn.Enabled = false;
                ApproveBtnImg.Enabled = true;
                updateLbl.Visible = false;
                insertedPending();
            }
        }

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

        protected void updatedCheck_CheckedChanged(object sender, EventArgs e)
        {
            if (updatedCheck.Checked)
            {
                insertCheck.Checked = false;
                GridView3.Visible = true;
                GridView2.Visible = false;
                ApproveUpdateBtn.Enabled = true;
                ApproveBtnImg.Enabled = false;
                insertLbl.Visible = false;
                UpdatedPending();
            }
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            string ConStr = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
            int CurmaxId;
            using (var conn = new SqlConnection(ConStr))
            using (var command = new SqlCommand("GetCurmaxID_acgf", conn)
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

                        //********************************************************
                        sqlCon.Open();
                        string query = "INSERT INTO [dbo].[ACGF]" +
                                      " (" +
                                      "  [Borrower Name]" +
                                      " ,[Faciliy Approval No]" +
                                      " ,[Product Code]" +
                                       ",[LOG No]" +
                                      " ,[Maturity Date of Facility]" +
                                      " ,[ACGF Expiry Date]" +
                                      " ,[Guarantee Claimed]" +
                                      " ,[Remark]" +
                                       ",[InsertedBy]" +
                                       //",[Approved By]" +
                                      // ",[Updated By]"+
                                      ")" +
                                        "VALUES(" +
                                        "@val2," +// bname
                                        "@val3," +//Fan
                                        "@val4," +//pc
                                        "@val5," +//log
                                        "@val6," +//mdf
                                        "@val7," +//acgf
                                        "@val8," +//GC
                                        "@val9," +//Remark
                                        "@val10" +//IB
                                       // "@val11" +//AB
                                       // ",@val12"+
                                        ")";
                        SqlCommand sqlcmd = new SqlCommand(query, sqlCon);
                        //==========catch selected data=================================
                        sqlcmd.Parameters.AddWithValue("@val2", Val2);//bname
                        sqlcmd.Parameters.AddWithValue("@val3", Val3);//FAN
                        sqlcmd.Parameters.AddWithValue("@val4", Val4);//PC
                        sqlcmd.Parameters.AddWithValue("@val5", Val5);//LOG
                        sqlcmd.Parameters.AddWithValue("@val6", Val6);//MDF
                        sqlcmd.Parameters.AddWithValue("@val7", Val7);//ACGF
                        sqlcmd.Parameters.AddWithValue("@val8", Val8);//GC
                        sqlcmd.Parameters.AddWithValue("@val9", Val9);//Remark
                        sqlcmd.Parameters.AddWithValue("@val10", Val10);//Inserted BY
                        //sqlcmd.Parameters.AddWithValue("@val11", Val11);//Approved BY
                        sqlcmd.ExecuteNonQuery();
                        sqlCon.Close();

                        using (SqlConnection sqlCon2 = new SqlConnection(ConStr))
                        {

                            string id = Val1;
                            sqlCon2.Open();
                            string Delquery = "DELETE FROM [acgf_insert] WHERE id='" + id + "'";
                            SqlCommand sqlcmdDel = new SqlCommand(Delquery, sqlCon2);

                            sqlcmdDel.ExecuteNonQuery();
                            sqlCon2.Close();
                        }
                        //----------------------------------FIND NEW ID---------------------------------------------------------
                        string ConStrr = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                        int maxIdd;
                        using (var conn = new SqlConnection(ConStrr))
                        using (var command = new SqlCommand("GetNewID_acgf", conn)
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
                                cmd2.CommandText = "SELECT * FROM acgf_tbl_id";

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
                        string fullUsername = User.Identity.Name;
                        int index_domain = fullUsername.IndexOf("AIB\\");
                        string username = fullUsername.Substring(fullUsername.IndexOf("\\") + 1);
                        string connectionStringg = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                        using (SqlConnection sqlConn = new SqlConnection(connectionStringg))
                        {
                            sqlConn.Open();
                            string queryy = "UPDATE acgf SET [approved By]='" + username + "' where id>'" + oldID + "' and id <='" + NewID + "'";
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
        //------------------------------------------------------------

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
                            Val3 = (gw.FindControl("Label3") as Label).Text;//FAN
                            Val4 = (gw.FindControl("Label4") as Label).Text;//PC
                            Val5 = (gw.FindControl("Label5") as Label).Text;//LOG
                            Val6 = (gw.FindControl("Label6") as Label).Text;//MDF
                            Val7 = (gw.FindControl("Label7") as Label).Text;//ACGF
                            Val8 = (gw.FindControl("Label8") as Label).Text;//GC
                            Val9 = (gw.FindControl("Label9") as Label).Text;//Remark
                            Val10 = (gw.FindControl("Label10") as Label).Text;//InsertedBy
                            Val11= (gw.FindControl("Label12") as Label).Text;//Updated By
                         
                            sqlConn.Open();
                        //string queryy = "UPDATE acgf SET [Approved By]='Alawi Nahoori' WHERE id='1'";
                        string queryy = "UPDATE [acgf] SET" +
                                  "[Borrower Name] =@val2" +
                                  ",[Faciliy Approval No] =@val3" +
                                  ",[Product Code] =@val4" +
                                  ",[LOG No] =@val5" +
                                  ",[Maturity Date of Facility] =@val6" +
                                  ",[ACGF Expiry Date] =@val7" +
                                  ",[Guarantee Claimed] =@val8" +
                                  ",[Remark] =@val9" +
                                  ",[InsertedBy]=@val10" +
                                  ",[Updated By]=@val12" +
                                  ",[Approved By]='" + Session["Users"].ToString() + "'" +
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
                            sqlcmd.Parameters.AddWithValue("@val12", Val11);// 

                            sqlcmd.ExecuteNonQuery();


                            sqlConn.Close();
                            using (SqlConnection sqlCon2 = new SqlConnection(connectionString))
                            {
                                string id = Val1; //Session["pid"].ToString();
                                sqlCon2.Open();
                                string Delquery = "DELETE FROM [acgf_update] WHERE id='" + id + "'";
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

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

      
        protected void GridView3_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void GridView3_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        protected void UpdatedPending()
        {

            if (GridView3.Rows.Count >= 1)
            {
                
                string ConStr = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                using (SqlConnection sqlCon2 = new SqlConnection(ConStr))
                {
                    sqlCon2.Open();
                    string query = "SELECT count(*) FROM [acgf_update]";
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
    }
}