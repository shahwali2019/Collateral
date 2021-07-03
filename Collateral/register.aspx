<%@ Page Title="Register" Language="C#" AutoEventWireup="true"  MasterPageFile="~/Site.Master" CodeBehind="register.aspx.cs" Inherits="Collateral.register" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
<%--     <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

       <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.js"></script>--%>

    <style>
            body {
            font-family: Arial, Helvetica, sans-serif;
        }
        form {
            border: 3px solid #f1f1f1;
        }
        input[type=text], input[type=password] {
            width: 100%;
            padding: 12px 20px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }

        .container {
            padding: 16px;
        }

        .frmalg {
            margin: auto;
            width: 40%;
        }
    </style>
    <br />
    <br />
    <br />
    <br />

		<div style="text-align: center;" class="alert alert-success" role="alert">
			<p style="text-align: center; font-size: 15px">
				<asp:Label ID="lblMessage" runat="server" EnableViewState="False" ForeColor ="#009933"></asp:Label>
                <asp:Label ID="lblerrormessage" runat="server" EnableViewState="False" ForeColor="#ff0000"></asp:Label>
			</p>
			<p class="alert-heading"><strong style="font-family:Bahnschrift,'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;">Register New User</strong>
			</p>
		</div>
        <div class="container">

            <table>
                <tr>
                    <td>
        <asp:TextBox ID="txtusername" runat="server" placeholder="Enter username" />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtusername" ForeColor="Red" ErrorMessage="Username Field can't be blanked"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
            <asp:DropDownList ID="DropDownList1" runat="server">
                <asp:ListItem Value="">Please Select</asp:ListItem> 
                <asp:ListItem>1</asp:ListItem>
                <asp:ListItem>2</asp:ListItem>
                <asp:ListItem>3</asp:ListItem>
                <asp:ListItem>4</asp:ListItem>
            </asp:DropDownList>
               <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="DropDownList1" ForeColor="Red" ErrorMessage="Please select usertype!"></asp:RequiredFieldValidator>

                    </td>
                </tr>
                <tr>
                    <td>
        <asp:Button ID="btnSave" runat="server" OnClick="Save" Text="Register" ForeColor="#33cc33" />

                    </td>
                </tr>
            </table>


<%--        <asp:TextBox runat="server" ID="txtusertype" placeholder="Enter usertype"></asp:TextBox>--%>
<%--        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtusertype" ForeColor="Red" ErrorMessage="Date Field can't be blanked"></asp:RequiredFieldValidator>--%>

        </div>


    </asp:Content>
