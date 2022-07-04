using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Globalization;

namespace Collateral_int
{
    public partial class new_rtd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string fullUsername = User.Identity.Name;
            int index_domain = fullUsername.IndexOf("AIB\\");
            string username = fullUsername.Substring(fullUsername.IndexOf("\\") + 1);
            if (!IsPostBack)
            {

                txtRTD.Visible = false;
                txtRelBy.Visible = false;
                txtRelDate.Visible = false;

                //---------------------------------------
                if (Session["RTD_ID"] != null)
                {
                    //COPY THE SESSION TO STRING VALUE

                    string id = Session["id"].ToString();
                    string cn = Session["CN"].ToString();
                    string lt = Session["LT"].ToString();
                    string qt = Session["qt"].ToString();
                    string qn = Session["qn"].ToString();
                    string qd = Session["qd"].ToString();
                    string oq = Session["oq"].ToString();
                    string tp = Session["tp"].ToString();
                    string vp = Session["vp"].ToString();
                    string cur = Session["cur"].ToString();
                    string pe = Session["pe"].ToString();
                    string address = Session["address"].ToString();
                    string led = Session["LED"].ToString();
                    string rmn = Session["rmn"].ToString();
                    string rmd = Session["rmd"].ToString();
                    string mv = Session["mv"].ToString();
                    string cv = Session["cv"].ToString();
                    string hkn = Session["hkn"].ToString();
                    string hkd = Session["hkd"].ToString();
                    string hkv = Session["hkv"].ToString();
                    string emn = Session["emn"].ToString();
                    string emd = Session["emd"].ToString();
                    string rd = Session["RD"].ToString();
                    string rtd = Session["RTD"].ToString();
                    string rb = Session["RB"].ToString();
                    string bo = Session["BO"].ToString();
                    string pifa = Session["PIFA"].ToString();
                    string duedate = Session["duedate"].ToString(); // New
                    string recb = Session["RECB"].ToString();
                    string rdsbto = Session["RDSBTO"].ToString();
                    string status = Session["Status"].ToString();
                    string remark = Session["Remark"].ToString();
                    string AddLoanStatus = Session["ALS"].ToString(); //New
                    string ib = Session["IB"].ToString();
                    string ub = Session["UB"].ToString();
                    string ab = Session["AB"].ToString();
                    string InDate = Session["InDate"].ToString();
                    //----------------------------------------------------

                    txtClient.Text = cn;
                    drop_loantype.SelectedValue = lt;
                    drop_QabalaType.SelectedValue = qt;
                    txtQabalaNo.Text = qn;
                    txtQabalaDate.Text = qd;
                    txtOwnerOfQabala.Text = oq;
                    drop_PropertyType.SelectedValue = tp;
                    txtPropertyvalue.Text = vp;
                    drop_Currency.SelectedValue = cur;
                    txtevaluator.Text = pe;
                    txtAddress.Text = address;
                    txtLastEvaluation.Text = led;
                    txtRMN.Text = rmn;
                    txtRMD.Text = rmd;
                    txtMValue.Text = mv;
                    txtcurrency_crtg.SelectedValue = cv;
                    txtHNo.Text = hkn;
                    txtHNo.Text = hkn;
                    txtHdate.Text = hkd;
                    txtEMN.Text = emn;
                    txtEMD.Text = emd;
                    txtBase.Text = bo;
                    txtPending.Text = pifa;
                    txtPIDD.Text = duedate;
                    // drop_Pending.SelectedValue = pifa;
                    txtRB.Text = recb;
                    txtrels_subm.Text = rdsbto;
                    Drop_status.SelectedValue = status;
                    txtRemark.Text = remark;
                    Drop_LoanStatus.SelectedValue = AddLoanStatus;
                    txtInsertedDate.Text = InDate;
                    txtRelBy.Enabled = false;
                    txtRelBy.Text = username;
                    txtRelDate.Text = rd;
                    txtRTD.Text = rtd;

                    //-----------------------------------------------
                    subBtn.Text = "Update";
                    Star1.Visible = Star2.Visible = Star3.Visible = false;
                    rtdLbl.Visible = RelBy.Visible = RelDate.Visible = false;
                    addLbl.Text = "Edit RTD Record";
                }
            }
            //----------------------------------------------

            if (Session["RTD_ID"] == null)
            {
                txtInsertedDate.Text = DateTime.Now.ToShortDateString();
                subBtn.Text = "Add";
                CheckBox1.Visible = false;
                Star1.Visible = Star2.Visible = Star3.Visible = false;
                rtdLbl.Visible = RelBy.Visible = RelDate.Visible = false;
            }
            //===================================
        }
        protected void back_Click(object sender, ImageClickEventArgs e)
        {
            if (Session["RTD_ID"] != null)
            {
                Session.Remove("RTD_ID");
            }

            Response.Redirect("RTDL.aspx");
        }
        protected void txtClient_TextChanged(object sender, EventArgs e)
        {
            msg.Text = "";
        }
        protected void subBtn_Click(object sender, EventArgs e)
        {
            string fullUsername = User.Identity.Name;
            int index_domain = fullUsername.IndexOf("AIB\\");
            string username = fullUsername.Substring(fullUsername.IndexOf("\\") + 1);
            if (Page.IsValid)
            {
                if (subBtn.Text == "Add")
                {
                    string connectionString = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                    using (SqlConnection sqlCon = new SqlConnection(connectionString))
                    {
                        sqlCon.Open();
                        string query = "INSERT INTO [dbo].[RTD_Temp_Insert]" + 
                            "(" + 
                            "[Client Name]" +
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
                            ",[Currency_Mrtg]" +
                            ",[Hujat Khaat Number]" +
                            ",[Hujat Khaat Date]" +
                            ",[Hujat Khaat Vallue]" + 
                            ",[Equitable Mortgage Number]" + 
                            ",[Equitable Mortgage Date]" +
                        //",[Released Date]" +
                        //",[Released By]" +
                        //",[Released Title Deeds]" +
                        ",[Based On]" + 
                        ",[Pending Item For Accomplishment]" + 
                        ",[Due Date]" + 
                        ",[Received By]" +
                        ",[Released Submitted to]" +
                        ",[Status]" +
                        ",[Remark]" + 
                        ",[Add Loan Status]" +
                        ",[Inserted By]" +
                        //",[Updated By]" +
                        //",[Approved By]" +
                        ",[Inserted Date]" +
                        ")" +
                        "VALUES" + 
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
                        "@val13," + 
                        "@val14," + 
                        "@val15," + 
                        "@val16," +
                        "@curren_gtg," +
                        "@val17," + 
                        "@val18," + 
                        "@val19," + 
                        "@val20," + 
                        "@val21," +
                        //"@val22," +
                        //"@val23" +
                        //"@val24," +
                        "@val25," + 
                        "@val26," + 
                        "@val27," + 
                        "@val28," +
                        "@submit_to," +
                        "@val29," + 
                        "@val30," + 
                        "@val31," +
                        "@val32," + 
                        "@val33" +
                        ")";
                        SqlCommand sqlcmd = new SqlCommand(query, sqlCon);
                        // sqlcmd.Parameters.AddWithValue("@val1",txtClient.Text);
                        sqlcmd.Parameters.AddWithValue("@val2", txtClient.Text);
                        sqlcmd.Parameters.AddWithValue("@val3", drop_loantype.SelectedValue);
                        sqlcmd.Parameters.AddWithValue("@val4", drop_QabalaType.SelectedValue);
                        sqlcmd.Parameters.AddWithValue("@val5", txtQabalaNo.Text);
                        sqlcmd.Parameters.AddWithValue("@val6", txtQabalaDate.Text);
                        sqlcmd.Parameters.AddWithValue("@val7", txtOwnerOfQabala.Text);
                        sqlcmd.Parameters.AddWithValue("@val8", drop_PropertyType.SelectedValue);
                        sqlcmd.Parameters.AddWithValue("@val9", txtPropertyvalue.Text);
                        sqlcmd.Parameters.AddWithValue("@val10", drop_Currency.SelectedValue);
                        sqlcmd.Parameters.AddWithValue("@val11", txtevaluator.Text);
                        sqlcmd.Parameters.AddWithValue("@val12", txtAddress.Text);
                        sqlcmd.Parameters.AddWithValue("@val13", txtLastEvaluation.Text);
                        sqlcmd.Parameters.AddWithValue("@val14", txtRMN.Text);
                        sqlcmd.Parameters.AddWithValue("@val15", txtRMD.Text);
                        sqlcmd.Parameters.AddWithValue("@val16", txtMValue.Text);
                        sqlcmd.Parameters.AddWithValue("@curren_gtg", txtcurrency_crtg.SelectedValue);
                        sqlcmd.Parameters.AddWithValue("@val17", txtHNo.Text);
                        sqlcmd.Parameters.AddWithValue("@val18", txtHdate.Text);
                        sqlcmd.Parameters.AddWithValue("@val19", txthValue.Text);
                        sqlcmd.Parameters.AddWithValue("@val20", txtEMN.Text);
                        sqlcmd.Parameters.AddWithValue("@val21", txtEMD.Text);
                        //sqlcmd.Parameters.AddWithValue("@val22", txtBase.Text);
                        //sqlcmd.Parameters.AddWithValue("@val23", txtPending.Text);
                        //sqlcmd.Parameters.AddWithValue("@val24", txtPIDD.Text);
                        sqlcmd.Parameters.AddWithValue("@val25", txtBase.Text);
                        sqlcmd.Parameters.AddWithValue("@val26", txtPending.Text);
                        sqlcmd.Parameters.AddWithValue("@val27", txtPIDD.Text);
                        sqlcmd.Parameters.AddWithValue("@val28", txtRB.Text);
                        sqlcmd.Parameters.AddWithValue("@submit_to", txtrels_subm.Text);
                        sqlcmd.Parameters.AddWithValue("@val29", Drop_status.SelectedValue);
                        sqlcmd.Parameters.AddWithValue("@val30", txtRemark.Text);
                        sqlcmd.Parameters.AddWithValue("@val31", Drop_LoanStatus.SelectedValue);
                        sqlcmd.Parameters.AddWithValue("@val32", username);
                        sqlcmd.Parameters.AddWithValue("@val33", txtInsertedDate.Text);
                        sqlcmd.ExecuteNonQuery();
                        msg.Visible = true;
                        msg.Text = "Inserted to inserted pending table!<br />It needs your admin approval!";
                        msg.ForeColor = System.Drawing.Color.Green;
                        sqlCon.Close();
                    }
                }

            }

            //END OF ADD ACTION
            if (subBtn.Text == "Update")
            //else
            {
                string connectionString = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    sqlCon.Open();
                    string query = "INSERT INTO [dbo].[RTD_Pending_Update]" +
                        "(" +
                        "id," +
                        "[Client Name]" +
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
                        ",[Currency_Mrtg]" +
                        ",[Hujat Khaat Number]" +
                        ",[Hujat Khaat Date]" +
                        ",[Hujat Khaat Vallue]" + 
                        ",[Equitable Mortgage Number]" +
                        ",[Equitable Mortgage Date]" + 
                        ",[Released Date]" + 
                        ",[Released By]" + 
                        ",[Released Title Deeds]" + 
                        ",[Based On]" + 
                        ",[Pending Item For Accomplishment]" +
                        ",[Due Date]" + 
                        ",[Received By]" +
                        ",[Released Submitted to]" +
                        ",[Status]" + 
                        ",[Remark]" + 
                        ",[Add Loan Status]" +
                        ",[Inserted By]" + 
                        ",[Updated By]" +
                        ",[Inserted Date]" + 
                        ")" + 
                        "VALUES" + 
                        "(" +
                        "@val1," +
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
                        "@val15," +
                        "@val16," +
                        "@curren_gtg," +
                        "@val17," +
                        "@val18," + 
                        "@val19," + 
                        "@val20," + 
                        "@val21," + 
                        "@val22," + 
                        "@val23," +
                        "@val24," + 
                        "@val25," +
                        "@val26," + 
                        "@val27," + 
                        "@val28," +
                        "@submit_to," +
                        "@val29," +
                        "@val30," + 
                        "@val31," +
                        "@val32," +
                        "@val33," +
                        "@val34" +
                        ")";
                    SqlCommand sqlcmd = new SqlCommand(query, sqlCon);
                    sqlcmd.Parameters.AddWithValue("@val1", Session["id"].ToString());
                    sqlcmd.Parameters.AddWithValue("@val2", txtClient.Text);
                    sqlcmd.Parameters.AddWithValue("@val3", drop_loantype.SelectedValue);
                    sqlcmd.Parameters.AddWithValue("@val4", drop_QabalaType.SelectedValue);
                    sqlcmd.Parameters.AddWithValue("@val5", txtQabalaNo.Text);
                    sqlcmd.Parameters.AddWithValue("@val6", txtQabalaDate.Text);
                    sqlcmd.Parameters.AddWithValue("@val7", txtOwnerOfQabala.Text);
                    sqlcmd.Parameters.AddWithValue("@val8", drop_PropertyType.SelectedValue);
                    sqlcmd.Parameters.AddWithValue("@val9", txtPropertyvalue.Text);
                    sqlcmd.Parameters.AddWithValue("@val10", drop_Currency.SelectedValue);
                    sqlcmd.Parameters.AddWithValue("@val11", txtevaluator.Text);
                    sqlcmd.Parameters.AddWithValue("@val12", txtAddress.Text);
                    sqlcmd.Parameters.AddWithValue("@val13", txtLastEvaluation.Text);
                    sqlcmd.Parameters.AddWithValue("@val14", txtRMN.Text);
                    sqlcmd.Parameters.AddWithValue("@val15", txtRMD.Text);
                    sqlcmd.Parameters.AddWithValue("@val16", txtMValue.Text);
                    sqlcmd.Parameters.AddWithValue("@curren_gtg", txtcurrency_crtg.SelectedValue);
                    sqlcmd.Parameters.AddWithValue("@val17", txtHNo.Text);
                    sqlcmd.Parameters.AddWithValue("@val18", txtHdate.Text);
                    sqlcmd.Parameters.AddWithValue("@val19", txthValue.Text);
                    sqlcmd.Parameters.AddWithValue("@val20", txtEMN.Text);
                    sqlcmd.Parameters.AddWithValue("@val21", txtEMD.Text);
                    sqlcmd.Parameters.AddWithValue("@val22", txtRelDate.Text);
                    sqlcmd.Parameters.AddWithValue("@val23", txtRelBy.Text);
                    sqlcmd.Parameters.AddWithValue("@val24", txtRTD.Text);
                    sqlcmd.Parameters.AddWithValue("@val25", txtBase.Text);
                    sqlcmd.Parameters.AddWithValue("@val26", txtPending.Text);
                    sqlcmd.Parameters.AddWithValue("@val27", txtPIDD.Text);
                    sqlcmd.Parameters.AddWithValue("@val28", txtRB.Text);
                    sqlcmd.Parameters.AddWithValue("@submit_to", txtrels_subm.Text);
                    sqlcmd.Parameters.AddWithValue("@val29", Drop_status.SelectedValue);
                    sqlcmd.Parameters.AddWithValue("@val30", txtRemark.Text);
                    sqlcmd.Parameters.AddWithValue("@val31", Drop_LoanStatus.SelectedValue);
                    sqlcmd.Parameters.AddWithValue("@val32", username);
                    sqlcmd.Parameters.AddWithValue("@val33", username);
                    sqlcmd.Parameters.AddWithValue("@val34", txtInsertedDate.Text);
                    sqlcmd.ExecuteNonQuery();
                    msg.Visible = true;
                    msg.Text = "Inserted to update pending table!<br />It needs your admin approval!";
                    msg.ForeColor = System.Drawing.Color.ForestGreen;
                    sqlCon.Close();
                }
            }

        } // end of page valid
        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {
            string fullUsername = User.Identity.Name;
            int index_domain = fullUsername.IndexOf("AIB\\");
            string username = fullUsername.Substring(fullUsername.IndexOf("\\") + 1);
            if (CheckBox1.Checked)
            {
                txtRelDate.Visible = true;
                txtRelBy.Visible = true;
                txtRTD.Visible = true;
                Star1.Visible = Star2.Visible = Star3.Visible = true;
                rtdLbl.Visible = RelBy.Visible = RelDate.Visible = true;
                txtRelBy.Text = username;
            }
            else
            {

                txtRelDate.Visible = false;
                txtRelBy.Visible = false;
                txtRTD.Visible = false;
                Star1.Visible = Star2.Visible = Star3.Visible = false;
                rtdLbl.Visible = RelBy.Visible = RelDate.Visible = false;
            }
        }

        protected void txtevaluator_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtRB_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtPending_TextChanged(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                if (string.IsNullOrEmpty(txtPending.Text))
                {

                    txtPIDD.Text = "";
                    txtPIDD.Enabled = false;
                    txtPIDD.TextMode = TextBoxMode.SingleLine;

                }
                else
                {
                    txtPIDD.Enabled = true;
                    txtPIDD.TextMode = TextBoxMode.Date;
                }
            }

        }


        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {

        }

        protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Chk_qabalaDate.Checked)
            {
                txtQabalaDate.Text = DropDownList1.SelectedValue + "/" + DropDownList2.SelectedValue + "/" + DropDownList3.SelectedValue;
                Chk_qabalaDate.Checked = false;
            }

            //--------------------------------------
            if (Chk_MortgageDate.Checked)
            {
                txtRMD.Text = DropDownList1.SelectedValue + "/" + DropDownList2.SelectedValue + "/" + DropDownList3.SelectedValue;
                Chk_MortgageDate.Checked = false;
            }

            //-----------------------------------------------
            if (Chk_HKD.Checked)
            {
                txtHdate.Text = DropDownList1.SelectedValue + "/" + DropDownList2.SelectedValue + "/" + DropDownList3.SelectedValue;
                Chk_HKD.Checked = false;
            }

        }
        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Chk_qabalaDate.Checked)
            {

                txtQabalaDate.Text = DropDownList1.SelectedValue + "/" + DropDownList2.SelectedValue + "/" + DropDownList3.SelectedValue;

                Chk_qabalaDate.Checked = false;

            }
            //--------------------------------------
            if (Chk_MortgageDate.Checked)
            {

                txtRMD.Text = DropDownList1.SelectedValue + "/" + DropDownList2.SelectedValue + "/" + DropDownList3.SelectedValue;

                Chk_MortgageDate.Checked = false;

            }
            //-----------------------------------------------
            if (Chk_HKD.Checked)
            {

                txtHdate.Text = DropDownList1.SelectedValue + "/" + DropDownList2.SelectedValue + "/" + DropDownList3.SelectedValue;
                Chk_HKD.Checked = false;

            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Chk_qabalaDate.Checked)
            {

                txtQabalaDate.Text = DropDownList1.SelectedValue + "/" + DropDownList2.SelectedValue + "/" + DropDownList3.SelectedValue;

                Chk_qabalaDate.Checked = false;

            }
            //--------------------------------------
            if (Chk_MortgageDate.Checked)
            {

                txtRMD.Text = DropDownList1.SelectedValue + "/" + DropDownList2.SelectedValue + "/" + DropDownList3.SelectedValue;


                Chk_MortgageDate.Checked = false;

            }
            //-----------------------------------------------
            if (Chk_HKD.Checked)
            {

                txtHdate.Text = DropDownList1.SelectedValue + "/" + DropDownList2.SelectedValue + "/" + DropDownList3.SelectedValue;

                Chk_HKD.Checked = false;

            }
        }

        protected void txtPropertyvalue_TextChanged(object sender, EventArgs e)
        {

        }

    }
}