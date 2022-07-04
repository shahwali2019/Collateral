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
<%--    <asp:TextBox ID="txtid" runat="server"></asp:TextBox>
    <asp:TextBox ID="txtnumber" runat="server"></asp:TextBox>
    <asp:TextBox ID="txtnumber1" runat="server"></asp:TextBox>
    <asp:TextBox ID="txtnumber2" runat="server" placeholder="40"></asp:TextBox>
    <asp:TextBox ID="txttotal" runat="server"></asp:TextBox>--%>
    <br />
   









    <table>
    <tr>
        <td>ID:</td>
        <td><asp:TextBox runat="server" ID="txtid" /></td>
    </tr>
    <tr>
        <td>Number:</td>
        <td><asp:TextBox runat="server" ID="txtnumber" /></td>
    </tr>
            <tr>
        <td>Number1:</td>
        <td><asp:TextBox runat="server" ID="txtnumber1" /></td>
    </tr>
<%--                    <tr>
        <td>Number2:</td>
        <td><asp:TextBox runat="server" ID="txtnumber2" /></td>
    </tr>--%>
                            <tr>
        <td>total:</td>
        <td><asp:TextBox runat="server" ID="txttotal" /></td>
    </tr>
    <tr>
        <td> <asp:Button ID="subbtn" runat="server" Text="submit" OnClick="subbtn_Click" /></td>
    </tr>
</table>
<br/>
<asp:GridView runat="server" ID="gvCustomers" AutoGenerateColumns="false">
    <Columns>
        <asp:BoundField DataField="customerno" HeaderText="ID" />
        <asp:BoundField DataField="Number" HeaderText="Number" />
        <asp:BoundField DataField="Number1" HeaderText="Number1" />
        <asp:BoundField DataField="Number2" HeaderText="Number2" />
        <asp:BoundField DataField="Total" HeaderText="Total" />
    </Columns>
</asp:GridView>


</asp:Content>
