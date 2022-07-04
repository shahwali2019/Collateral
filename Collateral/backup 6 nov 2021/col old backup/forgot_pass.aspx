<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="forgot_pass.aspx.cs" Inherits="Collateral_int.forgot_pass" %>
<asp:Content ID="Content1" ContentplaceholderID="MainContent" runat="server">
    <header>
    <title></title>
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
            .auto-style3 {
               width: 220px;
           }
        </style>
</header>
<body>
 
<div class="main">
    <table>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td colspan="2">
                <asp:Label ID="confirmLbl" runat="server" Font-Names="Bahnschrift" Font-Size="X-Small"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style3"><strong><asp:Label ID="Label1" runat="server" Text="Username" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Small"></asp:Label></strong><span class="auto-style2">*</span></td>
            <td>
                <asp:TextBox ID="txtsuername" placeholder="Current Username" runat="server" Font-Size="Small" Height="38px" Width="230px" Font-Names="Bahnschrift" Font-Bold="True"></asp:TextBox></td>
            <td class="auto-style1">
                <asp:Label ID="lbluser" runat="server" ForeColor="Red" Text="This field is mandatory" Visible="False"></asp:Label>
            </td>
        </tr>
    <tr>
            <td class="auto-style3"><strong><asp:Label ID="Label2" runat="server" Text="Password" Font-Names="Bahnschrift" Font-Size="Small"></asp:Label><span class="auto-style2">*</span></strong></td>
            <td><asp:TextBox ID="txtpassword" placeholder="Current Password" Font-Size="Small" runat="server" Height="38px" Width="230px" TextMode="Password" Font-Bold="True" Font-Names="Bahnschrift"></asp:TextBox></td>
        <td class="auto-style1">
            <asp:Label ID="lblPassword" runat="server" ForeColor="Red" Text="This field is mandatory" Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style3"><strong><asp:Label ID="Label3" runat="server" Text="New " Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Small"></asp:Label></strong></td>
            <td><asp:TextBox ID="txtNewPass" placeholder="New Password" Font-Size="Small" runat="server" Height="38px" Width="230px" TextMode="Password" Font-Bold="True" Font-Names="Bahnschrift"></asp:TextBox></td>
            <td class="auto-style1">
                <asp:Label ID="lblNew" runat="server" ForeColor="Red" Text="This field is mandatory" Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style3"><strong><asp:Label ID="Label4" runat="server" Text="Confirm " Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Small"></asp:Label></strong></td>
            <td>
                <asp:TextBox ID="txtConfirmPass" placeholder="Password Confirmation" Font-Size="Small" runat="server" Height="38px" Width="230px" TextMode="Password" Font-Bold="True" Font-Names="Bahnschrift"></asp:TextBox></td>
            <td class="auto-style1">
                <asp:Label ID="lblConfirm" runat="server" ForeColor="Red" Text="This field is mandatory" Visible="False"></asp:Label>
            </td>
        </tr>
        </table>
    <div style="margin-left:225px; margin-top:10px;"><strong>&nbsp;<asp:Button ID="Button1" runat="server" Text="Change" Height="36px" Width="83px" OnClick="Button1_Click" CssClass="btn-primary" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Small" /></strong></div>
    </div>
 
</asp:Content>
