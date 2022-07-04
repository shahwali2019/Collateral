<%@ Page Title="" Language="C#" MasterPageFile="~/loginMaster.Master" AutoEventWireup="true" CodeBehind="Loging.aspx.cs" Inherits="Collateral_int.WebForm1" EnableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
      
    <header>
<link href="../Content/bootstrap.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../Scripts/bootstrap.min.js"></script>
<script type="text/javascript" src="../Scripts/jQuery/jquery-3.3.1.min.js"></script>
     
      <style>

          
          .auto-style3 {
              width: 250px;
          }

          td
          {
              padding-bottom:5px;
                
          }
          .password{
              color:#fff;
              padding:5px 5px; 
              border:none;
              background:rgba(29, 60, 127, 0.37);
              font-family:Bahnschrift;
              text-decoration:none;
              font-size:small;
          }
          .password:hover{
              text-decoration:none;
          }
          .changepass:hover{
              text-decoration:none;
              color:#1d3c7f
          }
          </style>


             </header>
    <div class="main" style="background-image:url('image/bg.png'); margin-top:50px; padding: 0 20px 0px 50px;">
        <div style=" width:250px; padding-left:10px;">
           <asp:Label runat="server" ID="msgTxtLbl" ForeColor="Red" Visible="False" Font-Size="X-Small" Font-Bold="True" Font-Names="Bahnschrift">The user name or password is wrong!</asp:Label>
            <br />
            </div>
          
        <div class="sec2" style="width:250px;">
            <div class="container" style=" width:250px;">
                <div class="auto-style3">
                 
                    <div>
                      
                  <div style="">

                      <span  class="label label-success" style="font-family:Bahnschrift; font-size:small">Sign In</span>
                   
                        <table style="padding-bottom:5px;">
                            <tr>
                                <td>
                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                        <ContentTemplate>
                                            <asp:TextBox    ID="txtusername" placeholder="Username" runat="server" Height="45px" Width="230px" CssClass="form-control" BackColor="#CCFF99" AutoPostBack="True" OnTextChanged="txtusername_TextChanged"></asp:TextBox>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </td>
                                <td>
                                    &nbsp;&nbsp;&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtusername" ErrorMessage="Required!" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="X-Small" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>

                             <tr>
                                <td>
                                     <asp:TextBox  ID="txtpassword" placeholder="Password" TextMode="Password" runat="server" Height="45px" Width="230px" CssClass="form-control" BackColor="#CCFF99" ></asp:TextBox>
                 
                                </td>
                                <td>
                                    &nbsp;&nbsp;&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtpassword" ErrorMessage="Required!" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="X-Small" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                        </table>
                  </div>
                   
                        <asp:Button ID="Signin" runat="server" Font-Bold="True" Height="34px" OnClick="Signin_Click" Text="Sign in" Width="75px" CssClass="btn-success" Font-Names="Bahnschrift" BackColor="#1D3C7F" BorderStyle="None" />
                        <br />
                        <br />
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                            <ContentTemplate>
                                 <asp:LinkButton ID="LinkButton1" runat="server" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Small" PostBackUrl="https://aibnbw12wsus01:9251/showLogin.cc" ForeColor="#0033CC">RESET PASSWORD</asp:LinkButton>
            
                        <br />
            
                            </ContentTemplate>
                        </asp:UpdatePanel>
                </div>
            </div>
                <%-- <hr style="border-bottom:10px solid #1d3c7f;" />--%>
        </div>
             <br />
                        <br />
                        <br />
            <br />  <br />
                        <br />
                        <br />
            <br />
         </div>
      

    </div>
</asp:Content>
