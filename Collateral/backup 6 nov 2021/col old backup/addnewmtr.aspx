<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="addnewmtr.aspx.cs" Inherits="Collateral_int.addnewmtr" %>
<asp:Content ID="Content1" ContentplaceholderID="MainContent" runat="server">
    
    <header>
            <style>
        .auto-style30{
                    font-size: 12px;
                    font-weight: bold;
                    font-family: Bahnschrift;
                    width: 111px;
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
    .auto-style41 {
        font-size: 12px;
        font-weight: bold;
        font-family: Bahnschrift;
        height: 46px;
        width: 111px;
    }
    .auto-style42 {
        height: 46px;
    }
        .auto-style44 {
            width: 83%;
            height: 297px;
        }
                .auto-style59 {
                    width: 209px;
                    height: 46px;
                }
                .auto-style63 {
                    font-size: 12px;
                    font-weight: bold;
                    font-family: Bahnschrift;
                    width: 47px;
                    text-align: center;
                    height: 36px;
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
                    width: 64px;
                    height: 36px;
                }
                .auto-style69 {
                    font-size: 12px;
                    font-weight: bold;
                    font-family: Bahnschrift;
                    height: 36px;
                    width: 111px;
                }
                .auto-style70 {
                    width: 209px;
                    height: 36px;
                }
                .auto-style71 {
                    font-size: 12px;
                    font-weight: bold;
                    font-family: Bahnschrift;
                    text-align: center;
                    width: 47px;
                }
                .auto-style72 {
                    font-size: 12px;
                    font-weight: bold;
                    font-family: Bahnschrift;
                    text-align: center;
                    height: 46px;
                    width: 47px;
                }
                .auto-style73 {
                    font-size: 12px;
                    font-weight: bold;
                    font-family: Bahnschrift;
                    width: 14px;
                    text-align: center;
                }
                .auto-style74 {
                    font-size: 12px;
                    font-weight: bold;
                    font-family: Bahnschrift;
                    width: 14px;
                    text-align: center;
                    height: 46px;
                }
                .auto-style75 {
                    height: 46px;
                    width: 64px;
                }
                .auto-style76 {
                    width: 64px;
                }
                .auto-style78 {
                    font-size: 12px;
                    font-weight: bold;
                    font-family: Bahnschrift;
                    text-align: center;
                    height: 46px;
                    width: 79px;
                }
                .auto-style79 {
                    font-size: 12px;
                    font-weight: bold;
                    font-family: Bahnschrift;
                    width: 79px;
                }
    </style>
    </header>
     <br />
   <div style=" height:120px;padding-left: 45%;border-top:10px solid #0094ff; margin-top:-20px;" class="alert alert-success" role="alert">
              <h4 class="alert-heading" style=" font-family:Bahnschrift;"><strong><asp:Label ID="addLbl" runat="server" Text="ADD MTR RECORD" ></asp:Label></strong></h4>  
   </div>
        <table class="auto-style44" style="padding-bottom:5px; ">
        <tr>
            <td class="auto-style79">
                           &nbsp;</td>
            <td class="auto-style1" colspan="3">
                           <asp:ImageButton ID="ImageButton1" ImageUrl="~/image/back.png" Height="20" Width="20" runat="server" OnClick="ImageButton1_Click" />
                 <br />
                </td>
            <td colspan="3">
                <asp:Label ID="msg" runat="server" Visible="False" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Smaller"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style79">
                <strong>Client Name</strong></td>
            <td class="auto-style38">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="X" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="X-Small" ForeColor="Red" ControlToValidate="txtCname" ></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style75">
            <asp:TextBox ID="txtCname"   AutoPostBack="false"  runat="server" Height="40px" Width="196px" TabIndex="1" CssClass="form-control" ></asp:TextBox>
            </td>
            <td class="auto-style72">
                </td>
            <td class="auto-style41">
                Amount</td>
            <td class="auto-style73">
                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="X" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="X-Small" ForeColor="Red" ControlToValidate="txtAmount" ></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style42">
                <asp:TextBox ID="txtAmount" AutoPostBack="false" runat="server" Height="40px" Width="196px" TabIndex="8" CssClass="form-control"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style79">
                <strong>Memo Ref</strong></td>
            <td class="auto-style67">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="X" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="X-Small" ForeColor="Red" ControlToValidate="txtmemoref"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style68">
                <asp:TextBox ID="txtmemoref" runat="server" Height="40px" Width="196px" placeholder="" TabIndex="2" CssClass="form-control"></asp:TextBox>
            </td>
            <td class="auto-style63">
                </td>
            <td class="auto-style69">Currency</td>
            <td class="auto-style73">
                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="X" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="X-Small" ForeColor="Red" ControlToValidate="txtCurrency" ></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style70">
                <asp:TextBox ID="txtCurrency" AutoPostBack="false" runat="server" Height="40px" Width="196px"  TabIndex="9" CssClass="form-control"></asp:TextBox>
                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control">
                    <asp:ListItem Value="AFN">AFN</asp:ListItem>
                    <asp:ListItem Value="USD">USD</asp:ListItem>
                    <asp:ListItem Value="EUR">EUR</asp:ListItem>

                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style79">
                <strong>Debit Account</strong></td>
            <td class="auto-style33">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="X" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="X-Small" ForeColor="Red" ControlToValidate="txtDaccount" ></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style76">
                <asp:TextBox ID="txtDaccount" runat="server" Height="40px" Width="196px" TabIndex="3" CssClass="form-control"></asp:TextBox>
            </td>
            <td class="auto-style71">
                &nbsp;</td>
            <td class="auto-style30">
                Heading</td>
            <td class="auto-style73">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="X" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="X-Small" ForeColor="Red" ControlToValidate="txtHeading" ></asp:RequiredFieldValidator>
            </td>
            <td style="width: 209px">
                <asp:TextBox ID="txtHeading" AutoPostBack="false" runat="server" Height="40px" Width="196px"  TabIndex="10" CssClass="form-control"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style79">
                <strong>Credit Account</strong></td>
            <td class="auto-style38">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4"  runat="server" ErrorMessage="X" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="X-Small" ForeColor="Red" ControlToValidate="txtCaccount"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style75">
                <asp:TextBox ID="txtCaccount" runat="server" Height="40px" Width="196px" TabIndex="4" CssClass="form-control"></asp:TextBox>
            </td>
            <td class="auto-style72">
                </td>
            <td class="auto-style30">
                Transaction Detail</td>
            <td class="auto-style73">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="X" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="X-Small" ForeColor="Red" ControlToValidate="txtTD" ></asp:RequiredFieldValidator>
                </td>
            <td class="auto-style59">
                <asp:TextBox ID="txtTD" AutoPostBack="false" runat="server" Height="40px" Width="196px"  TabIndex="11" CssClass="form-control"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style79">
                <strong>Transaction Code</strong></td>
            <td class="auto-style38">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="X" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="X-Small" ForeColor="Red" ControlToValidate="txtTC" ></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style75">
            <asp:TextBox ID="txtTC"   AutoPostBack="false"  runat="server" Height="40px" Width="196px" TabIndex="5"  CssClass="form-control" ></asp:TextBox>
            </td>
            <td class="auto-style72">
                &nbsp;</td>
            <td class="auto-style30">
                Booking Date</td>
            <td class="auto-style73">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="X" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="X-Small" ForeColor="Red" ControlToValidate="txtBD" ></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style59">
                <asp:TextBox ID="txtBD" AutoPostBack="false" runat="server" Height="40px" Width="196px"    TabIndex="12" CssClass="form-control"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style79">
                <strong>Memo Submission</strong></td>
            <td class="auto-style38">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="X" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="X-Small" ForeColor="Red" ControlToValidate="txtMs" ></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style75">
            <asp:TextBox ID="txtMs"   AutoPostBack="false"  runat="server" Height="40px" Width="196px" TabIndex="6"  CssClass="form-control" ></asp:TextBox>
            </td>
            <td class="auto-style72">
                &nbsp;</td>
            <td class="auto-style30">
                Status</td>
            <td class="auto-style73">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ErrorMessage="X" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="X-Small" ForeColor="Red" ControlToValidate="txtStatus" ></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style59">
                <asp:TextBox ID="txtStatus" AutoPostBack="false" runat="server" Height="40px" Width="196px"   TabIndex="13" CssClass="form-control"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style79">
                <strong>Value Date</strong></td>
            <td class="auto-style38">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ErrorMessage="X" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="X-Small" ForeColor="Red" ControlToValidate="txtVD" ></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style75">
            <asp:TextBox ID="txtVD"   AutoPostBack="false"  runat="server" Height="40px" Width="196px" TabIndex="7"  CssClass="form-control" ></asp:TextBox>
            </td>
            <td class="auto-style72">
                &nbsp;</td>
            <td class="auto-style30">
                Remark</td>
            <td class="auto-style74">
                &nbsp;</td>
            <td class="auto-style59">
                <asp:TextBox ID="txtRemark" AutoPostBack="false" runat="server" Height="40px" Width="196px"   TabIndex="14" CssClass="form-control"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style78">
                &nbsp;</td>
            <td class="auto-style38">
                &nbsp;</td>
            <td class="auto-style75">
                <strong><asp:Button  ID="Button2" runat="server" CssClass="btn-info"    Height="37px" Text="ADD" Width="81px" Font-Bold="True"  Font-Size="Small" TabIndex="14" OnClick="Button2_Click"  OnClientClick="javascript:shouldsubmit=true;" BorderStyle="None" Font-Names="Bahnschrift"   />
                </strong>
            </td>
            <td class="auto-style72">
                &nbsp;</td>
            <td class="auto-style30">
                &nbsp;</td>
            <td class="auto-style74">
                &nbsp;</td>
            <td class="auto-style59">
                &nbsp;</td>
        </tr>
        </table>
</asp:Content>
