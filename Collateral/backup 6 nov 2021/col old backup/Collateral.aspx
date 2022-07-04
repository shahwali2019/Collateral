<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Collateral.aspx.cs" Inherits="Collateral_int._Default" EnableEventValidation="false" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <header>
        <%-- ............................................. --%>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
       
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <style>
           td{
               
               font-size:16px;
              
           }

            .sidenav {
                height: 100%;
                width: 0;
                position: fixed;
                z-index: 1;
                top: 0;
                left: 0;
                background-color: #111;
                overflow-x: hidden;
                transition: 0.5s;
                padding-top: 60px;
            }

                .sidenav a {
                    padding: 8px 8px 8px 32px;
                    text-decoration: none;
                    font-size: 25px;
                    color: #818181;
                    display: block;
                    transition: 0.3s;
                }

                    .sidenav a:hover {
                        color: #f1f1f1;
                    }

                .sidenav .closebtn {
                    position: absolute;
                    top: 0;
                    right: 25px;
                    font-size: 36px;
                    margin-left: 50px;
                }

            #main {
                transition: margin-left .5s;
                padding: 16px;
            }

            @media screen and (max-height: 450px) {
                .sidenav {
                    padding-top: 15px;
                }

                    .sidenav a {
                        font-size: 18px;
                    }
            }

            .Charts {
                background-color: #FFF;
                border-bottom: 1px solid #00a94f;
            }

                .Charts:hover {
                    border-bottom: 1px solid #1d3c7f;
                    background-color: #00a94f;
                    padding-left: 20px;
                    border-left: 15px solid #1d3c7f;
                }

            .Services {
                background-color: #FFF;
                border-bottom: 1px solid #00a94f;
            }

                .Services:hover {
                    border-bottom: 1px solid #1d3c7f;
                    background-color: #00a94f;
                    padding-left: 20px;
                    border-left: 15px solid #1d3c7f;
                }


            .UserDashboard {
                background-color: #fff;
                border-bottom: 1px solid #00a94f;
            }

                .UserDashboard:hover {
                    border-bottom: 1px solid #1d3c7f;
                    background-color: #00a94f;
                    border-left: 15px solid #1d3c7f;
                    padding-left: 20px;
                }


            .Reports {
                background-color: #FFF;
                border-bottom: 1px solid #00a94f;
            }

                .Reports:hover {
                    border-left: 15px solid #1d3c7f;
                    background-color: #00a94f;
                    padding-left: 20px;
                }

            .auto-style1 {
                width: 100%;
                margin: 0 auto;
            }

            .auto-style2 {
                width: 20%;
            }
          
            .sublink:hover {
                background: rgba(0, 169, 79, 0.52);
                padding-left: 40px;
            }

            .logo:hover {
                background: rgba(0, 169, 79, 0.45);
                border-bottom: 0.1em solid #00a94f;
               
            }

            .ResTable {
                
                height: 100px;
                width: 120px;
                opacity: .9;
            }
                .ResTable:hover {
                    opacity: 1;
                    border-bottom: 5px outset #1d3c7f;
                      background: rgba(0, 169, 79, 0.56);
                }
            .iconLogo {
                float: left;
                margin-bottom:20px;
                padding-right: 10px;
               
            }
            .tdText {
                padding-left: 10px;
                font-family: Bahnschrift;
                font-size: x-small;
                margin-top: -20px;
            }
                .tdText:hover {
                    padding-left: 15px;
                    color: #00a94f
                }

            .linkText {
                border-left: 7px solid #00a94f;
                padding-left: 5px;
            }
                .linkText:hover {
                    text-decoration: none;
                    border-right:7px solid #1d3c7f;
                    padding-right:5px;
                    border-left:none;
                    font-display:block;
                }
        </style>
        <script>
            function openNav() {
                document.getElementById("mySidenav").style.width = "100%";
                document.getElementById("main").style.marginLeft = "250px";
            }
            function closeNav() {
                document.getElementById("mySidenav").style.width = "0";
                document.getElementById("main").style.marginLeft = "0";
            }
        </script>
        </header>






    <div id="mySidenav" class="sidenav" style="margin-top: 50px; background-color:#FFF;font-family: Bahnschrift,'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;">
     <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
       
          <%-- 
        <a class="Charts" style="color: #1d3c7f; font-family: Bahnschrift; font-size: small;" href="#">Charts</a>
        <a class="Services" style="color: #1d3c7f; font-family: Bahnschrift; font-size: small;" href="#">Services</a>
        <a class="UserDashboard" style="color: #1d3c7f; font-family: Bahnschrift; font-size: small;" href="#">Dashboard</a>
        <a class="Reports" style="color: #1d3c7f; font-family: Bahnschrift; font-size: small;" href="#">Report</a>--%>
        <div id="containter" style="height: auto; padding: 20px 20px 20px 20px;">

            <table class="auto-style1" style="background: #fff">
                <tr style="height: 50px;">
                    <td contenteditable="true" style="color: #fff; font-family: Bahnschrift; text-align: center; background: #1d3c7f;">Setting</td>
                    <td style="color: #fff; font-family: Bahnschrift; text-align: center; background: #1d3c7f;">Charts</td>
                    <td style="color: #fff; font-family: Bahnschrift; text-align: center; background: #1d3c7f;">Pledge Upload</td>
                    <td style="color: #fff; font-family: Bahnschrift; text-align: center; background: #1d3c7f;">User Dashboard</td>
                </tr>


                <tr style="text-align: center;">
                    <td class="logo">
                        <asp:ImageButton ID="ImageButton2" runat="server" Height="50px" ImageUrl="~/image/setting.jpg" Width="80px" ToolTip="Setting" /></td>
                    <td class="logo">
                        <asp:ImageButton ID="ImageButton3" runat="server" Height="90px" ImageUrl="~/image/chart.jpg" ToolTip="Generate Report" Width="80px" /></td>

                    <td class="logo">
                        <asp:ImageButton ID="ImageButton4" runat="server" Height="50px" ImageUrl="~/image/upload.png" ToolTip="Pledge Bulk Upload" Width="80px" /></td>
                    <td class="logo">
                        <asp:ImageButton ID="ImageButton5" runat="server" ImageUrl="~/image/user2.jfif" ToolTip="User Setting" Width="80px" OnClick="ImageButton5_Click" /></td>
                </tr>


            </table>
            <br />
       
            <div style="margin: 0 auto;">
                <table class="auto-style2" style="background: #fff; margin-right: 50px; width: 100%;">
                    <tr style="height: 50px;">
                        <td style="color: #fff; font-family: Bahnschrift; padding-left: 10px; background: #1d3c7f; height: 70px">PLEDGE RECPRDS</td>
                        <td style="background: #cccccc;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td style="color: #fff; font-family: Bahnschrift; padding-left: 10px; background: #1d3c7f;">VAULT RECORDS</td>
                        <td style="background: #cccccc;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td style="color: #fff; font-family: Bahnschrift; padding-left: 10px; background: #1d3c7f;">TITLE DEEDS</td>
                    </tr>
                    <tr>
                        <td>
                            <a href="#" class="sublink" style="font-family: Bahnschrift; padding-left: 10px; font-size: x-small; color: #00a94f">Show Pledged Records</a>

                        </td>

                        <td style="background: #cccccc">&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>
                            <a href="#" class="sublink" style="font-family: Bahnschrift; padding-left: 10px; font-size: x-small; color: #00a94f">Show Vault Records</a>
                        </td>
                        <td style="background: #cccccc">&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>
                            <a href="#" class="sublink" style="font-family: Bahnschrift; padding-left: 10px; font-size: x-small; color: #00a94f">Show Title Deeds Records</a>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <a href="#" class="sublink" style="padding-bottom: 10px; font-family: Bahnschrift; padding-left: 10px; font-size: x-small; color: #00a94f">Insert Pledged Records 
                             <span style="text-align: center; height: 20px; width: 20px; margin-top: -10px; margin-left: 15px; color: #fff; font-size: 12px; border-radius: 50%; display: inline-block; font-family: Bahnschrift; background: red;">
                                 <asp:Label ID="Label2" runat="server" Text="51"></asp:Label></span></a>
                        </td>

                        <td style="background: #cccccc">&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>
                            <a href="#" class="sublink" style="padding-bottom: 10px; font-family: Bahnschrift; padding-left: 10px; font-size: x-small; color: #00a94f">Insert Vault Records 
                             <span style="text-align: center; height: 20px; width: 20px; margin-top: -10px; margin-left: 15px; color: #fff; font-size: 12px; border-radius: 50%; display: inline-block; font-family: Bahnschrift; background: red;">
                                 <asp:Label ID="Label3" runat="server" Text="51"></asp:Label></span></a>
                        </td>
                        <td style="background: #cccccc">&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>
                            <a href="#" class="sublink" style="padding-bottom: 10px; font-family: Bahnschrift; padding-left: 10px; font-size: x-small; color: #00a94f">Insert Title Deeds Records 
                             <span style="text-align: center; height: 20px; width: 20px; margin-top: -10px; margin-left: 15px; color: #fff; font-size: 12px; border-radius: 50%; display: inline-block; font-family: Bahnschrift; background: red;">
                                 <asp:Label ID="Label4" runat="server" Text="51"></asp:Label></span></a>
                        </td>
                    </tr>



                    <%-- *************************************************************** --%>
                    <tr>
                        <td>
                            <a href="#" class="sublink" style="padding-bottom: 10px; font-family: Bahnschrift; padding-left: 10px; font-size: x-small; color: #00a94f">Update Pledged Records 
                             <span style="text-align: center; height: 20px; width: 20px; margin-top: -10px; margin-left: 10px; color: #fff; font-size: 12px; border-radius: 50%; display: inline-block; font-family: Bahnschrift; background: red;">
                                 <asp:Label ID="PledgeLblForUpdate" runat="server" Text="51"></asp:Label></span></a>
                        </td>

                        <td style="background: #cccccc">&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>
                            <a href="#" class="sublink" style="padding-bottom: 10px; font-family: Bahnschrift; padding-left: 10px; font-size: x-small; color: #00a94f">Update Vault Records 
                             <span style="text-align: center; height: 20px; width: 20px; margin-top: -10px; margin-left: 10px; color: #fff; font-size: 12px; border-radius: 50%; display: inline-block; font-family: Bahnschrift; background: red;">
                                 <asp:Label ID="VaultLblForUpdate" runat="server" Text="51"></asp:Label></span></a>
                        </td>
                        <td style="background: #cccccc">&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>
                            <a href="#" class="sublink" style="padding-bottom: 10px; font-family: Bahnschrift; padding-left: 10px; font-size: x-small; color: #00a94f">Update Title Deeds Records 
                             <span style="text-align: center; height: 20px; width: 20px; margin-top: -10px; margin-left: 10px; color: #fff; font-size: 12px; border-radius: 50%; display: inline-block; font-family: Bahnschrift; background: red;">
                                 <asp:Label ID="DeedsLblForUpdate" runat="server" Text="51"></asp:Label></span></a>
                        </td>
                    </tr>


                </table>

            </div>


        </div>

    </div>
    <br />
    <div id="main" style="width: 30px; font-size: 10px; color: #00a94f; text-align: center;" runat="server" visible="true">
       
        <span style="padding:5px 5px; background:rgba(100, 189, 79, 0.45); border-radius:50% 50%; font-size: 15px; cursor: pointer" onclick="openNav()">&#9776;</span>
    
    </div>




    <div>

        <span style="color: #007acc; font-size: 12px; font-family: Bahnschrift; margin-top: 190px;">
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        </span>
    </div>

    <div class="table-responsive" style="padding-bottom:100px; ">

        <table class="table">

            <tbody>
              
                <tr>
                   
                    <td class="ResTable">
                        <div class="iconLogo">
                            <asp:Image ID="Image1" runat="server" ImageUrl="~/image/TelecomIcons.jfif" Height="30" Width="30" />
                        </div>
                        <br />
                        <div class="tdText">
                            <asp:LinkButton PostBackUrl="~/loan.aspx" CssClass="linkText" ID="LinkButton1" runat="server">PLEDGED RECORDS</asp:LinkButton>
                        </div>
                        <br />
                        <div class="tdText">
                            <asp:LinkButton PostBackUrl="~/SaveExcelToDB.aspx" CssClass="linkText" ID="LinkButton4" runat="server">PLEDGE UPLOAD</asp:LinkButton>
                        </div>
                          <br />
                        <div class="tdText">
                            <asp:LinkButton PostBackUrl="~/addnew.aspx" CssClass="linkText" ID="LinkButton10" runat="server">NEW PLEDGE</asp:LinkButton>
                        </div>
                        <br />
                        <div class="tdText" style="margin-left:30px">
                            <asp:LinkButton PostBackUrl="~/PendingRecords.aspx" CssClass="linkText" ID="LinkButton5" runat="server">PLEDGE APPROVAL</asp:LinkButton>
                        </div>


                    </td>
                    <td class="ResTable">
                        <div class="iconLogo">
                            <asp:Image ID="Image2" runat="server" ImageUrl="~/image/VAULT.png" Height="30" Width="30" />
                        </div>
                        <br />
                        <div class="tdText">
                            <asp:LinkButton PostBackUrl="~/wak.aspx" CssClass="linkText" ID="LinkButton2" runat="server">VAULT RECORDS</asp:LinkButton>
                        </div>
                        <br />
                        <div class="tdText">
                             <asp:LinkButton PostBackUrl="~/new_wak.aspx" CssClass="linkText" ID="LinkButton7" runat="server">NEW VAULT</asp:LinkButton>
                            
                        </div>
                        <br />
                        <div class="tdText">
                           <asp:LinkButton PostBackUrl="~/wak_pending.aspx" CssClass="linkText" ID="LinkButton6" runat="server">VAULT APPROVAL</asp:LinkButton>
                        </div>


                    </td>
                    <td class="ResTable">
                        <div class="iconLogo">
                            <asp:Image ID="Image3" runat="server" ImageUrl="~/image/deeds.png" Height="30" Width="30" />
                        </div>
                        <br />
                        <div class="tdText">
                            <asp:LinkButton PostBackUrl="~/RTDL.aspx" CssClass="linkText" ID="LinkButton3" runat="server">TITLE DEEDS</asp:LinkButton>
                        </div>
                        <br />
                        <div class="tdText">
                                <asp:LinkButton PostBackUrl="~/new_rtd.aspx" CssClass="linkText" ID="LinkButton9" runat="server">NEW DEEDS</asp:LinkButton>
                           
                        </div>
                        <br />
                        <div class="tdText">
                         <asp:LinkButton PostBackUrl="~/RTD_pending.aspx" CssClass="linkText" ID="LinkButton8" runat="server">DEEDS APPROVAL</asp:LinkButton>
                        </div>
                    </td>
                </tr>
                 <tr>
                   
                    <td class="ResTable">
                        <div class="iconLogo">
                            <asp:Image ID="Image4" runat="server" ImageUrl="~/image/ACGF.png" ToolTip="Afghanistan Credit Grantee Foundation" Height="30" Width="40" />
                        </div>
                        <br />
                        <div class="tdText">
                            <asp:LinkButton PostBackUrl="~/acgf_records.aspx" CssClass="linkText" ID="LinkButton11" runat="server">ACGF RECORDS</asp:LinkButton>
                        </div>
                     
                          <br />
                        <div class="tdText">
                            <asp:LinkButton PostBackUrl="~/addNEW_acgf.aspx" CssClass="linkText" ID="LinkButton13" runat="server">NEW ACGF</asp:LinkButton>
                        </div>
                        <br />
                        <div class="tdText">
                            <asp:LinkButton PostBackUrl="~/acfg_pending__records.aspx" CssClass="linkText" ID="LinkButton14" runat="server">ACGF APPROVAL</asp:LinkButton>
                        </div>
                    </td>

                         <td class="ResTable">
                        <div class="iconLogo">
                            <asp:Image ID="Image5" runat="server" ImageUrl="~/image/MCU.png" Height="30" Width="30" />
                        </div>
                        <br />
                        <div class="tdText">
                            <asp:LinkButton PostBackUrl="~/mcu_record.aspx" CssClass="linkText" ID="LinkButton12" runat="server">MANDATORY CLEAN-UP RECORDS</asp:LinkButton>
                        </div>
                      
                          <br />
                        <div class="tdText">
                            <asp:LinkButton PostBackUrl="~/new_mcu_record.aspx" CssClass="linkText" ID="LinkButton16" runat="server">NEW MANDATORY CLEAN-UP</asp:LinkButton>
                        </div>
                        <br />
                        <div class="tdText">
                            <asp:LinkButton PostBackUrl="~/mcu_pending_records.aspx" CssClass="linkText" ID="LinkButton17" runat="server">MANDATORY CLEAN-UP APPROVAL</asp:LinkButton>
                        </div>


                    </td>


                               <td class="ResTable">
                        <div class="iconLogo">
                            <asp:Image ID="Image6" runat="server" ImageUrl="~/image/loan.png" Height="30" Width="30" />
                        </div>
                        <br />
                        <div class="tdText">
                            <asp:LinkButton PostBackUrl="~/ldr_records.aspx" CssClass="linkText" ID="LinkButton15" runat="server">Loan Documents Registration  RECORDS</asp:LinkButton>
                        </div>
                      
                          <br />
                        <div class="tdText">
                            <asp:LinkButton PostBackUrl="~/newLRD_records.aspx" CssClass="linkText" ID="LinkButton18" runat="server" OnClick="LinkButton18_Click">NEW Loan Documents Registration </asp:LinkButton>
                        </div>
                        <br />
                        <div class="tdText">
                            <asp:LinkButton PostBackUrl="~/ldr_pending_records.aspx" CssClass="linkText" ID="LinkButton19" runat="server">Loan Documents Registration  APPROVAL</asp:LinkButton>
                        </div>


                    </td>



                     </tr>

                <tr>
                       <td class="ResTable">
                        <div class="iconLogo">
                            <asp:Image ID="Image7" runat="server" ImageUrl="~/image/loanConvenant.png" Height="30" Width="30" />
                        </div>
                        <br />
                        <div class="tdText">
                            <asp:LinkButton PostBackUrl="~/Loan__Covenant___Records.aspx" CssClass="linkText" ID="LinkButton20" runat="server">LOAN COVENANT RECORDS </asp:LinkButton>
                        </div>
                      
                          <br />
                        <div class="tdText">
                            <asp:LinkButton PostBackUrl="~/newLCR.aspx" CssClass="linkText" ID="LinkButton21" runat="server" OnClick="LinkButton18_Click">NEW LOAN COVENANT RECORDS</asp:LinkButton>
                        </div>
                        <br />
                        <div class="tdText">
                            <asp:LinkButton PostBackUrl="~/LCR__Pending___Records.aspx" CssClass="linkText" ID="LinkButton22" runat="server">LOAN COVENANT RECORDS APPROVAL</asp:LinkButton>
                        </div>
                    </td>


                      <td class="ResTable">
                        <div class="iconLogo">
                            <asp:Image ID="Image8" runat="server" ImageUrl="~/image/loanConvenant.png" Height="30" Width="30" />
                        </div>
                        <br />
                        <div class="tdText">
                            <asp:LinkButton PostBackUrl="~/DaytoDay.aspx" CssClass="linkText" ID="LinkButton23" runat="server">Day to Day RECORDS</asp:LinkButton>
                        </div>
                      
                          <br />
                        <div class="tdText">
                            <asp:LinkButton PostBackUrl="~/AddnewDaytoDayRecords.aspx" CssClass="linkText" ID="LinkButton24" runat="server" OnClick="LinkButton18_Click">NEW DAY TO DAY</asp:LinkButton>
                        </div>
                        <br />
                        <div class="tdText">
                            <asp:LinkButton PostBackUrl="~/DaytoDay__Pending___Records.aspx" CssClass="linkText" ID="LinkButton25" runat="server">DAY TO DAY APPROVAL</asp:LinkButton>
                        </div>
                    </td>



                    <td class="ResTable">
                        <div class="iconLogo">
                            <asp:Image ID="Image9" runat="server" ImageUrl="~/image/loanConvenant.png" Height="30" Width="30" />
                        </div>
                        <br />
                        <div class="tdText">
                            <asp:LinkButton PostBackUrl="~/mtr.aspx" CssClass="linkText" ID="LinkButton26" runat="server">Manual Transaction Records</asp:LinkButton>
                        </div>
                      
                          <br />
                        <div class="tdText">
                            <asp:LinkButton PostBackUrl="~/newmtr.aspx" CssClass="linkText" ID="LinkButton27" runat="server" OnClick="LinkButton18_Click">New Manual Transaction Record</asp:LinkButton>
                        </div>
                        <br />
                        <div class="tdText">
                            <asp:LinkButton PostBackUrl="~/mtr_pending.aspx" CssClass="linkText" ID="LinkButton28" runat="server">Manual Transaction APPROVAL</asp:LinkButton>
                        </div>
                    </td>










                </tr>






            </tbody>
        </table>
       
     
    </div>
    <table>

    </table>
    <div class="table-responsive" style="padding-bottom:100px;float:right; ">
        <table>
              <tr>
                     <td colspan="3" style="text-align:right;">
                            
                      <a href="Confirm.aspx" runat="server" id="userMsg" visible="false"> <span class="fa fa-gear <%--fa-spin--%>" style="color: Blue; font-size: 15px"></span>

                      </a>
                    
                         <asp:ImageButton ID="Newuser" runat="server" Height="15" ImageUrl="~/image/addnew.png"  ToolTip="Add new user" OnClick="Newuser_Click"/>
                         <asp:ImageButton ID="signout" runat="server" Height="15px" ImageUrl="~/image/shutdown.jpg" ToolTip="Save your job(s) and exit" Width="15px" OnClick="signout_Click" />
                     </td>
                
                </tr>
        </table>




        </div>
<%--  <div style="float: left; text-align: center;">
        <asp:Menu ID="Menu1" runat="server"
            BackColor="#0026FF" DynamicHorizontalOffset="2" Font-Names="Bahnschrift"
            Font-Size="0.8em" ForeColor="White" StaticSubMenuIndent="10px" CssClass="panel-body">
            <DynamicHoverStyle BackColor="#0094ff" ForeColor="White" />
            <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
            <DynamicMenuStyle BackColor="#B5C7DE" />
            <DynamicSelectedStyle BackColor="#00ff00" />
            <Items>
                <asp:MenuItem Text="USER DASHBOARD" Value="USER DASHBOARD" NavigateUrl="~/Confirm.aspx" ToolTip="All User Management Panel"></asp:MenuItem>
                <asp:MenuItem Text="NEW USER" Value="NU" ToolTip="Create a new user" NavigateUrl="~/register.aspx"></asp:MenuItem>
                <asp:MenuItem Text="PLEDGE UPLOAD" Value="UPLOAD" NavigateUrl="~/SaveExcelToDB.aspx" PopOutImageUrl="~/image/add.png" ToolTip="Confirm Upload Excel File"></asp:MenuItem>

                <asp:MenuItem Text="PLEDGE Records" Selected="True" Value="PI" NavigateUrl="~/loan.aspx" ToolTip="Go to Pledge Interface"></asp:MenuItem>

                <asp:MenuItem Text="PLEDGE APPROVAL" Value="NPPR" NavigateUrl="~/PendingRecords.aspx" ToolTip="Approve pending update records"></asp:MenuItem>

                <asp:MenuItem Text="EXIT" Value="EXIT" NavigateUrl="~/loging.aspx" PopOutImageUrl="~/image/add.png" ToolTip="Exit from application"></asp:MenuItem>

            </Items>
            <StaticHoverStyle BackColor="White" ForeColor="#000" Font-Bold="true" />
            <StaticMenuItemStyle HorizontalPadding="40px" VerticalPadding="20px" />
            <StaticSelectedStyle BackColor="#00ff00" />
        </asp:Menu>
    </div>--%>
<%--    <div class="main2">

        <div style="margin-left: 10px;" id="showBtn" class="auto-style3">
            <div style="text-align: center;" class="auto-style4">
                <asp:Menu ID="Menu2" runat="server"
                    BackColor="#0026FF" DynamicHorizontalOffset="2" Font-Names="Bahnschrift"
                    Font-Size="0.8em" ForeColor="White" StaticSubMenuIndent="10px" CssClass="panel-body">
                    <DynamicHoverStyle BackColor="#0094ff" ForeColor="White" />
                    <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                    <DynamicMenuStyle BackColor="#B5C7DE" />
                    <DynamicSelectedStyle BackColor="#00ff00" />
                    <DynamicItemTemplate>
                        <%# Eval("Text") %>
                    </DynamicItemTemplate>
                    <Items>
                        <asp:MenuItem Text="VAULT RECORD" Value="AWK" NavigateUrl="~/wak.aspx" Selected="True" ToolTip="Wazir Akbar Khan Interface"></asp:MenuItem>
                        <asp:MenuItem Text="VAULT APPROVAL" Value="" NavigateUrl="~/wak_pending.aspx" PopOutImageUrl="~/image/add.png" ToolTip="Confirm Upload Excel File"></asp:MenuItem>
                        <asp:MenuItem Text="TITLE DEEDS" Value="RTD" NavigateUrl="~/RTDL.aspx" ToolTip="Released Title Deeds Interface"></asp:MenuItem>
                        <asp:MenuItem Text="TITLE DEEDS APPROVAL" Value="" NavigateUrl="~/RTD_pending.aspx" ToolTip="Pending RTD Records"></asp:MenuItem>


                    </Items>
                    <StaticHoverStyle BackColor="White" ForeColor="#000" Font-Bold="true" />
                    <StaticMenuItemStyle HorizontalPadding="40px" VerticalPadding="20px" />
                    <StaticSelectedStyle BackColor="#00ff00" />
                </asp:Menu>
            </div>
        </div>



    </div>--%>

</asp:Content>
