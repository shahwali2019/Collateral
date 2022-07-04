<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DaytoDay__Pending___Records.aspx.cs" Inherits="Collateral_int.DaytoDay__Pending___Records" %>
<asp:Content ID="Content1" ContentplaceholderID="MainContent" runat="server">
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

             &nbsp;<asp:ImageButton ID="ApproveUpdateBtn" runat="server" Height="32px" ImageUrl="~/image/updatebtn.png" ToolTip="Approved Updated Records" Width="28px" Enabled="False" OnClick="ApproveUpdateBtn_Click" />
             <hr style="margin-left:5px;border-bottom:5px solid #003399; background-color: #00FF00;" class="auto-style2" />
              <div style="margin-top:-15px;">
         <asp:Label ID="updateLbl" runat="server" Font-Size="Small" Text="Label" Visible="False" Font-Names="Bahnschrift" ForeColor="Red"></asp:Label>
               </div>
              <div style="margin-top:-15px;">
 <asp:Label ID="insertLbl" runat="server" Font-Size="Small" Text="Label" Visible="False" Font-Names="Bahnschrift" ForeColor="Red"></asp:Label>
   </div>

          
                <asp:GridView ID="GridView2" OnRowCommand="GridView2_RowCommand"   runat="server" ShowHeaderWhenEmpty="True"
               AllowSorting="True" CssClass="auto-style1" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC"
               BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="id" DataSourceID="SqlCon2" PageSize="7" Width="1172px" Visible="False" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" AllowCustomPaging="True" GridLines="None">
                    <AlternatingRowStyle BackColor="#66CCFF" />
               <Columns>

                      <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
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
                          <ControlStyle CssClass="center" />
                          <HeaderStyle CssClass="center" />
                          <ItemStyle CssClass="center" />
                      </asp:TemplateField>
                      <asp:TemplateField HeaderText="Account Name" SortExpression="Account Name">
                          <EditItemTemplate>
                              <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("[Account Name]") %>'></asp:TextBox>
                          </EditItemTemplate>
                          <ItemTemplate>
                              <asp:Label ID="Label2" runat="server" Text='<%# Bind("[Account Name]") %>'></asp:Label>
                          </ItemTemplate>
                              <ControlStyle CssClass="center" />
                          <HeaderStyle CssClass="center" />
                          <ItemStyle CssClass="center" />
                      </asp:TemplateField>
                      <asp:TemplateField HeaderText="Approval Number" SortExpression="Approval Number">
                          <EditItemTemplate>
                              <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("[Approval Number]") %>'></asp:TextBox>
                          </EditItemTemplate>
                          <ItemTemplate>
                              <asp:Label ID="Label3" runat="server" Text='<%# Bind("[Approval Number]") %>'></asp:Label>
                          </ItemTemplate>
                              <ControlStyle CssClass="center" />
                          <HeaderStyle CssClass="center" />
                          <ItemStyle CssClass="center" />
                      </asp:TemplateField>
                      <asp:TemplateField HeaderText="Facility Type" SortExpression="Facility Type">
                          <EditItemTemplate>
                              <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("[Facility Type]") %>'></asp:TextBox>
                          </EditItemTemplate>
                          <ItemTemplate>
                              <asp:Label ID="Label4" runat="server" Text='<%# Bind("[Facility Type]") %>'></asp:Label>
                          </ItemTemplate>
                              <ControlStyle CssClass="center" />
                          <HeaderStyle CssClass="center" />
                          <ItemStyle CssClass="center" />
                      </asp:TemplateField>
                      <asp:TemplateField HeaderText="Facility Amount" SortExpression="Facility Amount">
                          <EditItemTemplate>
                              <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("[Facility Amount]") %>'></asp:TextBox>
                          </EditItemTemplate>
                          <ItemTemplate>
                              <asp:Label ID="Label5" runat="server" Text='<%# Bind("[Facility Amount]") %>'></asp:Label>
                          </ItemTemplate>
                              <ControlStyle CssClass="center" />
                          <HeaderStyle CssClass="center" />
                          <ItemStyle CssClass="center" />
                      </asp:TemplateField>
                      <asp:TemplateField HeaderText="Currency" SortExpression="Currency">
                          <EditItemTemplate>
                              <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Currency") %>'></asp:TextBox>
                          </EditItemTemplate>
                          <ItemTemplate>
                              <asp:Label ID="Label6" runat="server" Text='<%# Bind("Currency") %>'></asp:Label>
                          </ItemTemplate>
                              <ControlStyle CssClass="center" />
                          <HeaderStyle CssClass="center" />
                          <ItemStyle CssClass="center" />
                      </asp:TemplateField>
                      <asp:TemplateField HeaderText="Action Taken" SortExpression="Action Taken">
                          <EditItemTemplate>
                              <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("[Action Taken]") %>'></asp:TextBox>
                          </EditItemTemplate>
                          <ItemTemplate>
                              <asp:Label ID="Label7" runat="server" Text='<%# Bind("[Action Taken]") %>'></asp:Label>
                          </ItemTemplate>
                              <ControlStyle CssClass="center" />
                          <HeaderStyle CssClass="center" />
                          <ItemStyle CssClass="center" />
                      </asp:TemplateField>
                      <asp:TemplateField HeaderText="TFL Instructed On" SortExpression="TFL Instructed On">
                          <EditItemTemplate>
                              <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("[TFL Instructed On]") %>'></asp:TextBox>
                          </EditItemTemplate>
                          <ItemTemplate>
                              <asp:Label ID="Label8" runat="server" Text='<%# Bind("[TFL Instructed On]") %>'></asp:Label>
                          </ItemTemplate>
                              <ControlStyle CssClass="center" />
                          <HeaderStyle CssClass="center" />
                          <ItemStyle CssClass="center" />
                      </asp:TemplateField>
                      <asp:TemplateField HeaderText="Confirmed By" SortExpression="Confirmed By">
                          <EditItemTemplate>
                              <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("[Confirmed By]") %>'></asp:TextBox>
                          </EditItemTemplate>
                          <ItemTemplate>
                              <asp:Label ID="Label9" runat="server" Text='<%# Bind("[Confirmed By]") %>'></asp:Label>
                          </ItemTemplate>
                              <ControlStyle CssClass="center" />
                          <HeaderStyle CssClass="center" />
                          <ItemStyle CssClass="center" />
                      </asp:TemplateField>
                      <asp:TemplateField HeaderText="Date of Boking" SortExpression="Date of Boking">
                          <EditItemTemplate>
                              <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("[Date of Boking]") %>'></asp:TextBox>
                          </EditItemTemplate>
                          <ItemTemplate>
                              <asp:Label ID="Label10" runat="server" Text='<%# Bind("[Date of Boking]") %>'></asp:Label>
                          </ItemTemplate>
                              <ControlStyle CssClass="center" />
                          <HeaderStyle CssClass="center" />
                          <ItemStyle CssClass="center" />
                      </asp:TemplateField>
                      <asp:TemplateField HeaderText="CMLA SignOff Date" SortExpression="CMLA SignOff Date">
                          <EditItemTemplate>
                              <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("[CMLA SignOff Date]") %>'></asp:TextBox>
                          </EditItemTemplate>
                          <ItemTemplate>
                              <asp:Label ID="Label11" runat="server" Text='<%# Bind("[CMLA SignOff Date]") %>'></asp:Label>
                          </ItemTemplate>
                              <ControlStyle CssClass="center" />
                          <HeaderStyle CssClass="center" />
                          <ItemStyle CssClass="center" />
                      </asp:TemplateField>
                      <asp:TemplateField HeaderText="Remark" SortExpression="Remark">
                          <EditItemTemplate>
                              <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("Remark") %>'></asp:TextBox>
                          </EditItemTemplate>
                          <ItemTemplate>
                              <asp:Label ID="Label12" runat="server" Text='<%# Bind("Remark") %>'></asp:Label>
                          </ItemTemplate>
                              <ControlStyle CssClass="center" />
                          <HeaderStyle CssClass="center" />
                          <ItemStyle CssClass="center" />
                      </asp:TemplateField>
                      <asp:TemplateField HeaderText="Inserted By" SortExpression="Inserted By">
                          <EditItemTemplate>
                              <asp:TextBox ID="TextBox12" runat="server" Text='<%# Bind("[Inserted By]") %>'></asp:TextBox>
                          </EditItemTemplate>
                          <ItemTemplate>
                              <asp:Label ID="Label13" runat="server" Text='<%# Bind("[Inserted By]") %>'></asp:Label>
                          </ItemTemplate>
                              <ControlStyle CssClass="center" />
                          <HeaderStyle CssClass="center" />
                          <ItemStyle CssClass="center" />
                      </asp:TemplateField>
                      <asp:TemplateField HeaderText="Updated By" SortExpression="Updated By">
                          <EditItemTemplate>
                              <asp:TextBox ID="TextBox13" runat="server" Text='<%# Bind("[Updated By]") %>'></asp:TextBox>
                          </EditItemTemplate>
                          <ItemTemplate>
                              <asp:Label ID="Label14" runat="server" Text='<%# Bind("[Updated By]") %>'></asp:Label>
                          </ItemTemplate>
                              <ControlStyle CssClass="center" />
                          <HeaderStyle CssClass="center" />
                          <ItemStyle CssClass="center" />
                      </asp:TemplateField>
                      <asp:TemplateField HeaderText="Approved By" SortExpression="Approved By">
                          <EditItemTemplate>
                              <asp:TextBox ID="TextBox14" runat="server" Text='<%# Bind("[Approved By]") %>'></asp:TextBox>
                          </EditItemTemplate>
                          <ItemTemplate>
                              <asp:Label ID="Label15" runat="server" Text='<%# Bind("[Approved By]") %>'></asp:Label>
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

         <asp:SqlDataSource ID="SqlCon2" runat="server" ConnectionString="<%$ ConnectionStrings:DBCon %>"
            SelectCommand="SELECT * FROM [DayToDayTbl_ins]" DeleteCommand="DELETE FROM [DayToDayTbl_ins] WHERE [id] = @original_id AND [Account Name] = @original_Account_Name AND [Approval Number] = @original_Approval_Number AND [Facility Type] = @original_Facility_Type AND [Facility Amount] = @original_Facility_Amount AND [Currency] = @original_Currency AND [Action Taken] = @original_Action_Taken AND [TFL Instructed On] = @original_TFL_Instructed_On AND [Confirmed By] = @original_Confirmed_By AND [Date of Boking] = @original_Date_of_Boking AND [CMLA SignOff Date] = @original_CMLA_SignOff_Date AND [Remark] = @original_Remark AND (([Inserted By] = @original_Inserted_By) OR ([Inserted By] IS NULL AND @original_Inserted_By IS NULL)) AND (([Updated By] = @original_Updated_By) OR ([Updated By] IS NULL AND @original_Updated_By IS NULL)) AND (([Approved By] = @original_Approved_By) OR ([Approved By] IS NULL AND @original_Approved_By IS NULL))" InsertCommand="INSERT INTO [DayToDayTbl_ins] ([Account Name], [Approval Number], [Facility Type], [Facility Amount], [Currency], [Action Taken], [TFL Instructed On], [Confirmed By], [Date of Boking], [CMLA SignOff Date], [Remark], [Inserted By], [Updated By], [Approved By]) VALUES (@Account_Name, @Approval_Number, @Facility_Type, @Facility_Amount, @Currency, @Action_Taken, @TFL_Instructed_On, @Confirmed_By, @Date_of_Boking, @CMLA_SignOff_Date, @Remark, @Inserted_By, @Updated_By, @Approved_By)" UpdateCommand="UPDATE [DayToDayTbl_ins] SET [Account Name] = @Account_Name, [Approval Number] = @Approval_Number, [Facility Type] = @Facility_Type, [Facility Amount] = @Facility_Amount, [Currency] = @Currency, [Action Taken] = @Action_Taken, [TFL Instructed On] = @TFL_Instructed_On, [Confirmed By] = @Confirmed_By, [Date of Boking] = @Date_of_Boking, [CMLA SignOff Date] = @CMLA_SignOff_Date, [Remark] = @Remark, [Inserted By] = @Inserted_By, [Updated By] = @Updated_By, [Approved By] = @Approved_By WHERE [id] = @original_id AND [Account Name] = @original_Account_Name AND [Approval Number] = @original_Approval_Number AND [Facility Type] = @original_Facility_Type AND [Facility Amount] = @original_Facility_Amount AND [Currency] = @original_Currency AND [Action Taken] = @original_Action_Taken AND [TFL Instructed On] = @original_TFL_Instructed_On AND [Confirmed By] = @original_Confirmed_By AND [Date of Boking] = @original_Date_of_Boking AND [CMLA SignOff Date] = @original_CMLA_SignOff_Date AND [Remark] = @original_Remark AND (([Inserted By] = @original_Inserted_By) OR ([Inserted By] IS NULL AND @original_Inserted_By IS NULL)) AND (([Updated By] = @original_Updated_By) OR ([Updated By] IS NULL AND @original_Updated_By IS NULL)) AND (([Approved By] = @original_Approved_By) OR ([Approved By] IS NULL AND @original_Approved_By IS NULL))" ConflictDetection="CompareAllValues" OldValuesParameterFormatString="original_{0}" >
             <DeleteParameters>
                 <asp:Parameter Name="original_id" Type="Int32" />
                 <asp:Parameter Name="original_Account_Name" Type="String" />
                 <asp:Parameter Name="original_Approval_Number" Type="String" />
                 <asp:Parameter Name="original_Facility_Type" Type="String" />
                 <asp:Parameter Name="original_Facility_Amount" Type="String" />
                 <asp:Parameter Name="original_Currency" Type="String" />
                 <asp:Parameter Name="original_Action_Taken" Type="String" />
                 <asp:Parameter Name="original_TFL_Instructed_On" Type="String" />
                 <asp:Parameter Name="original_Confirmed_By" Type="String" />
                 <asp:Parameter DbType="Date" Name="original_Date_of_Boking" />
                 <asp:Parameter DbType="Date" Name="original_CMLA_SignOff_Date" />
                 <asp:Parameter Name="original_Remark" Type="String" />
                 <asp:Parameter Name="original_Inserted_By" Type="String" />
                 <asp:Parameter Name="original_Updated_By" Type="String" />
                 <asp:Parameter Name="original_Approved_By" Type="String" />
             </DeleteParameters>
             <InsertParameters>
                 <asp:Parameter Name="Account_Name" Type="String" />
                 <asp:Parameter Name="Approval_Number" Type="String" />
                 <asp:Parameter Name="Facility_Type" Type="String" />
                 <asp:Parameter Name="Facility_Amount" Type="String" />
                 <asp:Parameter Name="Currency" Type="String" />
                 <asp:Parameter Name="Action_Taken" Type="String" />
                 <asp:Parameter Name="TFL_Instructed_On" Type="String" />
                 <asp:Parameter Name="Confirmed_By" Type="String" />
                 <asp:Parameter Name="Date_of_Boking" DbType="Date" />
                 <asp:Parameter Name="CMLA_SignOff_Date" DbType="Date" />
                 <asp:Parameter Name="Remark" Type="String" />
                 <asp:Parameter Name="Inserted_By" Type="String" />
                 <asp:Parameter Name="Updated_By" Type="String" />
                 <asp:Parameter Name="Approved_By" Type="String" />
             </InsertParameters>
             <UpdateParameters>
                 <asp:Parameter Name="Account_Name" Type="String" />
                 <asp:Parameter Name="Approval_Number" Type="String" />
                 <asp:Parameter Name="Facility_Type" Type="String" />
                 <asp:Parameter Name="Facility_Amount" Type="String" />
                 <asp:Parameter Name="Currency" Type="String" />
                 <asp:Parameter Name="Action_Taken" Type="String" />
                 <asp:Parameter Name="TFL_Instructed_On" Type="String" />
                 <asp:Parameter Name="Confirmed_By" Type="String" />
                 <asp:Parameter Name="Date_of_Boking" DbType="Date" />
                 <asp:Parameter Name="CMLA_SignOff_Date" DbType="Date" />
                 <asp:Parameter Name="Remark" Type="String" />
                 <asp:Parameter Name="Inserted_By" Type="String" />
                 <asp:Parameter Name="Updated_By" Type="String" />
                 <asp:Parameter Name="Approved_By" Type="String" />
                 <asp:Parameter Name="original_id" Type="Int32" />
                 <asp:Parameter Name="original_Account_Name" Type="String" />
                 <asp:Parameter Name="original_Approval_Number" Type="String" />
                 <asp:Parameter Name="original_Facility_Type" Type="String" />
                 <asp:Parameter Name="original_Facility_Amount" Type="String" />
                 <asp:Parameter Name="original_Currency" Type="String" />
                 <asp:Parameter Name="original_Action_Taken" Type="String" />
                 <asp:Parameter Name="original_TFL_Instructed_On" Type="String" />
                 <asp:Parameter Name="original_Confirmed_By" Type="String" />
                 <asp:Parameter DbType="Date" Name="original_Date_of_Boking" />
                 <asp:Parameter DbType="Date" Name="original_CMLA_SignOff_Date" />
                 <asp:Parameter Name="original_Remark" Type="String" />
                 <asp:Parameter Name="original_Inserted_By" Type="String" />
                 <asp:Parameter Name="original_Updated_By" Type="String" />
                 <asp:Parameter Name="original_Approved_By" Type="String" />
             </UpdateParameters>
        </asp:SqlDataSource>
             <div style="margin-top:-5px;">
                    <asp:GridView ID="GridView3" OnRowCommand="GridView3_RowCommand"   runat="server" ShowHeaderWhenEmpty="True"
               AllowSorting="True" CssClass="auto-style1" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC"
               BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlConUpdate" PageSize="7" Width="1172px" Visible="False" OnSelectedIndexChanged="GridView3_SelectedIndexChanged" DataKeyNames="id">
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
                                <ControlStyle CssClass="center" />
                                <HeaderStyle CssClass="center" />
                                <ItemStyle CssClass="center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Account Name" SortExpression="Account Name">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("[Account Name]") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("[Account Name]") %>'></asp:Label>
                                </ItemTemplate>
                                    <ControlStyle CssClass="center" />
                                <HeaderStyle CssClass="center" />
                                <ItemStyle CssClass="center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Approval Number" SortExpression="Approval Number">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("[Approval Number]") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("[Approval Number]") %>'></asp:Label>
                                </ItemTemplate>
                                    <ControlStyle CssClass="center" />
                                <HeaderStyle CssClass="center" />
                                <ItemStyle CssClass="center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Facility Type" SortExpression="Facility Type">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("[Facility Type]") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("[Facility Type]") %>'></asp:Label>
                                </ItemTemplate>
                                    <ControlStyle CssClass="center" />
                                <HeaderStyle CssClass="center" />
                                <ItemStyle CssClass="center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Facility Amount" SortExpression="Facility Amount">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("[Facility Amount]") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("[Facility Amount]") %>'></asp:Label>
                                </ItemTemplate>
                                    <ControlStyle CssClass="center" />
                                <HeaderStyle CssClass="center" />
                                <ItemStyle CssClass="center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Currency" SortExpression="Currency">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Currency") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("Currency") %>'></asp:Label>
                                </ItemTemplate>
                                    <ControlStyle CssClass="center" />
                                <HeaderStyle CssClass="center" />
                                <ItemStyle CssClass="center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Action Taken" SortExpression="Action Taken">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("[Action Taken]") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("[Action Taken]") %>'></asp:Label>
                                </ItemTemplate>
                                    <ControlStyle CssClass="center" />
                                <HeaderStyle CssClass="center" />
                                <ItemStyle CssClass="center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="TFL Instructed On" SortExpression="TFL Instructed On">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("[TFL Instructed On]") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("[TFL Instructed On]") %>'></asp:Label>
                                </ItemTemplate>
                                    <ControlStyle CssClass="center" />
                                <HeaderStyle CssClass="center" />
                                <ItemStyle CssClass="center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Confirmed By" SortExpression="Confirmed By">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("[Confirmed By]") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label9" runat="server" Text='<%# Bind("[Confirmed By]") %>'></asp:Label>
                                </ItemTemplate>
                                    <ControlStyle CssClass="center" />
                                <HeaderStyle CssClass="center" />
                                <ItemStyle CssClass="center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Date of Boking" SortExpression="Date of Boking">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("[Date of Boking]") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label10" runat="server" Text='<%# Bind("[Date of Boking]") %>'></asp:Label>
                                </ItemTemplate>
                                    <ControlStyle CssClass="center" />
                                <HeaderStyle CssClass="center" />
                                <ItemStyle CssClass="center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="CMLA SignOff Date" SortExpression="CMLA SignOff Date">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("[CMLA SignOff Date]") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label11" runat="server" Text='<%# Bind("[CMLA SignOff Date]") %>'></asp:Label>
                                </ItemTemplate>
                                    <ControlStyle CssClass="center" />
                                <HeaderStyle CssClass="center" />
                                <ItemStyle CssClass="center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Remark" SortExpression="Remark">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("Remark") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label12" runat="server" Text='<%# Bind("Remark") %>'></asp:Label>
                                </ItemTemplate>
                                    <ControlStyle CssClass="center" />
                                <HeaderStyle CssClass="center" />
                                <ItemStyle CssClass="center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Inserted By" SortExpression="Inserted By">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox12" runat="server" Text='<%# Bind("[Inserted By]") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label13" runat="server" Text='<%# Bind("[Inserted By]") %>'></asp:Label>
                                </ItemTemplate>
                                    <ControlStyle CssClass="center" />
                                <HeaderStyle CssClass="center" />
                                <ItemStyle CssClass="center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Updated By" SortExpression="Updated By">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox13" runat="server" Text='<%# Bind("[Updated By]") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label14" runat="server" Text='<%# Bind("[Updated By]") %>'></asp:Label>
                                </ItemTemplate>
                                    <ControlStyle CssClass="center" />
                                <HeaderStyle CssClass="center" />
                                <ItemStyle CssClass="center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Approved By" SortExpression="Approved By">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox14" runat="server" Text='<%# Bind("[Approved By]") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label15" runat="server" Text='<%# Bind("[Approved By]") %>'></asp:Label>
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

     <asp:SqlDataSource ID="SqlConUpdate" runat="server" ConnectionString="<%$ ConnectionStrings:DBCon %>"
         SelectCommand="SELECT * FROM [DayToDayTbl_upd]" 
         >
        
     </asp:SqlDataSource>





   
  </div>


</asp:Content>