<%@ Page Title="Collateral Interface" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="acfg_pending__records.aspx.cs" Inherits="Collateral_int.acfg_pending__records" %>
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
              <div style="margin-top:-15px;">
         <asp:Label ID="updateLbl" runat="server" Font-Size="Small" Text="Label" Visible="False" Font-Names="Bahnschrift" ForeColor="Red"></asp:Label>
               </div>
              <div style="margin-top:-15px;">
 <asp:Label ID="insertLbl" runat="server" Font-Size="Small" Text="Label" Visible="False" Font-Names="Bahnschrift" ForeColor="Red"></asp:Label>
   </div>

          
                    <asp:GridView ID="GridView2" OnRowCommand="GridView2_RowCommand"   runat="server" ShowHeaderWhenEmpty="True"
               AllowSorting="True" CssClass="auto-style1" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC"
               BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="id" DataSourceID="SqlCon2" PageSize="7" Width="1172px" Visible="False" OnSelectedIndexChanged="GridView2_SelectedIndexChanged">
               <Columns>

                   <asp:TemplateField HeaderText="All">
                     <HeaderTemplate>
                    <asp:CheckBox ID="chkb2" runat="server" Text="All" OnCheckedChanged="chkb2_CheckedChanged1" AutoPostBack="true" />
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
                   <asp:TemplateField HeaderText="Borrower Name" SortExpression="Borrower Name">
                       <EditItemTemplate>
                           <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("[Borrower Name]") %>'></asp:TextBox>
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="Label2" runat="server" Text='<%# Bind("[Borrower Name]") %>'></asp:Label>
                       </ItemTemplate>
                       <ControlStyle CssClass="center" />
                       <HeaderStyle CssClass="center" />
                       <ItemStyle CssClass="center" />
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="Faciliy Approval No." SortExpression="Faciliy Approval No.">
                       <EditItemTemplate>
                           <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("[Faciliy Approval No]") %>'></asp:TextBox>
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="Label3" runat="server" Text='<%# Bind("[Faciliy Approval No]") %>'></asp:Label>
                       </ItemTemplate>
                       <ControlStyle CssClass="center" />
                       <HeaderStyle CssClass="center" />
                       <ItemStyle CssClass="center" />
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="Product Code" SortExpression="Product Code">
                       <EditItemTemplate>
                           <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("[Product Code]") %>'></asp:TextBox>
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="Label4" runat="server" Text='<%# Bind("[Product Code]") %>'></asp:Label>
                       </ItemTemplate>
                       <ControlStyle CssClass="center" />
                       <HeaderStyle CssClass="center" />
                       <ItemStyle CssClass="center" />
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="LOG No.#" SortExpression="LOG No.#">
                       <EditItemTemplate>
                           <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("[LOG No]") %>'></asp:TextBox>
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="Label5" runat="server" Text='<%# Bind("[LOG No]") %>'></asp:Label>
                       </ItemTemplate>
                       <ControlStyle CssClass="center" />
                       <HeaderStyle CssClass="center" />
                       <ItemStyle CssClass="center" />
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="Maturity Date of Facility" SortExpression="Maturity Date of Facility">
                       <EditItemTemplate>
                           <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("[Maturity Date of Facility]") %>'></asp:TextBox>
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="Label6" runat="server" Text='<%# Bind("[Maturity Date of Facility]") %>'></asp:Label>
                       </ItemTemplate>
                       <ControlStyle CssClass="center" />
                       <HeaderStyle CssClass="center" />
                       <ItemStyle CssClass="center" />
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="ACGF Expiry Date" SortExpression="ACGF Expiry Date">
                       <EditItemTemplate>
                           <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("[ACGF Expiry Date]") %>'></asp:TextBox>
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="Label7" runat="server" Text='<%# Bind("[ACGF Expiry Date]") %>'></asp:Label>
                       </ItemTemplate>
                       <ControlStyle CssClass="center" />
                       <HeaderStyle CssClass="center" />
                       <ItemStyle CssClass="center" />
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="Guarantee Claimed" SortExpression="Guarantee Claimed">
                       <EditItemTemplate>
                           <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("[Guarantee Claimed]") %>'></asp:TextBox>
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="Label8" runat="server" Text='<%# Bind("[Guarantee Claimed]") %>'></asp:Label>
                       </ItemTemplate>
                       <ControlStyle CssClass="center" />
                       <HeaderStyle CssClass="center" />
                       <ItemStyle CssClass="center" />
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="Remark" SortExpression="Remark">
                       <EditItemTemplate>
                           <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("Remark") %>'></asp:TextBox>
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="Label9" runat="server" Text='<%# Bind("Remark") %>'></asp:Label>
                       </ItemTemplate>
                       <ControlStyle CssClass="center" />
                       <HeaderStyle CssClass="center" />
                       <ItemStyle CssClass="center" />
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="InsertedBy" SortExpression="InsertedBy">
                       <EditItemTemplate>
                           <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("InsertedBy") %>'></asp:TextBox>
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="Label10" runat="server" Text='<%# Bind("InsertedBy") %>'></asp:Label>
                       </ItemTemplate>
                       <ControlStyle CssClass="center" />
                       <HeaderStyle CssClass="center" />
                       <ItemStyle CssClass="center" />
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="Approved By" SortExpression="Approved By">
                       <EditItemTemplate>
                           <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("[Approved By]") %>'></asp:TextBox>
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="Label11" runat="server" Text='<%# Bind("[Approved By]") %>'></asp:Label>
                       </ItemTemplate>
                       <ControlStyle CssClass="center" />
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
            DeleteCommand="DELETE FROM [ACGF_insert] WHERE [id] = @id"
            InsertCommand="INSERT INTO [ACGF_insert] ([Borrower Name], [Faciliy Approval No.], [Product Code], [LOG No.#], [Maturity Date of Facility], [ACGF Expiry Date], [Guarantee Claimed], [Remark], [InsertedBy], [Approved By], [Updated By]) VALUES (@Borrower_Name, @column1, @Product_Code, @column2, @Maturity_Date_of_Facility, @ACGF_Expiry_Date, @Guarantee_Claimed, @Remark, @InsertedBy, @Approved_By, @Updated_By)"
            SelectCommand="SELECT * FROM [ACGF_insert]" UpdateCommand="UPDATE [ACGF_insert] SET [Borrower Name] = @Borrower_Name, [Faciliy Approval No.] = @column1, [Product Code] = @Product_Code, [LOG No.#] = @column2, [Maturity Date of Facility] = @Maturity_Date_of_Facility, [ACGF Expiry Date] = @ACGF_Expiry_Date, [Guarantee Claimed] = @Guarantee_Claimed, [Remark] = @Remark, [InsertedBy] = @InsertedBy, [Approved By] = @Approved_By, [Updated By] = @Updated_By WHERE [id] = @id" >
             <DeleteParameters>
                 <asp:Parameter Name="id" Type="Int32" />
             </DeleteParameters>
             <InsertParameters>
                 <asp:Parameter Name="Borrower_Name" Type="String" />
                 <asp:Parameter Name="column1" Type="String" />
                 <asp:Parameter Name="Product_Code" Type="String" />
                 <asp:Parameter Name="column2" Type="String" />
                 <asp:Parameter Name="Maturity_Date_of_Facility" Type="String" />
                 <asp:Parameter Name="ACGF_Expiry_Date" Type="String" />
                 <asp:Parameter Name="Guarantee_Claimed" Type="String" />
                 <asp:Parameter Name="Remark" Type="String" />
                 <asp:Parameter Name="InsertedBy" Type="String" />
                 <asp:Parameter Name="Approved_By" Type="String" />
                 <asp:Parameter Name="Updated_By" Type="String" />
             </InsertParameters>
             <UpdateParameters>
                 <asp:Parameter Name="Borrower_Name" Type="String" />
                 <asp:Parameter Name="column1" Type="String" />
                 <asp:Parameter Name="Product_Code" Type="String" />
                 <asp:Parameter Name="column2" Type="String" />
                 <asp:Parameter Name="Maturity_Date_of_Facility" Type="String" />
                 <asp:Parameter Name="ACGF_Expiry_Date" Type="String" />
                 <asp:Parameter Name="Guarantee_Claimed" Type="String" />
                 <asp:Parameter Name="Remark" Type="String" />
                 <asp:Parameter Name="InsertedBy" Type="String" />
                 <asp:Parameter Name="Approved_By" Type="String" />
                 <asp:Parameter Name="Updated_By" Type="String" />
                 <asp:Parameter Name="id" Type="Int32" />
             </UpdateParameters>
        </asp:SqlDataSource>
             <div style="margin-top:-5px;">
                    <asp:GridView ID="GridView3" OnRowCommand="GridView3_RowCommand"   runat="server" ShowHeaderWhenEmpty="True"
               AllowSorting="True" CssClass="auto-style1" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC"
               BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlConUpdate" PageSize="7" Width="1172px" Visible="False" OnSelectedIndexChanged="GridView3_SelectedIndexChanged">
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
                                      <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("id") %>'></asp:TextBox>
                                  </EditItemTemplate>
                                  <ItemTemplate>
                                      <asp:Label ID="Label1" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                                  </ItemTemplate>
                                  <HeaderStyle CssClass="center" />
                                  <ItemStyle CssClass="center" />
                              </asp:TemplateField>
                              <asp:TemplateField HeaderText="Borrower Name" SortExpression="Borrower Name">
                                  <EditItemTemplate>
                                      <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("[Borrower Name]") %>'></asp:TextBox>
                                  </EditItemTemplate>
                                  <ItemTemplate>
                                      <asp:Label ID="Label2" runat="server" Text='<%# Bind("[Borrower Name]") %>'></asp:Label>
                                  </ItemTemplate>
                                  <HeaderStyle CssClass="center" />
                                  <ItemStyle CssClass="center" />
                              </asp:TemplateField>
                              <asp:TemplateField HeaderText="Faciliy Approval No." SortExpression="Faciliy Approval No.">
                                  <EditItemTemplate>
                                      <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("[Faciliy Approval No]") %>'></asp:TextBox>
                                  </EditItemTemplate>
                                  <ItemTemplate>
                                      <asp:Label ID="Label3" runat="server" Text='<%# Bind("[Faciliy Approval No]") %>'></asp:Label>
                                  </ItemTemplate>
                                  <HeaderStyle CssClass="center" />
                                  <ItemStyle CssClass="center" />
                              </asp:TemplateField>
                              <asp:TemplateField HeaderText="Product Code" SortExpression="Product Code">
                                  <EditItemTemplate>
                                      <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("[Product Code]") %>'></asp:TextBox>
                                  </EditItemTemplate>
                                  <ItemTemplate>
                                      <asp:Label ID="Label4" runat="server" Text='<%# Bind("[Product Code]") %>'></asp:Label>
                                  </ItemTemplate>
                                  <HeaderStyle CssClass="center" />
                                  <ItemStyle CssClass="center" />
                              </asp:TemplateField>
                              <asp:TemplateField HeaderText="LOG No.#" SortExpression="LOG No.#">
                                  <EditItemTemplate>
                                      <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("[LOG No]") %>'></asp:TextBox>
                                  </EditItemTemplate>
                                  <ItemTemplate>
                                      <asp:Label ID="Label5" runat="server" Text='<%# Bind("[LOG No]") %>'></asp:Label>
                                  </ItemTemplate>
                                  <HeaderStyle CssClass="center" />
                                  <ItemStyle CssClass="center" />
                              </asp:TemplateField>
                              <asp:TemplateField HeaderText="Maturity Date of Facility" SortExpression="Maturity Date of Facility">
                                  <EditItemTemplate>
                                      <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("[Maturity Date of Facility]") %>'></asp:TextBox>
                                  </EditItemTemplate>
                                  <ItemTemplate>
                                      <asp:Label ID="Label6" runat="server" Text='<%# Bind("[Maturity Date of Facility]") %>'></asp:Label>
                                  </ItemTemplate>
                                  <HeaderStyle CssClass="center" />
                                  <ItemStyle CssClass="center" />
                              </asp:TemplateField>
                              <asp:TemplateField HeaderText="ACGF Expiry Date" SortExpression="ACGF Expiry Date">
                                  <EditItemTemplate>
                                      <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("[ACGF Expiry Date]") %>'></asp:TextBox>
                                  </EditItemTemplate>
                                  <ItemTemplate>
                                      <asp:Label ID="Label7" runat="server" Text='<%# Bind("[ACGF Expiry Date]") %>'></asp:Label>
                                  </ItemTemplate>
                                  <HeaderStyle CssClass="center" />
                                  <ItemStyle CssClass="center" />
                              </asp:TemplateField>
                              <asp:TemplateField HeaderText="Guarantee Claimed" SortExpression="Guarantee Claimed">
                                  <EditItemTemplate>
                                      <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("[Guarantee Claimed]") %>'></asp:TextBox>
                                  </EditItemTemplate>
                                  <ItemTemplate>
                                      <asp:Label ID="Label8" runat="server" Text='<%# Bind("[Guarantee Claimed]") %>'></asp:Label>
                                  </ItemTemplate>
                                  <HeaderStyle CssClass="center" />
                                  <ItemStyle CssClass="center" />
                              </asp:TemplateField>
                              <asp:TemplateField HeaderText="Remark" SortExpression="Remark">
                                  <EditItemTemplate>
                                      <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("Remark") %>'></asp:TextBox>
                                  </EditItemTemplate>
                                  <ItemTemplate>
                                      <asp:Label ID="Label9" runat="server" Text='<%# Bind("Remark") %>'></asp:Label>
                                  </ItemTemplate>
                                  <HeaderStyle CssClass="center" />
                                  <ItemStyle CssClass="center" />
                              </asp:TemplateField>
                              <asp:TemplateField HeaderText="InsertedBy" SortExpression="InsertedBy">
                                  <EditItemTemplate>
                                      <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("InsertedBy") %>'></asp:TextBox>
                                  </EditItemTemplate>
                                  <ItemTemplate>
                                      <asp:Label ID="Label10" runat="server" Text='<%# Bind("InsertedBy") %>'></asp:Label>
                                  </ItemTemplate>
                                  <HeaderStyle CssClass="center" />
                                  <ItemStyle CssClass="center" />
                              </asp:TemplateField>
                              <asp:TemplateField HeaderText="Approved By" SortExpression="Approved By">
                                  <EditItemTemplate>
                                      <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("[Approved By]") %>'></asp:TextBox>
                                  </EditItemTemplate>
                                  <ItemTemplate>
                                      <asp:Label ID="Label11" runat="server" Text='<%# Bind("[Approved By]") %>'></asp:Label>
                                  </ItemTemplate>
                                  <HeaderStyle CssClass="center" />
                                  <ItemStyle CssClass="center" />
                              </asp:TemplateField>
                              <asp:TemplateField HeaderText="Updated By" SortExpression="Updated By">
                                  <EditItemTemplate>
                                      <asp:TextBox ID="TextBox12" runat="server" Text='<%# Bind("[Updated By]") %>'></asp:TextBox>
                                  </EditItemTemplate>
                                  <ItemTemplate>
                                      <asp:Label ID="Label12" runat="server" Text='<%# Bind("[Updated By]") %>'></asp:Label>
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
         SelectCommand="SELECT * FROM [ACGF_update]" 
         >
        
     </asp:SqlDataSource>





   
  </div>


</asp:Content>

