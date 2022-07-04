<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="newLCR.aspx.cs" Inherits="Collateral.newLCR" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <header>
            <style>
        .auto-style30{
                    font-size: 12px;
                    font-weight: bold;
                    font-family: Bahnschrift;
                    width: 104px;
                }
        .center{
            text-align:center;
            color:blue;
            font-family:Bahnschrift,Arial;
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
            text-align:center;
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
                    height: 46px;
                }
                .auto-style55 {
                    padding-left:10px;
                    font-size: 12px;
                    font-weight: bold;
                    font-family: Bahnschrift;
                    width: 25px;
                    height: 46px;
                }
                .auto-style56 {
                    font-size: 12px;
                    font-weight: bold;
                    font-family: Bahnschrift;
                    text-align: center;
                }
                .auto-style58 {
                    font-size: 12px;
                    font-weight: bold;
                    font-family: Bahnschrift;
                    text-align: center;
                    height: 46px;
                }
                .auto-style59 {
                    width: 209px;
                    height: 46px;
                }
                .auto-style63 {
                    font-size: 12px;
                    font-weight: bold;
                    font-family: Bahnschrift;
                    width: 23px;
                    text-align: center;
                    height: 36px;
                }
                .auto-style65 {
                    padding-left: 10px;
                    font-size: 12px;
                    font-weight: bold;
                    font-family: Bahnschrift;
                    width: 25px;
                    height: 36px;
                }
                .auto-style66 {
                    font-size: 12px;
                    font-weight: bold;
                    font-family: Bahnschrift;
                    height: 36px;
                    width: 149px;
                }
                .auto-style67 {
                    font-size: 12px;
                    font-weight: bold;
                    font-family: Bahnschrift;
                    width: 41px;
                    text-align: center;
                    height: 36px;
                }
                .auto-style68 {
                    width: 20px;
                    height: 36px;
                }
                .auto-style69 {
                    font-size: 12px;
                    font-weight: bold;
                    font-family: Bahnschrift;
                    height: 36px;
                    width: 104px;
                }
                .auto-style70 {
                    width: 209px;
                    height: 36px;
                }
    </style>
</header> 
 <br />
<div style=" height:120px;padding-left: 45%;border-top:10px solid #0094ff; margin-top:-20px;" class="alert alert-success" role="alert">
   <h4 class="alert-heading" style=" font-family:Bahnschrift;">
      <strong>
         <asp:Label ID="addLbl" runat="server" Text="ADD LCR RECORD" ></asp:Label>
      </strong>
   </h4>
</div>
<table class="auto-style44" style="padding-bottom:5px; ">
   <tr>
      <td class="auto-style1" colspan="4">
         <asp:ImageButton ID="ImageButton1" ImageUrl="~/image/back.png" Height="20" Width="20" runat="server" />
         <br />
      </td>
      <td colspan="3">
         <asp:Label ID="msg" runat="server" Visible="False" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Smaller"></asp:Label>
      </td>
   </tr>
   <tr>
      <td class="auto-style46"><strong>&nbsp;&nbsp;Customer Name<span style="color:red;">*</span></strong></td>
      <td class="auto-style38">
         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="X" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="X-Small" ForeColor="Red" ControlToValidate="txtCname" ></asp:RequiredFieldValidator>
      </td>
      <td class="auto-style39">
         <asp:TextBox ID="txtCname"   AutoPostBack="false"  runat="server" Height="40px" Width="196px" TabIndex="1" placeholder="  Customer Name..." CssClass="center" ></asp:TextBox>
      </td>
      <td class="auto-style48">
      </td>
      <td class="auto-style41">
         D<strong>ue Date<span style="color:red;">*</span></strong>
      </td>
      <td class="auto-style55">
         <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="X" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="X-Small" ForeColor="Red" ControlToValidate="txtDueDate"></asp:RequiredFieldValidator>
      </td>
      <td class="auto-style42">
         <asp:TextBox ID="txtDueDate" AutoPostBack="false" runat="server" Height="40px" Width="196px" placeholder="   Entered By..."  TabIndex="5" CssClass="center" TextMode="Date"></asp:TextBox>
      </td>
   </tr>
   <tr>
      <td class="auto-style66"><strong>&nbsp;Approval Name<span style="color:red;">*</span></strong></td>
      <td class="auto-style67">
         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="X" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="X-Small" ForeColor="Red" ControlToValidate="txtAppName"></asp:RequiredFieldValidator>
      </td>
      <td class="auto-style68">
         <asp:TextBox ID="txtAppName" runat="server" Height="40px" Width="196px" placeholder="  Approval Number..." TabIndex="2" CssClass="center"></asp:TextBox>
      </td>
      <td class="auto-style63">
      </td>
      <td class="auto-style69">Condition Status<strong><span style="color:red;">*</span></strong></td>
      <td class="auto-style65">
         <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="X" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="X-Small" ForeColor="Red" ControlToValidate="DropDownList1" InitialValue="CS"></asp:RequiredFieldValidator>
         &nbsp;
         &nbsp;
      </td>
      <td class="auto-style70">
         <asp:DropDownList ID="DropDownList1" runat="server" Height="40px" Width="196px" CssClass="btn-success" Font-Bold="True" Font-Names="Bahnschrift" TabIndex="6">
            <asp:ListItem Value="CS">Condition Status</asp:ListItem>
            <asp:ListItem>Active</asp:ListItem>
            <asp:ListItem>Closed</asp:ListItem>
         </asp:DropDownList>
      </td>
   </tr>
   <tr>
      <td class="auto-style46"><strong>Date of Disbursement</strong></td>
      <td class="auto-style33">
         &nbsp;
      </td>
      <td class="auto-style47">
         <asp:TextBox ID="txtDoD" runat="server" Height="40px" Width="196px" TextMode="Date" TabIndex="3" CssClass="center"></asp:TextBox>
      </td>
      <td class="auto-style56">
         &nbsp;
      </td>
      <td class="auto-style30">
         Remark
      </td>
      <td class="auto-style56">
         &nbsp;
      </td>
      <td style="width: 209px">
         <asp:TextBox ID="txtRemark" runat="server" Height="40px" Width="196px" placeholder="Remark about this record"  TabIndex="7" CssClass="center" Font-Names="Bahnschrift" TextMode="MultiLine"></asp:TextBox>
      </td>
   </tr>
   <tr>
      <td class="auto-style46"><strong>&nbsp;Conditions<span style="color:red;">*</span></strong></td>
      <td class="auto-style38">
         <asp:RequiredFieldValidator ID="RequiredFieldValidator4"  runat="server" ErrorMessage="X" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="X-Small" ForeColor="Red" ControlToValidate="txtCondition"></asp:RequiredFieldValidator>
      </td>
      <td class="auto-style39">
         <asp:TextBox ID="txtCondition" runat="server" Height="40px" Width="196px" placeholder="  Conditions..." TabIndex="4" CssClass="center" Font-Names="Bahnschrift" Font-Size="Small" TextMode="MultiLine"></asp:TextBox>
      </td>
      <td class="auto-style58" colspan="3">
      </td>
      <td class="auto-style59">
         <strong>
            <asp:Button  ID="subBtn" runat="server" CssClass="btn-info" Height="37px" Text="ADD" Width="81px" Font-Bold="True"  Font-Size="Small" TabIndex="8" OnClientClick="javascript:shouldsubmit=true;" BorderStyle="None" Font-Names="Bahnschrift" OnClick="Button2_Click"   />
            <%--                <asp:Button ID="ResetBtn" runat="server" CssClass="btn-danger" Font-Bold="True" Font-Size="Small" Height="37px"  Text="Reset" Width="81px" TabIndex="9" BorderStyle="None" OnClick="ResetBtn_Click" Font-Names="Bahnschrift" Enabled="False" />--%>
         </strong>
      </td>
   </tr>
   <tr>
      <td class="auto-style1">&nbsp;</td>
   </tr>
</table>
</asp:Content>
