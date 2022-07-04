<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LL_Details.aspx.cs" Inherits="Collateral.LL_Details" %>
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
         <asp:Label ID="addLbl" runat="server" Text="Loan Recovery Details"></asp:Label>
      </strong>

   </h4>
		<asp:Label ID="lblMessage" Text="" runat="server" ForeColor="Red" EnableViewState="false" />
	</div>
	<table id="tblContainer" class="auto-style17" style="padding-bottom: 5px;">
		<tr>
			<td class="auto-style1" colspan="4">&nbsp;</td>
			<td colspan="2">
				<asp:Label ID="msg" runat="server" Visible="False" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Smaller"></asp:Label>
			</td>
		</tr>
		<tr>
			<td class="auto-style14">Recovery Date<strong><span style="color: red;">*</span></strong>
			</td>
		
			<td class="auto-style32">
				<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtrcovr_date" ErrorMessage="X" Font-Names="Bahnschrift" Font-Size="XX-Small" ForeColor="Red" InitialValue="Group Name"></asp:RequiredFieldValidator>
			</td>
			<td class="auto-style18">
              <asp:TextBox ID="txtrcovr_date" CssClass="center" runat="server" TextMode="Date" Height="40px" Width="196px" Font-Bold="True" Font-Size="Smaller" TabIndex="8"></asp:TextBox>

			</td>
			<td class="auto-style6">
				<br />
				<br />
			</td>
			<td class="auto-style7">Source Of Recovery<strong><span style="color: red;">*&nbsp;&nbsp;&nbsp;</span></strong>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
				<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtsrc_recovey" ErrorMessage="X" Font-Names="Bahnschrift" Font-Size="XX-Small" ForeColor="Red"></asp:RequiredFieldValidator>
			</td>
			<td class="auto-style3">
				<asp:TextBox ID="txtsrc_recovey" CssClass="center" runat="server" Height="40px" Width="196px" Font-Bold="True" Font-Size="Smaller" TabIndex="8"></asp:TextBox>
			</td>
		</tr>
		<tr>
			<td class="auto-style15"><strong>&nbsp;Recovery Amount<span style="color: red;">*</span></strong>
			</td>
			<td class="auto-style32">
				<asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" ControlToValidate="txtrecvr_amount" ErrorMessage="X" Font-Names="Bahnschrift" Font-Size="XX-Small" ForeColor="Red"></asp:RequiredFieldValidator>
			</td>
			<td class="auto-style5">
				<asp:TextBox ID="txtrecvr_amount" CssClass="center" runat="server" Height="40px" Width="196px" Font-Bold="True" Font-Size="Smaller" TabIndex="10"></asp:TextBox>
			</td>
			<td class="auto-style6">
				<br />
				<br />
			</td>
			<td class="auto-style7">Expenses Occurred<strong><span style="color: red;">*&nbsp;&nbsp;&nbsp;</span></strong>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
				<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtexp_amount" ErrorMessage="X" Font-Names="Bahnschrift" Font-Size="XX-Small" ForeColor="Red"></asp:RequiredFieldValidator>
			</td>
			<td class="auto-style8">
				<asp:TextBox ID="txtexp_amount" CssClass="center" runat="server" Height="40px" Width="196px" Font-Bold="True" Font-Size="Smaller" TabIndex="10"></asp:TextBox>
			</td>
		</tr>
		<tr>
			<td class="auto-style15"><strong>&nbsp;Claim To be Paid<span style="color: red;">*</span></strong>
			</td>
			<td class="auto-style32">
				<asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="txtclm_paid" ErrorMessage="X" Font-Names="Bahnschrift" Font-Size="XX-Small" ForeColor="Red" InitialValue="currency"></asp:RequiredFieldValidator>
			</td>
			<td class="auto-style5">
				<asp:TextBox ID="txtclm_paid" CssClass="center" runat="server" Height="40px" Width="196px" Font-Bold="True" Font-Size="Smaller" TabIndex="10"></asp:TextBox>

			</td>
			<td class="auto-style6">
				<br />
				<br />
			</td>
			<td class="auto-style7"><strong>Net Loss<span style="color: red;">*&nbsp;&nbsp;&nbsp;</span></strong>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
				<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtnet_loss" ErrorMessage="X" Font-Names="Bahnschrift" Font-Size="XX-Small" ForeColor="Red"></asp:RequiredFieldValidator>
			</td>
			<td style="width: 209px">
				<asp:TextBox ID="txtnet_loss" CssClass="center" runat="server" Height="40px" Width="196px" AutoPostBack="true" Font-Bold="True" Font-Size="Smaller" TabIndex="12"></asp:TextBox>
			</td>
		</tr>

		<tr>
			<td class="auto-style30" style="width: 207px">&nbsp;</td>
			<td style="width: 209px">&nbsp;</td>
		</tr>
		<tr>
			<td class="auto-style31" colspan="2">&nbsp;</td>
			<td class="auto-style10"> <strong>
               <asp:Button ID="Add" runat="server" CssClass="btn-primary" Height="37px" Text="ADD" Width="81px" Font-Bold="True" Font-Size="Small" TabIndex="14" OnClick="Add_Click" BorderStyle="None" />
            </strong>
			</td>
		</tr>
	</table>
</div>
</asp:Content>
