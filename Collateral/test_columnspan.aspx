<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="test_columnspan.aspx.cs" Inherits="Collateral.test_columnspan" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<style>
table, th, td {
  border: 1px solid black;
  border-collapse: collapse;
}
</style>
<asp:GridView runat="server" ID="gvResults" OnRowCommand="gvResults_RowCommand" AutoGenerateColumns="False" DataSourceID="StringCon" ForeColor="Black" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
        <asp:TemplateField> 
        <ItemTemplate>
                <table>
                 <caption>Life Expectancy By Current Age</caption>
                 <tr>
                  <th colspan="2">65</th>
                  <th colspan="2">40</th>
                  <th colspan="2">20</th>
                 </tr>
                 <tr>
                  <th>Men</th>
                  <th>Women</th>
                  <th>Men</th>
                  <th>Women</th>
                  <th>Men</th>
                  <th>Women</th>
                 </tr>
                 <tr>
                  <td>82</td>
                  <td>85</td>
                  <td>78</td>
                  <td>82</td>
                  <td>77</td>
                  <td>81</td>
                 </tr>
                </table>
        </ItemTemplate>
        </asp:TemplateField>
        </Columns>
        </asp:GridView>

        <asp:SqlDataSource ID="StringCon" runat="server" ConnectionString="<%$ ConnectionStrings:DBCon %>" SelectCommand="SELECT * FROM [LAR]" OldValuesParameterFormatString="original_{0}"></asp:SqlDataSource>

</asp:Content>
