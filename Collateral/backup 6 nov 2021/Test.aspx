<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Test.aspx.cs" Inherits="Collateral.Test" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
             <asp:Label ID="updateLbl" runat="server" Font-Size="Small" Text="Label" Visible="False" Font-Names="Bahnschrift" ForeColor="Red"></asp:Label>

    <asp:GridView ID="GridView1" runat="server" OnRowCommand="GridView1_RowCommand">

        <Columns>
            <asp:TemplateField HeaderText = "Click to Delete">
                <ItemTemplate>
                    <asp:Button ID="btndel" runat="server" Text="Delete" OnClientClick = "alert('Are you sure you want to delete the selected Item?');" CommandName="comdel1" CommandArgument= '<%# Eval("id") %>' />
<%--                    <asp:Button ID="btnupdate" runat="server" Text="Update" CommandName="comupdate" CommandArgument='<%# Eval("eno") %>'' />--%>
                </ItemTemplate>

            </asp:TemplateField>
        </Columns>

    </asp:GridView>

</asp:Content>
