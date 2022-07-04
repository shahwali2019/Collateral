<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="Collateral_int.register" %>
<asp:Content ID="Content1" ContentplaceholderID="MainContent" runat="server">
    <header>
<link href="../Content/bootstrap.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../Scripts/bootstrap.min.js"></script>
<script type="text/javascript" src="../Scripts/jQuery/jquery-3.3.1.min.js"></script>
     
      <style>

          .main {
              margin-top:-140px;
          }
          .auto-style1 {
              font-family: "Franklin Gothic Medium";
          }
          </style>
             </header>

    <div class="main">
    <div style=" height:100px; text-align:center;  margin-top:140px; " class="alert alert-success" role="alert">
              <h4 class="alert-heading" style=" font-family:Bahnschrift;"><strong>ADD NEW USER</strong></h4>  
           </div>
</div>
        <div class="sec2">
            <div class="container">
                <div class="content">
                    <div class="navbar-left" style="margin-left:450px;">
                        <asp:Label ID="LblEmpty" runat="server" Font-Size="Smaller" ForeColor="Red" Text="Label" Visible="False"></asp:Label>
                       <br />
                     <span class="label label-success">SignUP </span><br />
                        <asp:Label ID="LblUserID" runat="server" Font-Size="Smaller" ForeColor="Red" Text="Label" Visible="False"></asp:Label>
                    <asp:TextBox CssClass="form-control input-lg"   ID="TxtUserID" placeholder="UserID" runat="server" Height="45px" Width="365px"></asp:TextBox>
                        <asp:Label ID="LblEmail" runat="server" Font-Size="Smaller" ForeColor="Red" Text="Label" Visible="False"></asp:Label>
                        <br />                  
                    <asp:TextBox CssClass="form-control input-lg"   ID="TxtEmail" placeholder="Email" runat="server" Height="45px" Width="365px" ></asp:TextBox>
                        <asp:Label ID="LblPassword" runat="server" Font-Size="Smaller" ForeColor="Red" Text="Label" Visible="False"></asp:Label>
                        <br />
                    <asp:TextBox CssClass="form-control input-lg"   ID="TxtPassword" placeholder="Password" TextMode="Password" runat="server" Height="45px" Width="365px"></asp:TextBox><span class="auto-style1">
                        <asp:Label ID="Lblconfirm" runat="server" Font-Size="Smaller" ForeColor="Red" Text="Label" Visible="False"></asp:Label>
                   
                    &nbsp;<asp:TextBox CssClass="form-control input-lg"   ID="txtconfirm" placeholder="Confirm password" TextMode="Password" runat="server" Height="45px" Width="365px" BackColor="#CCFFFF" Font-Bold="True" Font-Names="Bahnschrift"></asp:TextBox>
                      <%--  <asp:ScriptManager ID="ScriptManager1" runat="server">
                        </asp:ScriptManager>--%>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>

                                  <span class="auto-style1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>

                                  <asp:CheckBox  AutoPostBack="true" ID="ch3" runat="server" Text="Admin"  OnCheckedChanged="ch3_CheckedChanged" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="X-Small" />
                                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:CheckBox AutoPostBack="true"  ID="ch1" runat="server" Text="Basic"  OnCheckedChanged="ch1_CheckedChanged" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="X-Small" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:CheckBox AutoPostBack="true" ID="Ch2" runat="server" Text="Intermediate" OnCheckedChanged="Ch2_CheckedChanged" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="X-Small" />
                   
                            </ContentTemplate>


                        </asp:UpdatePanel>
                        <br />

                      
                   
                        <asp:Button ID="RegisterBtn" runat="server" Font-Bold="True" Height="38px" OnClick="RegisterBtn_Click" Text="Sign up" Width="92px" CssClass="btn-link" BackColor="#FF6666" Font-Names="Bahnschrift" Font-Size="Small" />
                    
                    &nbsp;
                        <asp:Button ID="SignIn" runat="server" Font-Bold="True" Height="38px" OnClick="SignIn_Click" Text="Sign in" Width="92px" CssClass="btn-info" Font-Names="Bahnschrift" Font-Size="Small" />
                        <br />
                    <br />
                        <br />
                    <br />       
                    </div>
                    </div>
                </div>
          </div>
         </form>
        </div>
    
      </span>
</asp:Content>
