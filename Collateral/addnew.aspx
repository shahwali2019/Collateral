<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="addnew.aspx.cs" Inherits="Collateral_int.addnew" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <header>
       <script type="text/javascript">

function copyText() {
    src = document.getElementById("source");
    dest = document.getElementById("dest");
    add = document.getElementById("add");
    add.value = src.value * dest.value;
}

</script>
   </header>
    <br />
   <div style=" height:120px;padding-left: 45%;border-top:10px solid #0094ff; margin-top:-20px;" class="alert alert-success" role="alert">
              <h4 class="alert-heading" style=" font-family:Bahnschrift;"><strong><asp:Label ID="addLbl" runat="server" Text="Edit Pledge Interface" ></asp:Label></strong></h4>  
           </div>
    <div style="background-color:#fff; padding:50px; margin-top:-40px;">
    <style>
        .auto-style30{
        font-size: 12px;
        font-weight: bold;
        font-family: Bahnschrift;
        width: 207px;
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
        .auto-style31 {
            font-size: 12px;
            font-weight: bold;
            font-family: Bahnschrift;
            width: 216px;
        }
        .auto-style32 {
            font-size: 12px;
            font-weight: bold;
            font-family: Bahnschrift;
            height: 15px;
            width: 216px;
        }
        .auto-style33 {
            font-size: 12px;
            font-weight: bold;
            font-family: Bahnschrift;
            width: 41px;
            text-align:center;
        }
        .auto-style35 {
            font-size: 12px;
            font-weight: bold;
            font-family: Bahnschrift;
            width: 68px;
            text-align:center;
        }
        .auto-style37 {
        font-size: 12px;
        font-weight: bold;
        font-family: Bahnschrift;
        width: 216px;
        height: 46px;
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
        width: 148px;
        height: 46px;
    }
    .auto-style40 {
        font-size: 12px;
        font-weight: bold;
        font-family: Bahnschrift;
        width: 68px;
        text-align: center;
        height: 46px;
    }
    .auto-style41 {
        font-size: 12px;
        font-weight: bold;
        font-family: Bahnschrift;
        height: 46px;
        width: 207px;
    }
    .auto-style42 {
        height: 46px;
    }
    .auto-style43 {
        width: 209px;
        height: 46px;
    }
    </style>
        <table class="nav-justified" style="padding-bottom:5px; height: 266px;">
        <tr>
            <td class="auto-style1" colspan="4">
                <%--               <form method="get">
                <input type="text" id="source" >
                <input type="text" id="dest" >
                <input type="text" id="add" onclick="copyText();"  />
            </form>--%>
                &nbsp;&nbsp;<br />
                </td>
            <td colspan="2">
                <asp:Label ID="msg" runat="server" Visible="False" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Smaller"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style37">
                Customer ID No.#(Unique)tt</td>
            <td class="auto-style38">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCID" ErrorMessage="x" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style39">
                <asp:TextBox ID="txtCID" CssClass="center" runat="server" Height="40px" Width="196px" placeholder="  ID..." Enabled="False" Font-Bold="True" Font-Size="Smaller" ></asp:TextBox>
            </td>
            <td class="auto-style40">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtDinomination" ErrorMessage="x" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style41">
                <strong>Dinomination(AFN)<span style="color:red;">*</span></strong></td>
            <td class="auto-style42">
                <asp:TextBox ID="txtDinomination" AutoPostBack="true" runat="server" Height="40px" Width="196px" placeholder="   Dinomination(AFN)..." OnTextChanged="txtDinomination_TextChanged" TabIndex="9"></asp:TextBox>
            </td>
        </tr>
        <tr>
            
            <td class="auto-style31">&nbsp;SNO.#&nbsp;</td>
            
            <td class="auto-style33">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtID" ErrorMessage="x" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td style="width: 148px">
                <asp:TextBox ID="txtID" CssClass="center" runat="server" Height="40px" Width="196px" placeholder="  ID..." Enabled="False" Font-Bold="True" Font-Size="Smaller" TabIndex="1" ></asp:TextBox>
            </td>
            <td class="auto-style40">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtCartonValue" ErrorMessage="x" ForeColor="Red"></asp:RequiredFieldValidator>
                <br />
            </td>
            <td class="auto-style30"><strong>&nbsp;Carton Value in AFN<span style="color:red;">*</span></strong></td>
            <td style="width: 209px">
                <asp:TextBox ID="txtCartonValue" runat="server" Height="40px" Width="196px" placeholder="  Carton Value...(AFN)..." OnTextChanged="txtCartonValue_TextChanged" TabIndex="10" Enabled="False"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style31"><strong>&nbsp;&nbsp;Borrower<span style="color:red;">*</span></strong></td>
            <td class="auto-style33">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtBorrower" ErrorMessage="x" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td style="width: 148px">
                <asp:TextBox ID="txtBorrower" AutoPostBack="true"  runat="server" Height="40px" Width="196px" placeholder="  Borrower Name..." TabIndex="2" OnTextChanged="txtBorrower_TextChanged"></asp:TextBox>
            </td>
            <td class="auto-style40">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txtStatus" ErrorMessage="x" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style30"><strong>&nbsp;Status<span style="color:red;">*</span></strong></td>
            <td style="width: 209px">
                <asp:TextBox ID="txtStatus" runat="server" Height="40px" Width="196px" placeholder="Status"  TabIndex="11" Enabled="False" ></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style31"><strong>&nbsp;Date of Pledge<span style="color:red;">*</span></strong></td>
            <td class="auto-style33">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="pdate" ErrorMessage="x" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td style="width: 148px">
                <asp:TextBox ID="pdate" runat="server" Height="40px" Width="196px" placeholder="  Date of Pledge..." TabIndex="3" TextMode="Date"></asp:TextBox>
            </td>
            <td class="auto-style35">
                <br />
                <br />
            </td>
            <td class="auto-style30"><strong>Date of Release</strong></td>
            <td style="width: 209px">
                <asp:TextBox ID="txtDateRelease" runat="server" Height="40px" Width="196px" AutoPostBack="true" TabIndex="12" TextMode="Date" OnTextChanged="txtDateRelease_TextChanged"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style37"><strong>Our Tag<span style="color:red;"> *</span></strong></td>
            <td class="auto-style38">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtOurRef" ErrorMessage="x" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style39">
                <asp:TextBox ID="txtOurRef" runat="server" CssClass="center" Height="40px" Width="196px" placeholder="   Our Reference(s)..." TabIndex="4"></asp:TextBox>
            </td>
            <td class="auto-style40">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="TxtDateforRotation" ErrorMessage="x" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style41"><strong>&nbsp;Due Date for Rotation<span style="color:red;">*</span></strong></td>
            <td class="auto-style43">
                <asp:TextBox ID="TxtDateforRotation" runat="server" TextMode="Date" Height="40px" Width="196px" TabIndex="13"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style31"><strong>&nbsp;Relative Telecom Company<span style="color:red;">*</span></strong></td>
            <td class="auto-style33">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtTelecom" ErrorMessage="x" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td style="width: 148px">
                <asp:TextBox ID="txtTelecom" runat="server" Height="40px" Width="196px" placeholder="  Telecom Company..." TabIndex="5"></asp:TextBox>
            </td>
            <td class="auto-style35" rowspan="4">
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
            </td>
            <td class="auto-style1" colspan="2"><strong>&nbsp;</strong></td>
        </tr>
        <tr>
            <td class="auto-style31"><strong>&nbsp;Scratch Card Serial Start<span style="color:red;">*</span></strong></td>
            <td class="auto-style33">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtSerialStart" ErrorMessage="x" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td style="width: 148px">
                <asp:TextBox ID="txtSerialStart" runat="server" Height="40px" Width="196px" placeholder="   Scratch Card Serial Start" TabIndex="6"></asp:TextBox>
            </td>
            <td class="auto-style1" colspan="2"><strong> <asp:Button  ID="Button2" runat="server" CssClass="btn-info" Height="37px" Text="SUBMIT" Width="81px" Font-Bold="True" OnClick="Button2_Click" Font-Size="Small" TabIndex="14" BorderStyle="None"   />
                &nbsp;</strong><asp:Button ID="Button3" runat="server" CssClass="btn-danger" Font-Bold="True" Font-Size="Small" Height="37px" OnClick="Button3_Click" Text="BACK" Width="81px" BorderStyle="None" />
<%--&nbsp;<asp:Button ID="Button4" runat="server" CssClass="btn-success" Font-Bold="True" Font-Size="Small" Height="37px" OnClick="Button4_Click" Text="Show Data" Width="81px" BorderStyle="None" />--%>
            </td>
        </tr>
        <tr>
            <td class="auto-style31"><strong>&nbsp;&nbsp;Scratch Card Serial End <span style="color:red;">*</span></span></strong></td>
            <td class="auto-style33">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtSerialEnd" ErrorMessage="x" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td style="width: 148px">
                <asp:TextBox ID="txtSerialEnd" runat="server" Height="40px" Width="196px" placeholder="  Scratch Card Serial End..." OnTextChanged="txtSerialEnd_TextChanged" AutoPostBack="true" TabIndex="7"></asp:TextBox>
            </td>
            <td class="auto-style1" colspan="2" rowspan="3"><strong>&nbsp;</strong>&nbsp;&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style32"><strong>Qty of Cards in Each Carton<span style="color:red;">*</span></strong></td>
            <td class="auto-style33">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtQty" ErrorMessage="x" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td style="width: 148px; height: 15px;">
                <asp:TextBox ID="txtQty" runat="server" Height="40px" Width="196px" placeholder="  Qty of Cards in Each Carton..." TabIndex="8" Enabled="False"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style1" colspan="4">
                </td>
        </tr>
        </table>

</div>




</asp:Content>
