<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ldr_pending_records.aspx.cs" Inherits="Collateral_int.ldr_pending_records" %>
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
             font-size: 12px;
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
             <asp:ImageButton ID="ApproveBtnImg" runat="server" Height="32px" ImageUrl="~/image/insertBtn.jpg" OnClick="ImageButton1_Click" ToolTip="Approve Inserted Records" Width="30px" Enabled="False" />

             &nbsp;<asp:ImageButton ID="ApproveUpdateBtn" runat="server" Height="32px" ImageUrl="~/image/updatebtn.png" ToolTip="Approved Updated Records" Width="28px" Enabled="False" OnClick="ApproveUpdateBtn_Click" />
             <hr style="margin-left:5px;border-bottom:5px solid #003399; width:1100px; background-color: #00FF00;" />
                <div style="margin-top:-15px; margin-bottom:15px;">
         <asp:Label ID="updateLbl" runat="server" Font-Size="Small" Text="Label" Visible="False" Font-Names="Bahnschrift" ForeColor="Red"></asp:Label>
               </div>
           <div style="margin-top:-15px; margin-bottom:15px;">
 <asp:Label ID="insertLbl" runat="server" Font-Size="Small" Text="Label" Visible="False" Font-Names="Bahnschrift" ForeColor="Red"></asp:Label>
   </div>

          
                    <asp:GridView ID="GridView2" OnRowCommand="GridView2_RowCommand" OnRowDataBound="GridView2_RowDataBound" runat="server" ShowHeaderWhenEmpty="True"
               AllowSorting="True" CssClass="auto-style1" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC"
               BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlCon2" DataKeyNames="id" PageSize="7" Width="1172px" Visible="False" GridLines="Horizontal">
                        <AlternatingRowStyle BackColor="#CCFFFF" />
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
<%--                       <asp:TemplateField ShowHeader="true" HeaderText="">
                       <ItemTemplate>
                           <asp:LinkButton ID="DeleteLbl" runat="server" CommandArgument='<%# Bind("id") %>' 
                               CausesValidation="False" CommandName="delete" Text="delete"></asp:LinkButton>
                       </ItemTemplate>
                       <ControlStyle CssClass="center" />
                       <HeaderStyle CssClass="center" />
                       <ItemStyle CssClass="center" />
                   </asp:TemplateField>--%>
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
                   <asp:TemplateField HeaderText="Received Date" SortExpression="Received Date">
                       <EditItemTemplate>
                           <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("[Received Date]") %>'></asp:TextBox>
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="Label2" runat="server" Text='<%# Bind("[Received Date]") %>'></asp:Label>
                       </ItemTemplate>
                       <HeaderStyle CssClass="center" />
                       <ItemStyle CssClass="center" />
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="Company Name" SortExpression="Company Name">
                       <EditItemTemplate>
                           <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("[Company Name]") %>'></asp:TextBox>
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="Label3" runat="server" Text='<%# Bind("[Company Name]") %>'></asp:Label>
                       </ItemTemplate>
                       <HeaderStyle CssClass="center" />
                       <ItemStyle CssClass="center" />
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="Approval Number" SortExpression="Approval Number">
                       <EditItemTemplate>
                           <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("ApprovalNumber") %>'></asp:TextBox>
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="Label4" runat="server" Text='<%# Bind("ApprovalNumber") %>'></asp:Label>
                       </ItemTemplate>
                       <HeaderStyle CssClass="center" />
                       <ItemStyle CssClass="center" />
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="Facility Type" SortExpression="Facility Type">
                       <EditItemTemplate>
                           <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("[Facility Type]") %>'></asp:TextBox>
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="Label5" runat="server" Text='<%# Bind("[Facility Type]") %>'></asp:Label>
                       </ItemTemplate>
                       <HeaderStyle CssClass="center" />
                       <ItemStyle CssClass="center" />
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="Document Received" SortExpression="Document Received">
                       <EditItemTemplate>
                           <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("[Document Received]") %>'></asp:TextBox>
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="Label6" runat="server" Text='<%# Bind("[Document Received]") %>'></asp:Label>
                       </ItemTemplate>
                       <HeaderStyle CssClass="center" />
                       <ItemStyle CssClass="center" />
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="Enter By" SortExpression="Enter By">
                       <EditItemTemplate>
                           <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("[Enter By]") %>'></asp:TextBox>
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="Label7" runat="server" Text='<%# Bind("[Enter By]") %>'></asp:Label>
                       </ItemTemplate>
                       <HeaderStyle CssClass="center" />
                       <ItemStyle CssClass="center" />
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="Second Verifier" SortExpression="Second Verifier">
                       <EditItemTemplate>
                           <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("[Second Verifier]") %>'></asp:TextBox>
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="Label8" runat="server" Text='<%# Bind("[Second Verifier]") %>'></asp:Label>
                       </ItemTemplate>
                       <HeaderStyle CssClass="center" />
                       <ItemStyle CssClass="center" />
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="Completion Date" SortExpression="Completion Date">
                       <EditItemTemplate>
                           <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("[Completion Date]") %>'></asp:TextBox>
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="Label9" runat="server" Text='<%# Bind("[Completion Date]") %>'></asp:Label>
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
                   <asp:TemplateField HeaderText="Updated By" SortExpression="Updated By">
                       <EditItemTemplate>
                           <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("[Updated By]") %>'></asp:TextBox>
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="Label12" runat="server" Text='<%# Bind("[Updated By]") %>'></asp:Label>
                       </ItemTemplate>
                       <HeaderStyle CssClass="center" />
                       <ItemStyle CssClass="center" />
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="Approved By" SortExpression="Approved By">
                       <EditItemTemplate>
                           <asp:TextBox ID="TextBox12" runat="server" Text='<%# Bind("[Approved By]") %>'></asp:TextBox>
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="Label13" runat="server" Text='<%# Bind("[Approved By]") %>'></asp:Label>
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
         <asp:SqlDataSource ID="SqlCon2" runat="server" ConnectionString="<%$ ConnectionStrings:DBCon %>"
             SelectCommand="SELECT * FROM [LoanReg_tbl_insert]" DeleteCommand="DELETE FROM [LoanReg_tbl_insert] WHERE [id] = @id">
               <DeleteParameters>
                  <asp:Parameter Name="id" Type="Int32" DefaultValue="0" />
             </DeleteParameters>

        </asp:SqlDataSource>

             <div style="margin-top:-5px;">
                    <asp:GridView ID="GridView3" OnRowCommand="GridView3_RowCommand" OnRowDataBound="GridView3_RowDataBound"   runat="server" ShowHeaderWhenEmpty="True"
               AllowSorting="True" CssClass="auto-style1" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC"
               BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlConUpdate" DataKeyNames="id" PageSize="7" Width="1172px" Visible="False" OnSelectedIndexChanged="GridView3_SelectedIndexChanged" GridLines="Horizontal">
                        <AlternatingRowStyle BackColor="#CCFFFF" />
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
                   <asp:TemplateField HeaderText="Received Date" SortExpression="Received Date">
                       <EditItemTemplate>
                           <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("[Received Date]") %>'></asp:TextBox>
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="Label2" runat="server" Text='<%# Bind("[Received Date]") %>'></asp:Label>
                       </ItemTemplate>
                       <HeaderStyle CssClass="center" />
                       <ItemStyle CssClass="center" />
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="Company Name" SortExpression="Company Name">
                       <EditItemTemplate>
                           <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("[Company Name]") %>'></asp:TextBox>
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="Label3" runat="server" Text='<%# Bind("[Company Name]") %>'></asp:Label>
                       </ItemTemplate>
                       <HeaderStyle CssClass="center" />
                       <ItemStyle CssClass="center" />
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="Approval Number" SortExpression="Approval Number">
                       <EditItemTemplate>
                           <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("[Approval Number]") %>'></asp:TextBox>
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="Label4" runat="server" Text='<%# Bind("[Approval Number]") %>'></asp:Label>
                       </ItemTemplate>
                       <HeaderStyle CssClass="center" />
                       <ItemStyle CssClass="center" />
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="Facility Type" SortExpression="Facility Type">
                       <EditItemTemplate>
                           <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("[Facility Type]") %>'></asp:TextBox>
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="Label5" runat="server" Text='<%# Bind("[Facility Type]") %>'></asp:Label>
                       </ItemTemplate>
                       <HeaderStyle CssClass="center" />
                       <ItemStyle CssClass="center" />
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="Document Received" SortExpression="Document Received">
                       <EditItemTemplate>
                           <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("[Document Received]") %>'></asp:TextBox>
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="Label6" runat="server" Text='<%# Bind("[Document Received]") %>'></asp:Label>
                       </ItemTemplate>
                       <HeaderStyle CssClass="center" />
                       <ItemStyle CssClass="center" />
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="Enter By" SortExpression="Enter By">
                       <EditItemTemplate>
                           <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("[Enter By]") %>'></asp:TextBox>
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="Label7" runat="server" Text='<%# Bind("[Enter By]") %>'></asp:Label>
                       </ItemTemplate>
                       <HeaderStyle CssClass="center" />
                       <ItemStyle CssClass="center" />
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="Second Verifier" SortExpression="Second Verifier">
                       <EditItemTemplate>
                           <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("[Second Verifier]") %>'></asp:TextBox>
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="Label8" runat="server" Text='<%# Bind("[Second Verifier]") %>'></asp:Label>
                       </ItemTemplate>
                       <HeaderStyle CssClass="center" />
                       <ItemStyle CssClass="center" />
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="Completion Date" SortExpression="Completion Date">
                       <EditItemTemplate>
                           <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("[Completion Date]") %>'></asp:TextBox>
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="Label9" runat="server" Text='<%# Bind("[Completion Date]") %>'></asp:Label>
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
                   <asp:TemplateField HeaderText="Updated By" SortExpression="Updated By">
                       <EditItemTemplate>
                           <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("[Updated By]") %>'></asp:TextBox>
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="Label12" runat="server" Text='<%# Bind("[Updated By]") %>'></asp:Label>
                       </ItemTemplate>
                       <HeaderStyle CssClass="center" />
                       <ItemStyle CssClass="center" />
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="Approved By" SortExpression="Approved By">
                       <EditItemTemplate>
                           <asp:TextBox ID="TextBox12" runat="server" Text='<%# Bind("[Approved By]") %>'></asp:TextBox>
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="Label13" runat="server" Text='<%# Bind("[Approved By]") %>'></asp:Label>
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
         SelectCommand="SELECT * FROM [LoanReg_tbl_Update]"  DeleteCommand="DELETE FROM [LoanReg_tbl_Update] WHERE [id] = @id">
     </asp:SqlDataSource>
  </div>
  <br />
 </asp:Content>

