<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RTD_pending.aspx.cs" Inherits="Collateral_int.RTD_pending" %>

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

    .auto-style1 {
       text-align: center;
       font-size: 12px;
       font-family: Bahnschrift;
       padding: 0 5px 0 5px;
                 }
</style>
    <br />
    <br />
<div class="main">
   <p>
      <asp:CheckBox AutoPostBack="true" ID="insertCheck" runat="server" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="X-Small" ForeColor="#003399" Text="Insert Pending Record(s)" OnCheckedChanged="insertCheck_CheckedChanged" />
      &nbsp;
      <asp:CheckBox AutoPostBack="true" ID="updatedCheck" runat="server" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="X-Small" ForeColor="#003399" Text="Updated Pending Record(s)" OnCheckedChanged="updatedCheck_CheckedChanged" />
      &nbsp;
      <asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="true" Checked="false" Font-Names="Bahnschrift" Font-Size="Small" ForeColor="Red" Text="SHOW ALL" OnCheckedChanged="CheckBox1_CheckedChanged" ToolTip="Show all fields" />
   <p>
      <asp:ImageButton ID="ApproveBtnImg" runat="server" Height="32px" ImageUrl="~/image/insertBtn.jpg" OnClick="ImageButton1_Click" ToolTip="Approve Inserted Records" Width="30px" Enabled="False" />
      &nbsp;
      <asp:ImageButton ID="ApproveUpdateBtn" runat="server" Height="32px" ImageUrl="~/image/updatebtn.png" ToolTip="Approved Updated Records" Width="28px" Enabled="False" OnClick="ApproveUpdateBtn_Click" />
   <hr style="margin-left: 5px; border-bottom: 5px solid #003399; width: 1100px; background-color: #00FF00;" />
   <div style="margin-top: -15px;">
      <asp:Label ID="updateLbl" runat="server" Font-Size="Small" Text="Label" Visible="False" Font-Names="Bahnschrift" ForeColor="Red"></asp:Label>
   </div>
   <div style="margin-top: -15px; color:red" >
      <asp:Label ID="insertLbl" runat="server" Font-Size="Small" Text="Label" Visible="False" Font-Names="Bahnschrift" ForeColor="Red"></asp:Label>
   </div>
   <asp:GridView ID="GridView2" OnRowCommand="GridView2_RowCommand" runat="server" OnRowDataBound="GridView2_RowDataBound" ShowHeaderWhenEmpty="True"
      AllowSorting="True" CssClass="auto-style1" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC"
      BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="id" DataSourceID="SqlCon2" PageSize="7" Width="1253px" Visible="False" OnSelectedIndexChanged="GridView2_SelectedIndexChanged">
      <Columns>
         <asp:TemplateField ShowHeader="False">
            <ItemTemplate>
               <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandArgument='<%# Bind("id") %>' CommandName="Delete" Text="Delete"></asp:LinkButton>
            </ItemTemplate>
         </asp:TemplateField>
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
         </asp:TemplateField>
         <asp:TemplateField HeaderText="id" InsertVisible="False" SortExpression="id">
            <EditItemTemplate>
               <asp:Label ID="Label1" runat="server" Text='<%# Eval("id") %>'></asp:Label>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label1" runat="server" Text='<%# Bind("id") %>'></asp:Label>
            </ItemTemplate>
            <ControlStyle CssClass="center" Font-Names="Bahnschrift" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" Font-Bold="True" Font-Names="Bahnschrift" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Client Name" SortExpression="Client Name">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("[Client Name]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label2" runat="server" Text='<%# Bind("[Client Name]") %>'></asp:Label>
            </ItemTemplate>
            <ControlStyle CssClass="center" Font-Names="Bahnschrift" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" Font-Bold="True" Font-Names="Bahnschrift" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Loan Type" SortExpression="Loan Type">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("[Loan Type]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label3" runat="server" Text='<%# Bind("[Loan Type]") %>'></asp:Label>
            </ItemTemplate>
            <ControlStyle CssClass="center" Font-Names="Bahnschrift" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" Font-Bold="True" Font-Names="Bahnschrift" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Qabala Type" SortExpression="Qabala Type">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("[Qabala Type]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label4" runat="server" Text='<%# Bind("[Qabala Type]") %>'></asp:Label>
            </ItemTemplate>
            <ControlStyle CssClass="center" Font-Names="Bahnschrift" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" Font-Bold="True" Font-Names="Bahnschrift" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Qabala Number" SortExpression="Qabala Number">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("[Qabala Number]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label5" runat="server" Text='<%# Bind("[Qabala Number]") %>'></asp:Label>
            </ItemTemplate>
            <ControlStyle CssClass="center" Font-Names="Bahnschrift" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" Font-Bold="True" Font-Names="Bahnschrift" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Qabala Date" SortExpression="Qabala Date">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("[Qabala Date]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label6" runat="server" Text='<%# Bind("[Qabala Date]") %>'></asp:Label>
            </ItemTemplate>
            <ControlStyle CssClass="center" Font-Names="Bahnschrift" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" Font-Bold="True" Font-Names="Bahnschrift" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Owner of Qabala" SortExpression="Owner of Qabala">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("[Owner of Qabala]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label7" runat="server" Text='<%# Bind("[Owner of Qabala]") %>'></asp:Label>
            </ItemTemplate>
            <ControlStyle CssClass="center" Font-Names="Bahnschrift" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" Font-Bold="True" Font-Names="Bahnschrift" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Type of Property" SortExpression="Type of Property">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("[Type of Property]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label8" runat="server" Text='<%# Bind("[Type of Property]") %>'></asp:Label>
            </ItemTemplate>
            <ControlStyle CssClass="center" Font-Names="Bahnschrift" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" Font-Bold="True" Font-Names="Bahnschrift" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Currency" SortExpression="Currency">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("Currency") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label10" runat="server" Text='<%# Bind("Currency") %>'></asp:Label>
            </ItemTemplate>
            <ControlStyle CssClass="center" Font-Names="Bahnschrift" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" Font-Bold="True" Font-Names="Bahnschrift" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Value of Property" SortExpression="Value of Property">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("[Value of Property]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label9" runat="server" Text='<%# Bind("[Value of Property]") %>'></asp:Label>
            </ItemTemplate>
            <ControlStyle CssClass="center" Font-Names="Bahnschrift" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" Font-Bold="True" Font-Names="Bahnschrift" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Property Evaluator" SortExpression="Property Evaluator">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("[Property Evaluator]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label11" runat="server" Text='<%# Bind("[Property Evaluator]") %>'></asp:Label>
            </ItemTemplate>
            <ControlStyle CssClass="center" Font-Names="Bahnschrift" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" Font-Bold="True" Font-Names="Bahnschrift" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Address" SortExpression="Address">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("Address") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label12" runat="server" Text='<%# Bind("Address") %>'></asp:Label>
            </ItemTemplate>
            <ControlStyle CssClass="center" Font-Names="Bahnschrift" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" Font-Bold="True" Font-Names="Bahnschrift" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Last Evaluation Date" SortExpression="Last Evaluation Date">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox13" runat="server" Text='<%# Bind("[Last Evaluation Date]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label13" runat="server"  Text='<%# Bind("[Last Evaluation Date]") %>'></asp:Label>
            </ItemTemplate>
            <ControlStyle CssClass="center" Font-Names="Bahnschrift" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" Font-Bold="True" Font-Names="Bahnschrift" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Registered Mortgage No" SortExpression="Registered Mortgage No">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox12" runat="server" Text='<%# Bind("[Registered Mortgage No]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label14" runat="server" Text='<%# Bind("[Registered Mortgage No]") %>'></asp:Label>
            </ItemTemplate>
            <ControlStyle CssClass="center" Font-Names="Bahnschrift" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" Font-Bold="True" Font-Names="Bahnschrift" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Registered Mortgage Date" SortExpression="Registered Mortgage Date">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox14" runat="server" Text='<%# Bind("[Registered Mortgage Date]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label15" runat="server" Text='<%# Bind("[Registered Mortgage Date]") %>'></asp:Label>
            </ItemTemplate>
            <ControlStyle CssClass="center" Font-Names="Bahnschrift" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" Font-Bold="True" Font-Names="Bahnschrift" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Mortgage Value" SortExpression="Mortgage Value">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox15" runat="server" Text='<%# Bind("[Mortgage Value]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label16" runat="server" Text='<%# Bind("[Mortgage Value]") %>'></asp:Label>
            </ItemTemplate>
            <ControlStyle CssClass="center" Font-Names="Bahnschrift" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" Font-Bold="True" Font-Names="Bahnschrift" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Currency Mortgage" SortExpression="Currency Mortgage">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox40" runat="server" Text='<%# Bind("[Currency_Mrtg]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label41" runat="server" Text='<%# Bind("[Currency_Mrtg]") %>'></asp:Label>
            </ItemTemplate>
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Hujat Khaat Number" SortExpression="Hujat Khaat Number">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox16" runat="server" Text='<%# Bind("[Hujat Khaat Number]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label17" runat="server" Text='<%# Bind("[Hujat Khaat Number]") %>'></asp:Label>
            </ItemTemplate>
            <ControlStyle CssClass="center" Font-Names="Bahnschrift" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" Font-Bold="True" Font-Names="Bahnschrift" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Hujat Khaat Date" SortExpression="Hujat Khaat Date">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox17" runat="server" Text='<%# Bind("[Hujat Khaat Date]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label18" runat="server" Text='<%# Bind("[Hujat Khaat Date]") %>'></asp:Label>
            </ItemTemplate>
            <ControlStyle CssClass="center" Font-Names="Bahnschrift" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" Font-Bold="True" Font-Names="Bahnschrift" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Hujat Khaat Vallue" SortExpression="Hujat Khaat Vallue">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox18" runat="server" Text='<%# Bind("[Hujat Khaat Vallue]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label19" runat="server" Text='<%# Bind("[Hujat Khaat Vallue]") %>'></asp:Label>
            </ItemTemplate>
            <ControlStyle CssClass="center" Font-Names="Bahnschrift" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" Font-Bold="True" Font-Names="Bahnschrift" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Equitable Mortgage Number" SortExpression="Equitable Mortgage Number">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox19" runat="server" Text='<%# Bind("[Equitable Mortgage Number]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label20" runat="server" Text='<%# Bind("[Equitable Mortgage Number]") %>'></asp:Label>
            </ItemTemplate>
            <ControlStyle CssClass="center" Font-Names="Bahnschrift" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" Font-Bold="True" Font-Names="Bahnschrift" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Equitable Mortgage Date" SortExpression="Equitable Mortgage Date">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox20" runat="server" Text='<%# Bind("[Equitable Mortgage Date]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label21" runat="server" Text='<%# Bind("[Equitable Mortgage Date]") %>'></asp:Label>
            </ItemTemplate>
            <ControlStyle CssClass="center" Font-Names="Bahnschrift" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" Font-Bold="True" Font-Names="Bahnschrift" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Released Date" SortExpression="Released Date">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox21" runat="server" Text='<%# Bind("[Released Date]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label22" runat="server" Text='<%# Bind("[Released Date]") %>'></asp:Label>
            </ItemTemplate>
            <ControlStyle CssClass="center" Font-Names="Bahnschrift" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" Font-Bold="True" Font-Names="Bahnschrift" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Released By" SortExpression="Released By">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox22" runat="server" Text='<%# Bind("[Released By]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label23" runat="server" Text='<%# Bind("[Released By]") %>'></asp:Label>
            </ItemTemplate>
            <ControlStyle CssClass="center" Font-Names="Bahnschrift" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" Font-Bold="True" Font-Names="Bahnschrift" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Released Title Deeds" SortExpression="Released Title Deeds">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox23" runat="server" Text='<%# Bind("[Released Title Deeds]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label24" runat="server" Text='<%# Bind("[Released Title Deeds]") %>'></asp:Label>
            </ItemTemplate>
            <ControlStyle CssClass="center" Font-Names="Bahnschrift" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" Font-Bold="True" Font-Names="Bahnschrift" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Reason for Released" SortExpression="Based On">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox24" runat="server" Text='<%# Bind("[Based On]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label25" runat="server" Text='<%# Bind("[Based On]") %>'></asp:Label>
            </ItemTemplate>
            <ControlStyle CssClass="center" Font-Names="Bahnschrift" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" Font-Bold="True" Font-Names="Bahnschrift" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Pending Item For Accomplishment" SortExpression="Pending Item For Accomplishment">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox25" runat="server" Text='<%# Bind("[Pending Item For Accomplishment]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label26" runat="server" Text='<%# Bind("[Pending Item For Accomplishment]") %>'></asp:Label>
            </ItemTemplate>
            <ControlStyle CssClass="center" Font-Names="Bahnschrift" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" Font-Bold="True" Font-Names="Bahnschrift" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Due Date" SortExpression="Due Date">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox26" runat="server" Text='<%# Bind("[Due Date]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label27" runat="server" Text='<%# Bind("[Due Date]") %>'></asp:Label>
            </ItemTemplate>
            <ControlStyle CssClass="center" Font-Names="Bahnschrift" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" Font-Bold="True" Font-Names="Bahnschrift" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Received By" SortExpression="Received By">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox27" runat="server" Text='<%# Bind("[Received By]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label28" runat="server" Text='<%# Bind("[Received By]") %>'></asp:Label>
            </ItemTemplate>
            <ControlStyle CssClass="center" Font-Names="Bahnschrift" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" Font-Bold="True" Font-Names="Bahnschrift" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Released Submitted to" SortExpression="Released Submitted to">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox270" runat="server" Text='<%# Bind("[Released Submitted to]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label280" runat="server" Text='<%# Bind("[Released Submitted to]") %>'></asp:Label>
            </ItemTemplate>
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Status" SortExpression="Status">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox28" runat="server" Text='<%# Bind("Status") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label29" runat="server" Text='<%# Bind("Status") %>'></asp:Label>
            </ItemTemplate>
            <ControlStyle CssClass="center" Font-Names="Bahnschrift" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" Font-Bold="True" Font-Names="Bahnschrift" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Remark" SortExpression="Remark">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox29" runat="server" Text='<%# Bind("Remark") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label30" runat="server" Text='<%# Bind("Remark") %>'></asp:Label>
            </ItemTemplate>
            <ControlStyle CssClass="center" Font-Names="Bahnschrift" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" Font-Bold="True" Font-Names="Bahnschrift" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Add Loan Status" SortExpression="Add Loan Status">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox30" runat="server" Text='<%# Bind("[Add Loan Status]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label31" runat="server" Text='<%# Bind("[Add Loan Status]") %>'></asp:Label>
            </ItemTemplate>
            <ControlStyle CssClass="center" Font-Names="Bahnschrift" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" Font-Bold="True" Font-Names="Bahnschrift" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Inserted By" SortExpression="Inserted By">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox31" runat="server" Text='<%# Bind("[Inserted By]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label32" runat="server" Text='<%# Bind("[Inserted By]") %>'></asp:Label>
            </ItemTemplate>
            <ControlStyle CssClass="center" Font-Names="Bahnschrift" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" Font-Bold="True" Font-Names="Bahnschrift" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Updated By" SortExpression="Updated By">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox32" runat="server" Text='<%# Bind("[Updated By]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label33" runat="server" Text='<%# Bind("[Updated By]") %>'></asp:Label>
            </ItemTemplate>
            <ControlStyle CssClass="center" Font-Names="Bahnschrift" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" Font-Bold="True" Font-Names="Bahnschrift" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Approved By" SortExpression="Approved By">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox33" runat="server" Text='<%# Bind("[Approved By]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label34" runat="server" Text='<%# Bind("[Approved By]") %>'></asp:Label>
            </ItemTemplate>
            <ControlStyle CssClass="center" Font-Names="Bahnschrift" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" Font-Bold="True" Font-Names="Bahnschrift" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Inserted Date" SortExpression="Inserted Date">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox34" runat="server" Text='<%# Bind("[Inserted Date]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label35" runat="server" Text='<%# Bind("[Inserted Date]") %>'></asp:Label>
            </ItemTemplate>
            <ControlStyle CssClass="center" Font-Names="Bahnschrift" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" Font-Bold="True" Font-Names="Bahnschrift" />
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
   <br />
   <asp:SqlDataSource ID="SqlCon2" runat="server" ConnectionString="<%$ ConnectionStrings:DBCon %>"
      DeleteCommand="DELETE FROM [RTD_Temp_Insert] WHERE [id] = @id" SelectCommand="SELECT * FROM [RTD_Temp_Insert]">
      <DeleteParameters>
         <asp:Parameter Name="id" Type="Int32" />
      </DeleteParameters>
   </asp:SqlDataSource>
   <div style="margin-top: -5px;">
      <asp:GridView ID="GridView3" OnRowCommand="GridView3_RowCommand" runat="server" OnRowDataBound="GridView3_RowDataBound" DataKeyNames="id" ShowHeaderWhenEmpty="True"
         AllowSorting="True" CssClass="auto-style1" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC"
         BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlConUpdate" PageSize="7" Width="1251px" Visible="False" OnSelectedIndexChanged="GridView3_SelectedIndexChanged">
         <Columns>
                      <asp:TemplateField ShowHeader="False">
            <ItemTemplate>
               <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandArgument='<%# Bind("id") %>' CommandName="Delete" Text="Delete"></asp:LinkButton>
            </ItemTemplate>
         </asp:TemplateField>
            <asp:TemplateField HeaderText="All">
               <HeaderTemplate>
                  <asp:CheckBox ID="chkb2" runat="server" Text="All" OnCheckedChanged="chkb2_CheckedChanged" AutoPostBack="true" />
               </HeaderTemplate>
               <ControlStyle CssClass="center" />
               <HeaderStyle CssClass="center" />
               <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="center" />
               <ItemTemplate>
                  <asp:CheckBox ID="chkSelect" runat="server" />
               </ItemTemplate>
               <ItemStyle HorizontalAlign="center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="id" SortExpression="id">
               <EditItemTemplate>
                  <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("id") %>'></asp:TextBox>
               </EditItemTemplate>
               <ItemTemplate>
                  <asp:Label ID="Label1" runat="server" Text='<%# Bind("id") %>'></asp:Label>
               </ItemTemplate>
               <HeaderStyle CssClass="center" />
               <ItemStyle CssClass="center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Client Name" SortExpression="Client Name">
               <EditItemTemplate>
                  <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("[Client Name]") %>'></asp:TextBox>
               </EditItemTemplate>
               <ItemTemplate>
                  <asp:Label ID="Label2" runat="server" Text='<%# Bind("[Client Name]") %>'></asp:Label>
               </ItemTemplate>
               <HeaderStyle CssClass="center" />
               <ItemStyle CssClass="center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Loan Type" SortExpression="Loan Type">
               <EditItemTemplate>
                  <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("[Loan Type]") %>'></asp:TextBox>
               </EditItemTemplate>
               <ItemTemplate>
                  <asp:Label ID="Label3" runat="server" Text='<%# Bind("[Loan Type]") %>'></asp:Label>
               </ItemTemplate>
               <HeaderStyle CssClass="center" />
               <ItemStyle CssClass="center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Qabala Type" SortExpression="Qabala Type">
               <EditItemTemplate>
                  <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("[Qabala Type]") %>'></asp:TextBox>
               </EditItemTemplate>
               <ItemTemplate>
                  <asp:Label ID="Label4" runat="server" Text='<%# Bind("[Qabala Type]") %>'></asp:Label>
               </ItemTemplate>
               <HeaderStyle CssClass="center" />
               <ItemStyle CssClass="center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Qabala Number" SortExpression="Qabala Number">
               <EditItemTemplate>
                  <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("[Qabala Number]") %>'></asp:TextBox>
               </EditItemTemplate>
               <ItemTemplate>
                  <asp:Label ID="Label5" runat="server" Text='<%# Bind("[Qabala Number]") %>'></asp:Label>
               </ItemTemplate>
               <HeaderStyle CssClass="center" />
               <ItemStyle CssClass="center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Qabala Date" SortExpression="Qabala Date">
               <EditItemTemplate>
                  <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("[Qabala Date]") %>'></asp:TextBox>
               </EditItemTemplate>
               <ItemTemplate>
                  <asp:Label ID="Label6" runat="server" Text='<%# Bind("[Qabala Date]") %>'></asp:Label>
               </ItemTemplate>
               <HeaderStyle CssClass="center" />
               <ItemStyle CssClass="center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Owner of Qabala" SortExpression="Owner of Qabala">
               <EditItemTemplate>
                  <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("[Owner of Qabala]") %>'></asp:TextBox>
               </EditItemTemplate>
               <ItemTemplate>
                  <asp:Label ID="Label7" runat="server" Text='<%# Bind("[Owner of Qabala]") %>'></asp:Label>
               </ItemTemplate>
               <HeaderStyle CssClass="center" />
               <ItemStyle CssClass="center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Type of Property" SortExpression="Type of Property">
               <EditItemTemplate>
                  <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("[Type of Property]") %>'></asp:TextBox>
               </EditItemTemplate>
               <ItemTemplate>
                  <asp:Label ID="Label8" runat="server" Text='<%# Bind("[Type of Property]") %>'></asp:Label>
               </ItemTemplate>
               <HeaderStyle CssClass="center" />
               <ItemStyle CssClass="center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Currency" SortExpression="Currency">
               <EditItemTemplate>
                  <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("Currency") %>'></asp:TextBox>
               </EditItemTemplate>
               <ItemTemplate>
                  <asp:Label ID="Label10" runat="server" Text='<%# Bind("Currency") %>'></asp:Label>
               </ItemTemplate>
               <HeaderStyle CssClass="center" />
               <ItemStyle CssClass="center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Value of Property" SortExpression="Value of Property">
               <EditItemTemplate>
                  <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("[Value of Property]") %>'></asp:TextBox>
               </EditItemTemplate>
               <ItemTemplate>
                  <asp:Label ID="Label9" runat="server" Text='<%# Bind("[Value of Property]") %>'></asp:Label>
               </ItemTemplate>
               <HeaderStyle CssClass="center" />
               <ItemStyle CssClass="center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Property Evaluator" SortExpression="Property Evaluator">
               <EditItemTemplate>
                  <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("[Property Evaluator]") %>'></asp:TextBox>
               </EditItemTemplate>
               <ItemTemplate>
                  <asp:Label ID="Label11" runat="server" Text='<%# Bind("[Property Evaluator]") %>'></asp:Label>
               </ItemTemplate>
               <HeaderStyle CssClass="center" />
               <ItemStyle CssClass="center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Address" SortExpression="Address">
               <EditItemTemplate>
                  <asp:TextBox ID="TextBox12" runat="server" Text='<%# Bind("Address") %>'></asp:TextBox>
               </EditItemTemplate>
               <ItemTemplate>
                  <asp:Label ID="Label12" runat="server" Text='<%# Bind("Address") %>'></asp:Label>
               </ItemTemplate>
               <HeaderStyle CssClass="center" />
               <ItemStyle CssClass="center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Last Evaluation Date" SortExpression="Last Evaluation Date">
               <EditItemTemplate>
                  <asp:TextBox ID="TextBox13" runat="server" Text='<%# Bind("[Last Evaluation Date]") %>'></asp:TextBox>
               </EditItemTemplate>
               <ItemTemplate>
                  <asp:Label ID="Label13" runat="server" Text='<%# Bind("[Last Evaluation Date]") %>'></asp:Label>
               </ItemTemplate>
               <HeaderStyle CssClass="center" />
               <ItemStyle CssClass="center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Registered Mortgage No" SortExpression="Registered Mortgage No">
               <EditItemTemplate>
                  <asp:TextBox ID="TextBox14" runat="server" Text='<%# Bind("[Registered Mortgage No]") %>'></asp:TextBox>
               </EditItemTemplate>
               <ItemTemplate>
                  <asp:Label ID="Label14" runat="server" Text='<%# Bind("[Registered Mortgage No]") %>'></asp:Label>
               </ItemTemplate>
               <HeaderStyle CssClass="center" />
               <ItemStyle CssClass="center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Registered Mortgage Date" SortExpression="Registered Mortgage Date">
               <EditItemTemplate>
                  <asp:TextBox ID="TextBox15" runat="server" Text='<%# Bind("[Registered Mortgage Date]") %>'></asp:TextBox>
               </EditItemTemplate>
               <ItemTemplate>
                  <asp:Label ID="Label15" runat="server" Text='<%# Bind("[Registered Mortgage Date]") %>'></asp:Label>
               </ItemTemplate>
               <HeaderStyle CssClass="center" />
               <ItemStyle CssClass="center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Mortgage Value" SortExpression="Mortgage Value">
               <EditItemTemplate>
                  <asp:TextBox ID="TextBox16" runat="server" Text='<%# Bind("[Mortgage Value]") %>'></asp:TextBox>
               </EditItemTemplate>
               <ItemTemplate>
                  <asp:Label ID="Label16" runat="server" Text='<%# Bind("[Mortgage Value]") %>'></asp:Label>
               </ItemTemplate>
               <HeaderStyle CssClass="center" />
               <ItemStyle CssClass="center" />
            </asp:TemplateField>
         <asp:TemplateField HeaderText="Currency Mortgage" SortExpression="Currency Mortgage">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox40" runat="server" Text='<%# Bind("[Currency_Mrtg]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label41" runat="server" Text='<%# Bind("[Currency_Mrtg]") %>'></asp:Label>
            </ItemTemplate>
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
         </asp:TemplateField>
            <asp:TemplateField HeaderText="Hujat Khaat Number" SortExpression="Hujat Khaat Number">
               <EditItemTemplate>
                  <asp:TextBox ID="TextBox17" runat="server" Text='<%# Bind("[Hujat Khaat Number]") %>'></asp:TextBox>
               </EditItemTemplate>
               <ItemTemplate>
                  <asp:Label ID="Label17" runat="server" Text='<%# Bind("[Hujat Khaat Number]") %>'></asp:Label>
               </ItemTemplate>
               <HeaderStyle CssClass="center" />
               <ItemStyle CssClass="center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Hujat Khaat Date" SortExpression="Hujat Khaat Date">
               <EditItemTemplate>
                  <asp:TextBox ID="TextBox18" runat="server" Text='<%# Bind("[Hujat Khaat Date]") %>'></asp:TextBox>
               </EditItemTemplate>
               <ItemTemplate>
                  <asp:Label ID="Label18" runat="server" Text='<%# Bind("[Hujat Khaat Date]") %>'></asp:Label>
               </ItemTemplate>
               <HeaderStyle CssClass="center" />
               <ItemStyle CssClass="center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Hujat Khaat Vallue" SortExpression="Hujat Khaat Vallue">
               <EditItemTemplate>
                  <asp:TextBox ID="TextBox19" runat="server" Text='<%# Bind("[Hujat Khaat Vallue]") %>'></asp:TextBox>
               </EditItemTemplate>
               <ItemTemplate>
                  <asp:Label ID="Label19" runat="server" Text='<%# Bind("[Hujat Khaat Vallue]") %>'></asp:Label>
               </ItemTemplate>
               <HeaderStyle CssClass="center" />
               <ItemStyle CssClass="center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Equitable Mortgage Number" SortExpression="Equitable Mortgage Number">
               <EditItemTemplate>
                  <asp:TextBox ID="TextBox20" runat="server" Text='<%# Bind("[Equitable Mortgage Number]") %>'></asp:TextBox>
               </EditItemTemplate>
               <ItemTemplate>
                  <asp:Label ID="Label20" runat="server" Text='<%# Bind("[Equitable Mortgage Number]") %>'></asp:Label>
               </ItemTemplate>
               <HeaderStyle CssClass="center" />
               <ItemStyle CssClass="center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Equitable Mortgage Date" SortExpression="Equitable Mortgage Date">
               <EditItemTemplate>
                  <asp:TextBox ID="TextBox21" runat="server" Text='<%# Bind("[Equitable Mortgage Date]") %>'></asp:TextBox>
               </EditItemTemplate>
               <ItemTemplate>
                  <asp:Label ID="Label21" runat="server" Text='<%# Bind("[Equitable Mortgage Date]") %>'></asp:Label>
               </ItemTemplate>
               <HeaderStyle CssClass="center" />
               <ItemStyle CssClass="center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Released Date" SortExpression="Released Date">
               <EditItemTemplate>
                  <asp:TextBox ID="TextBox22" runat="server" Text='<%# Bind("[Released Date]") %>'></asp:TextBox>
               </EditItemTemplate>
               <ItemTemplate>
                  <asp:Label ID="Label22" runat="server" Text='<%# Bind("[Released Date]") %>'></asp:Label>
               </ItemTemplate>
               <HeaderStyle CssClass="center" />
               <ItemStyle CssClass="center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Released By" SortExpression="Released By">
               <EditItemTemplate>
                  <asp:TextBox ID="TextBox23" runat="server" Text='<%# Bind("[Released By]") %>'></asp:TextBox>
               </EditItemTemplate>
               <ItemTemplate>
                  <asp:Label ID="Label23" runat="server" Text='<%# Bind("[Released By]") %>'></asp:Label>
               </ItemTemplate>
               <HeaderStyle CssClass="center" />
               <ItemStyle CssClass="center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Released Title Deeds" SortExpression="Released Title Deeds">
               <EditItemTemplate>
                  <asp:TextBox ID="TextBox24" runat="server" Text='<%# Bind("[Released Title Deeds]") %>'></asp:TextBox>
               </EditItemTemplate>
               <ItemTemplate>
                  <asp:Label ID="Label24" runat="server" Text='<%# Bind("[Released Title Deeds]") %>'></asp:Label>
               </ItemTemplate>
               <HeaderStyle CssClass="center" />
               <ItemStyle CssClass="center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Based On" SortExpression="Based On">
               <EditItemTemplate>
                  <asp:TextBox ID="TextBox25" runat="server" Text='<%# Bind("[Based On]") %>'></asp:TextBox>
               </EditItemTemplate>
               <ItemTemplate>
                  <asp:Label ID="Label25" runat="server" Text='<%# Bind("[Based On]") %>'></asp:Label>
               </ItemTemplate>
               <HeaderStyle CssClass="center" />
               <ItemStyle CssClass="center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Pending Item For Accomplishment" SortExpression="Pending Item For Accomplishment">
               <EditItemTemplate>
                  <asp:TextBox ID="TextBox26" runat="server" Text='<%# Bind("[Pending Item For Accomplishment]") %>'></asp:TextBox>
               </EditItemTemplate>
               <ItemTemplate>
                  <asp:Label ID="Label26" runat="server" Text='<%# Bind("[Pending Item For Accomplishment]") %>'></asp:Label>
               </ItemTemplate>
               <HeaderStyle CssClass="center" />
               <ItemStyle CssClass="center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Received By" SortExpression="Received By">
               <EditItemTemplate>
                  <asp:TextBox ID="TextBox27" runat="server" Text='<%# Bind("[Received By]") %>'></asp:TextBox>
               </EditItemTemplate>
               <ItemTemplate>
                  <asp:Label ID="Label27" runat="server" Text='<%# Bind("[Received By]") %>'></asp:Label>
               </ItemTemplate>
               <HeaderStyle CssClass="center" />
               <ItemStyle CssClass="center" />
            </asp:TemplateField>
         <asp:TemplateField HeaderText="Released Submitted to" SortExpression="Released Submitted to">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox270" runat="server" Text='<%# Bind("[Released Submitted to]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label270" runat="server" Text='<%# Bind("[Released Submitted to]") %>'></asp:Label>
            </ItemTemplate>
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
         </asp:TemplateField>
            <asp:TemplateField HeaderText="Status" SortExpression="Status">
               <EditItemTemplate>
                  <asp:TextBox ID="TextBox28" runat="server" Text='<%# Bind("Status") %>'></asp:TextBox>
               </EditItemTemplate>
               <ItemTemplate>
                  <asp:Label ID="Label28" runat="server" Text='<%# Bind("Status") %>'></asp:Label>
               </ItemTemplate>
               <HeaderStyle CssClass="center" />
               <ItemStyle CssClass="center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Remark" SortExpression="Remark">
               <EditItemTemplate>
                  <asp:TextBox ID="TextBox29" runat="server" Text='<%# Bind("Remark") %>'></asp:TextBox>
               </EditItemTemplate>
               <ItemTemplate>
                  <asp:Label ID="Label29" runat="server" Text='<%# Bind("Remark") %>'></asp:Label>
               </ItemTemplate>
               <HeaderStyle CssClass="center" />
               <ItemStyle CssClass="center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Inserted By" SortExpression="Inserted By">
               <EditItemTemplate>
                  <asp:TextBox ID="TextBox30" runat="server" Text='<%# Bind("[Inserted By]") %>'></asp:TextBox>
               </EditItemTemplate>
               <ItemTemplate>
                  <asp:Label ID="Label30" runat="server" Text='<%# Bind("[Inserted By]") %>'></asp:Label>
               </ItemTemplate>
               <HeaderStyle CssClass="center" />
               <ItemStyle CssClass="center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Updated By" SortExpression="Updated By">
               <EditItemTemplate>
                  <asp:TextBox ID="TextBox31" runat="server" Text='<%# Bind("[Updated By]") %>'></asp:TextBox>
               </EditItemTemplate>
               <ItemTemplate>
                  <asp:Label ID="Label31" runat="server" Text='<%# Bind("[Updated By]") %>'></asp:Label>
               </ItemTemplate>
               <HeaderStyle CssClass="center" />
               <ItemStyle CssClass="center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Approved By" SortExpression="Approved By">
               <EditItemTemplate>
                  <asp:TextBox ID="TextBox32" runat="server" Text='<%# Bind("[Approved By]") %>'></asp:TextBox>
               </EditItemTemplate>
               <ItemTemplate>
                  <asp:Label ID="Label32" runat="server" Text='<%# Bind("[Approved By]") %>'></asp:Label>
               </ItemTemplate>
               <HeaderStyle CssClass="center" />
               <ItemStyle CssClass="center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Inserted Date" SortExpression="Inserted Date">
               <EditItemTemplate>
                  <asp:TextBox ID="TextBox33" runat="server" Text='<%# Bind("[Inserted Date]") %>'></asp:TextBox>
               </EditItemTemplate>
               <ItemTemplate>
                  <asp:Label ID="Label33" runat="server" Text='<%# Bind("[Inserted Date]") %>'></asp:Label>
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
   <asp:SqlDataSource ID="SqlConUpdate" runat="server" ConnectionString="<%$ ConnectionStrings:DBCon %>"
      SelectCommand="SELECT * FROM [RTD_Pending_Update]" DeleteCommand="DELETE FROM [RTD_Pending_Update] WHERE [id] = @id" >

   </asp:SqlDataSource>
</div>

    <%--<script type="text/javascript">
    function HideLabel() {
        var seconds = 3;
        setTimeout(function () {
            document.getElementById("<%=Lblresult.ClientID %>").style.display = "none";
        }, seconds * 1000);
    };
</script>--%>
</asp:Content>
