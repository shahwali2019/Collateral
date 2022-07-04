<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="obsr_loan_docs_pending.aspx.cs" Inherits="Collateral.obsr_loan_docs_pending" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
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
        font-size: 12px;GridView2_RowCommand
        font-family: Bahnschrift;
        padding: 0 5px 0 5px;
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
   <hr style="margin-left:5px;border-bottom:5px solid #003399; width:1100px; background-color: #00FF00;" />
   <div style="margin-top:-15px;">
      <asp:Label ID="updateLbl" runat="server" Font-Size="Small" Text="Label" Visible="False" Font-Names="Bahnschrift" ForeColor="Red"></asp:Label>
   </div>
   <div style="margin-top:-15px;">
      <asp:Label ID="insertLbl" runat="server" Font-Size="Small" Text="Label" Visible="False" Font-Names="Bahnschrift" ForeColor="Red"></asp:Label>
   </div>
   <asp:GridView ID="gvobservloan" OnRowCommand="gvobservloan_RowCommand" OnRowDataBound="gvobservloan_RowDataBound"   runat="server" ShowHeaderWhenEmpty="True"
      AllowSorting="True" CssClass="auto-style1" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC"
      BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="id" DataSourceID="SqlCon2" PageSize="7" Width="1172px" Visible="False">
      <Columns>

         <asp:CommandField ShowDeleteButton="True" />
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
         <asp:TemplateField ShowHeader="False" Visible="false">
            <ItemTemplate>
               <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
            </ItemTemplate>
         </asp:TemplateField>
         <asp:TemplateField HeaderText="id" InsertVisible="False" SortExpression="id">
            <EditItemTemplate>
               <asp:Label ID="Label1" runat="server" Text='<%# Eval("id") %>'></asp:Label>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label1" runat="server" Text='<%# Bind("id") %>'></asp:Label>
            </ItemTemplate>
            <HeaderStyle CssClass="center" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Document checking ddddate" SortExpression="Document checking date">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("[Document checking date]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label2" runat="server" Text='<%# Bind("[Document checking date]") %>'></asp:Label>
            </ItemTemplate>
            <HeaderStyle CssClass="center" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Borrower" SortExpression="Borrower">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("[Borrower]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label3" runat="server" Text='<%# Bind("[Borrower]") %>'></asp:Label>
            </ItemTemplate>
            <HeaderStyle CssClass="center" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Department" SortExpression="Department">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox16" runat="server" Text='<%# Bind("[Department]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label17" runat="server" Text='<%# Bind("[Department]") %>'></asp:Label>
            </ItemTemplate>
            <HeaderStyle CssClass="center" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Purpose of Application" SortExpression="Purpose of Application">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox17" runat="server" Text='<%# Bind("[Purpose of Application]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label18" runat="server" Text='<%# Bind("[Purpose of Application]") %>'></asp:Label>
            </ItemTemplate>
            <HeaderStyle CssClass="center" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Case Number" SortExpression="Case Number">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("[Case Number]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label4" runat="server" Text='<%# Bind("[Case Number]") %>'></asp:Label>
            </ItemTemplate>
            <HeaderStyle CssClass="center" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Facility type" SortExpression="Facility type">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("[Facility type]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label5" runat="server" Text='<%# Bind("[Facility type]") %>'></asp:Label>
            </ItemTemplate>
            <HeaderStyle CssClass="center" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Currency" SortExpression="Currency">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("[Currency]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label6" runat="server" Text='<%# Bind("[Currency]") %>'></asp:Label>
            </ItemTemplate>
            <HeaderStyle CssClass="center" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Facility amount" SortExpression="Facility amount">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("[Facility amount]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label7" runat="server" Text='<%# Bind("[Facility amount]") %>'></asp:Label>
            </ItemTemplate>
            <HeaderStyle CssClass="center" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Customer type ( PEP /None)" SortExpression="Customer type ( PEP /None)">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("[Customers type]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label8" runat="server" Text='<%# Bind("[Customers type]") %>'></asp:Label>
            </ItemTemplate>
            <HeaderStyle CssClass="center" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="initial observations" SortExpression="initial observations">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("[initial observations]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label9" runat="server" Text='<%# Bind("[initial observations]") %>'></asp:Label>
            </ItemTemplate>
            <HeaderStyle CssClass="center" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Outstanding observations" SortExpression="Outstanding observations">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("[Outstanding observations]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label10" runat="server" Text='<%# Bind("[Outstanding observations]") %>'></asp:Label>
            </ItemTemplate>
            <HeaderStyle CssClass="center" />
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
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Inserted By" SortExpression="Inserted By">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox12" runat="server" Text='<%# Bind("[1st checker]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label13" runat="server" Text='<%# Bind("[1st checker]") %>'></asp:Label>
            </ItemTemplate>
            <HeaderStyle CssClass="center" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Approved By" SortExpression="Approved By">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox13" runat="server" Text='<%# Bind("[2nd checker]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label14" runat="server" Text='<%# Bind("[2nd checker]") %>'></asp:Label>
            </ItemTemplate>
            <HeaderStyle CssClass="center" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Remarks" SortExpression="Remarks">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox14" runat="server" Text='<%# Bind("[Remarks]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label15" runat="server" Text='<%# Bind("[Remarks]") %>'></asp:Label>
            </ItemTemplate>
            <HeaderStyle CssClass="center" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Updated By" SortExpression="Updated By">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox15" runat="server" Text='<%# Bind("[Updated By]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label16" runat="server" Text='<%# Bind("[Updated By]") %>'></asp:Label>
            </ItemTemplate>
            <HeaderStyle CssClass="center" />
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
      SelectCommand="SELECT * FROM [OLDs_insert]" DeleteCommand="DELETE FROM [OLDs_insert] WHERE [id] = @id">
      <DeleteParameters>
         <asp:Parameter Name="id" Type="Int32" />
      </DeleteParameters>
<%--      <InsertParameters>
         <asp:Parameter Name="Document_checking_date" Type="String" />
         <asp:Parameter Name="Borrower" Type="String" />
         <asp:Parameter Name="Department" Type="String" />
         <asp:Parameter Name="Case_Number" Type="String" />
         <asp:Parameter Name="Facility_type" Type="String" />
         <asp:Parameter Name="Currency" Type="String" />
         <asp:Parameter Name="Facility_amount" Type="String" />
         <asp:Parameter Name="Customers_type" Type="String" />
         <asp:Parameter Name="initial_observations" Type="String" />
         <asp:Parameter Name="Outstanding_observations" Type="String" />
         <asp:Parameter Name="Status_of_Observation" Type="String" />
         <asp:Parameter Name="Status_of_Facility" Type="String" />
         <asp:Parameter Name="1st_checker" Type="String" />
         <asp:Parameter Name="2nd_checker" Type="String" />
         <asp:Parameter Name="Remarks" Type="String" />
         <asp:Parameter Name="Updated_By" Type="String" />
      </InsertParameters>--%>
<%--      <UpdateParameters>
         <asp:Parameter Name="Document_checking_date" Type="String" />
         <asp:Parameter Name="Borrower" Type="String" />
         <asp:Parameter Name="Department" Type="String" />
         <asp:Parameter Name="Case_Number" Type="String" />
         <asp:Parameter Name="Facility_type" Type="String" />
         <asp:Parameter Name="Currency" Type="String" />
         <asp:Parameter Name="Facility_amount" Type="String" />
         <asp:Parameter Name="Customers_type" Type="String" />
         <asp:Parameter Name="initial_observations" Type="String" />
         <asp:Parameter Name="Outstanding_observations" Type="String" />
         <asp:Parameter Name="Status_of_Observation" Type="String" />
         <asp:Parameter Name="Status_of_Facility" Type="String" />
         <asp:Parameter Name="1st_checker" Type="String" />
         <asp:Parameter Name="2nd_checker" Type="String" />
         <asp:Parameter Name="Remarks" Type="String" />
         <asp:Parameter Name="Updated_By" Type="String" />
         <asp:Parameter Name="id" Type="Int32" />
      </UpdateParameters>--%>
   </asp:SqlDataSource>
   <div style="margin-top:-5px;">
      <asp:GridView ID="gv3" OnRowCommand="gv3_RowCommand" OnRowDataBound="gv3_RowDataBound" runat="server" ShowHeaderWhenEmpty="True" AllowSorting="True" CssClass="auto-style1" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC"
         BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlConUpdate" PageSize="7" Width="1172px" Visible="False" DataKeyNames="id">
         <Columns>
                                  <asp:TemplateField HeaderText="Delete">
            <ItemTemplate>
<%--               <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>--%>
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
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Document checking date" SortExpression="Document checking date">
               <EditItemTemplate>
                  <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("[Document checking date]") %>'></asp:TextBox>
               </EditItemTemplate>
               <ItemTemplate>
                  <asp:Label ID="Label2" runat="server" Text='<%# Bind("[Document checking date]") %>'></asp:Label>
               </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Borrower" SortExpression="Borrower">
               <EditItemTemplate>
                  <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("[Borrower]") %>'></asp:TextBox>
               </EditItemTemplate>
               <ItemTemplate>
                  <asp:Label ID="Label3" runat="server" Text='<%# Bind("[Borrower]") %>'></asp:Label>
               </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Department" SortExpression="Department">
               <EditItemTemplate>
                  <asp:TextBox ID="TextBox16" runat="server" Text='<%# Bind("[Department]") %>'></asp:TextBox>
               </EditItemTemplate>
               <ItemTemplate>
                  <asp:Label ID="Label17" runat="server" Text='<%# Bind("[Department]") %>'></asp:Label>
               </ItemTemplate>
               <HeaderStyle CssClass="center" />
            </asp:TemplateField>
         <asp:TemplateField HeaderText="Purpose of Application" SortExpression="Purpose of Application">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox17" runat="server" Text='<%# Bind("[Purpose of Application]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label18" runat="server" Text='<%# Bind("[Purpose of Application]") %>'></asp:Label>
            </ItemTemplate>
            <HeaderStyle CssClass="center" />
         </asp:TemplateField>
            <asp:TemplateField HeaderText="Case Number" SortExpression="Case Number">
               <EditItemTemplate>
                  <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("[Case Number]") %>'></asp:TextBox>
               </EditItemTemplate>
               <ItemTemplate>
                  <asp:Label ID="Label4" runat="server" Text='<%# Bind("[Case Number]") %>'></asp:Label>
               </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Facility type" SortExpression="Facility type">
               <EditItemTemplate>
                  <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("[Facility type]") %>'></asp:TextBox>
               </EditItemTemplate>
               <ItemTemplate>
                  <asp:Label ID="Label5" runat="server" Text='<%# Bind("[Facility type]") %>'></asp:Label>
               </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Currency" SortExpression="Currency">
               <EditItemTemplate>
                  <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("[Currency]") %>'></asp:TextBox>
               </EditItemTemplate>
               <ItemTemplate>
                  <asp:Label ID="Label6" runat="server" Text='<%# Bind("[Currency]") %>'></asp:Label>
               </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Facility amount" SortExpression="Facility amount">
               <EditItemTemplate>
                  <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("[Facility amount]") %>'></asp:TextBox>
               </EditItemTemplate>
               <ItemTemplate>
                  <asp:Label ID="Label7" runat="server" Text='<%# Bind("[Facility amount]") %>'></asp:Label>
               </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Customers type" SortExpression="Customers type">
               <EditItemTemplate>
                  <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("[Customers type]") %>'></asp:TextBox>
               </EditItemTemplate>
               <ItemTemplate>
                  <asp:Label ID="Label8" runat="server" Text='<%# Bind("[Customers type]") %>'></asp:Label>
               </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="initial observations" SortExpression="initial observations">
               <EditItemTemplate>
                  <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("[initial observations]") %>'></asp:TextBox>
               </EditItemTemplate>
               <ItemTemplate>
                  <asp:Label ID="Label9" runat="server" Text='<%# Bind("[initial observations]") %>'></asp:Label>
               </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Outstanding observations" SortExpression="Outstanding observations">
               <EditItemTemplate>
                  <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("[Outstanding observations]") %>'></asp:TextBox>
               </EditItemTemplate>
               <ItemTemplate>
                  <asp:Label ID="Label10" runat="server" Text='<%# Bind("[Outstanding observations]") %>'></asp:Label>
               </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Status of Observation" SortExpression="Status of Observation">
               <EditItemTemplate>
                  <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("[Status of Observation]") %>'></asp:TextBox>
               </EditItemTemplate>
               <ItemTemplate>
                  <asp:Label ID="Label11" runat="server" Text='<%# Bind("[Status of Observation]") %>'></asp:Label>
               </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Status of Facility" SortExpression="Status of Facility">
               <EditItemTemplate>
                  <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("[Status of Facility]") %>'></asp:TextBox>
               </EditItemTemplate>
               <ItemTemplate>
                  <asp:Label ID="Label12" runat="server" Text='<%# Bind("[Status of Facility]") %>'></asp:Label>
               </ItemTemplate>
            </asp:TemplateField>
            <%--                                      <asp:TemplateField HeaderText="Inserted By" SortExpression="Inserted By">
               <EditItemTemplate>
                   <asp:TextBox ID="TextBox12" runat="server" Text='<%# Bind("[1st checker]") %>'></asp:TextBox>
               </EditItemTemplate>
               <ItemTemplate>
                   <asp:Label ID="Label13" runat="server" Text='<%# Bind("[1st checker]") %>'></asp:Label>
               </ItemTemplate>
               </asp:TemplateField>--%>
            <asp:TemplateField HeaderText="Approved By" SortExpression="Approved By">
               <EditItemTemplate>
                  <asp:TextBox ID="TextBox13" runat="server" Text='<%# Bind("[2nd checker]") %>'></asp:TextBox>
               </EditItemTemplate>
               <ItemTemplate>
                  <asp:Label ID="Label14" runat="server" Text='<%# Bind("[2nd checker]") %>'></asp:Label>
               </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Remarks" SortExpression="Remarks">
               <EditItemTemplate>
                  <asp:TextBox ID="TextBox14" runat="server" Text='<%# Bind("[Remarks]") %>'></asp:TextBox>
               </EditItemTemplate>
               <ItemTemplate>
                  <asp:Label ID="Label15" runat="server" Text='<%# Bind("[Remarks]") %>'></asp:Label>
               </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Updated By" SortExpression="Updated By">
               <EditItemTemplate>
                  <asp:TextBox ID="TextBox15" runat="server" Text='<%# Bind("[Updated By]") %>'></asp:TextBox>
               </EditItemTemplate>
               <ItemTemplate>
                  <asp:Label ID="Label16" runat="server" Text='<%# Bind("[Updated By]") %>'></asp:Label>
               </ItemTemplate>
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
      SelectCommand="SELECT * FROM [OLDs_Update]" 
      DeleteCommand="DELETE FROM [OLDs_Update] WHERE [id] = @id" 
      >
      <DeleteParameters>
         <asp:Parameter Name="id" Type="Int32" />
      </DeleteParameters>
   </asp:SqlDataSource>
</div>
</asp:Content>
