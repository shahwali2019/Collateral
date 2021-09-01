<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="new_wak.aspx.cs" Inherits="Collateral_int.new_wak" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <div style="height: 120px; padding-left: 45%; border-top: 10px solid #0094ff; margin-top: -20px;" class="alert alert-success" role="alert">
        <h4 class="alert-heading" style="font-family: Bahnschrift;"><strong>
            <asp:Label ID="addLbl" runat="server" Text="Add New VAULT Record"></asp:Label></strong></h4>
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

            .auto-style16 {
                width: 183px;
                font-size: 12px;
                font-weight: bold;
                font-family: Bahnschrift;
                height: 20px;
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

            .auto-style33 {
                width: 105px;
                height: 46px;
            }

            .auto-style34 {
                width: 105px;
                height: 20px;
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
                <td class="auto-style1" colspan="4">

                    <div style="margin-left: -55px;">
                        <asp:ImageButton ID="back" runat="server" Height="23px" ImageUrl="~/image/back.png" OnClick="back_Click" Width="30px" /></div>
                    <br />
                </td>
                <td colspan="2">
                    <asp:CheckBox ID="ArchiveChBox" runat="server" Font-Size="Small" Text="Archive Setting" Font-Bold="True" Font-Names="Bahnschrift" AutoPostBack="True" Visible="False" OnCheckedChanged="ArchiveChBox_CheckedChanged" />
                </td>
            </tr>
            <tr>
                <td class="auto-style14">Client Name<strong><span style="color: red;">*</span></strong></td>
                <td class="auto-style32">

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtClient" ErrorMessage="X" Font-Names="Bahnschrift" Font-Size="XX-Small" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style18">
                    <%-- <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                     <ContentTemplate>--%>
                    <asp:TextBox ID="txtClient" AutoPostBack="true" CssClass="center" runat="server" Height="40px" Width="196px" Font-Bold="True" Font-Size="Smaller" TabIndex="1" OnTextChanged="txtClient_TextChanged"></asp:TextBox>
                    <%--       </ContentTemplate>
                     </asp:UpdatePanel>--%>
              
                </td>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style30">
                    <strong>Extention</strong></td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtExtention" CssClass="center" runat="server" Height="40px" Width="196px" Font-Bold="True" Font-Size="Smaller" TabIndex="8"></asp:TextBox>
                </td>
            </tr>
            <tr>

                <td class="auto-style14">Facility Approval No.#&nbsp;<strong><span style="color: red;">*</span></strong></td>
                <td class="auto-style32">

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="facilityApptxt" ErrorMessage="X" Font-Names="Bahnschrift" Font-Size="XX-Small" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style18">
                    <asp:TextBox ID="facilityApptxt" CssClass="center" runat="server" Height="40px" Width="196px" Font-Bold="True" Font-Size="Smaller" TabIndex="2"></asp:TextBox>
                </td>
                <td class="auto-style2">
                    <br />
                    <br />
                </td>
                <td class="auto-style30" style="width: 207px"><strong>Modificaton and Restructure </strong></td>
                <td style="width: 209px">
                    <asp:TextBox ID="txtMod" CssClass="center" runat="server" Height="40px" Width="196px" Font-Bold="True" Font-Size="Smaller" TabIndex="9"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style15"><strong>&nbsp;Facility Type<span style="color: red;">*</span></strong></td>
                <td class="auto-style32">

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="FacilityTypeList" ErrorMessage="X" Font-Names="Bahnschrift" Font-Size="XX-Small" ForeColor="Red" InitialValue="FacType"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style5">
                    <asp:DropDownList ID="FacilityTypeList" runat="server" CssClass="btn-info" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Smaller" Font-Strikeout="False" Font-Underline="False" ForeColor="White" Height="40px" Width="196px" TabIndex="3">
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

                        <asp:ListItem>OneDay</asp:ListItem>

                    </asp:DropDownList>
                </td>
                <td class="auto-style6">
                    <br />
                    <br />
                </td>
                <td class="auto-style7">Safe In Date<strong><span style="color: red;">*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></strong>&nbsp;&nbsp;&nbsp; 
                
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtSafein" ErrorMessage="X" Font-Names="Bahnschrift" Font-Size="XX-Small" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style8">
                    <asp:TextBox ID="txtSafein" CssClass="center" runat="server" Height="40px" Width="196px" Font-Bold="True" Font-Size="Smaller" TabIndex="10" TextMode="Date"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style14">F<strong>acility Status <span style="color: red;">*</span></strong></td>
                <td class="auto-style32">

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="FacilityStatusList" ErrorMessage="X" Font-Names="Bahnschrift" Font-Size="XX-Small" ForeColor="Red" InitialValue="FacSta"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style18">
                    <asp:DropDownList ID="FacilityStatusList" runat="server" CssClass="btn-info" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Smaller" Font-Strikeout="False" Font-Underline="False" ForeColor="White" Height="40px" Width="196px" TabIndex="4">
                        <asp:ListItem Selected="True" Value="FacSta">Facility Status</asp:ListItem>
                        <asp:ListItem Value="Acive">Active</asp:ListItem>
                        <asp:ListItem Value="Closed">Closed</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style2">
                    <br />
                    <br />
                </td>
                <td class="auto-style30" style="width: 207px">Safe Out Date</td>
                <td style="width: 209px">
                    <asp:TextBox ID="txtSafeout" CssClass="center" runat="server" Height="40px" Width="196px" AutoPostBack="true" Font-Bold="True" Font-Size="Smaller" TabIndex="12" TextMode="Date" OnTextChanged="txtSafeout_TextChanged"></asp:TextBox>

                </td>
                <td>
                    <asp:ImageButton ID="ImageButton2" runat="server" Height="20px" ImageUrl="~/image/refresh.jpg" Width="20px" OnClick="ImageButton2_Click" />
                </td>
            </tr>
            <tr>
                <td class="auto-style14"><strong>Safe No.# <span style="color: red;">*</span></strong></td>
                <td class="auto-style32">

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="SafeNoList" ErrorMessage="X" Font-Names="Bahnschrift" Font-Size="XX-Small" ForeColor="Red" InitialValue="SNO"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style18">
                    <asp:DropDownList ID="SafeNoList" runat="server" CssClass="btn-info" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Smaller" Font-Strikeout="False" Font-Underline="False" ForeColor="White" Height="40px" Width="196px" TabIndex="5">
                        <asp:ListItem Value="SNO">Safe Number</asp:ListItem>
                        <asp:ListItem Text="A" Value="A"></asp:ListItem>
                        <asp:ListItem Text="B" Value="B"></asp:ListItem>
                        <asp:ListItem Text="C" Value="C"></asp:ListItem>
                        <asp:ListItem Text="D" Value="D"></asp:ListItem>
                        <asp:ListItem Text="E" Value="E"></asp:ListItem>
                        <asp:ListItem Text="F" Value="F"></asp:ListItem>
                        <asp:ListItem Text="G" Value="G"></asp:ListItem>
                        <asp:ListItem Text="H" Value="H"></asp:ListItem>
                        <asp:ListItem Text="I" Value="I"></asp:ListItem>
                        <asp:ListItem Text="J" Value="J"></asp:ListItem>
                        <asp:ListItem Text="K" Value="K"></asp:ListItem>
                        <asp:ListItem Text="L" Value="L"></asp:ListItem>
                        <asp:ListItem Text="M" Value="M"></asp:ListItem>
                        <asp:ListItem Text="N" Value="N"></asp:ListItem>
                        <asp:ListItem Text="O" Value="O"></asp:ListItem>
                        <asp:ListItem Text="P" Value="P"></asp:ListItem>
                        <asp:ListItem Text="Q" Value="Q"></asp:ListItem>
                        <asp:ListItem Text="R" Value="R"></asp:ListItem>
                        <asp:ListItem Text="S" Value="S"></asp:ListItem>
                        <asp:ListItem Text="T" Value="T"></asp:ListItem>
                        <asp:ListItem Text="U" Value="U"></asp:ListItem>
                        <asp:ListItem Text="V" Value="V"></asp:ListItem>
                        <asp:ListItem Text="W" Value="W"></asp:ListItem>
                        <asp:ListItem Text="X" Value="X"></asp:ListItem>
                        <asp:ListItem Text="Y" Value="Y"></asp:ListItem>
                        <asp:ListItem Text="Z" Value="Z"></asp:ListItem>

                    </asp:DropDownList>
                </td>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style30" style="width: 207px">Document Status<strong><span style="color: red;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></strong></td>
                <td style="width: 209px">
                    <asp:DropDownList ID="DocStatusList" runat="server" CssClass="btn-success" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Smaller" Font-Strikeout="False" Font-Underline="False" ForeColor="White" Height="40px" Width="196px" TabIndex="11" Enabled="False">
                        <asp:ListItem Value=" ">Document Status</asp:ListItem>

                        <asp:ListItem Selected="True" Value="Available">Placed</asp:ListItem>

                        <asp:ListItem>Archieved</asp:ListItem>

                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style14"><strong>Drawer | Shelf <span style="color: red;">*</span></strong></td>
                <td class="auto-style32">

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtDrawer" ErrorMessage="X" Font-Names="Bahnschrift" Font-Size="XX-Small" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style18">
                    <asp:TextBox ID="txtDrawer" CssClass="center" runat="server" Height="40px" Width="196px" Font-Bold="True" Font-Size="Smaller" TabIndex="6"></asp:TextBox>
                </td>
                <td class="auto-style2">
                    <br />
                    <br />
                </td>
                <td class="auto-style30" style="width: 207px">
                Remark<td style="width: 209px">
                    <asp:TextBox ID="txtRemark" runat="server" Height="40px" Width="196px" Font-Bold="False" Font-Size="X-Small" TabIndex="13" BackColor="#CCCCCC" BorderColor="#FFFF99" Font-Names="Bahnschrift" ForeColor="Black" TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style16"><strong>&nbsp;Folder Number <span style="color: red;">*</span></strong></td>
                <td class="auto-style32">

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtFolderNo" ErrorMessage="X" Font-Names="Bahnschrift" Font-Size="XX-Small" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style10">
                    <asp:TextBox ID="txtFolderNo" CssClass="center" runat="server" Height="40px" Width="196px" Font-Bold="True" Font-Size="Smaller" TabIndex="7"></asp:TextBox>
                </td>
                <td class="auto-style11"></td>
                <td class="auto-style12">
                    <asp:Label ID="DocArcLbl" runat="server" Text="Document Archive" Visible="False"></asp:Label>
                </td>
                <td class="auto-style13">
                    <asp:TextBox ID="txtArcDoc" CssClass="center" runat="server" Height="40px" Width="196px" Font-Bold="True" Font-Size="Smaller" TabIndex="12" OnTextChanged="txtSafeout_TextChanged" Visible="False"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style31" colspan="2">&nbsp;</td>
                <td class="auto-style10">
                    <strong>
                        <asp:Button ID="subBtn" runat="server" CssClass="btn-primary" Height="37px" Text="ADD" Width="81px" Font-Bold="True" Font-Size="Small" TabIndex="14" OnClick="subBtn_Click" BorderStyle="None" />
                    </strong></td>
                <td class="auto-style11">&nbsp;</td>
                <td class="auto-style12">
                    <asp:Label ID="cabineRefLbl" runat="server" Text="Cabine|Safe Reference" Visible="False"></asp:Label>
                </td>
                <td class="auto-style13">
                    <asp:TextBox ID="txtCabineRef" runat="server" Height="40px" Visible="False" Width="196px" CssClass="center"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style30" colspan="4" rowspan="2">&nbsp;</td>
                <td class="auto-style12">
                    <asp:Label ID="ArchDateLbl" runat="server" Text="Archive Date" Visible="False"></asp:Label>
                </td>
                <td class="auto-style13">
                    <asp:TextBox ID="txtArchiveDate" CssClass="center" runat="server" Height="40px" Width="196px" Font-Bold="True" Font-Size="Smaller" TabIndex="12" TextMode="Date" OnTextChanged="txtSafeout_TextChanged" Visible="False"></asp:TextBox>
                </td>
                <td>

                    <asp:ImageButton ID="ImageButton3" runat="server" Height="20px" ImageUrl="~/image/refresh.jpg" Width="20px" OnClick="ImageButton3_Click" Visible="False" />

                </td>
            </tr>
            <tr>
                <td class="auto-style30" style="width: 207px">&nbsp;</td>
                <td style="width: 209px">&nbsp;</td>
            </tr>
        </table>

    </div>

</asp:Content>





