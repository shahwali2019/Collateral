using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Drawing;
using OfficeOpenXml;
using System.IO;

namespace Collateral_int
{
    public partial class RTDL : System.Web.UI.Page
    {
        string connectionString =  ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
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
               
                GridView1.Columns[11].Visible = false;
                GridView1.Columns[12].Visible = false;
                GridView1.Columns[13].Visible = false;
                GridView1.Columns[14].Visible = false;
                GridView1.Columns[15].Visible = false;
                GridView1.Columns[16].Visible = false;
                GridView1.Columns[17].Visible = false;
                GridView1.Columns[18].Visible = false;
                GridView1.Columns[19].Visible = false;
                GridView1.Columns[20].Visible = false;
                GridView1.Columns[21].Visible = false;
                GridView1.Columns[22].Visible = false;
                GridView1.Columns[23].Visible = false;
                GridView1.Columns[24].Visible = false;
                GridView1.Columns[25].Visible = false;
                GridView1.Columns[26].Visible = false;
                GridView1.Columns[27].Visible = false;
                GridView1.Columns[28].Visible = false;
                GridView1.Columns[29].Visible = false;
                GridView1.Columns[30].Visible = false;
            }
        }

        protected void searchBtn_Click(object sender, EventArgs e)
        {
            // DISPALY ALL
            if (string.IsNullOrEmpty(txtClientName.Text) && drop_QabalaType.SelectedValue == "Qabala Type" && string.IsNullOrEmpty(txtQNo.Text) && string.IsNullOrEmpty(txtToP.Text) && txtDate2.Text == "")

            {

                GridView1.DataSourceID = null;
                string sqlQuery;
                SqlConnection sqlCon = new SqlConnection(connectionString);
                sqlCon.Open();
                sqlQuery = "SELECT *FROM RTD ORDER BY [Inserted By] DESC ";
                SqlCommand cmd = new SqlCommand(sqlQuery, sqlCon);
                cmd.ExecuteNonQuery();
                SqlDataAdapter DA = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                DA.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();
                sqlCon.Close();
                int counter = GridView1.Rows.Count;
                resultLbl.Visible = true;
                resultLbl.Text = "Found " + counter + " Record(s)";
            }
            ////-----------Date Period---------------------------

            if (string.IsNullOrEmpty(txtClientName.Text) && drop_QabalaType.SelectedValue == "Qabala Type" && string.IsNullOrEmpty(txtQNo.Text) && string.IsNullOrEmpty(txtToP.Text) && txtDate2.Text != "" && txtDate1.Text!="")

            {
                DateTime dtFrom, dtTo;
                string dtFromStr, dtToStr;

                dtFrom = Convert.ToDateTime(txtDate1.Text);
                dtFromStr = dtFrom.ToShortDateString();
                dtTo = Convert.ToDateTime(txtDate2.Text);
                dtToStr = dtTo.ToShortDateString();

                GridView1.DataSourceID = null;
                string sqlQuery;
                SqlConnection sqlCon = new SqlConnection(connectionString);
                sqlCon.Open();
                sqlQuery = "SELECT *FROM RTD WHERE [Inserted Date]  BETWEEN '" + dtFromStr + "' AND '" + dtToStr + "' ORDER BY [Inserted Date] ASC";
                SqlCommand cmd = new SqlCommand(sqlQuery, sqlCon);

                cmd.ExecuteNonQuery();
                SqlDataAdapter DA = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                DA.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();
                sqlCon.Close();
                int counter = GridView1.Rows.Count;
                resultLbl.Visible = true;
                resultLbl.Text = "Found " + counter + " Record(s)";

            }
            //1 2 x x
            if ( drop_QabalaType.SelectedValue != "Qabala Type" && !string.IsNullOrEmpty(txtQNo.Text))

            {


                GridView1.DataSourceID = null;
                string sqlQuery;
                SqlConnection sqlCon = new SqlConnection(connectionString);
                sqlCon.Open();
                sqlQuery = "SELECT *FROM RTD WHERE [Qabala Type]='"+drop_QabalaType.SelectedValue+ "' AND [Qabala Number] LIKE '%"+txtQNo.Text+"%'  ORDER BY [Inserted Date] ASC";
                SqlCommand cmd = new SqlCommand(sqlQuery, sqlCon);

                cmd.ExecuteNonQuery();
                SqlDataAdapter DA = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                DA.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();
                sqlCon.Close();
                int counter = GridView1.Rows.Count;
                resultLbl.Visible = true;
                resultLbl.Text = "Found " + counter + " Record(s)";

            }
            //----------------------------------------------------------
            //1 2 3 x
            if (drop_QabalaType.SelectedValue != "Qabala Type" && !string.IsNullOrEmpty(txtQNo.Text)&& !string.IsNullOrEmpty(txtToP.Text))

            {

                GridView1.DataSourceID = null;
                string sqlQuery;
                SqlConnection sqlCon = new SqlConnection(connectionString);
                sqlCon.Open();
                sqlQuery = "SELECT *FROM RTD WHERE [Type of Property] LIKE '%" + txtToP.Text+"%' AND [Qabala Type]='" + drop_QabalaType.SelectedValue + "' AND [Qabala Number] LIKE '%" + txtQNo.Text + "%'  ORDER BY [Inserted Date] ASC";
                SqlCommand cmd = new SqlCommand(sqlQuery, sqlCon);

                cmd.ExecuteNonQuery();
                SqlDataAdapter DA = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                DA.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();
                sqlCon.Close();
                int counter = GridView1.Rows.Count;
                resultLbl.Visible = true;
                resultLbl.Text = "Found " + counter + " Record(s)";

            }
            //----------------------------------------------------------
            //1 2 3 4
            if (drop_QabalaType.SelectedValue != "Qabala Type" && !string.IsNullOrEmpty(txtQNo.Text) && !string.IsNullOrEmpty(txtToP.Text)&& Drop_status.SelectedValue!="Status")

            {

                GridView1.DataSourceID = null;
                string sqlQuery;
                SqlConnection sqlCon = new SqlConnection(connectionString);
                sqlCon.Open();
                sqlQuery = "SELECT *FROM RTD WHERE Status='"+Drop_status.SelectedValue+"' AND [Type of Property] LIKE '%" + txtToP.Text + "%' AND [Qabala Type]='" + drop_QabalaType.SelectedValue + "' AND [Qabala Number] LIKE '%" + txtQNo.Text + "%'  ORDER BY [Inserted Date] ASC";
                SqlCommand cmd = new SqlCommand(sqlQuery, sqlCon);

                cmd.ExecuteNonQuery();
                SqlDataAdapter DA = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                DA.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();
                sqlCon.Close();
                int counter = GridView1.Rows.Count;
                resultLbl.Visible = true;
                resultLbl.Text = "Found " + counter + " Record(s)";

            }
            //-------------------
            //2 x x x
            if (drop_QabalaType.SelectedValue == "Qabala Type" && !string.IsNullOrEmpty(txtQNo.Text) && string.IsNullOrEmpty(txtToP.Text) && Drop_status.SelectedValue == "Status")

            {

                GridView1.DataSourceID = null;
                string sqlQuery;
                SqlConnection sqlCon = new SqlConnection(connectionString);
                sqlCon.Open();
                sqlQuery = "SELECT *FROM RTD WHERE [Qabala Number] LIKE '%" + txtQNo.Text + "%'  ORDER BY [Inserted Date] ASC";
                SqlCommand cmd = new SqlCommand(sqlQuery, sqlCon);

                cmd.ExecuteNonQuery();
                SqlDataAdapter DA = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                DA.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();
                sqlCon.Close();
                int counter = GridView1.Rows.Count;
                resultLbl.Visible = true;
                resultLbl.Text = "Found " + counter + " Record(s)";

            }
            //-------------------
            //1 x 3 4
            if (drop_QabalaType.SelectedValue != "Qabala Type" && string.IsNullOrEmpty(txtQNo.Text) && !string.IsNullOrEmpty(txtToP.Text) && Drop_status.SelectedValue != "Status")

            {
                GridView1.DataSourceID = null;
                string sqlQuery;
                SqlConnection sqlCon = new SqlConnection(connectionString);
                sqlCon.Open();
                sqlQuery = "SELECT *FROM RTD WHERE [Qabala Type]='" + drop_QabalaType.SelectedValue + "' AND [Qabala Number] LIKE '%" + txtQNo.Text + "%' AND [Type of Property] LIKE '%"+txtToP.Text+"%' AND Status = '"+Drop_status.SelectedValue+"'   ORDER BY [Inserted Date] ASC";
                SqlCommand cmd = new SqlCommand(sqlQuery, sqlCon);
                cmd.ExecuteNonQuery();
                SqlDataAdapter DA = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                DA.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();
                sqlCon.Close();
                int counter = GridView1.Rows.Count;
                resultLbl.Visible = true;
                resultLbl.Text = "Found " + counter + " Record(s)";
            }
            //-------------------
            //1 x x 4
            if (drop_QabalaType.SelectedValue != "Qabala Type" && string.IsNullOrEmpty(txtQNo.Text) && string.IsNullOrEmpty(txtToP.Text) && Drop_status.SelectedValue != "Status")

            {
                GridView1.DataSourceID = null;
                string sqlQuery;
                SqlConnection sqlCon = new SqlConnection(connectionString);
                sqlCon.Open();
                sqlQuery = "SELECT *FROM RTD WHERE [Qabala Type]='" + drop_QabalaType.SelectedValue + "' AND [Qabala Number] LIKE '%" + txtQNo.Text + "%' AND [Type of Property] LIKE '%" + txtToP.Text + "%' AND Status = '" + Drop_status.SelectedValue + "'   ORDER BY [Inserted Date] ASC";
                SqlCommand cmd = new SqlCommand(sqlQuery, sqlCon);
                cmd.ExecuteNonQuery();
                SqlDataAdapter DA = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                DA.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();
                sqlCon.Close();
                int counter = GridView1.Rows.Count;
                resultLbl.Visible = true;
                resultLbl.Text = "Found " + counter + " Record(s)";
            }
            //-------------------
            //2 x 3 4  
            if (drop_QabalaType.SelectedValue == "Qabala Type" && !string.IsNullOrEmpty(txtQNo.Text) && !string.IsNullOrEmpty(txtToP.Text) && Drop_status.SelectedValue != "Status")

            {
                GridView1.DataSourceID = null;
                string sqlQuery;
                SqlConnection sqlCon = new SqlConnection(connectionString);
                sqlCon.Open();
                sqlQuery = "SELECT *FROM RTD WHERE [Qabala Number] LIKE '%" + txtQNo.Text + "%' AND [Type of Property] LIKE '%" + txtToP.Text + "%' AND Status = '" + Drop_status.SelectedValue + "'   ORDER BY [Inserted Date] ASC";
                SqlCommand cmd = new SqlCommand(sqlQuery, sqlCon);
                cmd.ExecuteNonQuery();
                SqlDataAdapter DA = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                DA.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();
                sqlCon.Close();
                int counter = GridView1.Rows.Count;
                resultLbl.Visible = true;
                resultLbl.Text = "Found " + counter + " Record(s)";
            }
            //-------------------
            //2 x 3 x  
            if (drop_QabalaType.SelectedValue == "Qabala Type" && !string.IsNullOrEmpty(txtQNo.Text) && !string.IsNullOrEmpty(txtToP.Text) && Drop_status.SelectedValue == "Status")

            {
                GridView1.DataSourceID = null;
                string sqlQuery;
                SqlConnection sqlCon = new SqlConnection(connectionString);
                sqlCon.Open();
                sqlQuery = "SELECT *FROM RTD WHERE [Qabala Number] LIKE '%" + txtQNo.Text + "%' AND [Type of Property] LIKE '%" + txtToP.Text + "%' ORDER BY [Inserted Date] ASC";
                SqlCommand cmd = new SqlCommand(sqlQuery, sqlCon);
                cmd.ExecuteNonQuery();
                SqlDataAdapter DA = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                DA.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();
                sqlCon.Close();
                int counter = GridView1.Rows.Count;
                resultLbl.Visible = true;
                resultLbl.Text = "Found " + counter + " Record(s)";
            }
            //-------------------


            //2 x x 4
            if (drop_QabalaType.SelectedValue == "Qabala Type" && !string.IsNullOrEmpty(txtQNo.Text) && string.IsNullOrEmpty(txtToP.Text) && Drop_status.SelectedValue != "Status")

            {
                GridView1.DataSourceID = null;
                string sqlQuery;
                SqlConnection sqlCon = new SqlConnection(connectionString);
                sqlCon.Open();
                sqlQuery = "SELECT *FROM RTD WHERE [Qabala Number] LIKE '%" + txtQNo.Text + "%' AND Status = '" + Drop_status.SelectedValue + "' ORDER BY [Inserted Date] ASC";
                SqlCommand cmd = new SqlCommand(sqlQuery, sqlCon);
                cmd.ExecuteNonQuery();
                SqlDataAdapter DA = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                DA.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();
                sqlCon.Close();
                int counter = GridView1.Rows.Count;
                resultLbl.Visible = true;
                resultLbl.Text = "Found " + counter + " Record(s)";
            }
            //-------------------

            //x x 3 x
            if (drop_QabalaType.SelectedValue == "Qabala Type" && string.IsNullOrEmpty(txtQNo.Text) && !string.IsNullOrEmpty(txtToP.Text) && Drop_status.SelectedValue == "Status")

            {
                GridView1.DataSourceID = null;
                string sqlQuery;
                SqlConnection sqlCon = new SqlConnection(connectionString);
                sqlCon.Open();
                sqlQuery = "SELECT *FROM RTD WHERE [Qabala Number] LIKE '%" + txtQNo.Text + "%' AND Status = '" + Drop_status.SelectedValue + "' ORDER BY [Inserted Date] ASC";
                SqlCommand cmd = new SqlCommand(sqlQuery, sqlCon);
                cmd.ExecuteNonQuery();
                SqlDataAdapter DA = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                DA.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();
                sqlCon.Close();
                int counter = GridView1.Rows.Count;
                resultLbl.Visible = true;
                resultLbl.Text = "Found " + counter + " Record(s)";
            }
            //-------------------

            //1 x 3 x
            if (drop_QabalaType.SelectedValue != "Qabala Type" && string.IsNullOrEmpty(txtQNo.Text) && !string.IsNullOrEmpty(txtToP.Text) && Drop_status.SelectedValue == "Status")

            {
                GridView1.DataSourceID = null;
                string sqlQuery;
                SqlConnection sqlCon = new SqlConnection(connectionString);
                sqlCon.Open();
                sqlQuery = "SELECT *FROM RTD WHERE [Qabala Number] LIKE '%" + txtQNo.Text + "%' AND Status = '" + Drop_status.SelectedValue + "' ORDER BY [Inserted Date] ASC";
                SqlCommand cmd = new SqlCommand(sqlQuery, sqlCon);
                cmd.ExecuteNonQuery();
                SqlDataAdapter DA = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                DA.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();
                sqlCon.Close();
                int counter = GridView1.Rows.Count;
                resultLbl.Visible = true;
                resultLbl.Text = "Found " + counter + " Record(s)";
            }
            //-------------------

            //1 2 3 x
            if (drop_QabalaType.SelectedValue != "Qabala Type" && !string.IsNullOrEmpty(txtQNo.Text) && !string.IsNullOrEmpty(txtToP.Text) && Drop_status.SelectedValue == "Status")

            {
                GridView1.DataSourceID = null;
                string sqlQuery;
                SqlConnection sqlCon = new SqlConnection(connectionString);
                sqlCon.Open();
                sqlQuery = "SELECT *FROM RTD WHERE [Qabala Type]='"+drop_QabalaType.SelectedValue+"' AND [Qabala Number] LIKE '%" + txtQNo.Text + "%' AND Status = '" + Drop_status.SelectedValue + "' ORDER BY [Inserted Date] ASC";
                SqlCommand cmd = new SqlCommand(sqlQuery, sqlCon);
                cmd.ExecuteNonQuery();
                SqlDataAdapter DA = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                DA.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();
                sqlCon.Close();
                int counter = GridView1.Rows.Count;
                resultLbl.Visible = true;
                resultLbl.Text = "Found " + counter + " Record(s)";
            }
            //-------------------
            //3 x 2 4 
            if (drop_QabalaType.SelectedValue == "Qabala Type" && !string.IsNullOrEmpty(txtQNo.Text) && !string.IsNullOrEmpty(txtToP.Text) && Drop_status.SelectedValue != "Status")

            {
                GridView1.DataSourceID = null;
                string sqlQuery;
                SqlConnection sqlCon = new SqlConnection(connectionString);
                sqlCon.Open();
                sqlQuery = "SELECT *FROM RTD WHERE [Type of Property] LIKE '%"+txtToP.Text+"%' AND [Qabala Number] LIKE '%" + txtQNo.Text + "%' AND Status = '" + Drop_status.SelectedValue + "' ORDER BY [Inserted Date] ASC";
                SqlCommand cmd = new SqlCommand(sqlQuery, sqlCon);
                cmd.ExecuteNonQuery();
                SqlDataAdapter DA = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                DA.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();
                sqlCon.Close();
                int counter = GridView1.Rows.Count;
                resultLbl.Visible = true;
                resultLbl.Text = "Found " + counter + " Record(s)";
            }
            //-------------------

            //x x 3 4
            if (drop_QabalaType.SelectedValue == "Qabala Type" && string.IsNullOrEmpty(txtQNo.Text) && !string.IsNullOrEmpty(txtToP.Text) && Drop_status.SelectedValue != "Status")

            {
                GridView1.DataSourceID = null;
                string sqlQuery;
                SqlConnection sqlCon = new SqlConnection(connectionString);
                sqlCon.Open();
                sqlQuery = "SELECT *FROM RTD WHERE [Type of Property] LIKE '%" + txtToP.Text + "%' AND Status = '" + Drop_status.SelectedValue + "' ORDER BY [Inserted Date] ASC";
                SqlCommand cmd = new SqlCommand(sqlQuery, sqlCon);
                cmd.ExecuteNonQuery();
                SqlDataAdapter DA = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                DA.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();
                sqlCon.Close();
                int counter = GridView1.Rows.Count;
                resultLbl.Visible = true;
                resultLbl.Text = "Found " + counter + " Record(s)";
            }
            //-------------------











            if (string.IsNullOrEmpty(txtClientName.Text) && drop_QabalaType.SelectedValue == "Qabala Type" && string.IsNullOrEmpty(txtQNo.Text) && string.IsNullOrEmpty(txtToP.Text) && txtDate2.Text == "" && txtDate1.Text != "")

            {
                DateTime dtFrom;
                string dtFromStr;

                dtFrom = Convert.ToDateTime(txtDate1.Text);
                dtFromStr = dtFrom.ToShortDateString();
                //dtTo = Convert.ToDateTime(txtDate2.Text);
                //dtToStr = dtTo.ToShortDateString();

                GridView1.DataSourceID = null;
                string sqlQuery;
                SqlConnection sqlCon = new SqlConnection(connectionString);
                sqlCon.Open();
                sqlQuery = "SELECT *FROM RTD WHERE [Inserted Date]  = '" + dtFromStr + "' ORDER BY [Inserted Date] ASC";
                SqlCommand cmd = new SqlCommand(sqlQuery, sqlCon);

                cmd.ExecuteNonQuery();
                SqlDataAdapter DA = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                DA.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();
                sqlCon.Close();
                int counter = GridView1.Rows.Count;
                resultLbl.Visible = true;
                resultLbl.Text = "Found " + counter + " Record(s)";

            }
            //---------------------------------------------------------------
            if (string.IsNullOrEmpty(txtClientName.Text) && drop_QabalaType.SelectedValue == "Qabala Type" && string.IsNullOrEmpty(txtQNo.Text) && string.IsNullOrEmpty(txtToP.Text) && txtDate2.Text != "" && txtDate1.Text == "")

            {
                DateTime  dtTo;
                string  dtToStr;

               
                dtTo = Convert.ToDateTime(txtDate2.Text);
                dtToStr = dtTo.ToShortDateString();

                GridView1.DataSourceID = null;
                string sqlQuery;
                SqlConnection sqlCon = new SqlConnection(connectionString);
                sqlCon.Open();
                sqlQuery = "SELECT *FROM RTD WHERE [Inserted Date]  = '" + dtToStr + "' ORDER BY [Inserted Date] ASC";
                SqlCommand cmd = new SqlCommand(sqlQuery, sqlCon);

                cmd.ExecuteNonQuery();
                SqlDataAdapter DA = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                DA.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();
                sqlCon.Close();
                int counter = GridView1.Rows.Count;
                resultLbl.Visible = true;
                resultLbl.Text = "Found " + counter + " Record(s)";

            }
            //------------------END of date period search
            //search by client name

            if (!string.IsNullOrEmpty(txtClientName.Text) && drop_QabalaType.SelectedValue== "Qabala Type" && string.IsNullOrEmpty(txtQNo.Text) && string.IsNullOrEmpty(txtToP.Text) && Drop_status.SelectedValue=="Status")

            {
                GridView1.DataSourceID = null;
                string sqlQuery;
                SqlConnection sqlCon = new SqlConnection(connectionString);
                sqlCon.Open();
                sqlQuery = "SELECT *FROM RTD WHERE [Client Name] LIKE '%" + txtClientName.Text + "%'";
                SqlCommand cmd = new SqlCommand(sqlQuery, sqlCon);
                cmd.ExecuteNonQuery();
                SqlDataAdapter DA = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                DA.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();
                sqlCon.Close();
                int counter = GridView1.Rows.Count;
                resultLbl.Visible = true;
                resultLbl.Text = "Found " + counter + " Record(s)";
            }









            //----------------Qabala Number Search----------------------------------------------------------------------------------
            if (string.IsNullOrEmpty(txtClientName.Text) && drop_QabalaType.SelectedValue == "Qabala Type" && !string.IsNullOrEmpty(txtQNo.Text) && string.IsNullOrEmpty(txtToP.Text) && txtDate2.Text == "")

            {

                GridView1.DataSourceID = null;
                string sqlQuery;
                SqlConnection sqlCon = new SqlConnection(connectionString);
                sqlCon.Open();
                sqlQuery = "SELECT *FROM RTD WHERE [Qabala Number] LIKE '%" + txtQNo.Text + "%'";
                SqlCommand cmd = new SqlCommand(sqlQuery, sqlCon);
                cmd.ExecuteNonQuery();
                SqlDataAdapter DA = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                DA.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();
                sqlCon.Close();
                int counter = GridView1.Rows.Count;
                resultLbl.Visible = true;
                resultLbl.Text = "Found " + counter + " Record(s)";
            }
            ////--------------------------------------------------------------------------------------------------
            //----------------Qabala Type of Property----------------------------------------------------------------------------------
            if (string.IsNullOrEmpty(txtClientName.Text) && drop_QabalaType.SelectedValue == "Qabala Type" && string.IsNullOrEmpty(txtQNo.Text) && !string.IsNullOrEmpty(txtToP.Text) && txtDate2.Text == "")

            {

                GridView1.DataSourceID = null;
                string sqlQuery;
                SqlConnection sqlCon = new SqlConnection(connectionString);
                sqlCon.Open();
                sqlQuery = "SELECT *FROM RTD WHERE [Type of Property] LIKE '%" + txtToP.Text + "%'";
                SqlCommand cmd = new SqlCommand(sqlQuery, sqlCon);
                cmd.ExecuteNonQuery();
                SqlDataAdapter DA = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                DA.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();
                sqlCon.Close();
                int counter = GridView1.Rows.Count;
                resultLbl.Visible = true;
                resultLbl.Text = "Found " + counter + " Record(s)";
            }
            ////--------------------------------------------------------------------------------------------------
            ////----------------Qabala Type of Property----------------------------------------------------------------------------------
            if (string.IsNullOrEmpty(txtClientName.Text) && drop_QabalaType.SelectedValue != "Qabala Type" && string.IsNullOrEmpty(txtQNo.Text) && string.IsNullOrEmpty(txtToP.Text) && txtDate2.Text == "")

            {

                GridView1.DataSourceID = null;
                string sqlQuery;
                SqlConnection sqlCon = new SqlConnection(connectionString);
                sqlCon.Open();
                sqlQuery = "SELECT *FROM RTD WHERE [Qabala Type] = '" + drop_QabalaType.SelectedValue + "'";
                SqlCommand cmd = new SqlCommand(sqlQuery, sqlCon);
                cmd.ExecuteNonQuery();
                SqlDataAdapter DA = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                DA.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();
                sqlCon.Close();
                int counter = GridView1.Rows.Count;
                resultLbl.Visible = true;
                resultLbl.Text = "Found " + counter + " Record(s)";
            }

            //------------------------------------------
            ////----------------------------------------------Qabala Type and Qabala No and Property Type----------------------------------------------------

            if (drop_QabalaType.SelectedValue != "Qabala Type" && !string.IsNullOrEmpty(txtQNo.Text) && !string.IsNullOrEmpty(txtToP.Text) && Drop_status.SelectedValue == "Status")

            {

                GridView1.DataSourceID = null;
                string sqlQuery;
                SqlConnection sqlCon = new SqlConnection(connectionString);
                sqlCon.Open();
                sqlQuery = "SELECT *FROM RTD WHERE [Qabala Type]='" + drop_QabalaType.SelectedValue + "' AND [Qabala Number] = '" + txtQNo.Text + "' AND [Type of Property] LIKE '"+txtToP.Text+"'";
                SqlCommand cmd = new SqlCommand(sqlQuery, sqlCon);
                cmd.ExecuteNonQuery();
                SqlDataAdapter DA = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                DA.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();
                sqlCon.Close();
                int counter = GridView1.Rows.Count;
                resultLbl.Visible = true;
                resultLbl.Text = "Found " + counter + " Record(s)";
            }
        }
        // END OF SEARCH
        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {

            DataTable dt = new DataTable();
            dt.Columns.Add("id");
            dt.Columns.Add("[Client Name]");
            dt.Columns.Add("[Released Title Deeds]");
            dt.Columns.Add("[Released By]");
            dt.Columns.Add("[Released Date]");
            dt.Columns.Add("[Based On]");
            dt.Columns.Add("[Pending Item For Accomplishment]");
            dt.Columns.Add("[Received By]");
            dt.Columns.Add("Status");
            //dt.Columns.Add("InsertedBy");
            //dt.Columns.Add("UpdatedBy");
            //dt.Columns.Add("ApprovedBy");

            foreach (GridViewRow gw in GridView1.Rows)
            {

                var chkSelect = gw.FindControl("chkSelect") as CheckBox;
                if (chkSelect.Checked)
                {
                    string Val1 = (gw.FindControl("Label1") as Label).Text;//
                    string Val2 = (gw.FindControl("Label2") as Label).Text;//
                    string Val3 = (gw.FindControl("Label3") as Label).Text;//
                    string Val4 = (gw.FindControl("Label4") as Label).Text;//
                    string Val5 = (gw.FindControl("Label5") as Label).Text;//
                    string Val6 = (gw.FindControl("Label6") as Label).Text;//
                    string Val7 = (gw.FindControl("Label7") as Label).Text;//
                    string Val8 = (gw.FindControl("Label8") as Label).Text;//
                    string Val9 = (gw.FindControl("Label9") as Label).Text;//
                                                                           //string Val10 = (gw.FindControl("Label10") as Label).Text;//
                                                                           //string Val11 = (gw.FindControl("Label11") as Label).Text;//
                                                                           //string Val12 = (gw.FindControl("Label12") as Label).Text;//


                    dt.Rows.Add(Val1, Val2, Val3, Val4, Val5, Val6, Val7, Val8, Val9);
                }
            }

            //--------------------------------
            var products = dt;
            ExcelPackage excel = new ExcelPackage();
            var workSheet = excel.Workbook.Worksheets.Add("RTD");
            var totalCols = products.Columns.Count;
            var totalRows = products.Rows.Count;

            for (var col = 1; col <= totalCols; col++)
            {
                workSheet.Cells[1, col].Value = products.Columns[col - 1].ColumnName;
            }
            for (var row = 1; row <= totalRows; row++)
            {
                for (var col = 0; col < totalCols; col++)
                {
                    workSheet.Cells[row + 1, col + 1].Value = products.Rows[row - 1][col];
                }
            }
            using (var memoryStream = new MemoryStream())
            {
                Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                Response.AddHeader("content-disposition", "attachment;  filename=[Released Title Deeds].xlsx");
                excel.SaveAs(memoryStream);
                memoryStream.WriteTo(Response.OutputStream);
                Response.Flush();
                Response.End();
            }
        }

        protected void addNew_Click(object sender, ImageClickEventArgs e)
        {
            //Session.Remove("RTD");
            Response.Redirect("new_rtd.aspx");
        }

        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {

        }

        // SELECT All CODE
        protected void chkb1_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox ChkBoxHeader = (CheckBox)GridView1.HeaderRow.FindControl("chkb1");
            foreach (GridViewRow row in GridView1.Rows)
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

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "edit")
            {
                Session["RTD_ID"] = e.CommandArgument.ToString();
                SqlConnection sqlCon = new SqlConnection(connectionString);
                string query = "SELECT *FROM RTD where id = '" + Session["RTD_ID"].ToString() + "'";
                SqlCommand sqlcmd = new SqlCommand(query, sqlCon);
                sqlCon.Open();
                SqlDataReader rdr = sqlcmd.ExecuteReader();
                if (rdr.Read())
                {
                    //READ THE DATA FROM COLLATERAL DATABASE AND SAVE THEM INTO SESSION
                    Session["id"] = (string)rdr["id"].ToString();
                    Session["CN"] = (string)rdr["Client Name"].ToString();
                    Session["LT"] = (string)rdr["Loan Type"].ToString();
                    Session["qt"] = (string)rdr["Qabala Type"].ToString();
                    Session["qn"] = (string)rdr["Qabala Number"].ToString();
                    Session["qd"] = (string)rdr["Qabala Date"].ToString();
                    Session["oq"] = (string)rdr["Owner of Qabala"].ToString();
                    Session["tp"] = (string)rdr["Type of Property"].ToString();
                    Session["vp"] = (string)rdr["Value of Property"].ToString();
                    Session["cur"] = (string)rdr["Currency"].ToString();
                    Session["pe"] = (string)rdr["Property Evaluator"].ToString();
                    Session["address"] = (string)rdr["Address"].ToString();
                    Session["LED"] = (string)rdr["Last Evaluation Date"].ToString();
                    Session["rmn"] = (string)rdr["Registered Mortgage No"].ToString();
                    Session["rmd"] = (string)rdr["Registered Mortgage Date"].ToString();
                    Session["mv"] = (string)rdr["Mortgage Value"].ToString();
                    Session["hkn"] = (string)rdr["Hujat Khaat Number"].ToString();
                    Session["hkd"] = (string)rdr["Hujat Khaat Date"].ToString();
                    Session["hkv"] = (string)rdr["Hujat Khaat Vallue"].ToString();
                    Session["emn"] = (string)rdr["Equitable Mortgage Number"].ToString();
                    Session["emd"] = (string)rdr["Equitable Mortgage Date"].ToString();

                    Session["RD"] = (string)rdr["Released Date"].ToString();
                    Session["RB"] = (string)rdr["Released By"].ToString();
                    Session["RTD"] = (string)rdr["Released Title Deeds"].ToString();
                    Session["BO"] = (string)rdr["Based On"].ToString();
                    Session["PIFA"] = (string)rdr["Pending Item For Accomplishment"].ToString();

                    Session["duedate"] = (string)rdr["Due Date"].ToString();



                    Session["RECB"] = (string)rdr["Received By"].ToString();
                    Session["Status"] = (string)rdr["Status"].ToString();
                    Session["Remark"] = (string)rdr["Remark"].ToString();

                    Session["ALS"] = (string)rdr["Add Loan Status"].ToString();
                    Session["IB"] = (string)rdr["Inserted By"].ToString();
                    Session["UB"] = (string)rdr["Updated By"].ToString();
                    Session["AB"] = (string)rdr["Approved By"].ToString();
                    Session["InDate"] = (string)rdr["Inserted Date"].ToString();


                    sqlCon.Close();
                    sqlCon.Dispose();
                    Response.Redirect("new_rtd.aspx");
                }
            }
        }

      

        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {

            if (!CheckBox1.Checked)
            {
                GridView1.Columns[11].Visible = false;
                GridView1.Columns[12].Visible = false;
                GridView1.Columns[13].Visible = false;
                GridView1.Columns[14].Visible = false;
                GridView1.Columns[15].Visible = false;
                GridView1.Columns[16].Visible = false;
                GridView1.Columns[17].Visible = false;
                GridView1.Columns[18].Visible = false;
                GridView1.Columns[19].Visible = false;
                GridView1.Columns[20].Visible = false;
                GridView1.Columns[21].Visible = false;
                GridView1.Columns[22].Visible = false;
                GridView1.Columns[23].Visible = false;
                GridView1.Columns[24].Visible = false;
                GridView1.Columns[25].Visible = false;
                GridView1.Columns[26].Visible = false;
                GridView1.Columns[27].Visible = false;
                GridView1.Columns[28].Visible = false;
                GridView1.Columns[29].Visible = false;
                GridView1.Columns[30].Visible = false;
                }
                else
                {
             
                GridView1.Columns[0].Visible = true;
                GridView1.Columns[1].Visible = true;
                GridView1.Columns[2].Visible = true;
                GridView1.Columns[3].Visible = true;
                GridView1.Columns[4].Visible = true;
                GridView1.Columns[5].Visible = true;
                GridView1.Columns[6].Visible = true;
                GridView1.Columns[7].Visible = true;
                GridView1.Columns[8].Visible = true;
                GridView1.Columns[9].Visible = true;
                GridView1.Columns[10].Visible = true;
                GridView1.Columns[11].Visible = true;
                GridView1.Columns[12].Visible = true;
                GridView1.Columns[13].Visible = true;
                GridView1.Columns[14].Visible = true;
                GridView1.Columns[15].Visible = true;
                GridView1.Columns[16].Visible = true;
                GridView1.Columns[17].Visible = true;
                GridView1.Columns[18].Visible = true;
                GridView1.Columns[19].Visible = true;
                GridView1.Columns[20].Visible = true;
                GridView1.Columns[21].Visible = true;
                GridView1.Columns[22].Visible = true;
                GridView1.Columns[23].Visible = true;
                GridView1.Columns[24].Visible = true;
                GridView1.Columns[25].Visible = true;
                GridView1.Columns[26].Visible = true;
                GridView1.Columns[27].Visible = true;
                GridView1.Columns[28].Visible = true;
                GridView1.Columns[29].Visible = true;
                GridView1.Columns[30].Visible = true;
               
            }
        }





        protected void txtDate2_TextChanged(object sender, EventArgs e)
        {

        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            txtDate1.Text = "";
            txtDate2.Text = "";
        }
    }
}