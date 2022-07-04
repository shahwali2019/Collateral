<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LLR_Insert.aspx.cs" Inherits="Collateral.LLR_Insert" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <br />
        <style>
            .auto-style30 {
                font-size: 12px;
                font-weight: bold;
                font-family: Bahnschrift;
            }

            .center {
                text-align: center;
                color: blue;
                font-family: Bahnschrift,Arial;
            }

            .auto-style1 {
                font-size: 12px;
                font-weight: bold;
                font-family: Bahnschrift;
            }

            .auto-style2 {
                width: 87px;
                font-size: 12px;
                font-weight: bold;
                font-family: Bahnschrift;
            }

            .auto-style3 {
                margin-left: 40px;
            }

            .auto-style5 {
                width: 148px;
                height: 46px;
            }

            .auto-style6 {
                width: 87px;
                font-size: 12px;
                font-weight: bold;
                font-family: Bahnschrift;
                height: 46px;
            }

            .auto-style7 {
                width: 207px;
                font-size: 12px;
                font-weight: bold;
                font-family: Bahnschrift;
                height: 46px;
            }

            .auto-style8 {
                width: 209px;
                height: 46px;
            }

            .auto-style10 {
                width: 148px;
                height: 20px;
            }

            .auto-style11 {
                width: 87px;
                font-size: 12px;
                font-weight: bold;
                font-family: Bahnschrift;
                height: 20px;
            }

            .auto-style12 {
                width: 207px;
                font-size: 12px;
                font-weight: bold;
                font-family: Bahnschrift;
                height: 20px;
            }

            .auto-style13 {
                width: 209px;
                height: 20px;
            }

            .auto-style14 {
                width: 183px;
                font-size: 12px;
                font-weight: bold;
                font-family: Bahnschrift;
            }

            .auto-style15 {
                width: 183px;
                font-size: 12px;
                font-weight: bold;
                font-family: Bahnschrift;
                height: 46px;
            }

            .auto-style17 {
                width: 95%;
                height: 266px;
            }

            td {
                padding-top: 5px;
            }

            .auto-style18 {
                width: 148px;
            }

            .auto-style31 {
                font-size: 12px;
                font-weight: bold;
                font-family: Bahnschrift;
                height: 20px;
            }

            .auto-style32 {
                width: 105px;
                padding-left: 50px;
            }

            </style>

     <script> 
         function ResetFormWithJS() {
    	$("[asp-for='Name']").val("");
    	$("[asp-for='Email']").val("");
                                     }

    function refreshPage() {
    	window.location.reload();
                           } 
     </script>


<div id="divContainer" style="background-color: #fff; padding: 50px; margin-top: -40px;">
    <div style="height: 120px; padding-left: 32%; border-top: 10px solid #0094ff; margin-top: -20px;" class="alert alert-success" role="alert">

    <h4 class="alert-heading" style="font-family: Bahnschrift;">
      <strong>
         <asp:Label ID="addLbl" runat="server" Text="ADD LOAN DETAILS APPROVAL RECORD"></asp:Label>
      </strong>

   </h4>
   <asp:Label ID="lblMessage" Text="" runat="server" ForeColor="Red" EnableViewState="false" />
</div>
   <table  id="tblContainer"class="auto-style17"  style="padding-bottom: 5px;">
      <tr>
         <td class="auto-style1" colspan="4">&nbsp;</td>
         <td colspan="2">
            <asp:Label ID="msg" runat="server" Visible="False" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Smaller"></asp:Label>
         </td>
      </tr>
      <tr>
         <td class="auto-style14">Borrower Name<strong><span style="color: red;">*</span></strong></td>
         <td class="auto-style32">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtborrname" ErrorMessage="X" Font-Names="Bahnschrift" Font-Size="XX-Small" ForeColor="Red"></asp:RequiredFieldValidator>
         </td>
         <td class="auto-style18">
            <asp:TextBox ID="txtborrname" CssClass="center" runat="server" Height="40px" Width="196px" AutoPostBack="true" Font-Bold="True" Font-Size="Smaller" TabIndex="12"></asp:TextBox>

         </td>
         <td class="auto-style6">
            <br />
            <br />
         </td>
         <td class="auto-style7">
            Account Number<strong><span style="color: red;">*&nbsp;&nbsp;&nbsp;</span></strong>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtacc_no" ErrorMessage="X" Font-Names="Bahnschrift" Font-Size="XX-Small" ForeColor="Red"></asp:RequiredFieldValidator>
         </td>
         <td class="auto-style3">
            <asp:TextBox ID="txtacc_no" CssClass="center" runat="server" Height="40px" Width="196px" Font-Bold="True" Font-Size="Smaller" TabIndex="8"></asp:TextBox>
         </td>
      </tr>
      <tr>
         <td class="auto-style15"><strong>&nbsp;Currency<span style="color: red;">*</span></strong></td>
         <td class="auto-style32">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtcurr" ErrorMessage="X" Font-Names="Bahnschrift" Font-Size="XX-Small" ForeColor="Red"></asp:RequiredFieldValidator>
         </td>
         <td class="auto-style5">
            <asp:DropDownList ID="txtcurr" runat="server" CssClass="btn-info" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Smaller" Font-Strikeout="False" Font-Underline="False" ForeColor="White" Height="40px" Width="196px" TabIndex="3">
               <asp:ListItem Text="Currency" Value="currency"></asp:ListItem>
               <asp:ListItem Text="AFN" Value="AFN"></asp:ListItem>
               <asp:ListItem Text=" USD" Value="USD"></asp:ListItem>
               <asp:ListItem Text="EUR" Value="EUR"></asp:ListItem>
               <asp:ListItem Text="Others" Value="Others"></asp:ListItem>
            </asp:DropDownList>
         </td>
        
         <td class="auto-style32">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtloan_no" ErrorMessage="X" Font-Names="Bahnschrift" Font-Size="XX-Small" ForeColor="Red"></asp:RequiredFieldValidator>
         </td>
           <td class="auto-style15"><strong>&nbsp;Loan Number<span style="color: red;">*</span></strong></td>
         <td class="auto-style3">
            <asp:TextBox ID="txtloan_no" CssClass="center" runat="server" Height="40px" Width="196px" Font-Bold="True" Font-Size="Smaller" TabIndex="8"></asp:TextBox>
         </td>
      </tr>
      <tr>
         <td class="auto-style15"><strong>&nbsp;Facility Type<span style="color: red;">*</span></strong></td>
         <td class="auto-style32">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtFacilityTypeList" ErrorMessage="X" Font-Names="Bahnschrift" Font-Size="XX-Small" ForeColor="Red"></asp:RequiredFieldValidator>
         </td>
         <td class="auto-style5">
            <asp:TextBox ID="txtFacilityTypeList" CssClass="center" runat="server" Height="40px" Width="196px" Font-Bold="True" Font-Size="Smaller" TabIndex="10"></asp:TextBox>
         </td>
         <td class="auto-style6">
            <br />
            <br />
         </td>
         <td class="auto-style7">
             Loan Disbursement Date<strong><span style="color: red;">*&nbsp;&nbsp;&nbsp;</span></strong>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtloan_dis_date" ErrorMessage="X" Font-Names="Bahnschrift" Font-Size="XX-Small" ForeColor="Red"></asp:RequiredFieldValidator>
         </td>
         <td class="auto-style8">
            <asp:TextBox ID="txtloan_dis_date" CssClass="center" runat="server" Height="40px" Width="196px" TextMode="Date" Font-Bold="True" Font-Size="Smaller" TabIndex="10"></asp:TextBox>
         </td>
      </tr>
      <tr>
         <td class="auto-style15"><strong>&nbsp;Disbursed Amount<span style="color: red;">*</span></strong></td>
         <td class="auto-style32">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtdisbs_amount" ErrorMessage="X" Font-Names="Bahnschrift" Font-Size="XX-Small" ForeColor="Red" InitialValue="currency"></asp:RequiredFieldValidator>
         </td>
         <td class="auto-style5">
            <asp:TextBox ID="txtdisbs_amount" CssClass="center" runat="server" Height="40px" Width="196px" Font-Bold="True" Font-Size="Smaller" TabIndex="10"></asp:TextBox>

         </td>
         <td class="auto-style2">
            <br />
            <br />
         </td>
         <td class="auto-style7">
            <strong>Interest Stoped On Date<span style="color: red;">*&nbsp;&nbsp;&nbsp;</span></strong>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtintsrt_stpon" ErrorMessage="X" Font-Names="Bahnschrift" Font-Size="XX-Small" ForeColor="Red"></asp:RequiredFieldValidator>
         </td>
         <td style="width: 209px">
            <asp:TextBox ID="txtintsrt_stpon" CssClass="center" runat="server" Height="40px" TextMode="Date" Width="196px" AutoPostBack="true" Font-Bold="True" Font-Size="Smaller" TabIndex="12"></asp:TextBox>
         </td>
      </tr>
      <tr>
         <td class="auto-style14"><strong>Doubtful Date<span style="color: red;">*</span></strong></td>
         <td class="auto-style32">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtdbfl_date" ErrorMessage="X" Font-Names="Bahnschrift" Font-Size="XX-Small" ForeColor="Red"></asp:RequiredFieldValidator>
         </td>
         <td style="width: 209px">
             <asp:TextBox ID="txtdbfl_date" CssClass="center" runat="server" Height="40px" Width="196px" AutoPostBack="true" Font-Bold="True" Font-Size="Smaller" TabIndex="12" TextMode="Date"></asp:TextBox>

         </td>
         <td class="auto-style22">
            <br />
            <br />
         </td>
         <td class="auto-style71">
            <strong>Charge Off Date<span style="color: red;">*&nbsp;</span></strong>&nbsp;&nbsp;&nbsp; 
            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtchrg_off_date" ErrorMessage="X" Font-Names="Bahnschrift" Font-Size="XX-Small" ForeColor="Red" InitialValue="Selectceo"></asp:RequiredFieldValidator>
         </td>
         <td class="auto-style18">
             <asp:TextBox ID="txtchrg_off_date" CssClass="center" runat="server" Height="40px" Width="196px" AutoPostBack="true" Font-Bold="True" Font-Size="Smaller" TabIndex="12" TextMode="Date"></asp:TextBox>
         </td>
      </tr>
      <tr>
         <td class="auto-style140">Charge off Amount Original Currency<strong><span style="color: red;">*</span></strong></td>
         <td class="auto-style32">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ControlToValidate="txtchrg_off_amt_orginal_curr" ErrorMessage="X" Font-Names="Bahnschrift" Font-Size="XX-Small" ForeColor="Red"  InitialValue="selectFS"></asp:RequiredFieldValidator>
         </td>
         <td class="auto-style18">
             <asp:TextBox ID="txtchrg_off_amt_orginal_curr" CssClass="center" runat="server" Height="40px" Width="196px" AutoPostBack="true" Font-Bold="True" Font-Size="Smaller" TabIndex="12"></asp:TextBox>
         </td>
         <td class="auto-style6">
            <br />
            <br />
         </td>
         <td class="auto-style7">
            Charge off Amount Converted to USD<strong><span style="color: red;">*&nbsp;&nbsp;&nbsp;</span></strong>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 
            <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" ControlToValidate="txtchrg_off_amt_convert_usd" ErrorMessage="X" Font-Names="Bahnschrift" Font-Size="XX-Small" ForeColor="Red"></asp:RequiredFieldValidator>
         </td>
         <td class="auto-style31">
            <asp:TextBox ID="txtchrg_off_amt_convert_usd" CssClass="center" runat="server" Height="40px" Width="196px" Font-Bold="True" Font-Size="Smaller" TabIndex="8"></asp:TextBox>

         </td>
      </tr>
      <tr>
         <td class="auto-style30" style="width: 207px">&nbsp;</td>
         <td style="width: 209px">&nbsp;</td>
      </tr>

             <tr>
         <td class="auto-style31" colspan="2">&nbsp;</td>
         <td class="auto-style10">
            <strong>
               <asp:Button ID="subBtn" runat="server" OnClick="subBtn_Click" CssClass="btn-primary" Height="37px" Text="ADD" Width="81px" Font-Bold="True" Font-Size="Small" TabIndex="14" BorderStyle="None" />
            </strong>
         </td>
      </tr>
   </table>
</div>
</asp:Content>
