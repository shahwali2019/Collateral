<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="addNEW_acgf.aspx.cs" Inherits="Collateral_int.addNEW_acgf" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <br />
   <div style=" height:120px;padding-left: 45%;border-top:10px solid #0094ff; margin-top:-20px;" class="alert alert-success" role="alert">
              <h4 class="alert-heading" style=" font-family:Bahnschrift;"><strong><asp:Label ID="addLbl" runat="server" Text="Add ACGF Record" ></asp:Label></strong></h4>  
           </div>
    <div style="background-color:#fff; padding:50px; margin-top:-40px;">
    <style>
        .auto-style30{
        font-size: 12px;
        font-weight: bold;
        font-family: Bahnschrift;
        width: 138px;
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
        width: 138px;
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
    .auto-style49 {
        font-size: 12px;
        font-weight: bold;
        font-family: Bahnschrift;
        width: 23px;
        text-align: center;
        height: 46px;
    }
        .auto-style50 {
            font-size: 12px;
            font-weight: bold;
            font-family: Bahnschrift;
            height: 46px;
        }
    .auto-style51 {
        font-size: 12px;
        font-weight: bold;
        font-family: Bahnschrift;
        text-align: center;
    }
    </style>
           
        <table class="auto-style44" style="padding-bottom:5px; ">
        <tr>
            <td class="auto-style1" colspan="4">
                <%--               <form method="get">
                <input type="text" id="source" >
                <input type="text" id="dest" >
                <input type="text" id="add" onclick="copyText();"  />
            </form>--%>
              
                           <asp:ImageButton ID="ImageButton1" ImageUrl="~/image/back.png" Height="20" Width="20" runat="server" OnClick="ImageButton1_Click" />
                   
             
                 <br />
                </td>
            <td colspan="2">
                <asp:Label ID="msg" runat="server" Visible="False" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Smaller"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style45"><strong>&nbsp;&nbsp;Borrower<span style="color:red;">*</span></strong></td>
            <td class="auto-style38">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="X" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="X-Small" ForeColor="Red" ControlToValidate="txtBorrower"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style39">
            <asp:TextBox ID="txtBorrower"  AutoPostBack="true" OnTextChanged="txtBorrower_TextChanged" runat="server" Height="40px" Width="196px" class="  Borrower Name..." CssClass="center" TabIndex="1"></asp:TextBox>
            </td>
            <td class="auto-style48">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="X" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="X-Small" ForeColor="Red" ControlToValidate="txtACGFED"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style41">
                <strong>&nbsp;ACFG Expiry Date <span style="color:red;">*</span></strong></td>
            <td class="auto-style42">
                <asp:TextBox ID="txtACGFED" AutoPostBack="false" runat="server" Height="40px" Width="196px" class="   ACGF Expiry Date..."  TabIndex="6" CssClass="center"></asp:TextBox>
            </td>
        </tr>
        <tr>
            
            <td class="auto-style45"><strong>&nbsp;Facility Approval Number<span style="color:red;">*</span></strong></td>
            
            <td class="auto-style33">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="X" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="X-Small" ForeColor="Red" ControlToValidate="txtFAN"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style47">
                <asp:TextBox ID="txtFAN" runat="server" Height="40px" Width="196px" class="  Facility Approval..." TabIndex="2" CssClass="center"></asp:TextBox>
            </td>
            <td class="auto-style48">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="X" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="X-Small" ForeColor="Red" ControlToValidate="txtGuarantee"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style30"><strong>Guarantee Claimed<span style="color:red;">*</span>&nbsp;&nbsp;</strong></td>
            <td style="width: 209px">
                <asp:TextBox ID="txtGuarantee" AutoPostBack="false" runat="server" Height="40px" Width="196px" class="   Guarantee Claimed..."  TabIndex="7" CssClass="center"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style46"><strong>Product Code<span style="color:red;"> *</span></strong></td>
            <td class="auto-style33">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="X" InitialValue="Product Code" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="X-Small" ForeColor="Red" ControlToValidate="drop_PC"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style47">
                <asp:DropDownList ID="drop_PC" runat="server" CssClass="btn-info" Height="40px" Width="196px" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Small" TabIndex="3">
                    <asp:ListItem>Product Code</asp:ListItem>
                    <asp:ListItem>OD</asp:ListItem>
                    <asp:ListItem>TL</asp:ListItem>
                    <asp:ListItem>ISB</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style48">
                &nbsp;</td>
            <td class="auto-style30"><strong>&nbsp;Remark</strong></td>
            <td style="width: 209px">
                <asp:TextBox ID="txtRemark" runat="server" Height="40px" Width="196px" class="  Remark..."  TabIndex="8" CssClass="center"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style45"><strong>&nbsp;LOG Number<span style="color:red;">*</span></strong></td>
            <td class="auto-style33">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="X" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="X-Small" ForeColor="Red" ControlToValidate="txtLOG"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style47">
                <asp:TextBox ID="txtLOG" runat="server" Height="40px" Width="196px" class="  LOG Number..." TabIndex="4" CssClass="center"></asp:TextBox>
            </td>
            <td class="auto-style51" colspan="3">
                <br />
            </td>
        </tr>
        <tr>
            <td class="auto-style45"><strong>&nbsp;Maturity Date of Facility<span style="color:red;">*</span></strong></td>
            <td class="auto-style38">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="X" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="X-Small" ForeColor="Red" ControlToValidate="txtMDF"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style39">
                <asp:TextBox ID="txtMDF" runat="server" Height="40px" Width="196px" class="   Maturity Date of Facility..." TabIndex="5" CssClass="center"></asp:TextBox>
            </td>
            <td class="auto-style49">
                &nbsp;</td>
            <td class="auto-style50" colspan="2"><strong>&nbsp;<asp:Button  ID="Button2" runat="server" CssClass="btn-info" Height="37px" Text="ADD" Width="81px" Font-Bold="True"  Font-Size="Small" TabIndex="9" OnClick="Button2_Click" BorderStyle="None"   />
                </strong>&nbsp; <strong>
                <asp:Button ID="ResetBtn" runat="server" CssClass="btn-danger" Font-Bold="True" Font-Size="Small" Height="37px"  Text="Reset" Width="81px" TabIndex="9" BorderStyle="None" OnClick="ResetBtn_Click" />
                </strong></td>
        </tr>
        <tr>
                <td class="auto-style1">&nbsp;</td>
                  
           
        </tr>
        </table>
           
</div>
</asp:Content>
