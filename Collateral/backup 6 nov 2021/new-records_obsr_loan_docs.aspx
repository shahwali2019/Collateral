<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="new-records_obsr_loan_docs.aspx.cs" Inherits="Collateral.new_records_obsr_loan_docs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

        <br />
    <div style="height: 120px; padding-left: 45%; border-top: 10px solid #0094ff; margin-top: -20px;" class="alert alert-success" role="alert">
        <h4 class="alert-heading" style="font-family: Bahnschrift;"><strong>
            <asp:Label ID="addLbl" runat="server" Text="Add OBSERVATIONS ON LOAN DOCUMENTS Record"></asp:Label></strong></h4>
                            <asp:Label ID="lblMessage" Text="" runat="server" ForeColor="Red" EnableViewState="false" />

    </div>
    <div style="background-color: #fff; padding: 50px; margin-top: -40px;">
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
        <table class="auto-style17" style="padding-bottom: 5px;">
            <tr>
                <td class="auto-style1" colspan="4">&nbsp;</td>
                <td colspan="2">

                    <asp:Label ID="msg" runat="server" Visible="False" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Smaller"></asp:Label>


                </td>
            </tr>

            <tr>
                <td class="auto-style14">Document checking date<strong><span style="color: red;">*</span></strong></td>
                <td class="auto-style32">

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtdchkdate" ErrorMessage="X" Font-Names="Bahnschrift" Font-Size="XX-Small" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style18">
                    <asp:TextBox ID="txtdchkdate" AutoPostBack="true" CssClass="center" runat="server" Height="40px" Width="196px" Font-Bold="True" Font-Size="Smaller" TabIndex="1" TextMode="Date"></asp:TextBox>

                </td>

                <td class="auto-style6">
                    <br />
                    <br />
                </td>
                <td class="auto-style7">Borrower<strong><span style="color: red;">*&nbsp;&nbsp;&nbsp;</span></strong>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 
                
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtCaseNumber" ErrorMessage="X" Font-Names="Bahnschrift" Font-Size="XX-Small" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtBorrower" CssClass="center" runat="server" Height="40px" Width="196px" Font-Bold="True" Font-Size="Smaller" TabIndex="8"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style15"><strong>&nbsp;Facility Type<span style="color: red;">*</span></strong></td>
                <td class="auto-style32">

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtFacilityTypeList" ErrorMessage="X" Font-Names="Bahnschrift" Font-Size="XX-Small" ForeColor="Red" InitialValue="FacType"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style5">
                    <asp:DropDownList ID="txtFacilityTypeList" runat="server" CssClass="btn-info" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Smaller" Font-Strikeout="False" Font-Underline="False" ForeColor="White" Height="40px" Width="196px" TabIndex="3">
                        <asp:ListItem Text="Facility Type" Value="FacType"></asp:ListItem>

                        <asp:ListItem Text="LSME" Value="LSME"></asp:ListItem>
                        <asp:ListItem Text=" LFSC" Value=" LFSC"></asp:ListItem>
                        <asp:ListItem Text=" LPIF" Value=" LPIF"></asp:ListItem>
                        <asp:ListItem Text="SBML" Value="SBML"></asp:ListItem>
                        <asp:ListItem Text=" SBSL" Value=" SBSL"></asp:ListItem>
                        <asp:ListItem Text=" LIND" Value=" LIND"></asp:ListItem>
                        <asp:ListItem Text="MCFP" Value="MCFP"></asp:ListItem>
                        <asp:ListItem Text=" MRCF" Value=" MRCF"></asp:ListItem>
                        <asp:ListItem Text="HELO" Value="HELO"></asp:ListItem>
                        <asp:ListItem Text="AZDL" Value="AZDL"></asp:ListItem>
                        <asp:ListItem Text="PAYL" Value="PAYL"></asp:ListItem>
                        <asp:ListItem Text="TLCL" Value="TLCL"></asp:ListItem>
                        <asp:ListItem Text="GTEP" Value="GTEP"></asp:ListItem>
                        <asp:ListItem Text=" GTEA" Value=" GTEA"></asp:ListItem>
                        <asp:ListItem Text=" GTEB" Value=" GTEB"></asp:ListItem>
                        <asp:ListItem Text=" GTIR" Value=" GTIR"></asp:ListItem>
                        <asp:ListItem Text=" LCSB" Value=" LCSB"></asp:ListItem>
                        <asp:ListItem Text="EXLC" Value="EXLC"></asp:ListItem>
                        <asp:ListItem Text="ABIL" Value="ABIL"></asp:ListItem>
                        <asp:ListItem Text="OFDC" Value="OFDC"></asp:ListItem>
                        <asp:ListItem Text="UILC" Value="UILC"></asp:ListItem>
                        <asp:ListItem Text="CCARDS" Value="CCARDS"></asp:ListItem>


                    </asp:DropDownList>
                </td>
                <td class="auto-style6">
                    <br />
                    <br />
                </td>
                <td class="auto-style7">Case Number<strong><span style="color: red;">*&nbsp;&nbsp;&nbsp;</span></strong>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 
                
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtCaseNumber" ErrorMessage="X" Font-Names="Bahnschrift" Font-Size="XX-Small" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style8">
                    <asp:TextBox ID="txtCaseNumber" CssClass="center" runat="server" Height="40px" Width="196px" Font-Bold="True" Font-Size="Smaller" TabIndex="10"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style15"><strong>&nbsp;Currency<span style="color: red;">*</span></strong></td>
                <td class="auto-style32">

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator121" runat="server" ControlToValidate="txtDropDownListCurrency" ErrorMessage="X" Font-Names="Bahnschrift" Font-Size="XX-Small" ForeColor="Red" InitialValue="currency"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style5">
                    <asp:DropDownList ID="txtDropDownListCurrency" runat="server" CssClass="btn-info" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Smaller" Font-Strikeout="False" Font-Underline="False" ForeColor="White" Height="40px" Width="196px" TabIndex="3">
                        <asp:ListItem Text="Currency" Value="currency"></asp:ListItem>

                        <asp:ListItem Text="AFN" Value="AFN"></asp:ListItem>
                        <asp:ListItem Text=" USD" Value="USD"></asp:ListItem>
                        <asp:ListItem Text="EUR" Value="EUR"></asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style2">
                    <br />
                    <br />
                </td>
                <td class="auto-style7">Fa<strong>cility amount<span style="color: red;">*&nbsp;&nbsp;&nbsp;</span></strong>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtfamount" ErrorMessage="X" Font-Names="Bahnschrift" Font-Size="XX-Small" ForeColor="Red"></asp:RequiredFieldValidator>
                
                </td>
                <td style="width: 209px">
                    <asp:TextBox ID="txtfamount" CssClass="center" runat="server" Height="40px" Width="196px" AutoPostBack="true" Font-Bold="True" Font-Size="Smaller" TabIndex="12"></asp:TextBox>

                </td>
            </tr>
            <tr>
                <td class="auto-style14"><strong>Customer type ( PEP /None) <span style="color: red;">*</span></strong></td>
                <td class="auto-style32">

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtchecklistcusttype" ErrorMessage="X" Font-Names="Bahnschrift" Font-Size="XX-Small" ForeColor="Red" InitialValue="custyp"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style18">
                    <asp:DropDownList ID="txtchecklistcusttype" runat="server" CssClass="btn-info" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Smaller" Font-Strikeout="False" Font-Underline="False" ForeColor="White" Height="40px" Width="196px" TabIndex="5">
                    <asp:ListItem Text="Customer Type" Value="custyp"></asp:ListItem>
                    <asp:ListItem Text="PEP" Value="PEP">PEP</asp:ListItem>
                    <asp:ListItem Text="NONE" Value="NONE">NONE</asp:ListItem>


                    </asp:DropDownList>
                </td>

                                <td class="auto-style22">
                    <br />
                    <br />
                </td>
                 <td class="auto-style14"><strong>Status of Facility<span style="color: red;">*</span></strong></td>

                <td class="auto-style18">
                    <asp:DropDownList ID="txtchecklistsfacility" runat="server" CssClass="btn-info" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Smaller" Font-Strikeout="False" Font-Underline="False" ForeColor="White" Height="40px" Width="196px" TabIndex="5">

                        <asp:ListItem Text="Status of Facility" Value="StatusofFacility"></asp:ListItem>
                        <asp:ListItem Text="Active" Value="Active"></asp:ListItem>
                        <asp:ListItem Text="Renewed" Value="Renewed"></asp:ListItem>
                        <asp:ListItem Text="Cancelled" Value="Cancelled"></asp:ListItem>
                        <asp:ListItem Text="Adjusted/Settled" Value="Adjusted/Settled"></asp:ListItem>
                        <asp:ListItem Text="Rescheduled" Value="Rescheduled"></asp:ListItem>
                        <asp:ListItem Text="Restructured" Value="Restructured"></asp:ListItem>
                        <asp:ListItem Text="Invoked" Value="Invoked"></asp:ListItem>


                    </asp:DropDownList>
                </td>

            </tr>
            <tr>
                <td class="auto-style14"><strong>Status of Observation<span style="color: red;">*</span></strong></td>
                <td class="auto-style32">

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtstasobsr" ErrorMessage="X" Font-Names="Bahnschrift" Font-Size="XX-Small" ForeColor="Red" InitialValue="stasobsr"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style18">
                    <asp:DropDownList ID="txtstasobsr" runat="server" CssClass="btn-info" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Smaller" Font-Strikeout="False" Font-Underline="False" ForeColor="White" Height="40px" Width="196px" TabIndex="5">
                    <asp:ListItem Text="Status of Observation" Value="stasobsr"></asp:ListItem>
                    <asp:ListItem Text="OK" Value="OK"></asp:ListItem>
                    <asp:ListItem Text="Pending" Value="Pending"></asp:ListItem>

                    </asp:DropDownList>
                </td>

<%--                <td class="auto-style22">
                    <br />
                    <br />
                </td>
                <td class="auto-style7"><strong>Outstanding observations<span style="color: red;">*&nbsp;</span></strong>&nbsp;&nbsp;&nbsp; 
                
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtoutstnobr" ErrorMessage="X" Font-Names="Bahnschrift" Font-Size="XX-Small" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td style="width: 209px">
                    <asp:TextBox ID="txtoutstnobr" CssClass="center" runat="server"  Height="246px" Width="196px" placeholder="   Document Received..." TabIndex="5" BackColor="#FFFF66" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="XX-Small" TextMode="MultiLine" ></asp:TextBox>

                </td>--%>
                                <td class="auto-style22">
                    <br />
                    <br />
                </td>
                <td class="auto-style71"><strong>Remarks<span style="color: red;">*&nbsp;</span></strong>&nbsp;&nbsp;&nbsp; 
                
                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtRemark" ErrorMessage="X" Font-Names="Bahnschrift" Font-Size="XX-Small" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style13">
                    <asp:TextBox ID="txtRemark" CssClass="center" runat="server" Height="40px" Width="196px" Font-Bold="True" Font-Size="Smaller" TabIndex="12"></asp:TextBox>
                </td>
            </tr>

                            <td class="auto-style225">
                    <br />
                    <br />
                </td>
                <td class="auto-style7"><strong>Initial Observations<span style="color: red;">*&nbsp;</span></strong>&nbsp;&nbsp;&nbsp; 
                
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtiniobseerv" ErrorMessage="X" Font-Names="Bahnschrift" Font-Size="XX-Small" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td style="width: 209px">
                    <asp:TextBox ID="txtiniobseerv" CssClass="center" runat="server" Height="246px" Width="196px" placeholder="   Document Received..." TabIndex="5" BackColor="#FFFF66" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="XX-Small" TextMode="MultiLine"></asp:TextBox>

                </td>

            
                <td class="auto-style22">
                    <br />
                    <br />
                </td>
                <td class="auto-style7"><strong>Outstanding observations<span style="color: red;">*&nbsp;</span></strong>&nbsp;&nbsp;&nbsp; 
                
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtoutstnobr" ErrorMessage="X" Font-Names="Bahnschrift" Font-Size="XX-Small" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td style="width: 209px">
                    <asp:TextBox ID="txtoutstnobr" CssClass="center" runat="server"  Height="246px" Width="196px" placeholder="   Document Received..." TabIndex="5" BackColor="#FFFF66" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="XX-Small" TextMode="MultiLine" ></asp:TextBox>

                </td>

<%--            <tr>
                <td class="auto-style14"><strong>Status of Facility<span style="color: red;">*</span></strong></td>
                <td class="auto-style32">

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtchecklistsfacility" ErrorMessage="X" Font-Names="Bahnschrift" Font-Size="XX-Small" ForeColor="Red" InitialValue="StatusofFacility"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style18">
                    <asp:DropDownList ID="txtchecklistsfacility" runat="server" CssClass="btn-info" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Smaller" Font-Strikeout="False" Font-Underline="False" ForeColor="White" Height="40px" Width="196px" TabIndex="5">

                        <asp:ListItem Text="Status of Facility" Value="StatusofFacility"></asp:ListItem>
                        <asp:ListItem Text="Active" Value="Active"></asp:ListItem>
                        <asp:ListItem Text="Renewed" Value="Renewed"></asp:ListItem>
                        <asp:ListItem Text="Cancelled" Value="Cancelled"></asp:ListItem>
                        <asp:ListItem Text="Adjusted/Settled" Value="Adjusted/Settled"></asp:ListItem>
                        <asp:ListItem Text="Rescheduled" Value="Rescheduled"></asp:ListItem>
                        <asp:ListItem Text="Restructured" Value="Restructured"></asp:ListItem>
                        <asp:ListItem Text="Invoked" Value="Invoked"></asp:ListItem>


                    </asp:DropDownList>
                </td>

                <td class="auto-style22">
                    <br />
                    <br />
                </td>
                <td class="auto-style71"><strong>Remarks<span style="color: red;">*&nbsp;</span></strong>&nbsp;&nbsp;&nbsp; 
                
                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtRemark" ErrorMessage="X" Font-Names="Bahnschrift" Font-Size="XX-Small" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style13">
                    <asp:TextBox ID="txtRemark" CssClass="center" runat="server" Height="40px" Width="196px" Font-Bold="True" Font-Size="Smaller" TabIndex="12"></asp:TextBox>
                </td>
            </tr>--%>
            <tr>
                <td class="auto-style31" colspan="2">&nbsp;</td>
                <td class="auto-style10">
                    <strong>
                        <asp:Button ID="subBtn" runat="server" CssClass="btn-primary" Height="37px" Text="ADD" Width="81px" Font-Bold="True" Font-Size="Small" TabIndex="14" OnClick="subBtn_Click" BorderStyle="None" />
                    </strong></td>

                <td>&nbsp;</td>
            </tr>
            <tr>

                <td>


                </td>
            </tr>
            <tr>
                <td class="auto-style30" style="width: 207px">&nbsp;</td>
                <td style="width: 209px">&nbsp;</td>
            </tr>
        </table>

    </div>
</asp:Content>
