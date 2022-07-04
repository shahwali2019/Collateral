<%@ Page Title="" Language="C#" MasterPageFile="~/MasterGS.Master" AutoEventWireup="true" CodeBehind="gs_item.aspx.cs" Inherits="Collateral_int.gs_item_edit" %>
<asp:Content ID="Content1" ContentplaceholderID="MainContent" runat="server">
    <header>

         <script type="text/javascript">
         function filterDigits(eventInstance) { 
            eventInstance = eventInstance || window.event;
                key = eventInstance.keyCode || eventInstance.which;
            if ((47 < key) && (key < 58) || key = 45 || key == 8) {
               return true;
             }
             else
             {
                    if (eventInstance.preventDefault) eventInstance.preventDefault();
                    eventInstance.returnValue = false;
                    return false;
             } //if
         } //filterDigits
      </script>

    </header>
    <br />
   <div style=" height:120px;padding-left: 45%;border-top:0 solid #0094ff; margin-top:-20px;" class="alert alert-success" role="alert">
             
       <br />
       <h4 class="auto-style67" style=" font-family:Bahnschrift;"><strong>
            <asp:Label ID="addLbl" runat="server" Text="ADD NEW ITEM" ></asp:Label>
     </strong></h4>  
           </div>
    <div style="background-color:#fff; padding:50px; margin-top:-40px;">
    <style>
        body{
           
        }
        .auto-style30{
            font-size: 12px;
            font-weight: bold;
            font-family: Bahnschrift;
            width: 87px;
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
        width: 102px;
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
    .auto-style51 {
        font-size: 12px;
        font-weight: bold;
        font-family: Bahnschrift;
        text-align: center;
    }
        .auto-style52 {
            height: 46px;
            width: 99px;
        }
        .auto-style53 {
            width: 99px;
        }
        .auto-style58 {
            width: 27px;
        }
        .auto-style59 {
            width: 27px;
            height: 46px;
        }
        .auto-style66 {
            width: 39px;
        }
        .auto-style67 {
            width: 149px;
        }
        .auto-style68 {
            font-size: 12px;
            font-weight: bold;
            font-family: Bahnschrift;
            height: 24px;
        }
        .auto-style69 {
            font-size: 12px;
            font-weight: bold;
            font-family: Bahnschrift;
            width: 13px;
        }
        .auto-style72 {
            font-size: 12px;
            font-weight: bold;
            font-family: Bahnschrift;
            width: 13px;
            text-align: center;
            height: 46px;
        }
        .auto-style73 {
            font-size: 12px;
            font-weight: bold;
            font-family: Bahnschrift;
            width: 13px;
            text-align: center;
        }
        .auto-style74 {
            font-size: 12px;
            font-weight: bold;
            font-family: Bahnschrift;
            width: 102px;
        }
    </style>
           
        <table class="auto-style44" style="padding-bottom:5px;  ">
        <tr>
            <td class="auto-style1" colspan="5">
                <%--               <form method="get">
                <input type="text" id="source" >
                <input type="text" id="dest" >
                <input type="text" id="add" onclick="copyText();"  />
            </form>--%>
              
                           <asp:ImageButton ID="ImageButton1" ImageUrl="~/image/back.png" Height="20" Width="20" runat="server" OnClick="ImageButton1_Click" />
                   
             
                 <br />
                </td>
            <td colspan="3">
                <asp:Label ID="msg" runat="server" Visible="False" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Smaller"></asp:Label>
            </td>
            <td class="auto-style58">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style46"><strong>&nbsp;&nbsp;Date<span style="color:red;">*</span></strong></td>
            <td class="auto-style38">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="X" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="X-Small" ForeColor="Red" ControlToValidate="dateBox"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style52">
            <asp:TextBox ID="dateBox" OnTextChanged="txtitem_TextChanged" runat="server" Height="40px" Width="196px" class="  Borrower Name..." CssClass="center" AutoPostBack="True" TextMode="Date" BackColor="#E0E1DF"></asp:TextBox>
            </td>
            <td class="auto-style66" rowspan="6">
                </td>
            <td class="auto-style72">
                &nbsp;</td>
            <td class="auto-style41">
                <strong>&nbsp;Currency<span style="color:red;">*</span></strong></td>
            <td class="auto-style51">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="X" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="X-Small" ForeColor="Red" ControlToValidate="CurrencyList" InitialValue="Currency"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style42">
                <asp:DropDownList ID="CurrencyList" runat="server" CssClass="btn-success" Height="40px" Width="196px" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Small" TabIndex="5" BackColor="#E0E1DF" ForeColor="Blue">
                    <asp:ListItem>Currency</asp:ListItem>
                    <asp:ListItem>USD</asp:ListItem>
                    <asp:ListItem>AFN</asp:ListItem>
                    <asp:ListItem>EURO</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style59">
                </td>
        </tr>
        <tr>
            
            <td class="auto-style45"><strong>&nbsp;Branch | Department<span style="color:red;">*</span></strong></td>
            
            <td class="auto-style33">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="X" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="X-Small" ForeColor="Red" ControlToValidate="BranchBox"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style53">
                <asp:TextBox ID="BranchBox" runat="server" Height="40px" Width="196px" class="  Facility Approval..." TabIndex="1" CssClass="center" BackColor="#E0E1DF"></asp:TextBox>
            </td>
            <td class="auto-style73">
                &nbsp;</td>
            <td class="auto-style74"><strong>Unit Price</strong></td>
            <td class="auto-style38">
                &nbsp;</td>
            <td style="width: 209px">
               
                    <asp:TextBox ID="TxtAmount" runat="server" CssClass="center" Height="40px" TabIndex="7" Width="196px" BackColor="#E0E1DF"></asp:TextBox>

            </td>
            <td class="auto-style51">
               
                    <strong>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtamount" ErrorMessage="X" Font-Bold="True" ForeColor="Red" ValidationExpression="^(\d*\.?\d+|\d{1,3}(,\d{3})*(\.\d+)?)$" Font-Size="X-Small"></asp:RegularExpressionValidator>
                    </strong>
            
            </td>
        </tr>
        <tr>
            <td class="auto-style46"><strong>Description<span style="color:red;">*</span></strong></td>
            <td class="auto-style33">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="X" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="X-Small" ForeColor="Red" ControlToValidate="txtdesc"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style53">
                <asp:TextBox ID="txtdesc" runat="server" Height="40px" Width="196px" class="  Facility Approval..." TabIndex="2" CssClass="center" BackColor="#E0E1DF" TextMode="MultiLine"></asp:TextBox>
            </td>
            <td class="auto-style73">
                &nbsp;</td>
            <td class="auto-style74">Total Amount<strong><span style="color:red;">*</span>&nbsp;&nbsp;</strong></td>
            <td class="auto-style51">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="X" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="X-Small" ForeColor="Red" ControlToValidate="txtTotal"></asp:RequiredFieldValidator>
            </td>
            <td style="width: 209px">
                <asp:TextBox ID="txtTotal" runat="server" Height="40px" Width="196px" class="  Remark..."  TabIndex="8" CssClass="center" BackColor="#E0E1DF"></asp:TextBox>
            </td>
            <td class="auto-style51">
               
                    <strong>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="txtTotal" ErrorMessage="X" Font-Bold="True" ForeColor="Red" ValidationExpression="^(\d*\.?\d+|\d{1,3}(,\d{3})*(\.\d+)?)$" Font-Size="X-Small"></asp:RegularExpressionValidator>
                    </strong>
            
            </td>
        </tr>
        <tr>
            <td class="auto-style45"><strong>&nbsp;Company Name<span style="color:red;">*</span></strong></td>
            <td class="auto-style33">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="X" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="X-Small" ForeColor="Red" ControlToValidate="txtCom"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style53">
                <asp:TextBox ID="txtCom" runat="server" Height="40px" Width="196px" class="  LOG Number..." TabIndex="3" CssClass="center" BackColor="#E0E1DF"></asp:TextBox>
            </td>
            <td class="auto-style73">
                &nbsp;</td>
            <td class="auto-style74">
                Tax<strong><span style="color:red;">*</span>&nbsp;</strong></td>
            <td class="auto-style51">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="X" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="X-Small" ForeColor="Red" ControlToValidate="txtTax"></asp:RequiredFieldValidator>
            </td>
            <td>
                <asp:TextBox ID="txtTax" runat="server" Height="40px" Width="196px" class="  Remark..."  TabIndex="9" CssClass="center" BackColor="#E0E1DF"></asp:TextBox>
            </td>
            <td class="auto-style51">
               
                    <strong>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="txtTax" ErrorMessage="X" Font-Bold="True" ForeColor="Red" ValidationExpression="^(\d*\.?\d+|\d{1,3}(,\d{3})*(\.\d+)?)$" Font-Size="X-Small"></asp:RegularExpressionValidator>
                    </strong>
            
            </td>
        </tr>
        <tr>
            <td class="auto-style45"><strong>&nbsp;Quantity<span style="color:red;">*
                </span></strong></td>
            <td class="auto-style38">
               
                    <strong>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="X" Font-Bold="True" Enabled="false" Font-Names="Bahnschrift" Font-Size="X-Small" ForeColor="Red" ControlToValidate="txtQuantity"></asp:RequiredFieldValidator>
                    </strong>
            </td>
            <td class="auto-style52">
                <asp:TextBox ID="txtQuantity" runat="server" Height="40px" Width="196px" class="   Maturity Date of Facility..." TabIndex="4" CssClass="center"  step="any" OnTextChanged="txtQuantity_TextChanged" TextMode="Number" BackColor="#E0E1DF"></asp:TextBox>
            </td>
            <td class="auto-style69">
                &nbsp;</td>
            <td class="auto-style74">
                Net Amount<strong><span style="color:red;">*</span>&nbsp;</strong></td>
            <td class="auto-style51">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ErrorMessage="X" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="X-Small" ForeColor="Red" ControlToValidate="txtNet"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style30">
                <asp:TextBox ID="txtNet" runat="server" Height="40px" Width="196px" class="  Remark..."  TabIndex="10" CssClass="center" BackColor="#E0E1DF"></asp:TextBox>
            </td>
            <td class="auto-style51">
               
                    <strong>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ControlToValidate="txtNet" ErrorMessage="X" Font-Bold="True" ForeColor="Red" ValidationExpression="^(\d*\.?\d+|\d{1,3}(,\d{3})*(\.\d+)?)$" Font-Size="X-Small"></asp:RegularExpressionValidator>
                    </strong>
            
            </td>
        </tr>
        <tr>
            <td class="auto-style45">&nbsp;</td>
            <td class="auto-style38">
               
                    &nbsp;</td>
            <td class="auto-style52">
                &nbsp;</td>
            <td class="auto-style51" colspan="2">
                &nbsp;</td>
            <td class="auto-style51">
                &nbsp;</td>
            <td class="auto-style30">
                <asp:Button ID="Button2" runat="server" BorderStyle="None" CssClass="btn-primary" Height="35px" Text="ADD" Width="76px" OnClick="Button2_Click" Font-Names="Bahnschrift" TabIndex="11" />
            </td>
            <td class="auto-style51">
               
                    &nbsp;</td>
        </tr>
        <tr>
                <td class="auto-style68">
                    &nbsp;</td>
        </tr>
        <tr>
                <td class="auto-style68">
               
                    &nbsp;</td>
        </tr>
        </table>
</div>
</asp:Content>
