<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="new_customer.aspx.cs" Inherits="Collateral_int.new_customer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <br />
   <div style=" height:120px;padding-left: 45%;border-top:10px solid #0094ff; margin-top:-20px;" class="alert alert-success" role="alert">
              <h4 class="alert-heading" style=" font-family:Bahnschrift;"><strong>Add New Customer Name</strong></h4>  
           </div>
    <div style="background-color:#fff; padding:50px; margin-top:-40px;">
    <style>
        .modal-sm{
            font-size:12px;
            font-weight:bold;
            font-family:Bahnschrift;



        }
    </style>
        <table class="nav-justified" style="padding-bottom:5px; height: 266px;">
        <tr>
            <td class="modal-sm" style="width: 261px;">&nbsp;</td>
            <td style="width: 148px">
                &nbsp;</td>
            <td class="modal-sm" style="width: 157px">
                &nbsp;</td>
            <td colspan="2">
                <asp:Label ID="msg" runat="server" Visible="False"></asp:Label>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 261px;">&nbsp;<strong>ID</strong>&nbsp;</td>
            <td style="width: 148px">
                <asp:TextBox ID="txtID" runat="server" Height="40px" Width="196px" placeholder="  ID..." ></asp:TextBox>
            </td>
            <td class="modal-sm" style="width: 157px">
                <br />
                <br />
            </td>
            <td class="modal-sm" style="width: 207px"><strong>&nbsp;Written OFF ON</strong></td>
            <td style="width: 209px">
                <asp:TextBox ID="txtSerialEnd" runat="server" Height="40px" Width="196px" placeholder="  Written OFF ON..."></asp:TextBox>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 261px;"><strong>&nbsp;&nbsp;Customer Name</strong></td>
            <td style="width: 148px">
                <asp:TextBox ID="txtBorrower" runat="server" Height="40px" Width="196px" placeholder="  Customer Name..."></asp:TextBox>
            </td>
            <td class="modal-sm" style="width: 157px">
                <br />
                <br />
            </td>
            <td class="modal-sm" style="width: 207px"><strong>&nbsp;Recorded from DEG</strong></td>
            <td style="width: 209px">
                <asp:TextBox ID="txtQty" runat="server" Height="40px" Width="196px" placeholder="  Recorded from DEG..."></asp:TextBox>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 261px"><strong>&nbsp;Account Number</strong></td>
            <td style="width: 148px">
                <asp:TextBox ID="pdate" runat="server" Height="40px" TextMode="Date" Width="196px" placeholder="  Account Number..."></asp:TextBox>
            </td>
            <td class="modal-sm" style="width: 157px">
                <br />
                <br />
            </td>
            <td class="modal-sm" style="width: 207px"><strong>&nbsp;</strong>Recoveried From Client</td>
            <td style="width: 209px">
                <asp:TextBox ID="txtCartonValue" runat="server" Height="40px" Width="196px" placeholder="  Recoveried From Client..."></asp:TextBox>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 261px"><strong>&nbsp;Facility Type</strong></td>
            <td style="width: 148px">
                <asp:TextBox ID="txtTelecom" runat="server" Height="40px" Width="196px" placeholder="  Facility Type..."></asp:TextBox>
            </td>
            <td class="modal-sm" style="width: 157px">
                <br />
                <br />
            </td>
            <td class="modal-sm" style="width: 207px"><strong>&nbsp;</strong>Net Loss till date</td>
            <td style="width: 209px">
                <asp:TextBox ID="txtStatus" runat="server" Height="40px" Width="196px" TextMode="Date" placeholder="  Net Loss till date..."></asp:TextBox>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 261px"><strong>&nbsp;</strong>Original&nbsp; Limits</td>
            <td style="width: 148px">
                <asp:TextBox ID="txtDinomination" runat="server" Height="40px" Width="196px" placeholder="  Original Limits..."></asp:TextBox>
            </td>
            <td class="modal-sm" style="width: 157px">
                <br />
                <br />
            </td>
            <td class="modal-sm" style="width: 207px"><strong>&nbsp;Paid to DEG</strong></td>
            <td style="width: 209px">
                <asp:TextBox ID="txtDateRelease" runat="server" Height="40px" Width="196px" placeholder="   Paid to DEG..."></asp:TextBox>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 261px"><strong>&nbsp;Currency</strong></td>
            <td style="width: 148px">
                <asp:TextBox ID="txtOurRef" runat="server" Height="40px" Width="196px" placeholder="  Currency..."></asp:TextBox>
            </td>
            <td class="modal-sm" style="width: 157px">
                <br />
                <br />
            </td>
            <td class="modal-sm" style="width: 207px; height: 15px;"><strong>&nbsp;</strong>Date 1st occurred </td>
            <td style="width: 209px">
                <asp:TextBox ID="TxtDateforRotation" runat="server" Height="40px" Width="196px" TextMode="Date" placeholder="   Date first occurred..."></asp:TextBox>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 261px; height: 15px;"><strong>&nbsp;</strong>Outstanding&nbsp; Loss | Write off</td>
            <td style="width: 148px; height: 15px;">
                <asp:TextBox ID="txtSerialStart" runat="server" Height="40px" Width="196px" placeholder="  Outstanding Loss..."></asp:TextBox>
            </td>
            <td class="modal-sm" style="width: 157px; height: 15px;">
                <br />
                <br />
            </td>
            <td class="modal-sm" style="width: 207px; height: 15px;">&nbsp; &nbsp;Status&nbsp;</td>
            <td style="width: 209px; height: 15px;">
                <asp:TextBox ID="TextBox1" runat="server" Height="40px" Width="196px" placeholder="  Status..."></asp:TextBox>
            </td>
            <td style="height: 15px"></td>
            <td style="height: 15px"></td>
            <td style="height: 15px"></td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 261px; height: 15px;">&nbsp;</td>
            <td style="width: 148px; height: 15px;">
                &nbsp;</td>
            <td class="modal-sm" style="width: 157px; height: 15px;">
                &nbsp;</td>
            <td class="modal-sm" style="width: 207px; height: 15px;">&nbsp; Recoveries</td>
            <td style="width: 209px; height: 15px;">
                <asp:TextBox ID="TextBox2" runat="server" Height="40px" Width="196px" placeholder="   Recoveries..."></asp:TextBox>
            </td>
            <td style="height: 15px">&nbsp;</td>
            <td style="height: 15px">&nbsp;</td>
            <td style="height: 15px">&nbsp;</td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 261px; height: 15px;">&nbsp;</td>
            <td style="width: 148px; height: 15px;">
                &nbsp;</td>
            <td class="modal-sm" style="width: 157px; height: 15px;">
                &nbsp;</td>
            <td class="modal-sm" style="width: 207px; height: 15px;">&nbsp; Memorandum Interest</td>
            <td style="width: 209px; height: 15px;">
                <asp:TextBox ID="TextBox3" runat="server" Height="40px" Width="196px" placeholder="   Memorandum Interest..."></asp:TextBox>
            </td>
            <td style="height: 15px">&nbsp;</td>
            <td style="height: 15px">&nbsp;</td>
            <td style="height: 15px">&nbsp;</td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 261px; height: 15px;">&nbsp;</td>
            <td style="width: 148px; height: 15px;">
                <asp:Button ID="Button2" runat="server" CssClass="btn-info" Height="37px" Text="SUBMIT" Width="81px" Font-Bold="True" OnClick="Button2_Click"  Font-Size="X-Small"  />
                <strong><asp:Button ID="Button1" runat="server" CssClass="bg-success" Height="37px" Text="UNDO" Width="81px" Font-Bold="True" Font-Size="X-Small" />
                </strong>
            </td>
            <td class="modal-sm" style="width: 157px; height: 15px;">
                &nbsp;</td>
            <td class="modal-sm" style="width: 207px; height: 15px;">&nbsp; loan class</td>
            <td style="width: 209px; height: 15px;">
                <asp:TextBox ID="TextBox4" runat="server" Height="40px" Width="196px" placeholder="   Loan Class..."></asp:TextBox>
            </td>
            <td style="height: 15px">&nbsp;</td>
            <td style="height: 15px">&nbsp;</td>
            <td style="height: 15px">&nbsp;</td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 261px">&nbsp;</td>
            <td style="width: 148px">
                &nbsp;</td>
            <td class="modal-sm" style="width: 157px">&nbsp;</td>
            <td class="modal-sm" style="width: 207px">&nbsp;</td>
            <td style="width: 209px">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 261px">&nbsp;</td>
            <td style="width: 148px">
                &nbsp;</td>
            <td class="modal-sm" style="width: 157px">&nbsp;</td>
            <td class="modal-sm" style="width: 207px">
&nbsp;&nbsp;</td>
            <td style="width: 209px">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>

</div>
</asp:Content>
