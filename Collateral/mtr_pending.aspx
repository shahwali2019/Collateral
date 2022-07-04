<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="mtr_pending.aspx.cs" Inherits="Collateral.mtr_pending" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <br />
     <style>
            .center
            {
                text-align:center;
                font-size:12px;
                 font-family:Bahnschrift;
                 height:30px;
                 width:auto;
                 padding:0 5px 0 5px;
            }
         .auto-style1 {
             text-align: center;
             font-size: 12px;
             font-family: Bahnschrift;
             padding: 0 5px 0 5px;
         }
  
         .auto-style2 {
             width: 1100px;
         }
  
        </style>
    <br />
<div class="main">
   <p>
      <asp:CheckBox AutoPostBack="true" ID="insertCheck" runat="server" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="X-Small" ForeColor="#003399" Text="Insert Pending Record(s)" OnCheckedChanged="insertCheck_CheckedChanged" />
      &nbsp;
      <asp:CheckBox AutoPostBack="true" ID="updatedCheck" runat="server" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="X-Small" ForeColor="#003399" Text="Updated Pending Record(s)" OnCheckedChanged="updatedCheck_CheckedChanged" />
   <p>
      <asp:ImageButton ID="ApproveBtnImg" runat="server" Height="32px" ImageUrl="~/image/insertBtn.jpg" OnClick="ApproveBtnImg_Click" ToolTip="Approve Inserted Records" Width="30px" Enabled="False" />
      &nbsp;
      <asp:ImageButton ID="ApproveUpdateBtn" runat="server" Height="32px" ImageUrl="~/image/updatebtn.png" ToolTip="Approved Updated Records" Width="28px" Enabled="False" OnClick="ApproveUpdateBtn_Click" />
   <p>
      <asp:Label ID="Label19" runat="server" Text=""></asp:Label>
   <hr style="margin-left:5px;border-bottom:5px solid #003399; background-color: #00FF00;" class="auto-style2" />
   <div style="margin-top:-15px;">
      <asp:Label ID="updateLbl" runat="server" Font-Size="Small" Text="Label" Visible="False" Font-Names="Bahnschrift" ForeColor="Red"></asp:Label>
   </div>
   <div style="margin-top:-15px;">
      <asp:Label ID="insertLbl" runat="server" Font-Size="Small" Text="Label" Visible="False" Font-Names="Bahnschrift" ForeColor="Red"></asp:Label>
   </div>
   <asp:GridView ID="GridView2" OnRowCommand="GridView2_RowCommand1" OnRowDataBound="GridView2_RowDataBound" runat="server" ShowHeaderWhenEmpty="True" AllowSorting="True" CssClass="auto-style1" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC"
      BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="id" DataSourceID="SqlCon2" PageSize="7" Width="1172px" Visible="False" >
      <%-- OnSelectedIndexChanged="GridView2_SelectedIndexChanged"--%>
      <Columns>
         <asp:TemplateField ShowHeader="False">
            <ItemTemplate>
               <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
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
         <asp:TemplateField HeaderText="id" InsertVisible="False" SortExpression="id">
            <EditItemTemplate>
               <asp:Label ID="Label1" runat="server" Text='<%# Eval("id") %>'></asp:Label>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label1" runat="server" Text='<%# Bind("id") %>'></asp:Label>
            </ItemTemplate>
            <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Client Name" SortExpression="Client Name">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("[Client Name]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label2" runat="server" Text='<%# Bind("[Client Name]") %>'></asp:Label>
            </ItemTemplate>
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Memo Ref" SortExpression="Memo Ref">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("[Memo Ref]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label3" runat="server" Text='<%# Bind("[Memo Ref]") %>'></asp:Label>
            </ItemTemplate>
            <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Debit Account" SortExpression="Debit Account">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("[Debit Account]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label4" runat="server" Text='<%# Bind("[Debit Account]") %>'></asp:Label>
            </ItemTemplate>
            <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Credit Account" SortExpression="Credit Account">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("[Credit Account]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label5" runat="server" Text='<%# Bind("[Credit Account]") %>'></asp:Label>
            </ItemTemplate>
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Transaction Code" SortExpression="Transaction Code">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("[Transaction Code]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label6" runat="server" Text='<%# Bind("[Transaction Code]") %>'></asp:Label>
            </ItemTemplate>
            <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Memo Submission" SortExpression="Memo Submission">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("[Memo Submission]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label7" runat="server" Text='<%# Bind("[Memo Submission]") %>'></asp:Label>
            </ItemTemplate>
            <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Amount" SortExpression="Amount">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Amount") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label8" runat="server" Text='<%# Bind("Amount") %>'></asp:Label>
            </ItemTemplate>
            <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Currency" SortExpression="Currency">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("Currency") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label9" runat="server" Text='<%# Bind("Currency") %>'></asp:Label>
            </ItemTemplate>
            <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Heading" SortExpression="Heading">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("Heading") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label10" runat="server" Text='<%# Bind("Heading") %>'></asp:Label>
            </ItemTemplate>
            <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Transaction Detail" SortExpression="Transaction Detail">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("[Transaction Detail]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label11" runat="server" Text='<%# Bind("[Transaction Detail]") %>'></asp:Label>
            </ItemTemplate>
            <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Booding Date" SortExpression="Booding Date">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("[Booding Date]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label12" runat="server" Text='<%# Bind("[Booding Date]") %>'></asp:Label>
            </ItemTemplate>
            <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Value Date" SortExpression="Value Date">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox12" runat="server" Text='<%# Bind("[Value Date]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label13" runat="server" Text='<%# Bind("[Value Date]") %>'></asp:Label>
            </ItemTemplate>
            <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Status" SortExpression="Status">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox13" runat="server" Text='<%# Bind("Status") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label14" runat="server" Text='<%# Bind("Status") %>'></asp:Label>
            </ItemTemplate>
            <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Remark" SortExpression="Remark">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox14" runat="server" Text='<%# Bind("Remark") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label15" runat="server" Text='<%# Bind("Remark") %>'></asp:Label>
            </ItemTemplate>
            <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="InsertedBy" SortExpression="InsertedBy">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox15" runat="server" Text='<%# Bind("InsertedBy") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label16" runat="server" Text='<%# Bind("InsertedBy") %>'></asp:Label>
            </ItemTemplate>
            <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="ApprovedBy" SortExpression="ApprovedBy">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox16" runat="server" Text='<%# Bind("ApprovedBy") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label17" runat="server" Text='<%# Bind("ApprovedBy") %>'></asp:Label>
            </ItemTemplate>
            <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="UpdatedBy" SortExpression="UpdatedBy">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox17" runat="server" Text='<%# Bind("UpdatedBy") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label18" runat="server" Text='<%# Bind("UpdatedBy") %>'></asp:Label>
            </ItemTemplate>
            <ControlStyle CssClass="center" />
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
   <br />
   <asp:SqlDataSource ID="SqlCon2" runat="server" ConnectionString="<%$ ConnectionStrings:DBCon %>" SelectCommand="SELECT * FROM [mtr_insert]" DeleteCommand="DELETE FROM [mtr_insert] WHERE [id] = @id">
      <DeleteParameters>
         <asp:Parameter Name="id" Type="Int32" DefaultValue="0" />
      </DeleteParameters>
   </asp:SqlDataSource>
   <div style="margin-top:-5px;">
      <asp:GridView ID="GridView3" OnRowCommand="GridView3_RowCommand1" OnRowDataBound="GridView3_RowDataBound" DataKeyNames="id" runat="server" ShowHeaderWhenEmpty="True"
         AllowSorting="True" CssClass="auto-style1" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC"
         BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlConUpdate" PageSize="7" Width="1172px" Visible="False" >
         <Columns>
        <asp:TemplateField ShowHeader="False">
            <ItemTemplate>
               <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
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
               <ItemStyle HorizontalAlign="center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="id" SortExpression="id">
               <EditItemTemplate>
                  <asp:Label ID="Label1" runat="server" Text='<%# Eval("id") %>'></asp:Label>
               </EditItemTemplate>
               <ItemTemplate>
                  <asp:Label ID="Label1" runat="server" Text='<%# Bind("id") %>'></asp:Label>
               </ItemTemplate>
               <ControlStyle CssClass="center" />
               <HeaderStyle CssClass="center" />
               <ItemStyle CssClass="center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Client Name" SortExpression="Client Name">
               <EditItemTemplate>
                  <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("[Client Name]") %>'></asp:TextBox>
               </EditItemTemplate>
               <ItemTemplate>
                  <asp:Label ID="Label2" runat="server" Text='<%# Bind("[Client Name]") %>'></asp:Label>
               </ItemTemplate>
               <ControlStyle CssClass="center" />
               <HeaderStyle CssClass="center" />
               <ItemStyle CssClass="center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Memo Ref" SortExpression="Memo Ref">
               <EditItemTemplate>
                  <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("[Memo Ref]") %>'></asp:TextBox>
               </EditItemTemplate>
               <ItemTemplate>
                  <asp:Label ID="Label3" runat="server" Text='<%# Bind("[Memo Ref]") %>'></asp:Label>
               </ItemTemplate>
               <ControlStyle CssClass="center" />
               <HeaderStyle CssClass="center" />
               <ItemStyle CssClass="center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Debit Account" SortExpression="Debit Account">
               <EditItemTemplate>
                  <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("[Debit Account]") %>'></asp:TextBox>
               </EditItemTemplate>
               <ItemTemplate>
                  <asp:Label ID="Label4" runat="server" Text='<%# Bind("[Debit Account]") %>'></asp:Label>
               </ItemTemplate>
               <ControlStyle CssClass="center" />
               <HeaderStyle CssClass="center" />
               <ItemStyle CssClass="center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Credit Account" SortExpression="Credit Account">
               <EditItemTemplate>
                  <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("[Credit Account]") %>'></asp:TextBox>
               </EditItemTemplate>
               <ItemTemplate>
                  <asp:Label ID="Label5" runat="server" Text='<%# Bind("[Credit Account]") %>'></asp:Label>
               </ItemTemplate>
               <ControlStyle CssClass="center" />
               <HeaderStyle CssClass="center" />
               <ItemStyle CssClass="center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Transaction Code" SortExpression="Transaction Code">
               <EditItemTemplate>
                  <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("[Transaction Code]") %>'></asp:TextBox>
               </EditItemTemplate>
               <ItemTemplate>
                  <asp:Label ID="Label6" runat="server" Text='<%# Bind("[Transaction Code]") %>'></asp:Label>
               </ItemTemplate>
               <ControlStyle CssClass="center" />
               <HeaderStyle CssClass="center" />
               <ItemStyle CssClass="center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Memo Submission" SortExpression="Memo Submission">
               <EditItemTemplate>
                  <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("[Memo Submission]") %>'></asp:TextBox>
               </EditItemTemplate>
               <ItemTemplate>
                  <asp:Label ID="Label7" runat="server" Text='<%# Bind("[Memo Submission]") %>'></asp:Label>
               </ItemTemplate>
               <ControlStyle CssClass="center" />
               <HeaderStyle CssClass="center" />
               <ItemStyle CssClass="center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Amount" SortExpression="Amount">
               <EditItemTemplate>
                  <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Amount") %>'></asp:TextBox>
               </EditItemTemplate>
               <ItemTemplate>
                  <asp:Label ID="Label8" runat="server" Text='<%# Bind("Amount") %>'></asp:Label>
               </ItemTemplate>
               <ControlStyle CssClass="center" />
               <HeaderStyle CssClass="center" />
               <ItemStyle CssClass="center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Currency" SortExpression="Currency">
               <EditItemTemplate>
                  <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("Currency") %>'></asp:TextBox>
               </EditItemTemplate>
               <ItemTemplate>
                  <asp:Label ID="Label9" runat="server" Text='<%# Bind("Currency") %>'></asp:Label>
               </ItemTemplate>
               <ControlStyle CssClass="center" />
               <HeaderStyle CssClass="center" />
               <ItemStyle CssClass="center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Heading" SortExpression="Heading">
               <EditItemTemplate>
                  <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("Heading") %>'></asp:TextBox>
               </EditItemTemplate>
               <ItemTemplate>
                  <asp:Label ID="Label10" runat="server" Text='<%# Bind("Heading") %>'></asp:Label>
               </ItemTemplate>
               <ControlStyle CssClass="center" />
               <HeaderStyle CssClass="center" />
               <ItemStyle CssClass="center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Transaction Detail" SortExpression="Transaction Detail">
               <EditItemTemplate>
                  <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("[Transaction Detail]") %>'></asp:TextBox>
               </EditItemTemplate>
               <ItemTemplate>
                  <asp:Label ID="Label11" runat="server" Text='<%# Bind("[Transaction Detail]") %>'></asp:Label>
               </ItemTemplate>
               <ControlStyle CssClass="center" />
               <HeaderStyle CssClass="center" />
               <ItemStyle CssClass="center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Booding Date" SortExpression="Booding Date">
               <EditItemTemplate>
                  <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("[Booding Date]") %>'></asp:TextBox>
               </EditItemTemplate>
               <ItemTemplate>
                  <asp:Label ID="Label12" runat="server" Text='<%# Bind("[Booding Date]") %>'></asp:Label>
               </ItemTemplate>
               <ControlStyle CssClass="center" />
               <HeaderStyle CssClass="center" />
               <ItemStyle CssClass="center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Value Date" SortExpression="Value Date">
               <EditItemTemplate>
                  <asp:TextBox ID="TextBox12" runat="server" Text='<%# Bind("[Value Date]") %>'></asp:TextBox>
               </EditItemTemplate>
               <ItemTemplate>
                  <asp:Label ID="Label13" runat="server" Text='<%# Bind("[Value Date]") %>'></asp:Label>
               </ItemTemplate>
               <ControlStyle CssClass="center" />
               <HeaderStyle CssClass="center" />
               <ItemStyle CssClass="center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Status" SortExpression="Status">
               <EditItemTemplate>
                  <asp:TextBox ID="TextBox13" runat="server" Text='<%# Bind("Status") %>'></asp:TextBox>
               </EditItemTemplate>
               <ItemTemplate>
                  <asp:Label ID="Label14" runat="server" Text='<%# Bind("Status") %>'></asp:Label>
               </ItemTemplate>
               <ControlStyle CssClass="center" />
               <HeaderStyle CssClass="center" />
               <ItemStyle CssClass="center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Remark" SortExpression="Remark">
               <EditItemTemplate>
                  <asp:TextBox ID="TextBox14" runat="server" Text='<%# Bind("Remark") %>'></asp:TextBox>
               </EditItemTemplate>
               <ItemTemplate>
                  <asp:Label ID="Label15" runat="server" Text='<%# Bind("Remark") %>'></asp:Label>
               </ItemTemplate>
               <ControlStyle CssClass="center" />
               <HeaderStyle CssClass="center" />
               <ItemStyle CssClass="center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="InsertedBy" SortExpression="InsertedBy">
               <EditItemTemplate>
                  <asp:TextBox ID="TextBox15" runat="server" Text='<%# Bind("InsertedBy") %>'></asp:TextBox>
               </EditItemTemplate>
               <ItemTemplate>
                  <asp:Label ID="Label16" runat="server" Text='<%# Bind("InsertedBy") %>'></asp:Label>
               </ItemTemplate>
               <ControlStyle CssClass="center" />
               <HeaderStyle CssClass="center" />
               <ItemStyle CssClass="center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ApprovedBy" SortExpression="ApprovedBy">
               <EditItemTemplate>
                  <asp:TextBox ID="TextBox16" runat="server" Text='<%# Bind("ApprovedBy") %>'></asp:TextBox>
               </EditItemTemplate>
               <ItemTemplate>
                  <asp:Label ID="Label17" runat="server" Text='<%# Bind("ApprovedBy") %>'></asp:Label>
               </ItemTemplate>
               <ControlStyle CssClass="center" />
               <HeaderStyle CssClass="center" />
               <ItemStyle CssClass="center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="UpdatedBy" SortExpression="UpdatedBy">
               <EditItemTemplate>
                  <asp:TextBox ID="TextBox17" runat="server" Text='<%# Bind("UpdatedBy") %>'></asp:TextBox>
               </EditItemTemplate>
               <ItemTemplate>
                  <asp:Label ID="Label18" runat="server" Text='<%# Bind("UpdatedBy") %>'></asp:Label>
               </ItemTemplate>
               <ControlStyle CssClass="center" />
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
   <asp:SqlDataSource ID="SqlConUpdate" runat="server" ConnectionString="<%$ ConnectionStrings:DBCon %>" SelectCommand="SELECT * FROM [mtr_update]" DeleteCommand="DELETE FROM [mtr_update] WHERE [id] = @id">
       <DeleteParameters>
         <asp:Parameter Name="id" Type="Int32" DefaultValue="0" />
      </DeleteParameters>
       </asp:SqlDataSource>
</div>
   
</asp:Content>
