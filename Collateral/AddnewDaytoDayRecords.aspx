<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddnewDaytoDayRecords.aspx.cs" Inherits="Collateral.AddnewDaytoDayRecords" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
       <br />
    <div style="height: 120px; padding-left: 45%; border-top: 10px solid #0094ff; margin-top: -20px;" class="alert alert-success" role="alert">
        <h4 class="alert-heading" style="font-family: Bahnschrift;"><strong>
            <asp:Label ID="addLbl" runat="server" Text="Add Day to Day Record"></asp:Label></strong></h4>
    </div>
    <div style="background-color: #fff; padding: 50px; margin-top: -40px;">
        <style>
            .auto-style30 {
                font-size: 12px;
                font-weight: bold;
                font-family: Bahnschrift;
                width: 138px;
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
                width: 114px;
            }

            .auto-style46 {
                font-size: 12px;
                font-weight: bold;
                font-family: Bahnschrift;
                height: 46px;
                width: 114px;
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

            .auto-style52 {
                width: 209px;
                height: 46px;
            }

            .auto-style58 {
                width: 209px;
            }
        </style>
        <script>
    function HideLabel() {
        var seconds = 5;
        setTimeout(function () {
            document.getElementById("<%=txtlbl.ClientID %>").style.display = "none";
        }, seconds * 1000);
    };
        </script>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">

            <ContentTemplate>
                <table>
            <tr>
                <td>
                                        &nbsp;</td>
               
                <td>
                    &nbsp;</td>
                 <td>
                    <asp:GridView ID="GridView2" runat="server" CellPadding="4" GridLines="None" CssClass="center" Font-Size="Smaller" HorizontalAlign="Left" OnRowCommand="GridView2_RowCommand" Visible="False" Width="444px" ForeColor="#333333">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:TemplateField HeaderText="SELECT">
                                <ItemTemplate>
                                    <asp:Button ID="Button3" runat="server" CausesValidation="false" CommandArgument='<%# Bind("dob_id") %>' CommandName="Edit" Text="SELECT" />
                                </ItemTemplate>
                                <HeaderStyle CssClass="center" />
                                <ItemStyle CssClass="center" />
                            </asp:TemplateField>
                        </Columns>
                        <EditRowStyle BackColor="#7C6F57" />
                        <FooterStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True" />
                        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#E3EAEB" />
                        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F8FAFA" />
                        <SortedAscendingHeaderStyle BackColor="#246B61" />
                        <SortedDescendingCellStyle BackColor="#D4DFE1" />
                        <SortedDescendingHeaderStyle BackColor="#15524A" />
                    </asp:GridView>
                </td>
            </tr>
        </table>
            </ContentTemplate>
        </asp:UpdatePanel>

        <table class="auto-style44" style="padding-bottom: 5px;">
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
                <td class="auto-style45"><strong>&nbsp;Account Name<span style="color: red;">*</span></strong></td>
                <td class="auto-style38">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="X" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="X-Small" ForeColor="Red" ControlToValidate="acc_name"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style39">
                    <asp:TextBox ID="acc_name" runat="server" Height="40px" Width="196px" class="  Borrower Name..." CssClass="form-control" TabIndex="1" AutoPostBack="True"></asp:TextBox>
                </td>
                <td class="auto-style48">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="X" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="X-Small" ForeColor="Red" ControlToValidate="action"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style41">
                    <strong>&nbsp;Action Taken<span style="color: red;">*</span></strong></td>
                <td class="auto-style42">
                    <asp:TextBox ID="action" AutoPostBack="false" runat="server" Height="40px" Width="196px" class="   ACGF Expiry Date..." TabIndex="6" CssClass="form-control"></asp:TextBox>
                </td>
            </tr>
            <tr>

                <td class="auto-style45"><strong>&nbsp;Approval Number<span style="color: red;">*</span></strong></td>

                <td class="auto-style33">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="X" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="X-Small" ForeColor="Red" ControlToValidate="appNumber"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style47">
                    <asp:TextBox ID="appNumber" runat="server" Height="40px" Width="196px" class="  Facility Approval..." TabIndex="2" CssClass="form-control"></asp:TextBox>
                    <asp:Label ID="txtlbl" ForeColor="Red" Font-Bold="true" Text="No Data In The FlexCube." runat="server" Visible="false" />

                    </td>
                <td class="auto-style48">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="X" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="X-Small" ForeColor="Red" ControlToValidate="action"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style30"><strong>TFL Instruced On<span style="color: red;">*</span>&nbsp;&nbsp;</strong></td>
                <td style="width: 209px">
                    <asp:TextBox ID="tfl" AutoPostBack="false" runat="server" Height="40px" Width="196px" class="   Guarantee Claimed..." TabIndex="7" CssClass="form-control" TextMode="Date"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style45"><strong>Facility Type<span style="color: red;">*</span></strong></td>
                <td class="auto-style33">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="X" InitialValue="FT" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="X-Small" ForeColor="Red" ControlToValidate="drop_down_facility_type"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style47">
                    <asp:DropDownList ID="drop_down_facility_type" runat="server" CssClass="form-control" Height="40px" Width="196px" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Small" TabIndex="4">
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
                <td class="auto-style48">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="X" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="X-Small" ForeColor="Red" ControlToValidate="confirmed"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style30">Confirmed By<strong><span style="color: red;">*</span>&nbsp;</strong></td>
                <td class="auto-style58">
                    <asp:TextBox ID="confirmed" runat="server" Height="40px" Width="196px" class="  Remark..." TabIndex="8" CssClass="form-control"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style46"><strong>&nbsp;Facility Amount<span style="color: red;">*</span></strong></td>
                <td class="auto-style38">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="X" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="X-Small" ForeColor="Red" ControlToValidate="facAmt"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style39">
                    <asp:TextBox ID="facAmt" runat="server" Height="40px" Width="196px" class="  LOG Number..." TabIndex="4" CssClass="form-control"></asp:TextBox>
                </td>
                <td class="auto-style49">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="X" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="X-Small" ForeColor="Red" ControlToValidate="DoB"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style41">Date of Booking<strong><span style="color: red;">*</span>&nbsp;</strong></td>
                <td class="auto-style52">
                    <asp:TextBox ID="DoB" runat="server" Height="40px" Width="196px" class="  Remark..." TabIndex="8" CssClass="form-control" TextMode="Date"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style46"><strong>&nbsp;Currency<span style="color: red;">*</span></strong></td>
                <td class="auto-style38">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="X" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="X-Small" InitialValue="Currency" ForeColor="Red" ControlToValidate="currencyList"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style39">
                    <%--<asp:TextBox ID="currency" runat="server" Height="40px" Width="196px" class="   Maturity Date of Facility..." TabIndex="5" CssClass="form-control"></asp:TextBox>--%>
                    <asp:DropDownList ID="currencyList" runat="server" CssClass="form-control" Font-Bold="True" Font-Names="Bahnschrift" Width="196px">
                        <asp:ListItem Selected="True">Currency</asp:ListItem>
                        <asp:ListItem Value="USD">USD</asp:ListItem>
                        <asp:ListItem Value="EUR">EUR</asp:ListItem>
                        <asp:ListItem Value="AFN">AFN</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style49">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="X" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="X-Small" ForeColor="Red" ControlToValidate="cmla"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style41">CMLA SignOff Date<strong><span style="color: red;">*</span>&nbsp;</strong></td>
                <td class="auto-style52">
                    <asp:TextBox ID="cmla" runat="server" Height="40px" Width="196px" class="  Remark..." TabIndex="8" CssClass="form-control" TextMode="Date"></asp:TextBox>
                </td>
            </tr>

                        <tr>
                <td class="auto-style46"><strong>&nbsp;Number of Extension/Renewal<span style="color: red;">*</span></strong></td>
                <td class="auto-style38">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="X" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="X-Small" ForeColor="Red" ControlToValidate="txtnm_extn"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style39">
                    <asp:TextBox ID="txtnm_extn" runat="server" Height="40px" Width="196px" class="  Number_Exten..." TabIndex="8" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>

                </td>
                <td class="auto-style49">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="X" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="X-Small" ForeColor="Red" ControlToValidate="remark"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style41">Remark<strong><span style="color: red;">*</span>&nbsp;</strong></td>
                <td class="auto-style52">
                    <asp:TextBox ID="remark" runat="server" Height="40px" Width="196px" class="  Remark..." TabIndex="8" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td class="auto-style45">&nbsp;</td>
                <td class="auto-style33">&nbsp;</td>
                <td class="auto-style47">&nbsp;</td>
                <td class="auto-style51">

                    <br />
                </td>
                <td class="auto-style51">&nbsp;</td>
                <td class="auto-style51">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style45">&nbsp;</td>
                <td class="auto-style38">&nbsp;</td>
                <td class="auto-style39">&nbsp;</td>
                <td class="auto-style49">&nbsp;</td>
                <td class="auto-style50" colspan="2"><strong>&nbsp;<asp:Button ID="Button2" runat="server" CssClass="btn btn-default" Height="37px" Text="ADD" Width="81px" Font-Bold="True" Font-Size="Small" TabIndex="9" OnClick="Button2_Click" BorderStyle="None" BackColor="#CCCCCC" />
                </strong>&nbsp; 
<%--                    <strong>
                    <asp:Button ID="ResetBtn" runat="server" CssClass="btn btn-default" Font-Bold="True" Font-Size="Small" Height="37px" Text="RESET" Width="81px" TabIndex="9" BorderStyle="None" OnClick="ResetBtn_Click" BackColor="#CCCCCC" />
                </strong>--%>

                </td>
            </tr>
            <tr>
                <td class="auto-style45">&nbsp;</td>


            </tr>
        </table>

    </div>
</asp:Content>
