<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Insert_LAR.aspx.cs" Inherits="Collateral.Insert_LAR" %>
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
         <asp:Label ID="addLbl" runat="server" Text="ADD LOAN APPROVAL RECORD"></asp:Label>
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
         <td class="auto-style14">Disbursement date<strong><span style="color: red;">*</span></strong></td>
         <td class="auto-style32">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtdate" ErrorMessage="X" Font-Names="Bahnschrift" Font-Size="XX-Small" ForeColor="Red"></asp:RequiredFieldValidator>
         </td>
         <td class="auto-style18">
            <asp:TextBox ID="txtdate" CssClass="center" runat="server" Height="40px" Width="196px" AutoPostBack="true" Font-Bold="True" Font-Size="Smaller" TabIndex="12" TextMode="Date"></asp:TextBox>

         </td>
         <td class="auto-style6">
            <br />
            <br />
         </td>
         <td class="auto-style7">
            Borrower<strong><span style="color: red;">*&nbsp;&nbsp;&nbsp;</span></strong>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtBorrower" ErrorMessage="X" Font-Names="Bahnschrift" Font-Size="XX-Small" ForeColor="Red"></asp:RequiredFieldValidator>
         </td>
         <td class="auto-style3">
            <asp:TextBox ID="txtBorrower" CssClass="center" runat="server" Height="40px" Width="196px" Font-Bold="True" Font-Size="Smaller" TabIndex="8"></asp:TextBox>
         </td>
      </tr>
      <tr>
         <td class="auto-style15"><strong>&nbsp;Case Number<span style="color: red;">*</span></strong></td>
         <td class="auto-style32">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtFacilityTypeList" ErrorMessage="X" Font-Names="Bahnschrift" Font-Size="XX-Small" ForeColor="Red"></asp:RequiredFieldValidator>
         </td>
         <td class="auto-style5">
            <asp:TextBox ID="txtCaseNo" CssClass="center" runat="server" Height="40px" Width="196px" Font-Bold="True" Font-Size="Smaller" TabIndex="8"></asp:TextBox>

         </td>
         <td class="auto-style6">
            <br />
            <br />
         </td>
         <td class="auto-style7"><strong><span style="color: red;">&nbsp;&nbsp;&nbsp;</span></strong>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 
         </td>
         <td class="auto-style8">
         </td>
      </tr>
      <tr>
         <td class="auto-style15"><strong>&nbsp;Facility Type<span style="color: red;">*</span></strong></td>
         <td class="auto-style32">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" ControlToValidate="txtFacilityTypeList" ErrorMessage="X" Font-Names="Bahnschrift" Font-Size="XX-Small" ForeColor="Red"></asp:RequiredFieldValidator>
         </td>
         <td class="auto-style5">
            <asp:TextBox ID="txtFacilityTypeList" CssClass="center" runat="server" Height="40px" Width="196px" Font-Bold="True" Font-Size="Smaller" TabIndex="10"></asp:TextBox>
         </td>
         <td class="auto-style6">
            <br />
            <br />
         </td>
         <td class="auto-style7">
            Facility Event<strong><span style="color: red;">*&nbsp;&nbsp;&nbsp;</span></strong>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtfacilityevent" ErrorMessage="X" Font-Names="Bahnschrift" Font-Size="XX-Small" ForeColor="Red"></asp:RequiredFieldValidator>
         </td>
         <td class="auto-style8">
            <asp:TextBox ID="txtfacilityevent" CssClass="center" runat="server" Height="40px" Width="196px" Font-Bold="True" Font-Size="Smaller" TabIndex="10"></asp:TextBox>
         </td>
      </tr>
      <tr>
         <td class="auto-style15"><strong>&nbsp;Currency<span style="color: red;">*</span></strong></td>
         <td class="auto-style32">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="txtDropDownListCurrency" ErrorMessage="X" Font-Names="Bahnschrift" Font-Size="XX-Small" ForeColor="Red" InitialValue="currency"></asp:RequiredFieldValidator>
         </td>
         <td class="auto-style5">
            <asp:DropDownList ID="txtDropDownListCurrency" runat="server" CssClass="btn-info" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Smaller" Font-Strikeout="False" Font-Underline="False" ForeColor="White" Height="40px" Width="196px" TabIndex="3">
               <asp:ListItem Text="Currency" Value="currency"></asp:ListItem>
               <asp:ListItem Text="AFN" Value="AFN"></asp:ListItem>
               <asp:ListItem Text=" USD" Value="USD"></asp:ListItem>
               <asp:ListItem Text="EUR" Value="EUR"></asp:ListItem>
               <asp:ListItem Text="Others" Value="Others"></asp:ListItem>
            </asp:DropDownList>
         </td>
         <td class="auto-style2">
            <br />
            <br />
         </td>
         <td class="auto-style7">
            Fa<strong>cility amount<span style="color: red;">*&nbsp;&nbsp;&nbsp;</span></strong>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtfamount" ErrorMessage="X" Font-Names="Bahnschrift" Font-Size="XX-Small" ForeColor="Red"></asp:RequiredFieldValidator>
         </td>
         <td style="width: 209px">
            <asp:TextBox ID="txtfamount" CssClass="center" runat="server" Height="40px" Width="196px" AutoPostBack="true" Font-Bold="True" Font-Size="Smaller" TabIndex="12"></asp:TextBox>
         </td>
      </tr>
      <tr>
         <td class="auto-style14"><strong> HOCC Approval Date <span style="color: red;">*</span></strong></td>
         <td class="auto-style32">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtHOCCApprovalDate" ErrorMessage="X" Font-Names="Bahnschrift" Font-Size="XX-Small" ForeColor="Red"></asp:RequiredFieldValidator>
         </td>
         <td style="width: 209px">
             <asp:TextBox ID="txtHOCCApprovalDate" CssClass="center" runat="server" Height="40px" Width="196px" AutoPostBack="true" Font-Bold="True" Font-Size="Smaller" TabIndex="12" TextMode="Date"></asp:TextBox>

         </td>
         <td class="auto-style22">
            <br />
            <br />
         </td>
         <td class="auto-style71">
            <strong>CEO<span style="color: red;">*&nbsp;</span></strong>&nbsp;&nbsp;&nbsp; 
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtceo" ErrorMessage="X" Font-Names="Bahnschrift" Font-Size="XX-Small" ForeColor="Red" InitialValue="Selectceo"></asp:RequiredFieldValidator>
         </td>
         <td class="auto-style18">
            <asp:DropDownList ID="txtceo" runat="server" CssClass="btn-info" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Smaller" Font-Strikeout="False" Font-Underline="False" ForeColor="White" Height="40px" Width="196px" TabIndex="5">
               <asp:ListItem Text="Select" Value="Selectceo"></asp:ListItem>
               <asp:ListItem Text="YES" Value="YES"></asp:ListItem>
               <asp:ListItem Text="NO" Value="NO"></asp:ListItem>
            </asp:DropDownList>
         </td>
      </tr>
      <tr>
         <td class="auto-style14"><strong>CFO<span style="color: red;">*</span></strong></td>
         <td class="auto-style32">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtcfo" ErrorMessage="X" Font-Names="Bahnschrift" Font-Size="XX-Small" ForeColor="Red" InitialValue="selectcfo"></asp:RequiredFieldValidator>
         </td>
         <td class="auto-style18">
            <asp:DropDownList ID="txtcfo" runat="server" CssClass="btn-info" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Smaller" Font-Strikeout="False" Font-Underline="False" ForeColor="White" Height="40px" Width="196px" TabIndex="5">
               <asp:ListItem Text="Select" Value="selectcfo"></asp:ListItem>
               <asp:ListItem Text="YES" Value="YES"></asp:ListItem>
               <asp:ListItem Text="NO" Value="NO"></asp:ListItem>
            </asp:DropDownList>
         </td>
         <td class="auto-style22">
            <br />
            <br />
         </td>
         <td class="auto-style71">
            <strong>BOD Requirement<span style="color: red;">*&nbsp;</span></strong>&nbsp;&nbsp;&nbsp; 
            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtBODRequirement" ErrorMessage="X" Font-Names="Bahnschrift" Font-Size="XX-Small" ForeColor="Red" InitialValue="selectbod"></asp:RequiredFieldValidator>
         </td>
         <td class="auto-style13">
            <asp:DropDownList ID="txtBODRequirement" runat="server" AutoPostBack="true"  OnSelectedIndexChanged="txtBODRequirement_SelectedIndexChanged" CssClass="btn-info" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Smaller" Font-Strikeout="False" Font-Underline="False" ForeColor="White" Height="40px" Width="196px" TabIndex="5">
                <asp:ListItem Text="NO" Value="NO"></asp:ListItem>
                <asp:ListItem Text="YES" Value="YES"></asp:ListItem>
            </asp:DropDownList>
         </td>
      </tr>

         <tr>
       <asp:Panel ID="bodc" runat="server" Visible="false">
         <td class="auto-style140">BoD Approval Date<strong><span style="color: red;">*</span></strong></td>
         <td class="auto-style32">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtBoDApprovalDate" ErrorMessage="X" Font-Names="Bahnschrift" Font-Size="XX-Small" ForeColor="Red"></asp:RequiredFieldValidator>
         </td>
         <td class="auto-style180">
            <asp:TextBox ID="txtBoDApprovalDate" AutoPostBack="true"  CssClass="center" runat="server" Height="40px" Width="196px" Font-Bold="True" Font-Size="Smaller" TabIndex="1" TextMode="Date"></asp:TextBox>

         </td>
         <td class="auto-style60">
            <br />
            <br />
         </td>
         <td class="auto-style7">
            BOD chairman<strong><span style="color: red;">*&nbsp;&nbsp;&nbsp;</span></strong>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 
            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtbodcharman" ErrorMessage="X" Font-Names="Bahnschrift" Font-Size="XX-Small" ForeColor="Red" InitialValue="selectLR"></asp:RequiredFieldValidator>
         </td>
         <td class="auto-style30">
             
            <asp:TextBox ID="txtbodcharman" CssClass="center" runat="server" Height="40px" Width="196px" Font-Bold="True" Font-Size="Smaller" TabIndex="8"></asp:TextBox>


         </td>
         </asp:Panel>
      </tr>
       <tr>
           <asp:Panel ID="bod1" runat="server" Visible="false">
         <td class="auto-style140">BOD1<strong><span style="color: red;">*</span></strong></td>
         <td class="auto-style32">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txtbodcharman" ErrorMessage="X" Font-Names="Bahnschrift" Font-Size="XX-Small" ForeColor="Red"  InitialValue="selectHM"></asp:RequiredFieldValidator>
         </td>
         <td class="auto-style18">
        
            <asp:TextBox ID="txtbod1" CssClass="center" runat="server" Height="40px" Width="196px" Font-Bold="True" Font-Size="Smaller" TabIndex="8"></asp:TextBox>

         </td>
         <td class="auto-style6">
            <br />
            <br />
         </td>
         <td class="auto-style7">
            BOD2<strong><span style="color: red;">*&nbsp;&nbsp;&nbsp;</span></strong>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 
            <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txtbod2" ErrorMessage="X" Font-Names="Bahnschrift" Font-Size="XX-Small" ForeColor="Red" InitialValue="selectHM"></asp:RequiredFieldValidator>
         </td>

         <td class="auto-style31">
            <asp:TextBox ID="txtbod2" CssClass="center" runat="server" Height="40px" Width="196px" Font-Bold="True" Font-Size="Smaller" TabIndex="8"></asp:TextBox>
     
         </td>
         </asp:panel>  
      </tr>
      <tr>
           <asp:Panel ID="bod2" runat="server" Visible="false">
         <td class="auto-style140">BOD3<strong><span style="color: red;">*</span></strong></td>
         <td class="auto-style32">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="txtbod3" ErrorMessage="X" Font-Names="Bahnschrift" Font-Size="XX-Small" ForeColor="Red"  InitialValue="selectRS"></asp:RequiredFieldValidator>
         </td>
         <td class="auto-style18">
            <asp:TextBox ID="txtbod3" CssClass="center" runat="server" Height="40px" Width="196px" Font-Bold="True" Font-Size="Smaller" TabIndex="8"></asp:TextBox>
         </td>
         <td class="auto-style6">
            <br />
            <br />
         </td>
         <td class="auto-style7">
            BOD4<strong><span style="color: red;">*&nbsp;&nbsp;&nbsp;</span></strong>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 
            <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" ControlToValidate="txtbod4" ErrorMessage="X" Font-Names="Bahnschrift" Font-Size="XX-Small" ForeColor="Red" InitialValue="selectSS"></asp:RequiredFieldValidator>
         </td>
         <td class="auto-style31">
            <asp:TextBox ID="txtbod4" CssClass="center" runat="server" Height="40px" Width="196px" Font-Bold="True" Font-Size="Smaller" TabIndex="8"></asp:TextBox>

         </td>
          </asp:panel>
      </tr>
                   <tr>
 <asp:Panel ID="bod3" runat="server" Visible="false">
         <td class="auto-style140">BOD5<strong><span style="color: red;">*</span></strong></td>
         <td class="auto-style32">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="txtbod5" ErrorMessage="X" Font-Names="Bahnschrift" Font-Size="XX-Small" ForeColor="Red"  InitialValue="selectMT"></asp:RequiredFieldValidator>
         </td>
         <td class="auto-style18">
            <asp:TextBox ID="txtbod5" CssClass="center" runat="server" Height="40px" Width="196px" Font-Bold="True" Font-Size="Smaller" TabIndex="8"></asp:TextBox>
         </td>
         <td class="auto-style6">
            <br />
            <br />
         </td>
         <td class="auto-style7">
            BOD6<strong><span style="color: red;">*&nbsp;&nbsp;&nbsp;</span></strong>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 
            <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ControlToValidate="txtbod6" ErrorMessage="X" Font-Names="Bahnschrift" Font-Size="XX-Small" ForeColor="Red" InitialValue="selectAS"></asp:RequiredFieldValidator>
         </td>
         <td class="auto-style31">
            <asp:TextBox ID="txtbod6" CssClass="center" runat="server" Height="40px" Width="196px" Font-Bold="True" Font-Size="Smaller" TabIndex="8"></asp:TextBox>
         </td>
                       </asp:panel>
      </tr>
            <tr>

         <td class="auto-style140">Facility Status<strong><span style="color: red;">*</span></strong></td>
         <td class="auto-style32">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ControlToValidate="txtFacilityStatus" ErrorMessage="X" Font-Names="Bahnschrift" Font-Size="XX-Small" ForeColor="Red"  InitialValue="selectFS"></asp:RequiredFieldValidator>
         </td>
         <td class="auto-style18">
            <asp:DropDownList ID="txtFacilityStatus" runat="server" CssClass="btn-info" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Smaller" Font-Strikeout="False" Font-Underline="False" ForeColor="White" Height="40px" Width="196px" TabIndex="5">
               <asp:ListItem Text="Status of Facility" Value="selectFS"></asp:ListItem>
               <asp:ListItem Text="Active" Value="Active"></asp:ListItem>
               <asp:ListItem Text="Renewed" Value="Renewed"></asp:ListItem>
               <asp:ListItem Text="Cancelled" Value="Cancelled"></asp:ListItem>
               <asp:ListItem Text="Adjusted/Settled" Value="Adjusted/Settled"></asp:ListItem>
               <asp:ListItem Text="Rescheduled" Value="Rescheduled"></asp:ListItem>
               <asp:ListItem Text="Restructured" Value="Restructured"></asp:ListItem>
               <asp:ListItem Text="Invoked" Value="Invoked"></asp:ListItem>
               <asp:ListItem Text="Others" Value="Others"></asp:ListItem>
            </asp:DropDownList> 

         </td>
         <td class="auto-style6">
            <br />
            <br />
         </td>
         <td class="auto-style7">
            Remarks<strong><span style="color: red;">*&nbsp;&nbsp;&nbsp;</span></strong>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 
            <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ControlToValidate="txtRemarks" ErrorMessage="X" Font-Names="Bahnschrift" Font-Size="XX-Small" ForeColor="Red"></asp:RequiredFieldValidator>
         </td>
         <td class="auto-style31">
            <asp:TextBox ID="txtRemarks" CssClass="center" runat="server" Height="40px" Width="196px" Font-Bold="True" Font-Size="Smaller" TabIndex="8"></asp:TextBox>

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
               <asp:Button ID="subBtn" runat="server" CssClass="btn-primary" Height="37px" Text="ADD" Width="81px" Font-Bold="True" Font-Size="Small" TabIndex="14" OnClick="subBtn_Click" BorderStyle="None" />
            </strong>
         </td>
      </tr>
   </table>
</div>
</asp:Content>
