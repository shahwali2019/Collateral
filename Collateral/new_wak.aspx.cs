using System;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Drawing;
using System.Web.UI;

namespace Collateral_int
{
    public partial class new_wak : System.Web.UI.Page
    {
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






                if (Session["id"] !=null)
                {
                    string id = Session["id"].ToString();
                    string ClientName = Session["ClientName"].ToString();
                    string FacilityApp = Session["FacilityApp"].ToString();
                    string FacilityType = Session["FacilityType"].ToString();
                    string FacilityStatus = Session["FacStatus"].ToString();
                    string SafeNo = Session["SafeNo"].ToString();
                    string drawer = Session["Drawer"].ToString();
                    string FolderNo = Session["FNO"].ToString();
                    string Extention = Session["Extention"].ToString();
                    string modification = Session["Modification"].ToString();
                    string SafeInDate = Session["SafeInDate"].ToString();
                    string DocStatus = Session["DocStatus"].ToString();
                    string SafeOutDate = Session["SafeoutDate"].ToString();
                    string Remark = Session["Remark"].ToString();

                    txtClient.Text = ClientName;
                    facilityApptxt.Text = FacilityApp;
                    FacilityTypeList.SelectedValue = FacilityType;
                    FacilityStatusList.SelectedValue = FacilityStatus;
                    SafeNoList.SelectedValue = SafeNo;
                    txtDrawer.Text = drawer;
                    txtFolderNo.Text = FolderNo;
                    txtExtention.Text = Extention;
                    txtMod.Text = modification;
                    txtSafein.Text = SafeInDate;
                    DocStatusList.SelectedValue = DocStatus;
                    txtSafeout.Text = SafeOutDate;
                    txtRemark.Text = Remark;
                    subBtn.Text = "Update";
                    ArchiveChBox.Visible = true;
                    addLbl.Text = "Edit VALUT Record";
                    //RequiredFieldValidator1.Enabled = false;
                    //RequiredFieldValidator2.Enabled = false;
                    //RequiredFieldValidator3.Enabled = false;
                    //RequiredFieldValidator4.Enabled = false;
                    //RequiredFieldValidator5.Enabled = false;
                    //RequiredFieldValidator6.Enabled = false;
                    //RequiredFieldValidator7.Enabled = false;
                    //RequiredFieldValidator8.Enabled = false;
                  

                }
            }
        }
        protected void backBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("wak.aspx");
        }
        protected void subBtn_Click(object sender, EventArgs e)
        {
            string fullUsername = User.Identity.Name;
            int index_domain = fullUsername.IndexOf("AIB\\");
            string username = fullUsername.Substring(fullUsername.IndexOf("\\") + 1);
            if (Page.IsValid)
            {
                if (subBtn.Text == "ADD")
                {
                    ArchiveChBox.Visible = false;
                    ImageButton3.Visible = false;
                    string connectionString = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                    using (SqlConnection sqlCon2 = new SqlConnection(connectionString))
                    {
                        ArchiveChBox.Visible = false;
                        sqlCon2.Open();
                        string query = "INSERT INTO[dbo].[Wak_Tbl_temp] (" + // temp table for insertion
                            "[ClientName]," +
                            "[FacilityApproval]," +
                            "[FacilityType] ," +
                            "[FacilityStatus]," +
                            "[SafeNo]," +
                            "[drawer]," +
                            "[FolderNo]," +
                            "[Extention]," +
                            "[modification]," +
                            "[SafeInDate] ," +
                            "[DocStatus]," +
                            "[SafeOutDate]," +
                            "[Remark]," +
                            "[InsertedBy]" +
                            ") VALUES" +
                            "(" +
                            "@ClientName," +
                            "@FacilityApproval," +
                            "@FacilityType," +
                            "@FacilityStatus," +
                            "@SafeNo," +
                            "@Drawer," +
                            "@FolderNo," +
                            "@Extention," +
                            "@modification," +
                            "@SafeInDate," +
                            "@DocStatus," +
                            "@SafeOutDate," +
                            "@Remark," +
                            "@InsertedBy)";

                        SqlCommand sqlcmd = new SqlCommand(query, sqlCon2);

                        sqlcmd.Parameters.AddWithValue("@ClientName", txtClient.Text);
                        sqlcmd.Parameters.AddWithValue("@FacilityApproval", facilityApptxt.Text);
                        sqlcmd.Parameters.AddWithValue("@FacilityType", FacilityTypeList.SelectedValue);
                        sqlcmd.Parameters.AddWithValue("@FacilityStatus", FacilityStatusList.SelectedValue);
                        sqlcmd.Parameters.AddWithValue("@SafeNo", SafeNoList.SelectedValue);

                        sqlcmd.Parameters.AddWithValue("@Drawer", txtDrawer.Text);
                        sqlcmd.Parameters.AddWithValue("@FolderNo", txtFolderNo.Text);
                        sqlcmd.Parameters.AddWithValue("@Extention", txtExtention.Text);
                        sqlcmd.Parameters.AddWithValue("@modification", txtMod.Text);


                        sqlcmd.Parameters.AddWithValue("@SafeInDate", txtSafein.Text);
                        sqlcmd.Parameters.AddWithValue("@DocStatus", DocStatusList.SelectedValue);
                        sqlcmd.Parameters.AddWithValue("@SafeOutDate", txtSafeout.Text);


                        sqlcmd.Parameters.AddWithValue("@Remark", txtRemark.Text);
                        sqlcmd.Parameters.AddWithValue("@InsertedBy", username);


                        sqlcmd.ExecuteNonQuery();
                        msg.Visible = true;
                        msg.Text = "Inserted to pending table!<br />It needs your admin approval!";
                        msg.ForeColor = System.Drawing.Color.Green;
                        Session.Remove("bid");
                        sqlCon2.Close();
                        //-------------------------------------

                        txtClient.Text = facilityApptxt.Text = txtDrawer.Text = txtFolderNo.Text = txtExtention.Text = txtMod.Text = txtSafein.Text = txtSafeout.Text = txtRemark.Text = "";

                        //==========================================
                    }
                }// end of adding new WAK Record

                else
                {
                    if (ArchiveChBox.Checked)
                    {
                        if (string.IsNullOrEmpty(txtArchiveDate.Text) && string.IsNullOrEmpty(txtArcDoc.Text))
                        {
                            msg.Text = "Please fill out archive mandatory field";
                            msg.Visible = true;
                            msg.ForeColor = Color.Red;

                        }

                        //end of if
                        else
                        {

                            string connectionStringg = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                            using (SqlConnection sqlConn = new SqlConnection(connectionStringg))
                            {
                                sqlConn.Open();
                                string query = "INSERT INTO[dbo].[Wak_update_temp] (" + // temp table for updating
                                    "[id]," +
                                    "[ClientName]," +
                                    "[FacilityApproval]," +
                                    "[FacilityType] ," +
                                    "[FacilityStatus]," +
                                    "[SafeNo]," +
                                    "[drawer]," +
                                    "[FolderNo]," +
                                    "[Extention]," +
                                    "[modification]," +
                                    "[SafeInDate] ," +
                                    "[DocStatus]," +
                                    "[SafeOutDate]," +
                                    "[Remark]," +
                                    "[updatedBy]," +
                                    "[ArchDoc]," +
                                    "[SafeRef]," +
                                    "[ArchDate]" +
                                    ") VALUES" +
                                    "(" +
                                    "@id," +
                                    "@ClientName," +
                                    "@FacilityApproval," +
                                    "@FacilityType," +
                                    "@FacilityStatus," +
                                    "@SafeNo," +
                                    "@Drawer," +
                                    "@FolderNo," +
                                    "@Extention," +
                                    "@modification," +
                                    "@SafeInDate," +
                                    "@DocStatus," +
                                    "@SafeOutDate," +
                                    "@Remark," +
                                    "@UpdatedBy," +
                                    "@archDoc," +
                                    "@SafeRef," +
                                    "@archDate)";

                                SqlCommand sqlcmd = new SqlCommand(query, sqlConn);
                                sqlcmd.Parameters.AddWithValue("@id", Session["id"].ToString());
                                sqlcmd.Parameters.AddWithValue("@ClientName", txtClient.Text);
                                sqlcmd.Parameters.AddWithValue("@FacilityApproval", facilityApptxt.Text);
                                sqlcmd.Parameters.AddWithValue("@FacilityType", FacilityTypeList.SelectedValue);
                                sqlcmd.Parameters.AddWithValue("@FacilityStatus", FacilityStatusList.SelectedValue);
                                sqlcmd.Parameters.AddWithValue("@SafeNo", SafeNoList.SelectedValue);
                                sqlcmd.Parameters.AddWithValue("@Drawer", txtDrawer.Text);
                                sqlcmd.Parameters.AddWithValue("@FolderNo", txtFolderNo.Text);
                                sqlcmd.Parameters.AddWithValue("@Extention", txtExtention.Text);
                                sqlcmd.Parameters.AddWithValue("@modification", txtMod.Text);
                                sqlcmd.Parameters.AddWithValue("@SafeInDate", txtSafein.Text);
                                sqlcmd.Parameters.AddWithValue("@DocStatus", DocStatusList.SelectedValue);
                                sqlcmd.Parameters.AddWithValue("@SafeOutDate", txtSafeout.Text);
                                sqlcmd.Parameters.AddWithValue("@Remark", txtRemark.Text);
                                sqlcmd.Parameters.AddWithValue("@UpdatedBy", Session["Users"].ToString());
                                sqlcmd.Parameters.AddWithValue("@archDoc", txtArcDoc.Text);
                                sqlcmd.Parameters.AddWithValue("@SafeRef", txtCabineRef.Text);
                                sqlcmd.Parameters.AddWithValue("@archDate", txtArchiveDate.Text);
                                sqlcmd.ExecuteNonQuery();
                                sqlConn.Close();
                                sqlConn.Dispose();
                            }

                            Session["eid"] = Session["id"].ToString();
                            msg.Visible = true;
                            msg.Text = "The record updated. <br/> It needs your admin approval.";
                            msg.ForeColor = System.Drawing.Color.Green;
                            Session.Remove("id");
                            Session.Remove("ClientName");
                            Session.Remove("FacilityApp");
                            Session.Remove("FacilityType");
                            Session.Remove("FacStatus");
                            Session.Remove("SafeNo");
                            Session.Remove("Drawer");
                            Session.Remove("FNO");
                            Session.Remove("Extention");
                            Session.Remove("Modification");
                            Session.Remove("SafeInDate");
                            Session.Remove("DocStatus");
                            Session.Remove("SafeoutDate");
                            Session.Remove("Remark");
                        }
                        //end of else

                    }// end of if checkbox checked

                    else
                    {


                        string connectionStringg = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                        using (SqlConnection sqlConn = new SqlConnection(connectionStringg))
                        {
                            sqlConn.Open();
                            string query = "INSERT INTO[dbo].[Wak_update_temp] (" + // temp table for updating
                                "[id]," +
                                "[ClientName]," +
                                "[FacilityApproval]," +
                                "[FacilityType] ," +
                                "[FacilityStatus]," +
                                "[SafeNo]," +
                                "[drawer]," +
                                "[FolderNo]," +
                                "[Extention]," +
                                "[modification]," +
                                "[SafeInDate] ," +
                                "[DocStatus]," +
                                "[SafeOutDate]," +
                                "[Remark]," +
                                "[updatedBy]," +
                                "[ArchDoc]," +
                                "[SafeRef]," +
                                "[ArchDate]" +
                                ") VALUES" +
                                "(" +
                                "@id," +
                                "@ClientName," +
                                "@FacilityApproval," +
                                "@FacilityType," +
                                "@FacilityStatus," +
                                "@SafeNo," +
                                "@Drawer," +
                                "@FolderNo," +
                                "@Extention," +
                                "@modification," +
                                "@SafeInDate," +
                                "@DocStatus," +
                                "@SafeOutDate," +
                                "@Remark," +
                                "@UpdatedBy," +
                                "@archDoc," +
                                "@SafeRef," +
                                "@archDate)";

                            SqlCommand sqlcmd = new SqlCommand(query, sqlConn);
                            sqlcmd.Parameters.AddWithValue("@id", Session["id"].ToString());
                            sqlcmd.Parameters.AddWithValue("@ClientName", txtClient.Text);
                            sqlcmd.Parameters.AddWithValue("@FacilityApproval", facilityApptxt.Text);
                            sqlcmd.Parameters.AddWithValue("@FacilityType", FacilityTypeList.SelectedValue);
                            sqlcmd.Parameters.AddWithValue("@FacilityStatus", FacilityStatusList.SelectedValue);
                            sqlcmd.Parameters.AddWithValue("@SafeNo", SafeNoList.SelectedValue);
                            sqlcmd.Parameters.AddWithValue("@Drawer", txtDrawer.Text);
                            sqlcmd.Parameters.AddWithValue("@FolderNo", txtFolderNo.Text);
                            sqlcmd.Parameters.AddWithValue("@Extention", txtExtention.Text);
                            sqlcmd.Parameters.AddWithValue("@modification", txtMod.Text);
                            sqlcmd.Parameters.AddWithValue("@SafeInDate", txtSafein.Text);
                            sqlcmd.Parameters.AddWithValue("@DocStatus", DocStatusList.SelectedValue);
                            sqlcmd.Parameters.AddWithValue("@SafeOutDate", txtSafeout.Text);
                            sqlcmd.Parameters.AddWithValue("@Remark", txtRemark.Text);
                            sqlcmd.Parameters.AddWithValue("@UpdatedBy", Session["Users"].ToString());
                            sqlcmd.Parameters.AddWithValue("@archDoc", txtArcDoc.Text);
                            sqlcmd.Parameters.AddWithValue("@SafeRef", txtCabineRef.Text);

                            sqlcmd.Parameters.AddWithValue("@archDate", txtArchiveDate.Text);
                            sqlcmd.ExecuteNonQuery();
                            sqlConn.Close();
                            sqlConn.Dispose();
                        }

                        Session["eid"] = Session["id"].ToString();
                        msg.Visible = true;
                        msg.Text = "The record updated. <br/> It needs your admin approval.";
                        msg.ForeColor = System.Drawing.Color.Green;
                        Session.Remove("id");
                        Session.Remove("ClientName");
                        Session.Remove("FacilityApp");
                        Session.Remove("FacilityType");
                        Session.Remove("FacStatus");
                        Session.Remove("SafeNo");
                        Session.Remove("Drawer");
                        Session.Remove("FNO");
                        Session.Remove("Extention");
                        Session.Remove("Modification");
                        Session.Remove("SafeInDate");
                        Session.Remove("DocStatus");
                        Session.Remove("SafeoutDate");
                        Session.Remove("Remark");
                    }
                    //end of else
                }// end of update btn



            }
            else
            {
                msg.Visible = true;
                msg.Text = "Please fill out all mandatory field";
                msg.ForeColor = System.Drawing.Color.OrangeRed;

            }


        }

    protected void back_Click(object sender, ImageClickEventArgs e)
        {
            Session.Remove("id");
            //RequiredFieldValidator1.Enabled = true;
            //RequiredFieldValidator2.Enabled = true;
            //RequiredFieldValidator3.Enabled = true;
            //RequiredFieldValidator4.Enabled = true;
            //RequiredFieldValidator5.Enabled = true;
            //RequiredFieldValidator6.Enabled = true;
            //RequiredFieldValidator7.Enabled = true;
            //RequiredFieldValidator8.Enabled = true;
            //RequiredFieldValidator9.Enabled = true;
            Response.Redirect("wak.aspx");

        }
        protected void txtClient_TextChanged(object sender, EventArgs e)
        {
            msg.Visible = false;

        }
        protected void txtSafeout_TextChanged(object sender, EventArgs e)
        {
            if (txtSafeout.Text == "yyyy-mm-dd")
            {
                DocStatusList.Enabled = false;
            }
            else
            DocStatusList.Enabled = true;
        }

        protected void ArchiveChBox_CheckedChanged(object sender, EventArgs e)
        {
            if (ArchiveChBox.Checked)
            {
                txtArchiveDate.Visible = true;
                txtArcDoc.Visible = true;
                ArchDateLbl.Visible = true;
                DocArcLbl.Visible = true;
                ImageButton3.Visible = true;
                txtCabineRef.Visible = true;
                cabineRefLbl.Visible = true;
                //RequiredFieldValidator9.Enabled = false;
                //RequiredFieldValidator10.Enabled = false;


            }
            else
            {
                txtArchiveDate.Visible = false;
                txtArcDoc.Visible = false;
                txtCabineRef.Visible = false;
                ArchDateLbl.Visible = false;
                DocArcLbl.Visible = false;
                ImageButton3.Visible = false;
                cabineRefLbl.Visible=false;
                //RequiredFieldValidator9.Enabled = true;
                //RequiredFieldValidator10.Enabled = true;

            }

        }
        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            txtSafeout.Text = "";
        }

        protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
        {
            txtArchiveDate.Text = "";
        }
    }
}