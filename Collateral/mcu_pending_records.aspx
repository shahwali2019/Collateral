<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="mcu_pending_records.aspx.cs" Inherits="Collateral_int.mcu_pending_records" %>
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
            .updateLbl {
            	margin-bottom: 5px;
            }
            .auto-style2 {
            	width: 1172px;
            }
            .auto-style3 {
            	width: 1173px;
            }
  
</style>

<br />

<div class="main">
   <p>
      <asp:CheckBox AutoPostBack="true" ID="insertCheck" runat="server" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="X-Small" ForeColor="#003399" Text="Insert Pending Record(s)" OnCheckedChanged="insertCheck_CheckedChanged" />
      &nbsp;
      <asp:CheckBox AutoPostBack="true" ID="updatedCheck" runat="server" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="X-Small" ForeColor="#003399" Text="Updated Pending Record(s)" OnCheckedChanged="updatedCheck_CheckedChanged" />
   <p>
      <asp:ImageButton ID="ApproveBtnImg" runat="server" Height="32px" ImageUrl="~/image/insertBtn.jpg" OnClick="ImageButton1_Click" ToolTip="Approve Inserted Records" Width="30px" Enabled="False" />
      &nbsp;
      <asp:ImageButton ID="ApproveUpdateBtn" runat="server" Height="32px" ImageUrl="~/image/updatebtn.png" ToolTip="Approved Updated Records" Width="28px" Enabled="False" OnClick="ApproveUpdateBtn_Click" />
   <hr style="text-align:center; border-bottom:5px solid #003399; width:1100px; background-color: #00FF00;" />
   <div style="margin-top:-15px;">
      <asp:Label ID="updateLbl" CssClass="updateLbl" runat="server" Font-Size="Small" Text="Label" Visible="False" Font-Names="Bahnschrift" ForeColor="Red"></asp:Label>
   </div>
   <div style="margin-top:-15px;">
      <asp:Label ID="insertLbl" runat="server" Font-Size="Small" Text="Label" Visible="False" Font-Names="Bahnschrift" ForeColor="Red"></asp:Label>
   </div>
   <div style="margin-top:10px" class="auto-style2">
      <asp:GridView ID="GridView2" OnRowCommand="GridView2_RowCommand" OnRowDataBound="GridView2_RowDataBound" runat="server" ShowHeaderWhenEmpty="True"
         AllowSorting="True" CssClass="auto-style1" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC"
         BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="id" DataSourceID="SqlCon2" PageSize="7" Width="1172px" Visible="False" GridLines="Horizontal">
         <AlternatingRowStyle BackColor="#3366CC" ForeColor="White" />
         <Columns>
                         <asp:CommandField ShowDeleteButton="True">
               <HeaderStyle CssClass="center" />
               <ItemStyle CssClass="center" />
            </asp:CommandField>
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
               <HeaderStyle CssClass="center" />
               <ItemStyle CssClass="center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Customre Name" SortExpression="Customre Name">
               <EditItemTemplate>
                  <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("[Customre Name]") %>'></asp:TextBox>
               </EditItemTemplate>
               <ItemTemplate>
                  <asp:Label ID="Label2" runat="server" Text='<%# Bind("[Customre Name]") %>'></asp:Label>
               </ItemTemplate>
               <HeaderStyle CssClass="center" />
               <ItemStyle CssClass="center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Currency" SortExpression="Currency">
               <EditItemTemplate>
                  <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Currency") %>'></asp:TextBox>
               </EditItemTemplate>
               <ItemTemplate>
                  <asp:Label ID="Label3" runat="server" Text='<%# Bind("Currency") %>'></asp:Label>
               </ItemTemplate>
               <HeaderStyle CssClass="center" />
               <ItemStyle CssClass="center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Account Number" SortExpression="Account Number">
               <EditItemTemplate>
                  <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("[Account Number]") %>'></asp:TextBox>
               </EditItemTemplate>
               <ItemTemplate>
                  <asp:Label ID="Label4" runat="server" Text='<%# Bind("[Account Number]") %>'></asp:Label>
               </ItemTemplate>
               <HeaderStyle CssClass="center" />
               <ItemStyle CssClass="center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Approval Number" SortExpression="Approval Number">
               <EditItemTemplate>
                  <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("[Approval Number]") %>'></asp:TextBox>
               </EditItemTemplate>
               <ItemTemplate>
                  <asp:Label ID="Label5" runat="server" Text='<%# Bind("[Approval Number]") %>'></asp:Label>
               </ItemTemplate>
               <HeaderStyle CssClass="center" />
               <ItemStyle CssClass="center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Disburesement" SortExpression="[Disburesement">
               <EditItemTemplate>
                  <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("[[Disburesement]") %>'></asp:TextBox>
               </EditItemTemplate>
               <ItemTemplate>
                  <asp:Label ID="Label6" runat="server" Text='<%# Bind("[[Disburesement]") %>'></asp:Label>
               </ItemTemplate>
               <HeaderStyle CssClass="center" />
               <ItemStyle CssClass="center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Due Date of MCU" SortExpression="Due Date of MCU">
               <EditItemTemplate>
                  <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("[Due Date of MCU]") %>'></asp:TextBox>
               </EditItemTemplate>
               <ItemTemplate>
                  <asp:Label ID="Label7" runat="server" Text='<%# Bind("[Due Date of MCU]") %>'></asp:Label>
               </ItemTemplate>
               <HeaderStyle CssClass="center" />
               <ItemStyle CssClass="center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="MCU Date" SortExpression="MCU Date">
               <EditItemTemplate>
                  <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("[MCU Date]") %>'></asp:TextBox>
               </EditItemTemplate>
               <ItemTemplate>
                  <asp:Label ID="Label8" runat="server" Text='<%# Bind("[MCU Date]") %>'></asp:Label>
               </ItemTemplate>
               <ItemStyle CssClass="center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Loan Status" SortExpression="Loan Status">
               <EditItemTemplate>
                  <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("[Loan Status]") %>'></asp:TextBox>
               </EditItemTemplate>
               <ItemTemplate>
                  <asp:Label ID="Label9" runat="server" Text='<%# Bind("[Loan Status]") %>'></asp:Label>
               </ItemTemplate>
               <HeaderStyle CssClass="center" />
               <ItemStyle CssClass="center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Remark" SortExpression="Remark">
               <EditItemTemplate>
                  <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("Remark") %>'></asp:TextBox>
               </EditItemTemplate>
               <ItemTemplate>
                  <asp:Label ID="Label10" runat="server" Text='<%# Bind("Remark") %>'></asp:Label>
               </ItemTemplate>
               <HeaderStyle CssClass="center" />
               <ItemStyle CssClass="center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Inserted By" SortExpression="Inserted By">
               <EditItemTemplate>
                  <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("[Inserted By]") %>'></asp:TextBox>
               </EditItemTemplate>
               <ItemTemplate>
                  <asp:Label ID="Label11" runat="server" Text='<%# Bind("[Inserted By]") %>'></asp:Label>
               </ItemTemplate>
               <HeaderStyle CssClass="center" />
               <ItemStyle CssClass="center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Approved By" SortExpression="Approved By">
               <EditItemTemplate>
                  <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("[Approved By]") %>'></asp:TextBox>
               </EditItemTemplate>
               <ItemTemplate>
                  <asp:Label ID="Label12" runat="server" Text='<%# Bind("[Approved By]") %>'></asp:Label>
               </ItemTemplate>
               <HeaderStyle CssClass="center" />
               <ItemStyle CssClass="center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Updated By" SortExpression="Updated By">
               <EditItemTemplate>
                  <asp:TextBox ID="TextBox12" runat="server" Text='<%# Bind("[Updated By]") %>'></asp:TextBox>
               </EditItemTemplate>
               <ItemTemplate>
                  <asp:Label ID="Label13" runat="server" Text='<%# Bind("[Updated By]") %>'></asp:Label>
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
   <asp:SqlDataSource ID="SqlCon2" runat="server" ConnectionString="<%$ ConnectionStrings:DBCon %>" 
            SelectCommand="SELECT * FROM [mcu_tbl_insert]" DeleteCommand="DELETE FROM [mcu_tbl_insert] WHERE [id] = @id">
             <DeleteParameters>
                 <asp:Parameter Name="id" Type="Int32" />
             </DeleteParameters>
        </asp:SqlDataSource>
   <div style="margin-top:20px" class="auto-style3">
      <asp:GridView ID="GridView3" OnRowCommand="GridView3_RowCommand" OnRowDataBound="GridView3_RowDataBound" runat="server" ShowHeaderWhenEmpty="True"
         AllowSorting="True" CssClass="auto-style1" AutoGenerateColumns="False" BorderColor="#3366CC"
         BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlConUpdate" DataKeyNames="id" PageSize="7" Width="1172px" Visible="False" GridLines="Horizontal" >
         <AlternatingRowStyle BackColor="#99FF99" />
         <Columns>
                         <asp:CommandField ShowDeleteButton="True">
               <HeaderStyle CssClass="center" />
               <ItemStyle CssClass="center" />
            </asp:CommandField>
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
            <asp:TemplateField HeaderText="Customre Name" SortExpression="Customre Name">
               <EditItemTemplate>
                  <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("[Customre Name]") %>'></asp:TextBox>
               </EditItemTemplate>
               <ItemTemplate>
                  <asp:Label ID="Label2" runat="server" Text='<%# Bind("[Customre Name]") %>'></asp:Label>
               </ItemTemplate>
               <HeaderStyle CssClass="center" />
               <ItemStyle CssClass="center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Currency" SortExpression="Currency">
               <EditItemTemplate>
                  <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Currency") %>'></asp:TextBox>
               </EditItemTemplate>
               <ItemTemplate>
                  <asp:Label ID="Label3" runat="server" Text='<%# Bind("Currency") %>'></asp:Label>
               </ItemTemplate>
               <HeaderStyle CssClass="center" />
               <ItemStyle CssClass="center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Account Number" SortExpression="Account Number">
               <EditItemTemplate>
                  <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("[Account Number]") %>'></asp:TextBox>
               </EditItemTemplate>
               <ItemTemplate>
                  <asp:Label ID="Label4" runat="server" Text='<%# Bind("[Account Number]") %>'></asp:Label>
               </ItemTemplate>
               <HeaderStyle CssClass="center" />
               <ItemStyle CssClass="center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Approval Number" SortExpression="Approval Number">
               <EditItemTemplate>
                  <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("[Approval Number]") %>'></asp:TextBox>
               </EditItemTemplate>
               <ItemTemplate>
                  <asp:Label ID="Label5" runat="server" Text='<%# Bind("[Approval Number]") %>'></asp:Label>
               </ItemTemplate>
               <HeaderStyle CssClass="center" />
               <ItemStyle CssClass="center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Disburesement" SortExpression="[Disburesement">
               <EditItemTemplate>
                  <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("[[Disburesement]") %>'></asp:TextBox>
               </EditItemTemplate>
               <ItemTemplate>
                  <asp:Label ID="Label6" runat="server" Text='<%# Bind("[[Disburesement]") %>'></asp:Label>
               </ItemTemplate>
               <HeaderStyle CssClass="center" />
               <ItemStyle CssClass="center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Due Date of MCU" SortExpression="Due Date of MCU">
               <EditItemTemplate>
                  <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("[Due Date of MCU]") %>'></asp:TextBox>
               </EditItemTemplate>
               <ItemTemplate>
                  <asp:Label ID="Label7" runat="server" Text='<%# Bind("[Due Date of MCU]") %>'></asp:Label>
               </ItemTemplate>
               <HeaderStyle CssClass="center" />
               <ItemStyle CssClass="center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="MCU Date" SortExpression="MCU Date">
               <EditItemTemplate>
                  <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("[MCU Date]") %>'></asp:TextBox>
               </EditItemTemplate>
               <ItemTemplate>
                  <asp:Label ID="Label8" runat="server" Text='<%# Bind("[MCU Date]") %>'></asp:Label>
               </ItemTemplate>
               <HeaderStyle CssClass="center" />
               <ItemStyle CssClass="center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Loan Status" SortExpression="Loan Status">
               <EditItemTemplate>
                  <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("[Loan Status]") %>'></asp:TextBox>
               </EditItemTemplate>
               <ItemTemplate>
                  <asp:Label ID="Label9" runat="server" Text='<%# Bind("[Loan Status]") %>'></asp:Label>
               </ItemTemplate>
               <HeaderStyle CssClass="center" />
               <ItemStyle CssClass="center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Remark" SortExpression="Remark">
               <EditItemTemplate>
                  <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("Remark") %>'></asp:TextBox>
               </EditItemTemplate>
               <ItemTemplate>
                  <asp:Label ID="Label10" runat="server" Text='<%# Bind("Remark") %>'></asp:Label>
               </ItemTemplate>
               <HeaderStyle CssClass="center" />
               <ItemStyle CssClass="center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Inserted By" SortExpression="Inserted By">
               <EditItemTemplate>
                  <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("[Inserted By]") %>'></asp:TextBox>
               </EditItemTemplate>
               <ItemTemplate>
                  <asp:Label ID="Label11" runat="server" Text='<%# Bind("[Inserted By]") %>'></asp:Label>
               </ItemTemplate>
               <HeaderStyle CssClass="center" />
               <ItemStyle CssClass="center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Approved By" SortExpression="Approved By">
               <EditItemTemplate>
                  <asp:TextBox ID="TextBox12" runat="server" Text='<%# Bind("[Approved By]") %>'></asp:TextBox>
               </EditItemTemplate>
               <ItemTemplate>
                  <asp:Label ID="Label12" runat="server" Text='<%# Bind("[Approved By]") %>'></asp:Label>
               </ItemTemplate>
               <HeaderStyle CssClass="center" />
               <ItemStyle CssClass="center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Updated By" SortExpression="Updated By">
               <EditItemTemplate>
                  <asp:TextBox ID="TextBox13" runat="server" Text='<%# Bind("[Updated By]") %>'></asp:TextBox>
               </EditItemTemplate>
               <ItemTemplate>
                  <asp:Label ID="Label13" runat="server" Text='<%# Bind("[Updated By]") %>'></asp:Label>
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
      SelectCommand="SELECT * FROM [mcu_tbl_update]" DeleteCommand="DELETE FROM [mcu_tbl_update] WHERE [id] = @id" >
   </asp:SqlDataSource>
</div>
<br />
<br />
</asp:Content>







