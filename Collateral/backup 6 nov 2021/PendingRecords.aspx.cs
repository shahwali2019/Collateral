using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace Collateral_int
{
    public partial class PendingRecords : System.Web.UI.Page
    {
        string Val1, Val2, Val3, Val4, Val5, Val6, Val7, Val8, Val9, Val10, Val11, Val12, Val13, Val14;

        protected void Button1_Click(object sender, EventArgs e)
        {
            string fullUsername = User.Identity.Name;
            int index_domain = fullUsername.IndexOf("AIB\\");
            string username = fullUsername.Substring(fullUsername.IndexOf("\\") + 1);

            GridView2.DataSourceID = null;
            string sqlQuery;
            SqlConnection sqlCon = new SqlConnection(connectionString);
            sqlCon.Open();
            sqlQuery = "select *from Loanadder_tbl3 where UpdatedBy like '%" + searchbarTxt.Text.TrimStart().TrimEnd() + "%'";

            SqlCommand cmd = new SqlCommand(sqlQuery, sqlCon);
            cmd.Parameters.Add(new SqlParameter("@SEARCH", searchbarTxt.Text));
            SqlDataAdapter DA = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            DA.Fill(ds);
            GridView2.DataSource = ds;
            GridView2.DataBind();
            sqlCon.Close();
            int counter = GridView2.Rows.Count;
            if (counter <= 1)
            {
                resultLbl.Visible = true;
                resultLbl.Text = "Found " + counter + " record for : " + searchbarTxt.Text;
            }
            else
            {
                resultLbl.Visible = true;
                resultLbl.Text = "Found " + counter + " record(s) for : " + searchbarTxt.Text;
            }
            if (searchbarTxt.Text == "")
            {
                resultLbl.Visible = true;
                resultLbl.Text = "All Records";
            }
        }

        /// <summary>
        /// end of search button
        /// </summary>

        string WhoUpdateID,WhoUpdate;
        string connectionString =  ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
        SqlCommand sqlcmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (GridView2.Rows.Count <= 0)
            {
                Lblresult.Text = "No pending records found !";
                Lblresult.ForeColor = System.Drawing.Color.Blue;
                Lblresult.Visible = true;
               
            }

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


                //if (Session["loading"] == null && Access_role == "1")
                if (Access_role == "1")
            {
                //Response.Redirect("loading.aspx");
                //Response.Redirect("PendingRecords.aspx");
            }
            //---------------------------------------------------------------------------------




            
                foreach (GridViewRow gw in GridView2.Rows)
                {
                WhoUpdateID = (gw.FindControl("Label15") as Label).Text;
                   
                }

            //--------------------------------------------------------------


            string connectionString2 = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
            using (SqlConnection sqlCon2 = new SqlConnection(connectionString2))
            {
                sqlCon2.Open();

                string query = "SELECT *FROM loanadder_tbl3 WHERE id='" + WhoUpdateID + "'";
                SqlCommand sqlcmd = new SqlCommand(query, sqlCon2);
                SqlDataReader dr;
                dr = sqlcmd.ExecuteReader();
                while (dr.Read())
                {
                    WhoUpdate = dr["UpdatedBy"].ToString();
                   
                }
                dr.Close();
                sqlCon2.Close();
                sqlCon2.Dispose();
            }
            //------------------------------------------------------------------------------

        }//end of page load

        protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string fullUsername = User.Identity.Name;
            int index_domain = fullUsername.IndexOf("AIB\\");
            string username = fullUsername.Substring(fullUsername.IndexOf("\\") + 1);


            //-----------When Approve Btn is pressed-----------------------
            if (e.CommandName == "Insert")
            {
                Session["pid"] = e.CommandArgument.ToString();
              
               
                    //=====================================================================
                    string connectionString =  ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {

                    

                    foreach (GridViewRow gw in GridView2.Rows)
                    {

                        //for (int i = 0; i < GridView2.Rows.Count; i++)
                        //{

                            Val1 = (gw.FindControl("Label15") as Label).Text;
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
                        //********************************************************
                            sqlCon.Open();
                            string query = "UPDATE [dbo].[Loanadder_tbl] SET" +
                                " CID = @CID," +
                                "bname = @bname," +
                                "pdate = @pdate," +
                                "telecom = @telecom," +
                                "dino = @dino," +
                                "ourRef = @ourRef," +
                                "CardSerialStart= @css," +
                                "CardSerialEnd = @CSE," +
                                "Qty = @qty," +
                                "CartonValAfn = @Carton," +
                                "status = @status," +
                                "ReleaseDate = @ReleaseDate," +
                                "RotationDate = @rotation," +
                                "UpdatedBy ='"+WhoUpdate+ "',ApprovedBy='"+ username+"'  where id ='" + Val1 + "'";

                            SqlCommand sqlcmd = new SqlCommand(query, sqlCon);
                            //==========catch selected data=================================

                            //--------------------------------------------------

                            sqlcmd.Parameters.AddWithValue("@CID", Val2);
                            sqlcmd.Parameters.AddWithValue("@bname", Val3);
                            sqlcmd.Parameters.AddWithValue("@pdate", Val4);

                            sqlcmd.Parameters.AddWithValue("@telecom", Val5);
                            sqlcmd.Parameters.AddWithValue("@dino", Val6);
                            sqlcmd.Parameters.AddWithValue("@ourRef", Val7);
                            sqlcmd.Parameters.AddWithValue("@css", Val8);
                            sqlcmd.Parameters.AddWithValue("@CSE", Val9);

                            sqlcmd.Parameters.AddWithValue("@qty", Val10);
                            sqlcmd.Parameters.AddWithValue("@Carton", Val11);


                            sqlcmd.Parameters.AddWithValue("@status", Val12);
                            sqlcmd.Parameters.AddWithValue("@ReleaseDate", Val13);
                            sqlcmd.Parameters.AddWithValue("@rotation", Val14);

                            sqlcmd.ExecuteNonQuery();

                            Lblresult.Text = "Pending record updated successfully!";
                            Lblresult.ForeColor = System.Drawing.Color.Blue;
                            Lblresult.Visible = true;
                            //----------------------------------------------



                            //================================================
                            //  sqlcmd2.Parameters.AddWithValue("@id", maxID);
                            sqlCon.Close();

                     
                        using (SqlConnection sqlCon2 = new SqlConnection(connectionString))
                        {
                                string id = Val1; //Session["pid"].ToString();
                            sqlCon2.Open();
                            string Delquery = "delete FROM Loanadder_tbl3 where id='" + id + "'";
                            SqlCommand sqlcmdDel = new SqlCommand(Delquery, sqlCon2);

                                sqlcmdDel.ExecuteNonQuery();
                            sqlCon2.Close();
                            Session.Remove("pid");
                        }
                        //    break;
                        //}
                    }//==========================================end of FOREACH
                }

                GridView2.DataSourceID = "SqlCon2";
                GridView2.DataBind();

                //=======================================================================
                //Response.Redirect("PledgeEditMode.aspx");
            }

            //--------------------------------------
            //    // end of approve link
            //-------------------------------------------------------------------
            if (e.CommandName == "delete")
                    {
                        Session["pid"] = e.CommandArgument.ToString();
                        using (SqlConnection sqlCon2 = new SqlConnection(connectionString))
                        {
                            string id = Session["pid"].ToString();
                            sqlCon2.Open();
                            string query1 = "delete FROM Loanadder_tbl3 where id='" + id + "'";
                            SqlCommand sqlcmd1 = new SqlCommand(query1, sqlCon2);
                            sqlcmd1.ExecuteNonQuery();
                            sqlCon2.Close();
                            Session.Remove("pid");
                        }
                        GridView2.DataSourceID = "SqlCon2";
                        GridView2.DataBind();
                        Lblresult.Text = "The Pending Record for update was rejected!";
                        Lblresult.Visible = true;
                        Lblresult.ForeColor = System.Drawing.Color.Red;
            }// end of reject link
                }
            }

        }
//    }
//}