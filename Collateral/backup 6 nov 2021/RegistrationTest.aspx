<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RegistrationTest.aspx.cs" Inherits="Collateral.RegistrationTest" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <asp:TextBox ID="txtId" runat="server" Visible="true"></asp:TextBox>
    <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
    <asp:TextBox ID="txtAge" runat="server"></asp:TextBox>
    <asp:TextBox ID="txtCountry" runat="server"></asp:TextBox>
    <asp:Button ID="btnSave" runat="server" Text="Button" OnClick="btnSave_Click" />


    <asp:GridView ID="GridView1" runat="server">

        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Label ID="lblField" runat="server" Text='<%#Eval("Your Field") %>'></asp:Label>
 <asp:Button ID="btnUpdate" runat="server" Text="Submit" OnClick="btnUpdate_Click" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>
