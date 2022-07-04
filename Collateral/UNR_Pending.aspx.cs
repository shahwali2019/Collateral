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
    public partial class UNR_Pending : System.Web.UI.Page
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
        Val13;

        protected void gv3_RowDataBound(object sender, GridViewRowEventArgs e)
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

        protected void Gridv_LAR_RowDataBound(object sender, GridViewRowEventArgs e)
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

        protected void ApproveUpdateBtn_Click(object sender, ImageClickEventArgs e)
        {
            string fullUsername = User.Identity.Name;
            int index_domain = fullUsername.IndexOf("AIB\\");
            string username = fullUsername.Substring(fullUsername.IndexOf("\\") + 1);

            //Code to secure URL Security

                string qry = string.Empty;
                qry = "select Access_role from [userMng] where username='" + username + "'";
                string strConnString = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;

                SqlConnection con = new SqlConnection(strConnString);
                con.Open();
                SqlCommand cd = new SqlCommand(qry, con);

                string Access_role = Convert.ToString(cd.ExecuteScalar());


                //else if (Access_role == "Admin")
                //{
                //    updatedCheck.Visible = true;


                //}
 
            string connectionString = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
            using (SqlConnection sqlConn = new SqlConnection(connectionString))
            {
                foreach (GridViewRow gw in gv3.Rows)
                {
                    var chkSelect = gw.FindControl("chkSelect") as CheckBox;

                        if (chkSelect.Checked) // && Access_role != username
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
                        //  Val11 = (gw.FindControl("Label11") as Label).Text; 
                        Val12 = (gw.FindControl("Label12") as Label).Text;
                        // Val13 = (gw.FindControl("Label12") as Label).Text; 
                        sqlConn.Open();

                        string queryy = "UPDATE [UNR] SET" +
                         "[Group Name] =@val2" + //Group Name
                        ",[Respective Name] =@val3" + //Respective Name
                        ",[Approval Number] =@val4" + //Approval Number
                        ",[Facility Type] =@val5" + //Facility Type
                        ",[Facility Amount]  =@val6" + //Facility Amount
                        ",[Currency]  =@val7" + //Currency
                        ",[Expire Date] =@val8" + //Expire Date
                        ",[Received]=@val9" + //Received
                        ",[Status]=@val10" + //Status
                        //",[Inserted By]=@val23" + //Inserted By
                        ",[Updated By]= @val12" + //Updated By
                        ",[Approved By]= '" + username + "' " + //Approved by
                        " WHERE id=@val1";
                        SqlCommand sqlcmd = new SqlCommand(queryy, sqlConn);
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
                                                                         // sqlcmd.Parameters.AddWithValue("@val11", Val11); //
                        sqlcmd.Parameters.AddWithValue("@val12", Val12); // 

                        sqlcmd.ExecuteNonQuery();
                        sqlConn.Close();
                        using (SqlConnection SqlConUpdate = new SqlConnection(connectionString))
                        {
                            string id = Val1; //Session["pid"].ToString();
                            SqlConUpdate.Open();
                            string Delquery = "DELETE FROM [UNR_Updated] WHERE Id='" + id + "'";
                            SqlCommand sqlcmdDel = new SqlCommand(Delquery, SqlConUpdate);
                            sqlcmdDel.ExecuteNonQuery();
                            SqlConUpdate.Close();
                        }
                    }
                    //    else
                    //{
                    //    ApproveUpdateBtn.Visible = false;

                    //}
                } //END of FOR
            }
            UpdatedPending();
            gv3.DataSourceID = "SqlConUpdate";
            gv3.DataBind();
        
        }
        protected void UpdatedPending()
        {

            if (gv3.Rows.Count >= 1)
            {

                string ConStr = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                using (SqlConnection sqlCon2 = new SqlConnection(ConStr))
                {
                    sqlCon2.Open();
                    string query = "SELECT count(*) FROM [UNR_Updated]";
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
        protected void Page_Load(object sender, EventArgs e)
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

        protected void chkb2_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox ChkBoxHeader = (CheckBox)Gridv_LAR.HeaderRow.FindControl("chkb2");
            foreach (GridViewRow row in Gridv_LAR.Rows)
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

        protected void Gridv_LAR_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void gv3_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void insertCheck_CheckedChanged(object sender, EventArgs e)
        {
            Gridv_LAR.Visible = true;
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
            Gridv_LAR.Visible = false;
            insertCheck.Checked = false;
            ApproveBtnImg.Enabled = false;
            ApproveUpdateBtn.Enabled = true;
            insertLbl.Visible = false;
            UpdatedPending();
        }
        // approve insert btn

            
        protected void ApproveBtnImg_Click(object sender, ImageClickEventArgs e)
        {
            System.Threading.Thread.Sleep(1000);
            //insert Button Click Event()
            // Read The Current Id from mcu_tbl-----------------------------------------------
            string ConStr = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
            int CurmaxId;
            using (var conn = new SqlConnection(ConStr))
            using (var command = new SqlCommand("GetCurmaxID_UNR", conn)
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
            qry = "select [Inserted By] from [UNR_Insert] where [Inserted By]='" + username + "'";
            SqlConnection con1 = new SqlConnection(strConnString);
            con1.Open();
            SqlCommand cd = new SqlCommand(qry, con1);
            string Access_role = Convert.ToString(cd.ExecuteScalar());
            using (SqlConnection sqlCon = new SqlConnection(ConStr))
            {

                foreach (GridViewRow gw in Gridv_LAR.Rows)
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

                        sqlCon.Open();

                        string query = "insert into  [UNR]" +
                            "(" +
                          " [Group Name]" +
                          ",[Respective Name]" +
                          ",[Approval Number]" +
                          ",[Facility Type]" +
                          ",[Facility Amount]" +
                          ",[Currency]" +
                          ",[Expire Date]" +
                          ",[Received]" +
                          ",[Status]" +
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
                        "@val13" +
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
                        sqlcmd.Parameters.AddWithValue("@val13", username); //

                        sqlcmd.ExecuteNonQuery();
                        sqlCon.Close();

                        using (SqlConnection sqlCon2 = new SqlConnection(ConStr))
                        {
                            string id = Val1;
                            sqlCon2.Open();
                            string Delquery = "DELETE FROM [UNR_Insert] WHERE Id='" + id + "'";
                            SqlCommand sqlcmdDel = new SqlCommand(Delquery, sqlCon2);
                            sqlcmdDel.ExecuteNonQuery();
                            sqlCon2.Close();
                        }
                        //----------------------------------FIND NEW ID---------------------------------------------------------
                        string ConStrr = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                        int maxIdd;
                        using (var conn = new SqlConnection(ConStrr))
                        using (var command = new SqlCommand("[GetNewID_UNR]", conn)
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
                                cmd2.CommandText = "SELECT *FROM UNR_tbl_id";

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
                            string queryy = "UPDATE UNR SET [Approved By]='" + username + "' where id>'" + oldID + "' AND id <='" + NewID + "'";
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
            Gridv_LAR.DataSourceID = "SqlCon2";
            Gridv_LAR.DataBind();
            insertedPending();
        }

        protected void insertedPending()
        {

            if (Gridv_LAR.Rows.Count >= 1)
            {

                string ConStr = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                using (SqlConnection sqlCon2 = new SqlConnection(ConStr))
                {

                    sqlCon2.Open();
                    string query = "SELECT count(*) FROM [UNR_Insert]";
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