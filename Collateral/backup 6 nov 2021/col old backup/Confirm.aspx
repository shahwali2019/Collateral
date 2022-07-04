<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Confirm.aspx.cs" Inherits="Collateral_int.Confirm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">


    <title>Confirm Page:</title>
    <style>
            .main{
               
                margin-top:10%;

            }
            table tr{
                height:40px;
            }
            table td{
                padding-left:10px;
            }
            .auto-style1 {
                width: 172px;
            }
            .auto-style2 {
                color: #FF0000;
            }
            .auto-style4 {
               width: 149px;
           }
        .auto-style5 {
            width: 149px;
            height: 40px;
        }
        .auto-style6 {
            height: 40px;
        }
        .auto-style7 {
            width: 172px;
            height: 40px;
        }
        </style>
</head>
<body style=" border:3px solid #007acc;   padding:10px 5px 10px 5px; width:400px; height:300px; margin:0 auto; margin-top:120px;">
    <div>
    <form id="form1" runat="server">
        <div>
            <div class="main">
    <table>
        <tr>
            <td colspan="3">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="Blue" Text="Afghanistan Inernational Bank"></asp:Label>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style4">
                <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="X-Small" ForeColor="Blue" Text="Super Amin"></asp:Label>
            </td>
            <td colspan="2">
                <asp:Label ID="confirmLbl" runat="server" Font-Bold="True" Font-Size="Smaller"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style4"><strong><asp:Label ID="Label1" runat="server" Text="Username" Font-Bold="True" Font-Size="Small"></asp:Label></strong><span class="auto-style2">*</span></td>
            <td>
                <asp:TextBox ID="txtsuername" placeholder=" Username" runat="server" Font-Size="Smaller" Height="30px" Width="230px" BackColor="#FFFF99"></asp:TextBox></td>
            <td class="auto-style1">
                &nbsp;</td>
        </tr>
    <tr>
            <td class="auto-style5"><strong><asp:Label ID="Label2" runat="server" Text="Password" Font-Size="Small"></asp:Label>&nbsp;<span class="auto-style2">*</span></strong></td>
            <td class="auto-style6"><asp:TextBox ID="txtpassword" placeholder=" Password" Font-Size="Smaller" runat="server" Height="30px" Width="230px" TextMode="Password" BackColor="#FFFF99"></asp:TextBox></td>
        <td class="auto-style7">
            </td>
        </tr>
        </table>
    <div style="margin-left:255px; margin-top:10px;"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Button OnClientClick="openWin()" ID="Button1" runat="server" Text="Enter" Height="36px" Width="89px" CssClass="btn-success" Font-Bold="True" Font-Size="Small" BackColor="#179F5D" ForeColor="White" OnClick="Button1_Click" />&nbsp; </strong></div>
    </div>
        </div>
    </form>
        </div>
</body>
</html>
