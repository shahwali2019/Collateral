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
    public partial class upload_xlsx : System.Web.UI.Page
    {
        string Val11, Val12, Val13, Val14, Val15, Val16, Val17, Val18, Val19, Val110, Val111, Val112, Val113, Val114;



        string connectionString = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
        //----------------------Jump release button event
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {

            }
            hide.Visible = false;
            //------------------Invoke StoreProcedure to change pdate DataType---------------------------
            string ConStr = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
            using (var conn = new SqlConnection(ConStr))
            using (var command = new SqlCommand("DTypeChanger", conn)
            {
                CommandType = CommandType.StoredProcedure
            })
            {
                conn.Open();
                command.ExecuteNonQuery();
                conn.Close();
                conn.Dispose();
            }

            //---------------------------------------------------------------------
            //------------------Invoke StoreProcedure to Rebuild Loanadder_tbl Index---------------------------
            string ConStr2 = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
            using (var conn = new SqlConnection(ConStr2))
            using (var command = new SqlCommand("IndexRebuilder", conn)
            {
                CommandType = CommandType.StoredProcedure
            })
            {
                conn.Open();
                command.ExecuteNonQuery();
                conn.Close();
                conn.Dispose();
            }
            //------------------------------------------------------------------------
            CartonNo.Focus();// = true;

            //----------------------------------
            if (!IsPostBack)
            {
                //if (Session["sid"] == null)
                //{
                //    Response.Redirect("Loging.aspx");
                //    Session.Remove("loading");
                //}

                string fullUsername = User.Identity.Name;
                int index_domain = fullUsername.IndexOf("AIB\\");
                string username = fullUsername.Substring(fullUsername.IndexOf("\\") + 1);
            }
            //Label1.Text = "Welcome: " + Session["Users"].ToString();

        }


        protected void btnJump_Click(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("CID");//6
            dt.Columns.Add("id");//16
            dt.Columns.Add("bname");//7
            dt.Columns.Add("pdate");//4
            dt.Columns.Add("Telecom");//8
            dt.Columns.Add("dino");//9
            dt.Columns.Add("ourRef");//10
            dt.Columns.Add("CardSerialStart");//11
            dt.Columns.Add("CardSerialEnd");//12
            dt.Columns.Add("Qty");//13
            dt.Columns.Add("CartonValAfn");//14
            dt.Columns.Add("status");//15
            dt.Columns.Add("ReleaseDate");//2
            dt.Columns.Add("RotationDate");//3
            dt.Columns.Add("InsertedBy");//5
          
            //=====================================================================
            foreach (GridViewRow gw in GridView1.Rows)
            {

                var checkSelect = gw.FindControl("childch") as CheckBox;
                if (checkSelect.Checked)
                {
                    string Val1 = (gw.FindControl("Label6") as Label).Text;
                    string Val2 = (gw.FindControl("Label16") as Label).Text;
                    string Val3 = (gw.FindControl("Label7") as Label).Text;
                    string Val4 = (gw.FindControl("Label4") as Label).Text;
                    string Val5 = (gw.FindControl("Label8") as Label).Text;
                    string Val6 = (gw.FindControl("Label9") as Label).Text;
                    string Val7 = (gw.FindControl("Label10") as Label).Text;
                    string Val8 = (gw.FindControl("Label11") as Label).Text;
                    string Val9 = (gw.FindControl("Label12") as Label).Text;
                    string Val10 = (gw.FindControl("Label13") as Label).Text;
                    string Val11 = (gw.FindControl("Label14") as Label).Text;
                    string Val12 = (gw.FindControl("Label15") as Label).Text;
                    string Val13 = (gw.FindControl("Label2") as Label).Text;
                    string Val14 = (gw.FindControl("Label3") as Label).Text;
                    string Val15 = (gw.FindControl("Label5") as Label).Text;
                    
                    dt.Rows.Add(Val1, Val2, Val3, Val4, Val5, Val6, Val7, Val8, Val9, Val10, Val11, Val12, Val13, Val14, Val15);
                    GridView2.DataSource = dt;
                    GridView2.DataBind();
                    GridView2.Visible = true;
                    GridView1.Visible = false;
                }
            }

            string fullUsername = User.Identity.Name;
            int index_domain = fullUsername.IndexOf("AIB\\");
            string username = fullUsername.Substring(fullUsername.IndexOf("\\") + 1);
            //-----------------------------------------------Add selected record to Pending table----------------------------------------------------
            string strConnString = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;

            SqlConnection sqlCon = new SqlConnection(strConnString);
            {
                sqlCon.Open();
                foreach (GridViewRow gw in GridView2.Rows)
                {
                    for (int i = 0; i < GridView2.Rows.Count; i++)
                    {
                        val1 = (gw.FindControl("Label1") as Label).Text;//ID
                        val2 = (gw.FindControl("Label2") as Label).Text;//CID
                        val3 = (gw.FindControl("Label3") as Label).Text;//bname
                        val4 = (gw.FindControl("Label4") as Label).Text;//pdate
                        val5 = (gw.FindControl("Label5") as Label).Text;//telecom
                        val6 = (gw.FindControl("Label6") as Label).Text;//dino
                        val7 = (gw.FindControl("Label7") as Label).Text;//ourRef
                        val8 = (gw.FindControl("Label8") as Label).Text;//CSS
                        val9 = (gw.FindControl("Label9") as Label).Text;//CSE
                        val10 = (gw.FindControl("Label10") as Label).Text;//Qty
                        val11 = (gw.FindControl("Label11") as Label).Text;//CartonValue
                        val12 = (gw.FindControl("Label12") as Label).Text;//Status
                        val13 = (gw.FindControl("Label13") as Label).Text;//ReleaseDate
                        val14 = (gw.FindControl("Label14") as Label).Text;//RotationDate
                        val15 = (gw.FindControl("Label15") as Label).Text;//InsertedBy


                        //----------------------------------------

                        string query = "INSERT INTO [dbo].[Loanadder_tbl3](" +

                                       "[id]," +
                                       "[CID]," +
                                       "[bname]," +
                                       "[pdate]," +
                                       "[Telecom]," +
                                       "[dino]," +
                                       "[ourRef]," +
                                       "[CardSerialStart]," +
                                       "[CardSerialEnd]," +
                                       "[Qty]," +
                                       "[CartonValAfn]," +
                                       "[status]," +
                                       "[ReleaseDate]," +
                                       "[RotationDate]," +
                                       "[UpdatedBy]," +
                                       "[insertedBy])" +
                                       "VALUES (" +
                                       "@id," +
                                       "@CID," +
                                       "@bname," +
                                       "@pdate," +
                                       "@telecom," +
                                       "@dino," +
                                       "@ourRef," +
                                       "@css," +
                                       "@CSE," +
                                       "@qty," +
                                       "@Carton," +
                                       "@status," +
                                       "@ReleaseDate," +
                                       "@rotation," +
                                       "@UpdatedBy," +
                                       "@InsertedBy" +
                                       ")";
                        SqlCommand sqlcmd = new SqlCommand(query, sqlCon);
                        sqlcmd.Parameters.AddWithValue("@id", val1);

                        sqlcmd.Parameters.AddWithValue("@CID", val2);
                        sqlcmd.Parameters.AddWithValue("@bname", val3);
                        sqlcmd.Parameters.AddWithValue("@pdate", val4);

                        sqlcmd.Parameters.AddWithValue("@telecom", val5);
                        sqlcmd.Parameters.AddWithValue("@dino", val6);
                        sqlcmd.Parameters.AddWithValue("@ourRef", val7);
                        sqlcmd.Parameters.AddWithValue("@css", val8);
                        sqlcmd.Parameters.AddWithValue("@CSE", val9);

                        sqlcmd.Parameters.AddWithValue("@qty", 0);
                        sqlcmd.Parameters.AddWithValue("@Carton", 0);

                        sqlcmd.Parameters.AddWithValue("@status", "Released");
                        sqlcmd.Parameters.AddWithValue("@ReleaseDate", DateTime.Now.ToShortDateString());
                        sqlcmd.Parameters.AddWithValue("@rotation", val14);
                        sqlcmd.Parameters.AddWithValue("@UpdatedBy", username);
                        sqlcmd.Parameters.AddWithValue("@InsertedBy", val15);

                        //------------------------------------------
                        sqlcmd.ExecuteNonQuery();
                        msg2.Visible = true;
                        //if (GridView2.Rows.Count > 1)
                        //{
                        //    bulkLbl.Text = GridView2.Rows.Count + " records will be released, Please contact your admin to approve them.";

                        //}
                        //if (GridView2.Rows.Count <= 1)
                        //{

                        //    bulkLbl.Text = GridView2.Rows.Count + " record will be released, Please contact your admin to approve them.";
                        //}
                        msg2.Text = "The Record(s) has been updated!<br />Please contact your Admin for further release processing!";
                        msg2.ForeColor = System.Drawing.Color.Green;
                        //Response.Write("<script language=javascript>alert('" + i + "');</script>");
                        //---------------------------------------------
                        break;
                    }
                }

                sqlCon.Close();
                sqlCon.Dispose();
            }
            //end of pending table execution

        }

        protected void childch_CheckedChanged(object sender, EventArgs e)
        {
            btnJump.Visible = true;
            Button5.Visible = false;
            btnJump.CssClass = "btn-danger";

        }


        protected void chkb1_CheckedChanged(object sender, EventArgs e)
        {

            CheckBox ChkBoxHeader = (CheckBox)GridView1.HeaderRow.FindControl("chkb1");
            foreach (GridViewRow row in GridView1.Rows)
            {
                CheckBox ChkBoxRows = (CheckBox)row.FindControl("childch");
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

        protected void txtQty_TextChanged(object sender, EventArgs e)
        {

        }

        string val1, val2, val3, val4, val5, val6, val7, val8, val9, val10, val11, val12, val13, val14,val15;


        int qty;
        int IntVal;
        bool idChecker;



        protected void Button5_Click(object sender, EventArgs e)
        {
            if(txtCartonVal.Text=="")
            {
                txtCartonVal.BackColor = System.Drawing.Color.LightPink;
            }
            else
            {
                txtCartonVal.BackColor = System.Drawing.Color.White;

               
                    //------------------------------------------------------
                    string connectionString = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                    {
                    sqlCon.Open();
                        foreach (GridViewRow gw in GridView2.Rows)
                   {
                        for (int i = 0; i < GridView2.Rows.Count; i++)
                        {
                            val1 = (gw.FindControl("Label1") as Label).Text;//ID
                            val2 = (gw.FindControl("Label2") as Label).Text;//CID
                            val3 = (gw.FindControl("Label3") as Label).Text;//bname
                            val4 = (gw.FindControl("Label4") as Label).Text;//pdate
                            val5 = (gw.FindControl("Label5") as Label).Text;//telecom
                            val6 = (gw.FindControl("Label6") as Label).Text;//dino
                            val7 = (gw.FindControl("Label7") as Label).Text;//ourRef
                            val8 = (gw.FindControl("Label8") as Label).Text;//CSS
                            val9 = (gw.FindControl("Label9") as Label).Text;//CSE
                            val10 = (gw.FindControl("Label10") as Label).Text;//Qty
                            val11 = (gw.FindControl("Label11") as Label).Text;//CartonValue
                            val12 = (gw.FindControl("Label12") as Label).Text;//Status
                            val13 = (gw.FindControl("Label13") as Label).Text;//ReleaseDate
                            val14 = (gw.FindControl("Label14") as Label).Text;//RotationDate
                            val15 = (gw.FindControl("Label15") as Label).Text;//InsertedBy


                            //----------------------------------------

                            string query = "INSERT INTO [dbo].[Loanadder_tbl3](" +
                                           "[id]," +
                                           "[CID]," +
                                           "[bname]," +
                                           "[pdate]," +
                                           "[Telecom]," +
                                           "[dino]," +
                                           "[ourRef]," +
                                           "[CardSerialStart]," +
                                           "[CardSerialEnd]," +
                                           "[Qty]," +
                                           "[CartonValAfn]," +
                                           "[status]," +
                                           "[ReleaseDate]," +
                                           "[RotationDate]," +
                                           "[UpdatedBy]," +
                                           "[insertedBy])" +
                                           "VALUES (@id,@CID,@bname,@pdate,@telecom,@dino,@ourRef,@css,@CSE,@qty,@Carton,@status,@ReleaseDate,@rotation,@UpdatedBy,@InsertedBy)";
                            SqlCommand sqlcmd = new SqlCommand(query, sqlCon);
                            sqlcmd.Parameters.AddWithValue("@id", val1);

                            sqlcmd.Parameters.AddWithValue("@CID", val2);
                            sqlcmd.Parameters.AddWithValue("@bname", val3);
                            sqlcmd.Parameters.AddWithValue("@pdate", val4);

                            sqlcmd.Parameters.AddWithValue("@telecom", val5);
                            sqlcmd.Parameters.AddWithValue("@dino", val6);
                            sqlcmd.Parameters.AddWithValue("@ourRef", val7);
                            sqlcmd.Parameters.AddWithValue("@css", val8);
                            sqlcmd.Parameters.AddWithValue("@CSE", val9);

                            sqlcmd.Parameters.AddWithValue("@qty", 0);
                            sqlcmd.Parameters.AddWithValue("@Carton", 0);

                            sqlcmd.Parameters.AddWithValue("@status", "Released");
                            sqlcmd.Parameters.AddWithValue("@ReleaseDate", DateTime.Now.ToShortDateString());
                            sqlcmd.Parameters.AddWithValue("@rotation", val14);
                            sqlcmd.Parameters.AddWithValue("@UpdatedBy", Session["Users"].ToString());
                            sqlcmd.Parameters.AddWithValue("@InsertedBy", val15);

                            //------------------------------------------
                            sqlcmd.ExecuteNonQuery();
                            msg2.Visible = true;
                            //if (GridView2.Rows.Count > 1)
                            //{
                            //    bulkLbl.Text = GridView2.Rows.Count + " records will be released, Please contact your admin to approve them.";

                            //}
                            //if (GridView2.Rows.Count <= 1)
                            //{

                            //    bulkLbl.Text = GridView2.Rows.Count + " record will be released, Please contact your admin to approve them.";
                            //}
                            msg2.Text = "The Record(s) has been updated!<br />Please contact your Admin for further release processing!";
                            msg2.ForeColor = System.Drawing.Color.Green;
                            //Response.Write("<script language=javascript>alert('" + i + "');</script>");
                            //---------------------------------------------
                            break;
                        }
                    }
                    
                    sqlCon.Close();
                    sqlCon.Dispose();
                }
            }

        }

        //----------------------------------------------------------
      

        //----------------------------------------------------
        protected void Button4_Click(object sender, EventArgs e)
        {
            if (Session["pid"] == null)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), " ", "alert('Warning! Please select a record first!')", true);

            }
            if(Session["pid"] != null)
            {
                //Fetch the information from gridview selected row

                int id = Int32.Parse(Session["pid"].ToString());
                string connectionString2 = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                try
                {
                    using (SqlConnection sqlCon2 = new SqlConnection(connectionString2))
                    {
                        sqlCon2.Open();

                        string query = "SELECT *FROM loanadder_tbl WHERE id='" + id + "'";
                        SqlCommand sqlcmd = new SqlCommand(query, sqlCon2);
                        SqlDataReader dr;
                        dr = sqlcmd.ExecuteReader();
                        while (dr.Read())
                        {
                            Val11 = dr["id"].ToString();
                            Val12 = dr["CID"].ToString();
                            Val13 = dr["bname"].ToString();
                            Val14 = dr["pdate"].ToString();
                            Val15 = dr["Telecom"].ToString();
                            Val16 = dr["dino"].ToString();
                            Val17 = dr["ourRef"].ToString();
                            Val18 = dr["CardSerialStart"].ToString();
                            Val19 = dr["CardSerialEnd"].ToString();
                            Val110 = dr["Qty"].ToString();
                            Val111 = dr["CartonValAfn"].ToString();
                            Val112 = dr["status"].ToString();
                            Val113 = dr["ReleaseDate"].ToString();
                            Val114 = dr["RotationDate"].ToString();
                        }
                        lblQty.Text = Val110;
                        lblQty.Visible = true;

                        dr.Close();
                        sqlCon2.Close();
                        sqlCon2.Dispose();

                        
                    }
                }
                catch (Exception)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), " ", "alert('Warning! Error A_9392')", true);
                    throw;
                }

            }
            //==================================Insert updated record to Loanadder_tbl3 as a temp record to approve by admin=============
            //------check wheter it is in update pending table or not---------------------------------------

            string connectionString3 = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
            using (SqlConnection sqlCon = new SqlConnection(connectionString3))
            {
                sqlCon.Open();
                idChecker = false;
                //========================================================================

                string idFinder = "select id from loanadder_tbl3 where id='" + Session["pid"].ToString() + "'";
                SqlCommand cmd = new SqlCommand(idFinder, sqlCon);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.Read())
                {
                        idChecker = true;
                }
            }
            //-----------------------------------------------------
            if (idChecker != true)
            {
                string connectionString = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                using (SqlConnection sqlCon2 = new SqlConnection(connectionString))
                {

                    //========================================================================
                    //string maxID = "select MAX(id) from homes";
                    //SqlCommand sqlcmd2 = new SqlCommand(maxID, sqlCon);
                    //int count = Convert.ToInt16(sqlcmd2.ExecuteScalar()) + 1;
                    sqlCon2.Open();
                    string query = "INSERT INTO [dbo].[Loanadder_tbl3](" +
                        "[id]," +
                        "[CID]," +
                        "[bname]," +
                        "[pdate]," +
                        "[Telecom]," +
                        "[dino]," +
                        "[ourRef]," +
                        "[CardSerialStart]," +
                        "[CardSerialEnd]," +
                        "[Qty]," +
                        "[CartonValAfn]," +
                        "[status]," +
                        "[ReleaseDate]," +
                        "[RotationDate])" +
                        "VALUES (@id,@CID,@bname,@pdate,@telecom,@dino,@ourRef,@css,@CSE,@qty,@Carton,@status,@ReleaseDate,@rotation)";
                    SqlCommand sqlcmd = new SqlCommand(query, sqlCon2);

                    sqlcmd.Parameters.AddWithValue("@id", Val11);

                    sqlcmd.Parameters.AddWithValue("@CID", Val12);
                    sqlcmd.Parameters.AddWithValue("@bname", Val13);
                    sqlcmd.Parameters.AddWithValue("@pdate", Val14);

                    sqlcmd.Parameters.AddWithValue("@telecom", Val15);
                    sqlcmd.Parameters.AddWithValue("@dino", Val16);
                    sqlcmd.Parameters.AddWithValue("@ourRef", Val17);
                    sqlcmd.Parameters.AddWithValue("@css", Val18);
                    sqlcmd.Parameters.AddWithValue("@CSE", Val19);
                    //-------------------------------

                    //if (txtQty.Text == null)
                    //{
                    //    qty = 0;
                    //}
                    //else
                    //{
                    qty = Int32.Parse(txtQty.Text);
                    IntVal = Int32.Parse(Val110);
                    //}
                    //-------------------------------
                    sqlcmd.Parameters.AddWithValue("@qty", IntVal - qty);



                    int IntDino;
                    int CartVal;
                    //--------------------------------------------
                    IntDino = Int32.Parse(Val16);
                    CartVal = IntDino * (IntVal - qty);
                    //--------------------------------------------

                    sqlcmd.Parameters.AddWithValue("@Carton", CartVal);

                    sqlcmd.Parameters.AddWithValue("@status", "Released");
                    sqlcmd.Parameters.AddWithValue("@ReleaseDate", DateTime.Now.ToShortDateString());
                    sqlcmd.Parameters.AddWithValue("@rotation", Val114);
                    sqlcmd.ExecuteNonQuery();
                    msg.Visible = true;
                    msg.Text = "The Record updated and it is on pending table!<br />     Please contact your admin for further release processing!";
                    msg.ForeColor = System.Drawing.Color.Green;

                    Session.Remove("pid");
                    sqlCon2.Close();

                }

            }
            else
            {
                msg.Text = "this id is in the pending record<br/>" +
                          "Please contact your admin to approve it first";
                msg.Visible = true;
                msg.ForeColor = System.Drawing.Color.Red;
            }
            //=======================================================================================
        }

        protected void txtCartonVal_TextChanged(object sender, EventArgs e)
        {
            string connectionString =  ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
            GridView2.DataSourceID = null;
            string sqlQuery;
            SqlConnection sqlCon = new SqlConnection(connectionString);
            sqlCon.Open();
            sqlQuery = "select top (@top)  *from Loanadder_tbl where bname='" + bulkbname.Text + "'  and dino ='" + bulkdino.Text + "'  and pdate ='" + bulkPdate.Text + "' and status='pledged'";

           
           
            SqlCommand cmd = new SqlCommand(sqlQuery, sqlCon);
            cmd.Parameters.AddWithValue("@top",Int32.Parse(txtCartonVal.Text));
            SqlDataAdapter DA = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            DA.Fill(ds);
            GridView2.DataSource = ds;
            GridView2.DataBind();
            sqlCon.Close();
            SqlCon.Dispose();
            //cartonNoLbl.Visible = true;
            //cartonNoLbl.Text = GridView2.Rows.Count.ToString() + " of";
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
           
            if (e.CommandName == "Select")
            {
                



                if (bname.Text != "")
                {
                    msg.Visible = false;
                    Session["pid"] = e.CommandArgument.ToString();
                    int id = Int32.Parse(Session["pid"].ToString());
                    string connectionString2 = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                    using (SqlConnection sqlCon2 = new SqlConnection(connectionString2))
                    {
                        sqlCon2.Open();

                        string query = "SELECT *FROM loanadder_tbl WHERE id='" + id + "' and ";
                        SqlCommand sqlcmd = new SqlCommand(query, sqlCon2);
                        SqlDataReader dr;
                        dr = sqlcmd.ExecuteReader();
                        while (dr.Read())
                        {
                            //Val11 = dr["id"].ToString();
                            //Val12 = dr["CID"].ToString();
                            //Val13 = dr["bname"].ToString();
                            // Val14 = dr["pdate"].ToString();



                            //---------------CONVERT TO YYYY-MM-DD DATE FORMAT ---------



                            //----------------------------------------------------


                            //Val15 = dr["Telecom"].ToString();
                            //Val16 = dr["dino"].ToString();
                            //Val17 = dr["ourRef"].ToString();
                            //Val18 = dr["CardSerialStart"].ToString();
                            //Val19 = dr["CardSerialEnd"].ToString();
                            Val110 = dr["Qty"].ToString();
                            //Val111 = dr["CartonValAfn"].ToString();
                            //Val112 = dr["status"].ToString();
                            //Val113 = dr["ReleaseDate"].ToString();
                            //Val114 = dr["RotationDate"].ToString();
                        }
                        lblQty.Text = Val110;
                        lblQty.Visible = true;

                        dr.Close();
                        sqlCon2.Close();
                        sqlCon2.Dispose();
                    }
                }
                else
                {

                    msg.Visible = false;
                    Session["pid"] = e.CommandArgument.ToString();
                    int id = Int32.Parse(Session["pid"].ToString());
                    string connectionString2 = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                    using (SqlConnection sqlCon2 = new SqlConnection(connectionString2))
                    {
                        sqlCon2.Open();

                        string query = "SELECT *FROM loanadder_tbl WHERE id='" + id + "'";
                        SqlCommand sqlcmd = new SqlCommand(query, sqlCon2);
                        SqlDataReader dr;
                        dr = sqlcmd.ExecuteReader();
                        while (dr.Read())
                        {
                            //Val11 = dr["id"].ToString();
                            //Val12 = dr["CID"].ToString();
                            Val13 = dr["bname"].ToString();
                            Val14 = dr["pdate"].ToString();
                            //Val15 = dr["Telecom"].ToString();
                            //Val16 = dr["dino"].ToString();
                            //Val17 = dr["ourRef"].ToString();
                            //Val18 = dr["CardSerialStart"].ToString();
                            //Val19 = dr["CardSerialEnd"].ToString();
                            //Val110 = dr["Qty"].ToString();
                            //Val111 = dr["CartonValAfn"].ToString();
                            //Val112 = dr["status"].ToString();
                            //Val113 = dr["ReleaseDate"].ToString();
                            //Val114 = dr["RotationDate"].ToString();
                        }
                        bulkPdate.Text = Val14;
                        bulkbname.Text = Val13;
                        //lblQty.Visible = true;

                        dr.Close();
                        sqlCon2.Close();
                        sqlCon2.Dispose();
                    }
                  
                }
                //---------------------------------------------------

                string connectionString =  ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                GridView2.DataSourceID = null;
                string sqlQuery;
                SqlConnection sqlCon = new SqlConnection(connectionString);
                sqlCon.Open();
                sqlQuery = "select *from Loanadder_tbl where bname='" + bulkbname.Text + "'  and dino ='" + bulkdino.Text + "'  and pdate ='" + bulkPdate.Text + "' and [status]= 'Pledged'";

                SqlCommand cmd = new SqlCommand(sqlQuery, sqlCon);

                SqlDataAdapter DA = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                DA.Fill(ds);
                GridView2.DataSource = ds;
                GridView2.DataBind();
                sqlCon.Close();
                SqlCon.Dispose();
             
                    GridView1.Visible = false;
                GridView2.Visible = true;
                CartonNo.Text = GridView2.Rows.Count.ToString();
            }
      }

        protected void Button1_Click(object sender, EventArgs e)
        {
          
            string connectionString =  ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
            GridView1.DataSourceID = null;
            string sqlQuery;
            SqlConnection sqlCon = new SqlConnection(connectionString);
            sqlCon.Open();
            sqlQuery = "select *from Loanadder_tbl where bname like '%" + bname.Text.TrimStart().TrimEnd() + "%'  and( dino ='" + dino.Text.TrimStart().TrimEnd() + "'  and CardSerialStart like  '" + css.Text.TrimStart().TrimEnd() + "%')";
            SqlCommand cmd = new SqlCommand(sqlQuery, sqlCon);
            
            SqlDataAdapter DA = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            DA.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
            sqlCon.Close();
            int counter = GridView1.Rows.Count;
            if (counter <= 1)
            {
                resultLbl.Visible = true;
                resultLbl.Text = "Found " + counter + " record for : " + bname.Text;
            }
            else
            {
                resultLbl.Visible = true;
                resultLbl.Text = "Found " + counter + " record(s) for : " + bname.Text;
            }
            GridView1.Visible = true;
            GridView2.Visible = false;
        }//------------------------------------------------------

        protected void Button2_Click(object sender, EventArgs e)
        {

            btnJump.Visible = false;
            Button5.Visible = true;
            GridView1.Visible = true;
            GridView2.Visible = false;
            string connectionString =  ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
            GridView1.DataSourceID = null;
            string sqlQuery;
            SqlConnection sqlCon = new SqlConnection(connectionString);
            sqlCon.Open();
             sqlQuery = "select *from Loanadder_tbl where bname like '%" + bulkbname.Text + "%' and dino='" + bulkdino.Text + "' and [status]= 'Pledged' order by pdate asc";
            SqlCommand cmd = new SqlCommand(sqlQuery, sqlCon);
            SqlDataAdapter DA = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            DA.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
            sqlCon.Close();
            SqlCon.Dispose();
            GridView1.Visible = true;
            msg2.Visible = false;
        }

    }
}