<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="obsr_loan_docs.aspx.cs" Inherits="Collateral.obsr_loan_docs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<style>
   .center {
     text-align: center;
     font-size: 12px;
     font-family: Bahnschrift;
     height: 30px;
     width: auto;
     padding: 0 5px 0 5px;
            }
   td {
    padding: 3px;
      }
</style>

<div style=" text-align:center; height:100px; margin-top:10px; " class="alert alert-success" role="alert">
   <h4 class="alert-heading" style="font-family:Bahnschrift;"><strong>OLDs RECORDS</strong></h4>
</div>
<asp:Panel runat="server" DefaultButton="searchBtn">
   <table>
      <tr style="padding:10px 10px;">
         <td>
            <asp:TextBox ID="txtcustcase" placeholder="Case Number" runat="server" Height="31px" Width="168px" BackColor="#FFFF99" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Small" TabIndex="2" CssClass="form-control"></asp:TextBox>
         </td>
         <td>
            <asp:TextBox ID="txtborr" placeholder="Borrower" runat="server" Height="31px" Width="168px" BackColor="#FFFF99" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Small" TabIndex="2" CssClass="form-control"></asp:TextBox>
         </td>
         <td>
            <asp:TextBox ID="txtFacilityTypeList" placeholder="Facility type" runat="server" Height="31px" Width="168px" BackColor="#FFFF99" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Small" TabIndex="2" CssClass="form-control"></asp:TextBox>
         </td>
      </tr>
      <tr>
         <td>
            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="btn-info" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Small" Height="31px" Width="168px" TabIndex="4">
               <asp:ListItem Value="DP" Selected="True">Department</asp:ListItem>
               <asp:ListItem Value="CIB"></asp:ListItem>
               <asp:ListItem Value="TradeFinance"></asp:ListItem>
               <asp:ListItem Value="IslamicBanking"></asp:ListItem>
               <asp:ListItem Value="ConsumerLoan"></asp:ListItem>
               <asp:ListItem Value="CB"></asp:ListItem>
               <asp:ListItem Value="Legal"></asp:ListItem>
               <asp:ListItem Value="ElectronicBanking(CreditCard)"></asp:ListItem>
               <asp:ListItem Value="Others"></asp:ListItem>
            </asp:DropDownList>
         </td>
         <td>
            <asp:DropDownList ID="txtststs_obsr" runat="server" CssClass="btn-info" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Small" Height="31px" Width="168px" TabIndex="4">
               <asp:ListItem Value="FT" Selected="True">Status of Observation</asp:ListItem>
               <asp:ListItem Value="OK"></asp:ListItem>
               <asp:ListItem Value="Pending"></asp:ListItem>
            </asp:DropDownList>
         </td>
         <td>
            <asp:DropDownList ID="txtcust_type" runat="server" CssClass="btn-info" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Small" Height="31px" Width="168px" TabIndex="4">
               <asp:ListItem Value="CT" Selected="True">Customer type ( PEP /None)</asp:ListItem>
               <asp:ListItem Value="PEP">PEP</asp:ListItem>
               <asp:ListItem Value="NONE">NONE</asp:ListItem>
            </asp:DropDownList>
         </td>
         <td>
            <asp:Button ID="searchBtn" runat="server" CssClass="btn-primary focus" Font-Bold="True" Font-Size="Small" Height="31px" OnClick="searchBtn_Click" Text="Search" Width="67px" Font-Names="Bahnschrift" BorderStyle="None" />
         </td>
      </tr>
   </table>
</asp:Panel>
<div style="margin-left:10px;">
   <asp:Label ID="resultLbl" runat="server" Font-Bold="True" Font-Size="Smaller" ForeColor="Red" Visible="False" Font-Names="Bahnschrift Condensed"></asp:Label>
</div>
<hr style="border-bottom:5px solid #003399" />
<div style="margin-left:20px;">
   <asp:ImageButton ID="excelExporter" runat="server" Height="23px" ImageUrl="~/image/excel1.png" OnClick="excelExporter_Click" ToolTip="Export to excel" Width="17px" />
   &nbsp;
   <asp:ImageButton ID="addNew" runat="server" Height="25px" ImageUrl="~/image/add.png" OnClick="addNew_Click" Width="18px" />
   <br />
   <%-- <asp:Button ID="btnChange" Text="Change Header Text" runat="server" onclick="btnChange_Click" />--%>
   <asp:GridView ID="GridView1" runat="server" OnRowCommand="GridView1_RowCommand" OnRowDataBound="GridView1_RowDataBound" OnDataBound="GridView1_DataBound" HeaderStyle-ForeColor="#636363" ShowHeaderWhenEmpty="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="StringCon" GridLines="Horizontal" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" EnableTheming="True" HorizontalAlign="Center">
      <AlternatingRowStyle BorderStyle="None" HorizontalAlign="Center" />
      <Columns>
         <asp:TemplateField HeaderText="All">
            <HeaderTemplate>
               <asp:CheckBox ID="chkb1" runat="server" Text="All" OnCheckedChanged="chkb1_CheckedChanged" AutoPostBack="true" />
            </HeaderTemplate>
            <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="center" />
            <ItemTemplate>
               <asp:CheckBox ID="chkSelect" runat="server" />
            </ItemTemplate>
            <ItemStyle HorizontalAlign="center" />
         </asp:TemplateField>
         <asp:TemplateField ShowHeader="False">
            <ItemTemplate>
               <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandArgument='<%# Bind("id") %>' CommandName="edit" Text="Edit"></asp:LinkButton>
            </ItemTemplate>
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="id" InsertVisible="False" SortExpression="id">
            <EditItemTemplate>
               <asp:Label ID="Label1" runat="server" Text='<%# Eval("id") %>'></asp:Label>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label1" runat="server" Text='<%# Bind("id") %>'></asp:Label>
            </ItemTemplate>
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Document checking date" SortExpression="Document checking date">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("[Document checking date]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label2" runat="server" Text='<%# Bind("[Document checking date]") %>'></asp:Label>
            </ItemTemplate>
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Borrower" SortExpression="Borrower">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("[Borrower]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label3" runat="server" Text='<%# Bind("[Borrower]") %>'></asp:Label>
            </ItemTemplate>
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Department" SortExpression="Department">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox16" runat="server" Text='<%# Bind("[Department]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label17" runat="server" Text='<%# Bind("[Department]") %>'></asp:Label>
            </ItemTemplate>
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Purpose of Application" SortExpression="Purpose of Application">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox17" runat="server" Text='<%# Bind("[Purpose of Application]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label18" runat="server" Text='<%# Bind("[Purpose of Application]") %>'></asp:Label>
            </ItemTemplate>
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Case Number" SortExpression="Case Number">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("[Case Number]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label4" runat="server" Text='<%# Bind("[Case Number]") %>'></asp:Label>
            </ItemTemplate>
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Facility type" SortExpression="Facility type">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("[Facility type]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label5" runat="server" Text='<%# Bind("[Facility type]") %>'></asp:Label>
            </ItemTemplate>
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Currency" SortExpression="Currency">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("[Currency]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label6" runat="server" Text='<%# Bind("[Currency]") %>'></asp:Label>
            </ItemTemplate>
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Facility amount" SortExpression="Facility amount">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("[Facility amount]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label7" runat="server" Text='<%# Bind("[Facility amount]") %>'></asp:Label>
            </ItemTemplate>
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Customers type" SortExpression="Customers type">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("[Customers type]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label8" runat="server" Text='<%# Bind("[Customers type]") %>'></asp:Label>
            </ItemTemplate>
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="initial observations" SortExpression="initial observations">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("[initial observations]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label9" runat="server" Text='<%# Bind("[initial observations]") %>'></asp:Label>
            </ItemTemplate>
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Outstanding observations" SortExpression="Outstanding observations">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("[Outstanding observations]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label10" runat="server" Text='<%# Bind("[Outstanding observations]") %>'></asp:Label>
            </ItemTemplate>
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Status of Observation" SortExpression="Status of Observation">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("[Status of Observation]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label11" runat="server" Text='<%# Bind("[Status of Observation]") %>'></asp:Label>
            </ItemTemplate>
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Status of Facility" SortExpression="Status of Facility">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("[Status of Facility]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label12" runat="server" Text='<%# Bind("[Status of Facility]") %>'></asp:Label>
            </ItemTemplate>
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Inserted By" SortExpression="Inserted By">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox12" runat="server" Text='<%# Bind("[1st checker]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label13" runat="server" Text='<%# Bind("[1st checker]") %>'></asp:Label>
            </ItemTemplate>
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Approved By" SortExpression="Approved By">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox13" runat="server" Text='<%# Bind("[2nd checker]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label14" runat="server" Text='<%# Bind("[2nd checker]") %>'></asp:Label>
            </ItemTemplate>
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Remarks" SortExpression="Remarks">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox14" runat="server" Text='<%# Bind("[Remarks]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label15" runat="server" Text='<%# Bind("[Remarks]") %>'></asp:Label>
            </ItemTemplate>
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Updated By" SortExpression="Updated By">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox15" runat="server" Text='<%# Bind("[Updated By]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label16" runat="server" Text='<%# Bind("[Updated By]") %>'></asp:Label>
            </ItemTemplate>
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
         </asp:TemplateField>
      </Columns>
      <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
      <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
      <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
      <RowStyle BackColor="White" ForeColor="#003399" />
      <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
      <SortedAscendingCellStyle BackColor="#EDF6F6" />
      <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
      <SortedDescendingCellStyle BackColor="#D6DFDF" />
      <SortedDescendingHeaderStyle BackColor="#002876" />
   </asp:GridView>
</div>
<br />
<asp:SqlDataSource ID="StringCon" runat="server" ConnectionString="<%$ ConnectionStrings:DBCon %>" SelectCommand="SELECT * FROM [OLDs]" OldValuesParameterFormatString="original_{0}"></asp:SqlDataSource>
</asp:Content>
