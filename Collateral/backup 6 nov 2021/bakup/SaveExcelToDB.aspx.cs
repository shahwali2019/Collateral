using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data;
using System.Data.SqlClient;
using System.Data.Common;
using System.Configuration;
using ClosedXML.Excel;
using System.IO;
using System.Text;

namespace Collateral_int
{
    public partial class SaveExcelToDB : System.Web.UI.Page
    {
        string val1;
        //string DownloadPath = @"\\192.168.0.4\groups\TFL\Collateral Management\Excel File\";
        string UploadedFileName;
        public void typeChanger()// to convert pdate datatype
        {
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
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["loading"] == null)
            //{
            //    Response.Redirect("loading.aspx");
            //}
            //GridView1.DataSourceID = null;
            ////------------------------------------------------------------
            //if ((string)Session["Sid"] == "vuser")
            //{
            
            //    GridView1.Columns[1].Visible = false;
            //    GridView1.Columns[5].Visible = false;
            //    GridView1.Columns[0].Visible = false;
            //    Button1.Visible = false;
            //}
                        string fullUsername = User.Identity.Name;
            int index_domain = fullUsername.IndexOf("AIB\\");
            string username = fullUsername.Substring(fullUsername.IndexOf("\\") + 1);
            Label1.Text = username;
            //--------------------------------------------------------

            if (!IsPostBack)
            {
                BindGrid();
            }


            //-------------------Get The old max ID before insert new record to LoanadderTbl----------------------

            string ConStr = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
            int maxId;
            using (var conn = new SqlConnection(ConStr))
            using (var command = new SqlCommand("GetOldmaxID", conn)
            {
                CommandType = CommandType.StoredProcedure
            })
            {
                conn.Open();
                maxId = command.ExecuteNonQuery();
                conn.Close();
                conn.Dispose();
            }
        }
        private void BindGrid()
        {
            string constr = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "SELECT *FROM tblFiles WHERE id=(select MAX(id) FROM tblFiles)";
                    cmd.Connection = con;
                    con.Open();
                    GridView1.DataSource = cmd.ExecuteReader();
                    GridView1.DataBind();
                    con.Close();
                }
            }
        }
        //-------------------------------------
        protected void Upload(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                //-----------------------------------
                string folderPath = @"\\192.168.0.4\groups\TFL\Collateral Management\Excel File\";

                if (!Directory.Exists(folderPath))
                {
                    Directory.CreateDirectory(folderPath);
                }

                //Save the File to the Directory (Folder).
                FileUpload1.SaveAs(folderPath + Path.GetFileName(FileUpload1.FileName));
                //-----------------------------Open uploaded file for cross check by admin
                string filePath = @"\\192.168.0.4\groups\TFL\Collateral Management\Excel File\" + FileUpload1.FileName;
                if (!File.Exists(filePath))
                {
                    return;
                }


                //string argument = " / select, \"" + folderPath + "\"";

                //System.Diagnostics.Process.Start("explorer.exe", argument);

                //------------------------------------
                string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                string contentType = FileUpload1.PostedFile.ContentType;
                using (Stream fs = FileUpload1.PostedFile.InputStream)
                {
                    using (BinaryReader br = new BinaryReader(fs))
                    {
                        byte[] bytes = br.ReadBytes((Int32)fs.Length);
                        string constr = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                        using (SqlConnection con = new SqlConnection(constr))
                        {
                            string query = "insert into tblFiles values (@Name, @ContentType, @Data,@uploader)";
                            using (SqlCommand cmd = new SqlCommand(query))
                            {
                                string fullUsername = User.Identity.Name;
                                string username = fullUsername.Substring(fullUsername.IndexOf("\\") + 1);
                                cmd.Connection = con;
                                cmd.Parameters.AddWithValue("@Name", filename);
                                cmd.Parameters.AddWithValue("@ContentType", contentType);
                                cmd.Parameters.AddWithValue("@Data", bytes);
                                cmd.Parameters.AddWithValue("@uploader", username);
                                con.Open();
                                cmd.ExecuteNonQuery();
                                con.Close();
                            }
                        }
                    }
                }
                Response.Redirect(Request.Url.AbsoluteUri);
            }//end of if
            else
                msg.Visible = true;
            msg.Text = "Please select a file to upload!";
            msg.ForeColor = System.Drawing.Color.Red;
        }
        //-------------------------------------------------------
        protected void DownloadFile(object sender, EventArgs e)
        {
            string folderPath = @"\\192.168.0.4\groups\TFL\Collateral Management\Excel File\";
            string argument = " / select, \"" + folderPath + "\"";
            System.Diagnostics.Process.Start("explorer.exe", argument);
            //string folderPath = @"\\192.168.0.4\groups\TFL\Collateral Management\Excel File\";
            //if (!Directory.Exists(folderPath))
            //{
            //    Directory.CreateDirectory(folderPath);
            //}

            ////SAVE THE FILE TO THE DIRECTORY (FOLDER).
            //FileUpload1.SaveAs(folderPath + Path.GetFileName(UploadedFileName));
            ////OPEN UPLOADED FILE FOR CROSS CHECK BY ADMIN
            //string filePath = @"\\192.168.0.4\groups\TFL\Collateral Management\Excel File\";
            //if (!File.Exists(filePath))
            //{
            //    return;
            //}
            ////OPEN THE SELECTED FILE
            //string argument = " / select, \"" + folderPath + "\"";
            //System.Diagnostics.Process.Start("explorer.exe", argument);

            //Response.Write("<script>alert('Downloaded to 192.168.0.4/groups/TFL/Collateral Management/Excel File/ ');</script>");
            //-----------------------------------------------------------------------------------------
            //int id = int.Parse((sender as LinkButton).CommandArgument);
            //byte[] bytes;
            //string fileName, contentType, Uploader;
            //string constr = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
            //using (SqlConnection con = new SqlConnection(constr))
            //{
            //    using (SqlCommand cmd = new SqlCommand())
            //    {
            //        cmd.CommandText = "select * from tblFiles where Id=@Id";
            //        cmd.Parameters.AddWithValue("@Id", id);
            //        cmd.Connection = con;
            //        con.Open();
            //        using (SqlDataReader sdr = cmd.ExecuteReader())
            //        {
            //            sdr.Read();
            //            bytes = (byte[])sdr["Data"];
            //            contentType = sdr["ContentType"].ToString();
            //            fileName = sdr["Name"].ToString();
            //            Uploader = sdr["UPloadUser"].ToString();
            //        }
            //        con.Close();
            //    }
            //}
            ////  FileStream file = new FileStream(Server.MapPath("~/Files/") + fileName, FileMode.Create, System.IO.FileAccess.Write)
            //Response.Clear();
            //Response.Buffer = true;
            //Response.Charset = "";
            //Response.Cache.SetCacheability(HttpCacheability.NoCache);
            //Response.ContentType = contentType;
            //Response.AppendHeader("Content-Disposition", "attachment; filename=" + fileName);
            //Response.BinaryWrite(bytes);
            //Response.Flush();
            //Response.End();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            if (e.CommandName == "Select")
            {
                string ExcelFileName = e.CommandArgument.ToString();
                //---------------------
                string path = @"\\192.168.0.4\groups\TFL\Collateral Management\Excel File\" + ExcelFileName;
                try
                {
                    if (File.Exists(path))
                {
                    string connStr = @"Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + path + ";Mode=Read;Extended Properties=Excel 12.0;Persist Security Info=False";
                    OleDbConnection OleDbcon = new OleDbConnection(connStr);
                    OleDbCommand cmd = new OleDbCommand("SELECT" +

                 "[CID]," +
                 "[bname]," +
                 "[pdate]," +
                 "[Telecom] ," +
                 "[dino]," +
                 "[ourRef]," +
                 "[CardSerialStart]," +
                 "[CardSerialEnd]," +
                 "[Qty]," +
                 "[CartonValAfn]," +
                 "[status]," +
                 "[ReleaseDate]," +
                 "[RotationDate]," +
                 "[SecRotationDate] ," +
                 "[ThirdRotationDate]" +
                 "FROM  [Sheet1$]", OleDbcon);
                    OleDbDataAdapter objAdapter1 = new OleDbDataAdapter(cmd);
                    DataSet ds = new DataSet();
                    objAdapter1.Fill(ds);
                    OleDbcon.Open();
                    DbDataReader dr = cmd.ExecuteReader();

                    //-------------add excel rows to Loanadder_tbl table-----------------------
                    string constr = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                        SqlBulkCopy bulkInsert = new SqlBulkCopy(constr);
                    bulkInsert.DestinationTableName = "Loanadder_tbl";// destination table
                    bulkInsert.WriteToServer(dr);
                    OleDbcon.Close();
                    //------------------Call the GetNewMaxID SP to get the last inserted id

                    string ConStr =  ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                    int maxId;
                    using (var conn = new SqlConnection(ConStr))
                    using (var command = new SqlCommand("GetNewMaxID", conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    })
                    {
                        conn.Open();
                        maxId = command.ExecuteNonQuery();
                        conn.Close();
                        conn.Dispose();
                    }

                    //-------------------------------------Update insertedBy field from uploader ----------------------------------------------------
                    string oldID, NewID;
                    string constr2 = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                    using (SqlConnection con = new SqlConnection(constr2))
                    {
                        using (SqlCommand cmd2 = new SqlCommand())
                        {
                            cmd2.CommandText = "SELECT *FROM maxID";

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
                    // ----------------------------insert uploader name to InsertedBy-----------------
                    //----------------------------get the uploader name------------------------------
                    foreach (GridViewRow gw in GridView1.Rows)
                    {
                        val1 = (gw.FindControl("Label1") as Label).Text;
                    }
                    //---------------------------------------------------------------------------------
                    string connectionString = @"Data Source=AIBW8CAMS02;Initial Catalog=collateral;Persist Security Info=True;User ID=sma;Password=1111";
                    using (SqlConnection sqlCon = new SqlConnection(connectionString))
                    {
                        sqlCon.Open();
                        string query = "UPDATE Loanadder_tbl SET InsertedBy ='" + val1 + "', approvedBy='"+Session["Users"].ToString()+"' where id>'" + oldID + "' and id <='" + NewID + "'";
                        SqlCommand sqlcmd = new SqlCommand(query, sqlCon);
                        sqlcmd.ExecuteNonQuery();
                        sqlCon.Close();
                        sqlCon.Dispose();

                    }
                    //---------------------------------------------------------------------------------------------
                    msg.Visible = true;
                    msg.ForeColor = System.Drawing.Color.DarkOliveGreen;
                    msg.Text = "Record(s) Uploaded Successfully ! ";
                }

                //----------------------------------end of if file exist in Collateral Shared Drive-----------------
                else
                {
                    msg.Visible = true;
                    msg.ForeColor = System.Drawing.Color.Red;
                    msg.Text = "Please download the file first ,verify it, then upload it to pledge interface data source ! ";
                }
            }
                    catch (Exception ex)
            {
                    Response.Write("<br />");
                    Response.Write(ex);
                
                msg.Visible = false;
            }
        }
            //CALL TYPECHANGER FUNCTION

            typeChanger();
        }
        protected void BindGridView()

        {
            string constr = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {

                DataTable dt = new DataTable();
                SqlDataAdapter da = new SqlDataAdapter("select * from tblFiles where id = (select MAX(id) from tblFiles)", con);
                con.Open();
                da.Fill(dt);
                con.Close();
                GridView1.DataSource = dt;
                GridView1.DataBind();
                // Response.Redirect("SaveExcelToDB.aspx");

            }

        }
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

            string connectionString = @"Data Source=AIBW8CAMS02;Initial Catalog=collateral;Persist Security Info=True;User ID=sma;Password=1111";
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {

                // find student id of edit row

                string id = GridView1.DataKeys[e.RowIndex].Value.ToString();
                SqlCommand cmd = new SqlCommand("DELETE FROM tblFiles WHERE ID=" + id, sqlCon);
                sqlCon.Open();
                cmd.ExecuteNonQuery();
                sqlCon.Close();
                BindGridView();
                msg.Visible = false;
            }
            //--------------------------------------------------------
        }
        //------------------------------------------

        protected void DeleteFile(object sender, EventArgs e)
        {
            string filePath = (sender as LinkButton).CommandArgument;
            File.Delete(filePath);
            Response.Redirect(Request.Url.AbsoluteUri);
        }


        protected void Button1_Click(object sender, EventArgs e)
        {


            string[] filePaths = Directory.GetFiles(@"//192.168.0.4/groups/TFL/Collateral Management/Excel File/");
            foreach (string filePath in filePaths)
                File.Delete(@"//192.168.0.4/groups/TFL/Collateral Management/Excel File/Coll.xlsx");
            msg.Visible = true;
            msg.ForeColor = System.Drawing.Color.Red;
            msg.Text = "All Uploaded .xlsx files have been deleted from shared drive.";
        }

        protected void FileUpload1_Load(object sender, EventArgs e)
        {
            UploadedFileName = FileUpload1.FileName.ToString();
        }
    }
}
