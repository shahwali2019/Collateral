<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="mcu_pending_records.aspx.cs" Inherits="Collateral_int.mcu_pending_records" %>
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
         .updateLbl{
             margin-bottom:5px;
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

             &nbsp;<asp:ImageButton ID="ApproveUpdateBtn" runat="server" Height="32px" ImageUrl="~/image/updatebtn.png" ToolTip="Approved Updated Records" Width="28px" Enabled="False" OnClick="ApproveUpdateBtn_Click" />
             <hr style="text-align:center; border-bottom:5px solid #003399; width:1100px; background-color: #00FF00;" />
              <div style="margin-top:-15px;">
         <asp:Label ID="updateLbl" CssClass="updateLbl" runat="server" Font-Size="Small" Text="Label" Visible="False" Font-Names="Bahnschrift" ForeColor="Red"></asp:Label>
               </div>
              <div style="margin-top:-15px;">
 <asp:Label ID="insertLbl" runat="server" Font-Size="Small" Text="Label" Visible="False" Font-Names="Bahnschrift" ForeColor="Red"></asp:Label>
   </div>
<div style="margin-top:10px" class="auto-style2">
    <asp:GridView ID="GridView2" OnRowCommand="GridView2_RowCommand"   runat="server" ShowHeaderWhenEmpty="True"
               AllowSorting="True" CssClass="auto-style1" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC"
               BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="id" DataSourceID="SqlCon2" PageSize="7" Width="1172px" Visible="False" GridLines="Horizontal">
                        <AlternatingRowStyle BackColor="#3366CC" ForeColor="White" />
               <Columns>

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

                    <asp:CommandField ShowDeleteButton="True">
                    <HeaderStyle CssClass="center" />
                    <ItemStyle CssClass="center" />
                    </asp:CommandField>
                  




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
            DeleteCommand="DELETE FROM [mcu_tbl_insert] WHERE [id] = @original_id AND (([Customre Name] = @original_Customre_Name) OR ([Customre Name] IS NULL AND @original_Customre_Name IS NULL)) AND (([Currency] = @original_Currency) OR ([Currency] IS NULL AND @original_Currency IS NULL)) AND (([Account Number] = @original_Account_Number) OR ([Account Number] IS NULL AND @original_Account_Number IS NULL)) AND (([Approval Number] = @original_Approval_Number) OR ([Approval Number] IS NULL AND @original_Approval_Number IS NULL)) AND (([[Disburesement] = @original_column1) OR ([[Disburesement] IS NULL AND @original_column1 IS NULL)) AND (([Due Date of MCU] = @original_Due_Date_of_MCU) OR ([Due Date of MCU] IS NULL AND @original_Due_Date_of_MCU IS NULL)) AND (([MCU Date] = @original_MCU_Date) OR ([MCU Date] IS NULL AND @original_MCU_Date IS NULL)) AND (([Loan Status] = @original_Loan_Status) OR ([Loan Status] IS NULL AND @original_Loan_Status IS NULL)) AND (([Remark] = @original_Remark) OR ([Remark] IS NULL AND @original_Remark IS NULL)) AND (([Inserted By] = @original_Inserted_By) OR ([Inserted By] IS NULL AND @original_Inserted_By IS NULL)) AND (([Approved By] = @original_Approved_By) OR ([Approved By] IS NULL AND @original_Approved_By IS NULL)) AND (([Updated By] = @original_Updated_By) OR ([Updated By] IS NULL AND @original_Updated_By IS NULL))"
            InsertCommand="INSERT INTO [mcu_tbl_insert] ([Customre Name], [Currency], [Account Number], [Approval Number], [[Disburesement], [Due Date of MCU], [MCU Date], [Loan Status], [Remark], [Inserted By], [Approved By], [Updated By]) VALUES (@Customre_Name, @Currency, @Account_Number, @Approval_Number, @column1, @Due_Date_of_MCU, @MCU_Date, @Loan_Status, @Remark, @Inserted_By, @Approved_By, @Updated_By)"
            SelectCommand="SELECT * FROM [mcu_tbl_insert]" UpdateCommand="UPDATE [mcu_tbl_insert] SET [Customre Name] = @Customre_Name, [Currency] = @Currency, [Account Number] = @Account_Number, [Approval Number] = @Approval_Number, [[Disburesement] = @column1, [Due Date of MCU] = @Due_Date_of_MCU, [MCU Date] = @MCU_Date, [Loan Status] = @Loan_Status, [Remark] = @Remark, [Inserted By] = @Inserted_By, [Approved By] = @Approved_By, [Updated By] = @Updated_By WHERE [id] = @original_id AND (([Customre Name] = @original_Customre_Name) OR ([Customre Name] IS NULL AND @original_Customre_Name IS NULL)) AND (([Currency] = @original_Currency) OR ([Currency] IS NULL AND @original_Currency IS NULL)) AND (([Account Number] = @original_Account_Number) OR ([Account Number] IS NULL AND @original_Account_Number IS NULL)) AND (([Approval Number] = @original_Approval_Number) OR ([Approval Number] IS NULL AND @original_Approval_Number IS NULL)) AND (([[Disburesement] = @original_column1) OR ([[Disburesement] IS NULL AND @original_column1 IS NULL)) AND (([Due Date of MCU] = @original_Due_Date_of_MCU) OR ([Due Date of MCU] IS NULL AND @original_Due_Date_of_MCU IS NULL)) AND (([MCU Date] = @original_MCU_Date) OR ([MCU Date] IS NULL AND @original_MCU_Date IS NULL)) AND (([Loan Status] = @original_Loan_Status) OR ([Loan Status] IS NULL AND @original_Loan_Status IS NULL)) AND (([Remark] = @original_Remark) OR ([Remark] IS NULL AND @original_Remark IS NULL)) AND (([Inserted By] = @original_Inserted_By) OR ([Inserted By] IS NULL AND @original_Inserted_By IS NULL)) AND (([Approved By] = @original_Approved_By) OR ([Approved By] IS NULL AND @original_Approved_By IS NULL)) AND (([Updated By] = @original_Updated_By) OR ([Updated By] IS NULL AND @original_Updated_By IS NULL))" ConflictDetection="CompareAllValues" OldValuesParameterFormatString="original_{0}" >
             <DeleteParameters>
                 <asp:Parameter Name="original_id" Type="Int32" />
                 <asp:Parameter Name="original_Customre_Name" Type="String" />
                 <asp:Parameter Name="original_Currency" Type="String" />
                 <asp:Parameter Name="original_Account_Number" Type="String" />
                 <asp:Parameter Name="original_Approval_Number" Type="String" />
                 <asp:Parameter Name="original_column1" Type="String" />
                 <asp:Parameter Name="original_Due_Date_of_MCU" Type="String" />
                 <asp:Parameter Name="original_MCU_Date" Type="String" />
                 <asp:Parameter Name="original_Loan_Status" Type="String" />
                 <asp:Parameter Name="original_Remark" Type="String" />
                 <asp:Parameter Name="original_Inserted_By" Type="String" />
                 <asp:Parameter Name="original_Approved_By" Type="String" />
                 <asp:Parameter Name="original_Updated_By" Type="String" />
             </DeleteParameters>
             <InsertParameters>
                 <asp:Parameter Name="Customre_Name" Type="String" />
                 <asp:Parameter Name="Currency" Type="String" />
                 <asp:Parameter Name="Account_Number" Type="String" />
                 <asp:Parameter Name="Approval_Number" Type="String" />
                 <asp:Parameter Name="column1" Type="String" />
                 <asp:Parameter Name="Due_Date_of_MCU" Type="String" />
                 <asp:Parameter Name="MCU_Date" Type="String" />
                 <asp:Parameter Name="Loan_Status" Type="String" />
                 <asp:Parameter Name="Remark" Type="String" />
                 <asp:Parameter Name="Inserted_By" Type="String" />
                 <asp:Parameter Name="Approved_By" Type="String" />
                 <asp:Parameter Name="Updated_By" Type="String" />
             </InsertParameters>
             <UpdateParameters>
                 <asp:Parameter Name="Customre_Name" Type="String" />
                 <asp:Parameter Name="Currency" Type="String" />
                 <asp:Parameter Name="Account_Number" Type="String" />
                 <asp:Parameter Name="Approval_Number" Type="String" />
                 <asp:Parameter Name="column1" Type="String" />
                 <asp:Parameter Name="Due_Date_of_MCU" Type="String" />
                 <asp:Parameter Name="MCU_Date" Type="String" />
                 <asp:Parameter Name="Loan_Status" Type="String" />
                 <asp:Parameter Name="Remark" Type="String" />
                 <asp:Parameter Name="Inserted_By" Type="String" />
                 <asp:Parameter Name="Approved_By" Type="String" />
                 <asp:Parameter Name="Updated_By" Type="String" />
                 <asp:Parameter Name="original_id" Type="Int32" />
                 <asp:Parameter Name="original_Customre_Name" Type="String" />
                 <asp:Parameter Name="original_Currency" Type="String" />
                 <asp:Parameter Name="original_Account_Number" Type="String" />
                 <asp:Parameter Name="original_Approval_Number" Type="String" />
                 <asp:Parameter Name="original_column1" Type="String" />
                 <asp:Parameter Name="original_Due_Date_of_MCU" Type="String" />
                 <asp:Parameter Name="original_MCU_Date" Type="String" />
                 <asp:Parameter Name="original_Loan_Status" Type="String" />
                 <asp:Parameter Name="original_Remark" Type="String" />
                 <asp:Parameter Name="original_Inserted_By" Type="String" />
                 <asp:Parameter Name="original_Approved_By" Type="String" />
                 <asp:Parameter Name="original_Updated_By" Type="String" />
             </UpdateParameters>
        </asp:SqlDataSource>
             <div style="margin-top:20px" class="auto-style3">
                    <asp:GridView ID="GridView3" OnRowCommand="GridView3_RowCommand"   runat="server" ShowHeaderWhenEmpty="True"
               AllowSorting="True" CssClass="auto-style1" AutoGenerateColumns="False" BorderColor="#3366CC"
               BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlConUpdate" PageSize="7" Width="1172px" Visible="False" GridLines="Horizontal" >
                        <AlternatingRowStyle BackColor="#99FF99" />
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
         SelectCommand="SELECT * FROM [mcu_tbl_update]" >
        
     </asp:SqlDataSource>





   
      





   
  </div>

      <br />
      <br />

</asp:Content>







