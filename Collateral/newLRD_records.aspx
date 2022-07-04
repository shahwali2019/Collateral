<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="newLRD_records.aspx.cs" Inherits="Collateral_int.newLRD_records" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<header>
<style> 
    .auto-style30 {
            	font-size: 12px;
            	font-weight: bold;
            	font-family: Bahnschrift;
            	width: 104px;
            }
            .center {
            	text-align: center;
            	color: blue;
            	font-family: Bahnschrift, Arial;
            }
            .auto-style1 {
            	font-size: 12px;
            	font-weight: bold;
            	font-family: Bahnschrift;
            }
            .auto-style33 {
            	font-size: 12px;
            	font-weight: bold;
            	font-family: Bahnschrift;
            	width: 41px;
            	text-align: center;
            }
            .auto-style38 {
            	font-size: 12px;
            	font-weight: bold;
            	font-family: Bahnschrift;
            	width: 41px;
            	text-align: center;
            	height: 46px;
            }
            .auto-style39 {
            	width: 20px;
            	height: 46px;
            }
            .auto-style41 {
            	font-size: 12px;
            	font-weight: bold;
            	font-family: Bahnschrift;
            	height: 46px;
            	width: 104px;
            }
            .auto-style42 {
            	height: 46px;
            }
            .auto-style44 {
            	width: 91%;
            	height: 297px;
            }
            .auto-style45 {
            	font-size: 12px;
            	font-weight: bold;
            	font-family: Bahnschrift;
            	width: 149px;
            }
            .auto-style46 {
            	font-size: 12px;
            	font-weight: bold;
            	font-family: Bahnschrift;
            	height: 46px;
            	width: 149px;
            }
            .auto-style47 {
            	width: 20px;
            }
            .auto-style48 {
            	font-size: 12px;
            	font-weight: bold;
            	font-family: Bahnschrift;
            	width: 23px;
            	text-align: center;
            }
            .auto-style50 {
            	font-size: 12px;
            	font-weight: bold;
            	font-family: Bahnschrift;
            	height: 74px;
            }
            .auto-style51 {
            	font-size: 12px;
            	font-weight: bold;
            	font-family: Bahnschrift;
            	width: 149px;
            	height: 74px;
            }
            .auto-style52 {
            	font-size: 12px;
            	font-weight: bold;
            	font-family: Bahnschrift;
            	width: 41px;
            	text-align: center;
            	height: 74px;
            }
            .auto-style53 {
            	height: 74px;
            }
            .auto-style55 {
            	padding-left: 10px;
            	font-size: 12px;
            	font-weight: bold;
            	font-family: Bahnschrift;
            	width: 25px;
            }
            .auto-style56 {
            	font-size: 12px;
            	font-weight: bold;
            	font-family: Bahnschrift;
            	text-align: center;
            }
            .auto-style57 {
            	width: 209px;
            }
</style>
</header>

<br />
 
<div style=" height:120px;padding-left: 45%;border-top:10px solid #0094ff; margin-top:-20px;" class="alert alert-success" role="alert">
   <h4 class="alert-heading" style=" font-family:Bahnschrift;">
      <strong>
         <asp:Label ID="addLbl" runat="server" Text="ADD LDR RECORD" ></asp:Label>
      </strong>
   </h4>
</div>
<p style="text-align: center; font-size: 15px">
   <%--                    <asp:Label ID="Label1" runat="server" Text="Label" ForeColor="Red" EnableViewState="false"></asp:Label>--%>
   <asp:Label ID="lblMessage" Text="" runat="server" ForeColor="Red" EnableViewState="false" />
</p>
<table class="auto-style44" style="padding-bottom:5px; ">
   <tr>
      <td class="auto-style1" colspan="4">
         <asp:ImageButton ID="ImageButton1" ImageUrl="~/image/back.png" Height="20" Width="20" runat="server" OnClick="ImageButton1_Click" />
         <br />
      </td>
      <td colspan="3">
         <asp:Label ID="msg" runat="server" Visible="False" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Smaller"></asp:Label>
      </td>
   </tr>
   <tr>
      <td class="auto-style45"><strong>&nbsp;&nbsp;Received Date<span style="color:red;">*</span></strong></td>
      <td class="auto-style38">
         <asp:RequiredFieldValidator ValidationGroup="form" ID="RequiredFieldValidator1" runat="server" ErrorMessage="X" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="X-Small" ForeColor="Red" ControlToValidate="txtRecDate" ></asp:RequiredFieldValidator>
      </td>
      <td class="auto-style39">
         <asp:TextBox ID="txtRecDate"   AutoPostBack="true" OnTextChanged="txtRecDate_TextChanged" runat="server" Height="40px" Width="196px" placeholder="  Received Date..." CssClass="center" TextMode="Date"></asp:TextBox>
      </td>
      <td class="auto-style48">
         &nbsp;
      </td>
      <td class="auto-style41">
         <strong>&nbsp;Entered By<span style="color:red;">*</span></strong>
      </td>
      <td class="auto-style55">
         <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="X" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="X-Small" ForeColor="Red" ControlToValidate="txtEnterby"></asp:RequiredFieldValidator>
      </td>
      <td class="auto-style42">
         <asp:TextBox ID="txtEnterby" AutoPostBack="false" runat="server" Height="40px" Width="196px" placeholder="   Entered By..."  TabIndex="6" CssClass="center" Enabled="False"></asp:TextBox>
      </td>
   </tr>
   <tr>
      <td class="auto-style45"><strong>&nbsp;Company Name<span style="color:red; ">*</span></strong></td>
      <td class="auto-style33">
         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="X" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="X-Small" ForeColor="Red" ControlToValidate="txtCompanyName"></asp:RequiredFieldValidator>
      </td>
      <td class="auto-style47">
         <asp:TextBox ID="txtCompanyName" runat="server" Height="40px" Width="196px"   placeholder="  Company Name..." TextMode="MultiLine" TabIndex="5"  CssClass="center"></asp:TextBox>
      </td>
      <td class="auto-style48">
         &nbsp;
      </td>
      <td class="auto-style30">Remark</td>
      <td class="auto-style55">&nbsp;
         &nbsp;
      </td>
      <td style="width: 209px">
         <asp:TextBox ID="txtRemark" runat="server" Height="40px" Width="196px" placeholder="  Remark..."  TabIndex="9" CssClass="center"></asp:TextBox>
      </td>
   </tr>
   <tr>
      <td class="auto-style46"><strong>Approval Number<span style="color:red;">*</span></strong></td>
      <td class="auto-style33">
         <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="X" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="X-Small" ForeColor="Red" ControlToValidate="txtAppNo"></asp:RequiredFieldValidator>
      </td>
      <td class="auto-style47">
         <asp:TextBox ID="txtAppNo" runat="server" Height="40px" Width="196px" placeholder="  Approval Number..." TabIndex="3" CssClass="center"></asp:TextBox>
      </td>
      <td class="auto-style56" colspan="3" rowspan="7">
         &nbsp;
      </td>
      <td style="width: 209px">
         <asp:TextBox ID="txtCompleteDate" runat="server" Height="40px" Width="196px" placeholder="  Completion Date..."  TabIndex="8" CssClass="center" Enabled="False" Visible="False"></asp:TextBox>
      </td>
   </tr>
   <tr>
      <td class="auto-style46"><strong>&nbsp;Facility Type<span style="color:red;">*</span></strong></td>
      <td class="auto-style33">
         <asp:RequiredFieldValidator ID="RequiredFieldValidator4"  runat="server" ErrorMessage="X" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="X-Small" ForeColor="Red" ControlToValidate="drop_down_facility_type" InitialValue="FT"></asp:RequiredFieldValidator>
      </td>
      <td class="auto-style47">
         <asp:DropDownList ID="drop_down_facility_type" runat="server" CssClass="btn-info" Height="40px" Width="196px" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Small" TabIndex="4">
            <asp:ListItem Value="FT" Selected="True">Facility Types</asp:ListItem>
            <asp:ListItem Value="BG">BG</asp:ListItem>
            <asp:ListItem Value="PG">PG</asp:ListItem>
            <asp:ListItem Value="APG">APG</asp:ListItem>
            <asp:ListItem Value="BG.EX">BG.EX</asp:ListItem>
            <asp:ListItem Value="PG.EX">PG.EX</asp:ListItem>
            <asp:ListItem Value="APG.EX">APG.EX</asp:ListItem>
            <asp:ListItem Value="BG.AM">BG.AM</asp:ListItem>
            <asp:ListItem Value="PG.AM">PG.AM</asp:ListItem>
            <asp:ListItem Value="APG.AM">APG.AM</asp:ListItem>
            <asp:ListItem Value="LC">LC</asp:ListItem>
            <asp:ListItem Value="ULC">ULC</asp:ListItem>
            <asp:ListItem Value="SLC">SLC</asp:ListItem>
            <asp:ListItem Value="OD">OD</asp:ListItem>
            <asp:ListItem Value="TL">TL</asp:ListItem>
            <asp:ListItem Value="ISB">ISB</asp:ListItem>
            <asp:ListItem Value="CC">CC</asp:ListItem>
            <asp:ListItem Value="Teach.Loan">Teach.Loan</asp:ListItem>
            <asp:ListItem Value="Pay.Loan">Pay.Loan</asp:ListItem>
            <asp:ListItem Value="One Day">One Day</asp:ListItem>
            <asp:ListItem Value="HELO">HELO</asp:ListItem>
            <asp:ListItem Value="Azad.Loan">Azad.Loan</asp:ListItem>
            <asp:ListItem Value="Restructuring">Restructuring</asp:ListItem>
         </asp:DropDownList>
      </td>
      <td style="width: 209px">
         <asp:TextBox ID="txt2ndverifier" AutoPostBack="false" runat="server" Height="40px" Width="196px" placeholder="   Second Verifier..."  TabIndex="7" CssClass="center" Enabled="False" Visible="False"></asp:TextBox>
      </td>
   </tr>
   <tr>
      <td class="auto-style46"><strong>Document Received<span style="color:red;">*</span></strong></td>
      <td class="auto-style33" rowspan="5">
         <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="X" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="X-Small" ForeColor="Red" ControlToValidate="txtDocrRec"></asp:RequiredFieldValidator>
      </td>
      <td class="auto-style47" rowspan="5">
         <asp:TextBox ID="txtDocrRec" runat="server" Height="246px" Width="196px" placeholder="   Document Received..." TabIndex="5" BackColor="#FFFF66" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="XX-Small" TextMode="MultiLine"></asp:TextBox>
      </td>
      <td style="width: 209px; padding-top:-30px">
         <strong>
            <asp:Button  ID="Button2" runat="server" CssClass="btn-info"    Height="37px" Text="ADD" Width="81px" Font-Bold="True"  Font-Size="Small" TabIndex="10" OnClick="Button2_Click"  OnClientClick="javascript:shouldsubmit=true;" BorderStyle="None" Font-Names="Bahnschrift"   />
            <asp:Button ID="ResetBtn" runat="server" CssClass="btn-danger" Font-Bold="True" Font-Size="Small" Height="37px"  Text="Reset" Width="81px" TabIndex="11" BorderStyle="None" OnClick="ResetBtn_Click" Font-Names="Bahnschrift" />
         </strong>
      </td>
   </tr>
   <tr>
      <td class="auto-style46">&nbsp;</td>
      <td style="padding-top:-30px" rowspan="4" class="auto-style57">
         &nbsp;
      </td>
   </tr>
   <tr>
      <td class="auto-style46">&nbsp;</td>
   </tr>
   <tr>
      <td class="auto-style46">&nbsp;</td>
   </tr>
   <tr>
      <td class="auto-style46">&nbsp;</td>
   </tr>
   <tr>
      <td class="auto-style45"><strong>&nbsp;</strong></td>
      <td class="auto-style33">
         &nbsp;
      </td>
      <td colspan="5" rowspan="5">
         <br />
      </td>
   </tr>
   <tr>
      <td class="auto-style45">&nbsp;</td>
      <td class="auto-style33">
         &nbsp;
      </td>
   </tr>
   <tr>
      <td class="auto-style45">&nbsp;</td>
      <td class="auto-style33">
         &nbsp;
      </td>
   </tr>
   <tr>
      <td class="auto-style45">&nbsp;</td>
      <td class="auto-style33">
         &nbsp;
      </td>
   </tr>
   <tr>
      <td class="auto-style45">&nbsp;</td>
      <td class="auto-style33">
         &nbsp;
      </td>
   </tr>
   <tr>
      <td class="auto-style51"></td>
      <td class="auto-style52">
      </td>
      <td class="auto-style53" colspan="2">
         &nbsp;
      </td>
      <td class="auto-style50" colspan="3"><strong>&nbsp;</strong>&nbsp; </td>
   </tr>
   <tr>
      <td class="auto-style1">&nbsp;</td>
   </tr>
</table>
</asp:Content>
