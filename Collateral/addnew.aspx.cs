using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OracleClient;
using System.Data.SqlClient;
using System.Configuration;
using System.Globalization;
using System.Drawing;

namespace Collateral_int
{ /// <summary>
  /// this part is used to connect to Flexcube database
  /// </summary>

    public partial class addnew : System.Web.UI.Page
    {
      static string strConnString = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
      public SqlConnection con = new SqlConnection(strConnString);
       string RDValue;
        string Val1, Val2, Val3, Val4, Val5, Val6, Val7, Val8, Val9, Val10, Val11, Val12, Val13, Val14;
        int count=0;
        protected void Button3_Click(object sender, EventArgs e)
        {
            string fullUsername = User.Identity.Name;
            int index_domain = fullUsername.IndexOf("AIB\\");
            string username = fullUsername.Substring(fullUsername.IndexOf("\\") + 1);
        }

      //  OracleDataAdapter orada;
        protected void Page_Load(object sender, EventArgs e)
        {
            string fullUsername = User.Identity.Name;
            int index_domain = fullUsername.IndexOf("AIB\\");
            string username = fullUsername.Substring(fullUsername.IndexOf("\\") + 1);
            
            //===================================================
            //if (Session["bid"] != null)
            //{
            //    Button2.Text = " Update ";
            //    //    //========================================================
            //}

            //if (Session["bid"] == null)
            //{
            //    Button4.Visible = false;
            //    addLbl.Text = "Add New Pledge Record";
            //    //    //========================================================
            //}

            if (txtDateRelease.Text == "")
            {
                txtStatus.Text = "Pledged";
            }
            txtStatus.Enabled = false;
            txtStatus.CssClass = "center";

            if (Session["bid"] == null) {
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString))
                {
                    con.Open();
                    string maxID = "select MAX(id) from Loanadder_tbl";
                    //SqlCommand cmd = new SqlCommand("SELECT max(id) from Loanadder_tbl", con);

                    SqlCommand sqlcmd2 = new SqlCommand(maxID, con);
            
                    if (sqlcmd2.ExecuteScalar() == null)
                    {
                        count = 1;
                    }
                    else
                    {
                        count += 1;
                    }
                     
                    txtID.Text = Convert.ToString(count);
                    txtOurRef.Text = txtID.Text;
                }
                //    //=======================================================================================

                con.Close();
            }
            //----------------------------------
            //if (!IsPostBack)
            //{
            //    if (Session["sid"] == null)
            //    {
            //        Response.Redirect("Loging.aspx");
            //        Session.Remove("loading");
            //    }
            //}


        }
        //end of page_load
        protected void Button2_Click(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            //{
                if (txtBorrower.Text == "" && txtOurRef.Text == "" && pdate.Text == "" && txtTelecom.Text == "" && txtSerialStart.Text == "" && txtSerialEnd.Text == "" && txtQty.Text == "" && txtDinomination.Text == "" && txtCartonValue.Text == "" && TxtDateforRotation.Text == "")
                {
                    msg.Visible = true;
                    msg.ForeColor = System.Drawing.Color.Red;
                    msg.Text = "Please fill out all the mandatory fields!";
                }
            //--------------------------------------------------------------------

            //-------------------------------------------------------

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
            if (Access_role == "1")

                //--------------------------------------------------------
                //if (Session["Sid"].ToString() == "1")// IT MEANS  LOGED IN AS ADMIN USER
                {
                    string connectionString = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                    using (SqlConnection sqlCon = new SqlConnection(connectionString))
                    {
                        sqlCon.Open();
                        string query = "INSERT INTO [dbo].[Loanadder_tbl](" +
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
                            "VALUES (@CID," +
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
                            "@rotation)";
                        SqlCommand sqlcmd = new SqlCommand(query, sqlCon);

                        //  sqlcmd2.Parameters.AddWithValue("@id", maxID);
                        sqlcmd.Parameters.AddWithValue("@CID", txtCID.Text);
                        sqlcmd.Parameters.AddWithValue("@bname", txtBorrower.Text);
                        sqlcmd.Parameters.AddWithValue("@pdate", pdate.Text);

                        sqlcmd.Parameters.AddWithValue("@telecom", txtTelecom.Text);
                        sqlcmd.Parameters.AddWithValue("@dino", txtDinomination.Text);
                        sqlcmd.Parameters.AddWithValue("@ourRef", txtOurRef.Text);
                        sqlcmd.Parameters.AddWithValue("@css", txtSerialStart.Text);
                        sqlcmd.Parameters.AddWithValue("@CSE", txtSerialEnd.Text);

                        sqlcmd.Parameters.AddWithValue("@qty", txtQty.Text);
                        sqlcmd.Parameters.AddWithValue("@Carton", txtCartonValue.Text);

                        if (txtDateRelease.Text == "")
                        {
                            RDValue = " ";

                        }
                        if (txtDateRelease.Text != "")
                        {
                            RDValue = txtDateRelease.Text;
                        }
                        sqlcmd.Parameters.AddWithValue("@status", txtStatus.Text);
                        sqlcmd.Parameters.AddWithValue("@ReleaseDate", RDValue);
                        sqlcmd.Parameters.AddWithValue("@rotation", TxtDateforRotation.Text);
                        sqlcmd.ExecuteNonQuery();
                        msg.Visible = true;
                        msg.Text = "A new record added successfully!";
                        msg.ForeColor = System.Drawing.Color.Green;
                    }

                }
                //-----------------------------------------------------------------

                if (Access_role != "1" && Session["bid"] == null)// IT MEANS NOT LOGED IN AS ADMIN USER
                {
                    string connectionString = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                    using (SqlConnection sqlCon = new SqlConnection(connectionString))
                    {
                        sqlCon.Open();
                        string query = "INSERT INTO [dbo].[Loanadder_tbl2](" +
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
                            "[InsertedBy]" +
                            ")" +
                            "VALUES (@CID,@bname,@pdate,@telecom,@dino,@ourRef,@css,@CSE,@qty,@Carton,@status,@ReleaseDate,@rotation,@InsertedBy)";
                        SqlCommand sqlcmd = new SqlCommand(query, sqlCon);

                        //  sqlcmd2.Parameters.AddWithValue("@id", maxID);
                        sqlcmd.Parameters.AddWithValue("@CID", txtCID.Text);
                        sqlcmd.Parameters.AddWithValue("@bname", txtBorrower.Text);
                        sqlcmd.Parameters.AddWithValue("@pdate", pdate.Text);

                        sqlcmd.Parameters.AddWithValue("@telecom", txtTelecom.Text);
                        sqlcmd.Parameters.AddWithValue("@dino", txtDinomination.Text);
                        sqlcmd.Parameters.AddWithValue("@ourRef", txtOurRef.Text);
                        sqlcmd.Parameters.AddWithValue("@css", txtSerialStart.Text);
                        sqlcmd.Parameters.AddWithValue("@CSE", txtSerialEnd.Text);

                        sqlcmd.Parameters.AddWithValue("@qty", txtQty.Text);
                        sqlcmd.Parameters.AddWithValue("@Carton", txtCartonValue.Text);

                        if (txtDateRelease.Text == "")
                        {
                            RDValue = " ";

                        }
                        if (txtDateRelease.Text != "")
                        {
                            RDValue = txtDateRelease.Text;
                        }
                        sqlcmd.Parameters.AddWithValue("@status", txtStatus.Text);
                        sqlcmd.Parameters.AddWithValue("@ReleaseDate", RDValue);
                        sqlcmd.Parameters.AddWithValue("@rotation", TxtDateforRotation.Text);
                        sqlcmd.Parameters.AddWithValue("@InsertedBy", username);
                        sqlcmd.ExecuteNonQuery();
                        msg.Visible = true;
                        msg.Text = "A new record added to Pending Table successfully!<br />This record should be approved!";
                        msg.ForeColor = System.Drawing.Color.Green;
                    }

                }

                //=======================================================add by intermediate user============================================================
                if (Session["bid"] != null)
                {

                    string ConString = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                    using (SqlConnection sqlCon = new SqlConnection(ConString))
                    {
                        sqlCon.Open();
                        //========================================================================

                        string idFinder = "SELECT id FROM loanadder_tbl3 WHERE id='" + Session["bid"].ToString() + "'";
                        SqlCommand cmd = new SqlCommand(idFinder, sqlCon);
                        SqlDataReader rdr = cmd.ExecuteReader();
                        if (rdr.Read())
                        {
                            msg.Text = "this id is in the pending record.<br/>Please contact your <b style='color:red';>Administrotor</b> to approve it first";
                            msg.Visible = true;
                            msg.ForeColor = System.Drawing.Color.Red;
                        }
                        //----------------------------------------
                        else
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
                                    "VALUES " +
                                    "(@id,@CID,@bname,@pdate,@telecom,@dino,@ourRef,@css,@CSE,@qty,@Carton,@status,@ReleaseDate,@rotation)";
                                SqlCommand sqlcmd = new SqlCommand(query, sqlCon2);
                                sqlcmd.Parameters.AddWithValue("@id", txtID.Text);
                                sqlcmd.Parameters.AddWithValue("@CID", txtCID.Text);
                                sqlcmd.Parameters.AddWithValue("@bname", txtBorrower.Text);
                                sqlcmd.Parameters.AddWithValue("@pdate", pdate.Text);
                                sqlcmd.Parameters.AddWithValue("@telecom", txtTelecom.Text);
                                sqlcmd.Parameters.AddWithValue("@dino", txtDinomination.Text);
                                sqlcmd.Parameters.AddWithValue("@ourRef", txtOurRef.Text);
                                sqlcmd.Parameters.AddWithValue("@css", txtSerialStart.Text);
                                sqlcmd.Parameters.AddWithValue("@CSE", txtSerialEnd.Text);
                                sqlcmd.Parameters.AddWithValue("@qty", txtQty.Text);
                                sqlcmd.Parameters.AddWithValue("@Carton", txtCartonValue.Text);
                                if (txtDateRelease.Text == "")
                                {
                                    RDValue = " ";
                                }
                                if (txtDateRelease.Text != "")
                                {
                                    RDValue = txtDateRelease.Text;
                                }
                                sqlcmd.Parameters.AddWithValue("@status", txtStatus.Text);
                                sqlcmd.Parameters.AddWithValue("@ReleaseDate", RDValue);
                                sqlcmd.Parameters.AddWithValue("@rotation", TxtDateforRotation.Text);
                                sqlcmd.ExecuteNonQuery();
                                msg.Visible = true;
                                msg.Text = "The Record updated and it is on pending table!<br />This record should be approve by your Admin!";
                                msg.ForeColor = System.Drawing.Color.Green;
                                Session.Remove("bid");
                                sqlCon2.Close();
                            }
                        }
                    }//end of elseif
                }

           // }



        }// end Button 2 event
         //=============================================================

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Session["bid"] != null)
            {
                Session.Remove("bid");
            }
            Response.Redirect("loan.aspx");
        }

        protected void txtCartonValue_TextChanged(object sender, EventArgs e)
        {
            string ClientValue = Request.Form["add"];
            txtCartonValue.Text = ClientValue;
        }
        protected void txtDinomination_TextChanged(object sender, EventArgs e)
        {
            int val1, val2, result;
            int.TryParse(txtDinomination.Text, out val1);
            int.TryParse(txtQty.Text, out val2);
            result = val1 * val2;
            txtCartonValue.Text = result.ToString();
        }

        protected void txtSerialEnd_TextChanged(object sender, EventArgs e)
        {
            double val1, val2, result;
            double.TryParse(txtSerialEnd.Text, out val1);
            double.TryParse(txtSerialStart.Text, out val2);
            result = (val1 - val2)+1;
            txtQty.Text = result.ToString();
        }

        protected void txtBorrower_TextChanged(object sender, EventArgs e)
        {
            //if (con == null && con.State != ConnectionState.Open)
            //{
            //    con.Open();
            //}
            //string query = "select AC_DESC,CUST_AC_NO,CUST_NO,CCY from sttm_cust_account@fc where upper(ac_desc) like  '%" + txtBorrower.Text.ToUpper() + "%'";
            //OracleCommand cmd = new OracleCommand(query, con);
            //OracleDataReader dr = cmd.ExecuteReader();
            //DataTable dataTable = new DataTable();
            //dataTable.Load(dr);
            //GridView1.DataSource = dataTable;
            //GridView1.DataBind();
            //GridView1.Visible = true;



            SqlCommand sqlCmd2;
            string connectionString = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
          //  ========================================================================
                sqlCon.Open();
                string query = "SELECT *FROM CID WHERE bname LIKE '%" + txtBorrower.Text.TrimStart().TrimEnd() + "%'";
                SqlCommand sqlcmd = new SqlCommand(query, sqlCon);
                SqlDataReader rdr = sqlcmd.ExecuteReader();

                if (rdr.Read())
                {
                    // get the results of each column
                    string cid = (string)rdr["cid"];
                    string bname = (string)rdr["bname"];
                    txtCID.Enabled = false;
                    txtCID.ForeColor = System.Drawing.Color.Blue;
                    txtCID.Text = cid;
                    txtBorrower.Text = bname;
                    sqlCon.Close();
                }
                else
                {
                    using (SqlConnection sqlCon2 = new SqlConnection(connectionString))
                    {
                        sqlCon2.Open();
                        string maxCID = "SELECT  MAX(cid) FROM CID";
                        sqlCmd2 = new SqlCommand(maxCID, sqlCon2);
                        int count = Convert.ToInt16(sqlCmd2.ExecuteScalar()) + 1;
                        txtCID.Enabled = false;
                        txtCID.ForeColor = System.Drawing.Color.Red;
                        txtCID.Text = count.ToString();
                        sqlCon2.Close();
                        using (SqlConnection sqlCon3 = new SqlConnection(connectionString))
                        {
                            sqlCon3.Open();
                            string sqlCIDInsert = "INSERT INTO cid(cid,bname) values('" + count + "','" + txtBorrower.Text + "')";
                            SqlCommand sqlcmd3 = new SqlCommand(sqlCIDInsert, sqlCon3);
                            sqlcmd3.ExecuteNonQuery();
                            sqlCon3.Close();
                        }
                    }
                }
            }
        }

    
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {


        }
            protected void txtDateRelease_TextChanged(object sender, EventArgs e)
        {
            if (txtDateRelease.Text != "")
            {
                txtStatus.Text = "Released";
            }
            else
            {
                txtStatus.Text = "Pledged";
            }
        }
        //-----------------------------------------
        //protected void updateBtn_Click(object sender, EventArgs e)
        //{
        //    string connectionString = @"Data Source=AIBW8CAMS02;Initial Catalog=collateral;Persist Security Info=True;User ID=sma;Password=1111";
        //    using (SqlConnection sqlCon = new SqlConnection(connectionString))
        //    {

        //        //========================================================================
        //        //string maxID = "select MAX(id) from homes";
        //        //SqlCommand sqlcmd2 = new SqlCommand(maxID, sqlCon);
        //        //int count = Convert.ToInt16(sqlcmd2.ExecuteScalar()) + 1;
        //        sqlCon.Open();
        //        string query = "INSERT INTO [dbo].[Loanadder_tbl3](" +
        //            "[id]," +
        //            "[CID]," +
        //            "[bname]," +
        //            "[pdate]," +
        //            "[Telecom]," +
        //            "[dino]," +
        //            "[ourRef]," +
        //            "[CardSerialStart]," +
        //            "[CardSerialEnd]," +
        //            "[Qty]," +
        //            "[CartonValAfn]," +
        //            "[status]," +
        //            "[ReleaseDate]," +
        //            "[RotationDate])" +
        //            "VALUES (@id,@CID,@bname,@pdate,@telecom,@dino,@ourRef,@css,@CSE,@qty,@Carton,@status,@ReleaseDate,@rotation)";
        //        SqlCommand sqlcmd = new SqlCommand(query, sqlCon);

        //        sqlcmd.Parameters.AddWithValue("@id", txtID.Text);

        //        sqlcmd.Parameters.AddWithValue("@CID", txtCID.Text);
        //        sqlcmd.Parameters.AddWithValue("@bname", txtBorrower.Text);
        //        sqlcmd.Parameters.AddWithValue("@pdate", pdate.Text);

        //        sqlcmd.Parameters.AddWithValue("@telecom", txtTelecom.Text);
        //        sqlcmd.Parameters.AddWithValue("@dino", txtDinomination.Text);
        //        sqlcmd.Parameters.AddWithValue("@ourRef", txtOurRef.Text);
        //        sqlcmd.Parameters.AddWithValue("@css", txtSerialStart.Text);
        //        sqlcmd.Parameters.AddWithValue("@CSE", txtSerialEnd.Text);

        //        sqlcmd.Parameters.AddWithValue("@qty", txtQty.Text);
        //        sqlcmd.Parameters.AddWithValue("@Carton", txtCartonValue.Text);

        //        if (txtDateRelease.Text == "")
        //        {
        //            RDValue = " ";
        //        }
        //        if (txtDateRelease.Text != "")
        //        {
        //            RDValue = txtDateRelease.Text;
        //        }
        //        sqlcmd.Parameters.AddWithValue("@status", txtStatus.Text);
        //        sqlcmd.Parameters.AddWithValue("@ReleaseDate", RDValue);
        //        sqlcmd.Parameters.AddWithValue("@rotation", TxtDateforRotation.Text);
        //        sqlcmd.ExecuteNonQuery();
        //        msg.Visible = true;
        //        msg.Text = "The Record updated and it is on pending table!<br />This record should be approved!";
        //        msg.ForeColor = System.Drawing.Color.Green;
        //        Session.Remove("bid");

        //    }

        //}
        protected void Button4_Click(object sender, EventArgs e)
        {


            //    //= --------------Get data from--------------------
            string connectionString2 = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
            using (SqlConnection sqlCon2 = new SqlConnection(connectionString2))
            {
                sqlCon2.Open();
                string id = Session["bid"].ToString();
                string query = "SELECT *FROM loanadder_tbl WHERE id='" + id + "'";
                SqlCommand sqlcmd = new SqlCommand(query, sqlCon2);
                SqlDataReader dr;
                dr = sqlcmd.ExecuteReader();
                while (dr.Read())
                {

                    Val1 = dr["id"].ToString();
                    Val2 = dr["CID"].ToString();
                    Val3 = dr["bname"].ToString();
                    Val4 = dr["pdate"].ToString();
                    Val5 = dr["Telecom"].ToString();
                    Val6 = dr["dino"].ToString();
                    Val7 = dr["ourRef"].ToString();
                    Val8 = dr["CardSerialStart"].ToString();
                    Val9 = dr["CardSerialEnd"].ToString();
                    Val10 = dr["Qty"].ToString();
                    Val11 = dr["CartonValAfn"].ToString();
                    Val12 = dr["status"].ToString();
                    Val13 = dr["ReleaseDate"].ToString();
                    Val14 = dr["RotationDate"].ToString();
                }
                //        //---------------------------
                txtID.Text = Val1;
                txtCID.Text = Val2;

                txtBorrower.Text = Val3;

                pdate.Text = Val4;
                txtOurRef.Text = Val1;
                txtTelecom.Text = Val5;
                txtSerialStart.Text = Val8;
                txtSerialEnd.Text = Val9;
                txtQty.Text = Val10;
                txtDinomination.Text = Val6;
                txtCartonValue.Text = Val11;
                txtStatus.Text = Val12;
                txtDateRelease.Text = Val13;
                TxtDateforRotation.Text = Val14;
                addLbl.Text = "Basic User Edit Page";
                //------------------------------------
                dr.Close();

                sqlCon2.Close();
                sqlCon2.Dispose();
            }




        }



    }
}