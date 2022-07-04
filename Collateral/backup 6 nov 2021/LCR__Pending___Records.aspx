<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LCR__Pending___Records.aspx.cs" Inherits="Collateral.LCR__Pending___Records" %>
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
             <asp:ImageButton ID="ApproveBtnImg" runat="server" Height="32px" ImageUrl="~/image/insertBtn.jpg" OnClick="ImageButton1_Click" ToolTip="Approve Inserted Records" Width="30px" Enabled="False" />

             &nbsp;<asp:ImageButton ID="ApproveUpdateBtn" runat="server" Height="32px" ImageUrl="~/image/updatebtn.png" ToolTip="Approved Updated Records" Width="28px" Enabled="False" OnClick="ApproveUpdateBtn_Click" />
             <hr style="margin-left:5px;border-bottom:5px solid #003399; width:1100px; background-color: #00FF00;" />
              <div style="margin-top:-15px;">
         <asp:Label ID="updateLbl" runat="server" Font-Size="Small" Text="Label" Visible="False" Font-Names="Bahnschrift" ForeColor="Red"></asp:Label>
               </div>
              <div style="margin-top:-15px;">
 <asp:Label ID="insertLbl" runat="server" Font-Size="Small" Text="Label" Visible="False" Font-Names="Bahnschrift" ForeColor="Red"></asp:Label>
   </div>

          
                <asp:GridView ID="gv" OnRowCommand="gv_RowCommand"   runat="server" ShowHeaderWhenEmpty="True"
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
                     <asp:TemplateField HeaderText="Customer Name" SortExpression="Customer Name">
                         <EditItemTemplate>
                             <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("[Customer Name]") %>'></asp:TextBox>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="Label2" runat="server" Text='<%# Bind("[Customer Name]") %>'></asp:Label>
                         </ItemTemplate>
                         <HeaderStyle CssClass="center" />
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="Approval Name" SortExpression="Approval Name">
                         <EditItemTemplate>
                             <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("[Approval Name]") %>'></asp:TextBox>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="Label3" runat="server" Text='<%# Bind("[Approval Name]") %>'></asp:Label>
                         </ItemTemplate>
                         <HeaderStyle CssClass="center" />
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="Date of Disbursement" SortExpression="Date of Disbursement">
                         <EditItemTemplate>
                             <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("[Date of Disbursement]") %>'></asp:TextBox>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="Label4" runat="server" Text='<%# Bind("[Date of Disbursement]") %>'></asp:Label>
                         </ItemTemplate>
                         <HeaderStyle CssClass="center" />
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="Conditions" SortExpression="Conditions">
                         <EditItemTemplate>
                             <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Conditions") %>'></asp:TextBox>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="Label5" runat="server" Text='<%# Bind("Conditions") %>'></asp:Label>
                         </ItemTemplate>
                         <HeaderStyle CssClass="center" />
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="Due Date" SortExpression="Due Date">
                         <EditItemTemplate>
                             <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("[Due Date]") %>'></asp:TextBox>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="Label6" runat="server" Text='<%# Bind("[Due Date]") %>'></asp:Label>
                         </ItemTemplate>
                         <HeaderStyle CssClass="center" />
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="Condition Status" SortExpression="Condition Status">
                         <EditItemTemplate>
                             <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("[Condition Status]") %>'></asp:TextBox>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="Label7" runat="server" Text='<%# Bind("[Condition Status]") %>'></asp:Label>
                         </ItemTemplate>
                         <HeaderStyle CssClass="center" />
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="Remark" SortExpression="Remark">
                         <EditItemTemplate>
                             <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Remark") %>'></asp:TextBox>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="Label8" runat="server" Text='<%# Bind("Remark") %>'></asp:Label>
                         </ItemTemplate>
                         <HeaderStyle CssClass="center" />
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="Inserted By" SortExpression="Inserted By">
                         <EditItemTemplate>
                             <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("[Inserted By]") %>'></asp:TextBox>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="Label9" runat="server" Text='<%# Bind("[Inserted By]") %>'></asp:Label>
                         </ItemTemplate>
                         <HeaderStyle CssClass="center" />
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="Updated By" SortExpression="Updated By">
                         <EditItemTemplate>
                             <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("[Updated By]") %>'></asp:TextBox>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="Label10" runat="server" Text='<%# Bind("[Updated By]") %>'></asp:Label>
                         </ItemTemplate>
                         <HeaderStyle CssClass="center" />
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="Approved By" SortExpression="Approved By">
                         <EditItemTemplate>
                             <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("[Approved By]") %>'></asp:TextBox>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="Label11" runat="server" Text='<%# Bind("[Approved By]") %>'></asp:Label>
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
            SelectCommand="SELECT * FROM [LCR_insert]" DeleteCommand="DELETE FROM [LCR_insert] WHERE [id] = @id" InsertCommand="INSERT INTO [LCR_insert] ([Customer Name], [Approval Name], [Date of Disbursement], [Conditions], [Due Date], [Condition Status], [Remark], [Inserted By], [Updated By], [Approved By]) VALUES (@Customer_Name, @Approval_Name, @Date_of_Disbursement, @Conditions, @Due_Date, @Condition_Status, @Remark, @Inserted_By, @Updated_By, @Approved_By)" UpdateCommand="UPDATE [LCR_insert] SET [Customer Name] = @Customer_Name, [Approval Name] = @Approval_Name, [Date of Disbursement] = @Date_of_Disbursement, [Conditions] = @Conditions, [Due Date] = @Due_Date, [Condition Status] = @Condition_Status, [Remark] = @Remark, [Inserted By] = @Inserted_By, [Updated By] = @Updated_By, [Approved By] = @Approved_By WHERE [id] = @id">
             <DeleteParameters>
                 <asp:Parameter Name="id" Type="Int32" />
             </DeleteParameters>
             <InsertParameters>
                 <asp:Parameter Name="Customer_Name" Type="String" />
                 <asp:Parameter Name="Approval_Name" Type="String" />
                 <asp:Parameter Name="Date_of_Disbursement" Type="String" />
                 <asp:Parameter Name="Conditions" Type="String" />
                 <asp:Parameter Name="Due_Date" Type="String" />
                 <asp:Parameter Name="Condition_Status" Type="String" />
                 <asp:Parameter Name="Remark" Type="String" />
                 <asp:Parameter Name="Inserted_By" Type="String" />
                 <asp:Parameter Name="Updated_By" Type="String" />
                 <asp:Parameter Name="Approved_By" Type="String" />
             </InsertParameters>
             <UpdateParameters>
                 <asp:Parameter Name="Customer_Name" Type="String" />
                 <asp:Parameter Name="Approval_Name" Type="String" />
                 <asp:Parameter Name="Date_of_Disbursement" Type="String" />
                 <asp:Parameter Name="Conditions" Type="String" />
                 <asp:Parameter Name="Due_Date" Type="String" />
                 <asp:Parameter Name="Condition_Status" Type="String" />
                 <asp:Parameter Name="Remark" Type="String" />
                 <asp:Parameter Name="Inserted_By" Type="String" />
                 <asp:Parameter Name="Updated_By" Type="String" />
                 <asp:Parameter Name="Approved_By" Type="String" />
                 <asp:Parameter Name="id" Type="Int32" />
             </UpdateParameters>
        </asp:SqlDataSource>
             <div style="margin-top:-5px;">
                    <asp:GridView ID="gv3" OnRowCommand="gv3_RowCommand1" runat="server" ShowHeaderWhenEmpty="True" AllowSorting="True" CssClass="auto-style1" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC"
               BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlConUpdate" PageSize="7" Width="1172px" Visible="False" DataKeyNames="id">
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

                                      <asp:TemplateField HeaderText="id" SortExpression="id">
                                          <EditItemTemplate>
                                              <asp:Label ID="Label1" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                                          </EditItemTemplate>
                                          <ItemTemplate>
                                              <asp:Label ID="Label1" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                                          </ItemTemplate>
                                      </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Customer Name" SortExpression="Customer Name">
                                          <EditItemTemplate>
                                              <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("[Customer Name]") %>'></asp:TextBox>
                                          </EditItemTemplate>
                                          <ItemTemplate>
                                              <asp:Label ID="Label2" runat="server" Text='<%# Bind("[Customer Name]") %>'></asp:Label>
                                          </ItemTemplate>
                                      </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Approval Name" SortExpression="Approval Name">
                                          <EditItemTemplate>
                                              <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("[Approval Name]") %>'></asp:TextBox>
                                          </EditItemTemplate>
                                          <ItemTemplate>
                                              <asp:Label ID="Label3" runat="server" Text='<%# Bind("[Approval Name]") %>'></asp:Label>
                                          </ItemTemplate>
                                      </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Date of Disbursement" SortExpression="Date of Disbursement">
                                          <EditItemTemplate>
                                              <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("[Date of Disbursement]") %>'></asp:TextBox>
                                          </EditItemTemplate>
                                          <ItemTemplate>
                                              <asp:Label ID="Label4" runat="server" Text='<%# Bind("[Date of Disbursement]") %>'></asp:Label>
                                          </ItemTemplate>
                                      </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Conditions" SortExpression="Conditions">
                                          <EditItemTemplate>
                                              <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Conditions") %>'></asp:TextBox>
                                          </EditItemTemplate>
                                          <ItemTemplate>
                                              <asp:Label ID="Label5" runat="server" Text='<%# Bind("Conditions") %>'></asp:Label>
                                          </ItemTemplate>
                                      </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Due Date" SortExpression="Due Date">
                                          <EditItemTemplate>
                                              <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("[Due Date]") %>'></asp:TextBox>
                                          </EditItemTemplate>
                                          <ItemTemplate>
                                              <asp:Label ID="Label6" runat="server" Text='<%# Bind("[Due Date]") %>'></asp:Label>
                                          </ItemTemplate>
                                      </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Condition Status" SortExpression="Condition Status">
                                          <EditItemTemplate>
                                              <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("[Condition Status]") %>'></asp:TextBox>
                                          </EditItemTemplate>
                                          <ItemTemplate>
                                              <asp:Label ID="Label7" runat="server" Text='<%# Bind("[Condition Status]") %>'></asp:Label>
                                          </ItemTemplate>
                                      </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Remark" SortExpression="Remark">
                                          <EditItemTemplate>
                                              <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Remark") %>'></asp:TextBox>
                                          </EditItemTemplate>
                                          <ItemTemplate>
                                              <asp:Label ID="Label8" runat="server" Text='<%# Bind("Remark") %>'></asp:Label>
                                          </ItemTemplate>
                                      </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Inserted By" SortExpression="Inserted By">
                                          <EditItemTemplate>
                                              <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("[Inserted By]") %>'></asp:TextBox>
                                          </EditItemTemplate>
                                          <ItemTemplate>
                                              <asp:Label ID="Label9" runat="server" Text='<%# Bind("[Inserted By]") %>'></asp:Label>
                                          </ItemTemplate>
                                      </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Updated By" SortExpression="Updated By">
                                          <EditItemTemplate>
                                              <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("[Updated By]") %>'></asp:TextBox>
                                          </EditItemTemplate>
                                          <ItemTemplate>
                                              <asp:Label ID="Label10" runat="server" Text='<%# Bind("[Updated By]") %>'></asp:Label>
                                          </ItemTemplate>
                                      </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Approved By" SortExpression="Approved By">
                                          <EditItemTemplate>
                                              <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("[Approved By]") %>'></asp:TextBox>
                                          </EditItemTemplate>
                                          <ItemTemplate>
                                              <asp:Label ID="Label11" runat="server" Text='<%# Bind("[Approved By]") %>'></asp:Label>
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
         SelectCommand="SELECT * FROM [LCR_update]" DeleteCommand="DELETE FROM [LCR_update] WHERE [id] = @id" InsertCommand="INSERT INTO [LCR_update] ([id], [Customer Name], [Approval Name], [Date of Disbursement], [Conditions], [Due Date], [Condition Status], [Remark], [Inserted By], [Updated By], [Approved By]) VALUES (@id, @Customer_Name, @Approval_Name, @Date_of_Disbursement, @Conditions, @Due_Date, @Condition_Status, @Remark, @Inserted_By, @Updated_By, @Approved_By)" UpdateCommand="UPDATE [LCR_update] SET [Customer Name] = @Customer_Name, [Approval Name] = @Approval_Name, [Date of Disbursement] = @Date_of_Disbursement, [Conditions] = @Conditions, [Due Date] = @Due_Date, [Condition Status] = @Condition_Status, [Remark] = @Remark, [Inserted By] = @Inserted_By, [Updated By] = @Updated_By, [Approved By] = @Approved_By WHERE [id] = @id" 
         >
         <DeleteParameters>
             <asp:Parameter Name="id" Type="Int32" />
         </DeleteParameters>
         <InsertParameters>
             <asp:Parameter Name="id" Type="Int32" />
             <asp:Parameter Name="Customer_Name" Type="String" />
             <asp:Parameter Name="Approval_Name" Type="String" />
             <asp:Parameter Name="Date_of_Disbursement" Type="String" />
             <asp:Parameter Name="Conditions" Type="String" />
             <asp:Parameter Name="Due_Date" Type="String" />
             <asp:Parameter Name="Condition_Status" Type="String" />
             <asp:Parameter Name="Remark" Type="String" />
             <asp:Parameter Name="Inserted_By" Type="String" />
             <asp:Parameter Name="Updated_By" Type="String" />
             <asp:Parameter Name="Approved_By" Type="String" />
         </InsertParameters>
         <UpdateParameters>
             <asp:Parameter Name="Customer_Name" Type="String" />
             <asp:Parameter Name="Approval_Name" Type="String" />
             <asp:Parameter Name="Date_of_Disbursement" Type="String" />
             <asp:Parameter Name="Conditions" Type="String" />
             <asp:Parameter Name="Due_Date" Type="String" />
             <asp:Parameter Name="Condition_Status" Type="String" />
             <asp:Parameter Name="Remark" Type="String" />
             <asp:Parameter Name="Inserted_By" Type="String" />
             <asp:Parameter Name="Updated_By" Type="String" />
             <asp:Parameter Name="Approved_By" Type="String" />
             <asp:Parameter Name="id" Type="Int32" />
         </UpdateParameters>
        
     </asp:SqlDataSource>
  </div>


</asp:Content>
