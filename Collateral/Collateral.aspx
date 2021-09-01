<%@ Page Title="AIB" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Collateral.aspx.cs" Inherits="Collateral_int._Default" EnableEventValidation="false" %>

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
td {
    font-size: 16px;
}




/*.sidenav a {
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
	/*border-bottom: 0.1em solid #00a94f;*/
}*/

.ResTable {
	height: 100px;
	width: 120px;
	opacity: .9;
    /*color: #fff;*/

}

/*.ResTable:hover {
	opacity: 1;
	border-bottom: 5px outset #fff;
	background: rgba(0, 169, 79, 0.56);
    background: #00a94f;
    color: #FFF;
}*/
           

.iconLogo {
	float: left;
	margin-bottom: 20px;
	padding-right: 10px;
}

.tdText {
	padding-left: 10px;
	/*font-family: Bahnschrift;*/
/*font-family: Arial, Helvetica, sans-serif;*/
font-family: "Times New Roman", Georgia, serif;
	font-size: x-small;
	margin-top: -20px;
    color: #1d3c7f;
}

.tdText:hover {
	padding-left: 15px;
	color: #1d3c7f;

}

.linkText {
	border-left: 5px solid #00a94f;
	padding-left: 5px;

}

.linkText:hover {
	text-decoration: none;
	/*border-right: 7px solid #303233;*/
    	border-right: 5px solid #00a94f;

	padding-right: 5px;
	border-left: none;
	/*color: #f1f1f1;*/
}

/*.table tr {
  border-style: solid;
  border-color: #ffffff;
  border-bottom-color:  #00a94f;
  border-top-color: #00a94f;

}*/

/*table, th, td, tr {
  border: 10px solid #ffffff;
    border-bottom-color:  #00a94f;
  border-top-color: #00a94f;
}*/

        </style>
    <script type="text/javascript">
        function preventBack() { window.history.forward(); }
        setTimeout("preventBack()", 0);
        window.onunload = function () { null };
    </script>
        </header>
<%--      -------------------------- table --------------------------%>

<%--          --------------------------table ----------------------------%>
        
<br />
    <br />
    <br />
    <br />
    <br />
<div class="table-responsive" style="margin-bottom: 10px; align-content: center ">
	<table class="table" style="border:none">
		<tbody>
			<tr>
				<td class="ResTable">
<%--					<div class="iconLogo">
						<asp:Image ID="Image1" runat="server" ImageUrl="~/image/TelecomIcons.jfif" Height="30" Width="30" />
					</div>--%>
					<br />
<%--                    <div class="wrapper">
  <a href="#"><span>Hover Me!</span></a>
</div>--%>
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
					<div class="tdText" style="margin-left:0px">
						<asp:LinkButton ID="LinkButton5" PostBackUrl="~/PendingRecords.aspx" CssClass="linkText" runat="server">PLEDGE APPROVAL</asp:LinkButton>
					</div>
				</td>
				<td class="ResTable">
<%--					<div class="iconLogo">
						<asp:Image ID="Image2" runat="server" ImageUrl="~/image/VAULT.png" Height="30" Width="30" />
					</div>--%>
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
						<asp:LinkButton ID="LinkButton6" PostBackUrl="~/wak_pending.aspx" CssClass="linkText"  runat="server">VAULT APPROVAL</asp:LinkButton>
					</div>
				</td>
				<td class="ResTable">
<%--					<div class="iconLogo">
						<asp:Image ID="Image3" runat="server" ImageUrl="~/image/deeds.png" Height="30" Width="30" />
					</div>--%>
					<br />
					<div class="tdText">
						<asp:LinkButton ID="LinkButton3" PostBackUrl="~/RTDL.aspx" CssClass="linkText"  runat="server">TITLE DEEDS</asp:LinkButton>
					</div>
					<br />
					<div class="tdText">
						<asp:LinkButton ID="LinkButton9" PostBackUrl="~/new_rtd.aspx" CssClass="linkText" runat="server">NEW DEEDS</asp:LinkButton>
					</div>
					<br />
					<div class="tdText">
						<asp:LinkButton  ID="LinkButton8" PostBackUrl="~/RTD_pending.aspx" CssClass="linkText" runat="server">DEEDS APPROVAL</asp:LinkButton>
					</div>
				</td>
			</tr>
			<tr>
				<td class="ResTable">
<%--					<div class="iconLogo">
						<asp:Image ID="Image4" runat="server" ImageUrl="~/image/ACGF.png" ToolTip="Afghanistan Credit Grantee Foundation" Height="30" Width="40" />
					</div>--%>
					<br />
					<div class="tdText">
						<asp:LinkButton PostBackUrl="~/acgf_records.aspx" CssClass="linkText" ID="LinkButton11" runat="server">ACGF RECORDS</asp:LinkButton>
					</div>
					<br />
					<div class="tdText">
						<asp:LinkButton ID="LinkButton13" PostBackUrl="~/addNEW_acgf.aspx" CssClass="linkText" runat="server">NEW ACGF</asp:LinkButton>
					</div>
					<br />
					<div class="tdText">
						<asp:LinkButton ID="LinkButton14" PostBackUrl="~/acfg_pending__records.aspx" CssClass="linkText" runat="server">ACGF APPROVAL</asp:LinkButton>
					</div>
				</td>
				<td class="ResTable">
<%--					<div class="iconLogo">
						<asp:Image ID="Image5" runat="server" ImageUrl="~/image/MCU.png" Height="30" Width="30" />
					</div>--%>
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
						<asp:LinkButton ID="LinkButton17" PostBackUrl="~/mcu_pending_records.aspx" CssClass="linkText" runat="server">MANDATORY CLEAN-UP APPROVAL</asp:LinkButton>
					</div>
				</td>
				<td class="ResTable">
<%--					<div class="iconLogo">
						<asp:Image ID="Image6" runat="server" ImageUrl="~/image/loan.jpg" Height="30" Width="30" />
					</div>--%>
					<br />
					<div class="tdText">
						<asp:LinkButton ID="LinkButton15" PostBackUrl="~/ldr_records.aspx" CssClass="linkText" runat="server">Loan Documents Registration  RECORDS</asp:LinkButton>
					</div>
					<br />
					<div class="tdText">
						<asp:LinkButton ID="LinkButton18" PostBackUrl="~/newLRD_records.aspx" CssClass="linkText" runat="server" OnClick="LinkButton18_Click">NEW Loan Documents Registration </asp:LinkButton>
					</div>
					<br />
					<div class="tdText">
						<asp:LinkButton ID="LinkButton19" PostBackUrl="~/ldr_pending_records.aspx" CssClass="linkText"  runat="server">Loan Documents Registration  APPROVAL</asp:LinkButton>
					</div>
				</td>
			</tr>
			<tr>
				<td class="ResTable">
<%--					<div class="iconLogo">
						<asp:Image ID="Image7" runat="server" ImageUrl="~/image/loan.png" Height="30" Width="30" />
					</div>--%>
					<br />
					<div class="tdText">
						<asp:LinkButton  ID="LinkButton20" PostBackUrl="~/Loan__Covenant___Records.aspx" CssClass="linkText" runat="server">LOAN COVENANT RECORDS </asp:LinkButton>
					</div>
					<br />
					<div class="tdText">
						<asp:LinkButton ID="LinkButton21" PostBackUrl="~/newLCR.aspx" CssClass="linkText" runat="server" OnClick="LinkButton18_Click">NEW LOAN COVENANT RECORDS</asp:LinkButton>
					</div>
					<br />
					<div class="tdText">
						<asp:LinkButton ID="LinkButton22" PostBackUrl="~/LCR__Pending___Records.aspx" CssClass="linkText" runat="server">LOAN COVENANT RECORDS APPROVAL</asp:LinkButton>
					</div>
				</td>
				<td class="ResTable">
<%--					<div class="iconLogo">
						<asp:Image ID="Image8" runat="server" ImageUrl="~/image/loan.jpg" Height="30" Width="30" />
					</div>--%>
					<br />
					<div class="tdText">
						<asp:LinkButton ID="LinkButton23" PostBackUrl="~/DaytoDay.aspx" CssClass="linkText" runat="server">Day to Day RECORDS</asp:LinkButton>
					</div>
					<br />
					<div class="tdText">
						<asp:LinkButton ID="LinkButton24" PostBackUrl="~/AddnewDaytoDayRecords.aspx" CssClass="linkText" runat="server" OnClick="LinkButton18_Click">NEW DAY TO DAY</asp:LinkButton>
					</div>
					<br />
					<div class="tdText">
						<asp:LinkButton ID="LinkButton25" PostBackUrl="~/DaytoDay__Pending___Records.aspx" CssClass="linkText"  runat="server">DAY TO DAY APPROVAL</asp:LinkButton>
					</div>
				</td>
				<td class="ResTable">
<%--					<div class="iconLogo">
						<asp:Image ID="Image9" runat="server" ImageUrl="~/image/loan.jpg" Height="30" Width="30" />
					</div>--%>
					<br />
					<div class="tdText">
						<asp:LinkButton ID="LinkButton26" PostBackUrl="~/mtr.aspx" CssClass="linkText"  runat="server">Manual Transaction Records</asp:LinkButton>
					</div>
					<br />
					<div class="tdText">
						<asp:LinkButton ID="LinkButton27" PostBackUrl="~/newmtr.aspx" CssClass="linkText"  runat="server" OnClick="LinkButton18_Click">New Manual Transaction Record</asp:LinkButton>
					</div>
					<br />
					<div class="tdText">
						<asp:LinkButton ID="LinkButton28" PostBackUrl="~/mtr_pending.aspx" CssClass="linkText"  runat="server">Manual Transaction APPROVAL</asp:LinkButton>
					</div>
				</td>
			</tr>
		</tbody>
	</table>
</div>
<%--            -----------------------------table -----------------------------%>

    <br />
    <br />
        
<div class="table-responsive" style="padding-bottom:100px;float:right; ">
	<table>
		<tr>
			<td colspan="3" style="text-align:right;">
				<a href="Confirm.aspx" runat="server" id="userMsg" visible="false">
					<span class="fa fa-gear <%--fa-spin--%>" style="color: Blue; font-size: 15px">
					</span>
				</a>
				<asp:ImageButton ID="Newuser" runat="server" Height="15" ImageUrl="~/image/addnew.png"  ToolTip="Add new user" OnClick="Newuser_Click"/>
				<asp:ImageButton ID="signout" runat="server" Height="15px" ImageUrl="~/image/shutdown.jpg" ToolTip="Save your job(s) and exit" Width="15px" OnClick="signout_Click1" />
			</td>
		</tr>
	</table>
</div>
</asp:Content>
