<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LLR_Approve_Pending.aspx.cs" Inherits="Collateral.LLR_Approve_Pending" %>
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
      <asp:CheckBox AutoPostBack="true" ID="updatedCheck" runat="server" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="X-Small" ForeColor="#003399" Text="Loan Recovery Details" OnCheckedChanged="updatedCheck_CheckedChanged" />
   <p>
      <asp:ImageButton ID="ApproveBtnImg" runat="server" Height="32px" ImageUrl="~/image/insertBtn.jpg" OnClick="ApproveBtnImg_Click" ToolTip="Approve Inserted Records" Width="30px" Enabled="False" />
      &nbsp;
      <asp:ImageButton ID="ApproveUpdateBtn" runat="server" Height="32px" ImageUrl="~/image/updatebtn.png" Visible="false" ToolTip="Approved Updated Records" Width="28px" Enabled="False" OnClick="ApproveUpdateBtn_Click" />
   <hr style="margin-left:5px;border-bottom:5px solid #003399; width:1100px; background-color: #00FF00;" />
   <div style="margin-top:-15px;">
      <asp:Label ID="updateLbl" runat="server" Font-Size="Small" Text="Label" Visible="False" Font-Names="Bahnschrift" ForeColor="Red"></asp:Label>
   </div>
   <div style="margin-top:-15px;">
      <asp:Label ID="insertLbl" runat="server" Font-Size="Small" Text="" Visible="true" Font-Names="Bahnschrift" ForeColor="Red"></asp:Label>
   </div>
       <br />

          <div style="margin-top:-15px;">
      <asp:Label ID="Label26" runat="server" Font-Size="Small" Visible="false" Font-Names="Bahnschrift" ForeColor="Red"></asp:Label>
   </div>
   <asp:GridView ID="Gridv_LR" OnRowCommand="Gridv_LR_RowCommand" OnRowDataBound="Gridv_LR_RowDataBound" runat="server" ShowHeaderWhenEmpty="True"
      AllowSorting="True" CssClass="auto-style1" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC"
      BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="LoanID" DataSourceID="SqlCon2" PageSize="7" Width="1172px" Visible="False">
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
         <asp:TemplateField HeaderText="LoanID" InsertVisible="False" SortExpression="LoanID">
            <EditItemTemplate>
               <asp:Label ID="Label1" runat="server" Text='<%# Eval("LoanID") %>'></asp:Label>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label1" runat="server" Text='<%# Bind("LoanID") %>'></asp:Label>
            </ItemTemplate>
            <HeaderStyle CssClass="center" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="BorrowerName" SortExpression="BorrowerName">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("[BorrowerName]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label2" runat="server" Text='<%# Bind("[BorrowerName]") %>'></asp:Label>
            </ItemTemplate>
            <HeaderStyle CssClass="center" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="AccountNumber" SortExpression="AccountNumber">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("[AccountNumber]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label3" runat="server" Text='<%# Bind("[AccountNumber]") %>'></asp:Label>
            </ItemTemplate>
            <HeaderStyle CssClass="center" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Currency" SortExpression="Currency">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("[Currency]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label4" runat="server" Text='<%# Bind("[Currency]") %>'></asp:Label>
            </ItemTemplate>
            <HeaderStyle CssClass="center" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Loan Number" SortExpression="Loan Number">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("[Loan Number]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label5" runat="server" Text='<%# Bind("[Loan Number]") %>'></asp:Label>
            </ItemTemplate>
            <HeaderStyle CssClass="center" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Facility Type" SortExpression="Facility Type">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("[Facility Type]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label6" runat="server" Text='<%# Bind("[Facility Type]") %>'></asp:Label>
            </ItemTemplate>
            <HeaderStyle CssClass="center" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Loan Disbursement Date" SortExpression="Loan Disbursement Date">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("[Loan Disbursement Date]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label7" runat="server" Text='<%# Bind("[Loan Disbursement Date]") %>'></asp:Label>
            </ItemTemplate>
            <HeaderStyle CssClass="center" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Disbursed Amount" SortExpression="Disbursed Amount">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("[Disbursed Amount]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label8" runat="server" Text='<%# Bind("[Disbursed Amount]") %>'></asp:Label>
            </ItemTemplate>
            <HeaderStyle CssClass="center" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Interest Stoped On" SortExpression="Interest Stoped On">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("[Interest Stoped On]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label9" runat="server" Text='<%# Bind("[Interest Stoped On]") %>'></asp:Label>
            </ItemTemplate>
            <HeaderStyle CssClass="center" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Doubtful Date" SortExpression="Doubtful Date">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("[Doubtful Date]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label10" runat="server" Text='<%# Bind("[Doubtful Date]") %>'></asp:Label>
            </ItemTemplate>
            <HeaderStyle CssClass="center" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Charge off Date" SortExpression="Charge off Date">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("[Charge off Date]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label11" runat="server" Text='<%# Bind("[Charge off Date]") %>'></asp:Label>
            </ItemTemplate>
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Charge off Amount Original Currency" SortExpression="Charge off Amount Original Currency">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("[Charge off Amount Original Currency]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label12" runat="server" Text='<%# Bind("[Charge off Amount Original Currency]") %>'></asp:Label>
            </ItemTemplate>
            <HeaderStyle CssClass="center" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Charge off Amount Converted to USD" SortExpression="Charge off Amount Converted to USD">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox12" runat="server" Text='<%# Bind("[Charge off Amount Converted to USD]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label13" runat="server" Text='<%# Bind("[Charge off Amount Converted to USD]") %>'></asp:Label>
            </ItemTemplate>
            <HeaderStyle CssClass="center" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Inserted By" SortExpression="Inserted By">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox13" runat="server" Text='<%# Bind("[Inserted By]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label14" runat="server" Text='<%# Bind("[Inserted By]") %>'></asp:Label>
            </ItemTemplate>
            <HeaderStyle CssClass="center" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Updated By" SortExpression="Updated By">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox14" runat="server" Text='<%# Bind("[Updated By]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label15" runat="server" Text='<%# Bind("[Updated By]") %>'></asp:Label>
            </ItemTemplate>
            <HeaderStyle CssClass="center" />
         </asp:TemplateField>
          <asp:TemplateField HeaderText ="Approved By" SortExpression ="Approved By">
              <EditItemTemplate>
                  <asp:TextBox ID="TextBox15" runat="server" Text='<%# Bind("[Approved By]") %>'></asp:TextBox>
              </EditItemTemplate>
              <ItemTemplate>
                  <asp:Label ID="Label16" runat="server" Text='<%# Bind("[Approved By]") %>'></asp:Label>
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
   <br />
  <asp:SqlDataSource ID="SqlCon2" runat="server" ConnectionString="<%$ ConnectionStrings:DBCon %>"
      SelectCommand="SELECT * FROM [LoanDetail_Insert]" DeleteCommand="DELETE FROM [LoanDetail_Insert] WHERE [LoanID] = @LoanID">

   </asp:SqlDataSource>
      <asp:GridView ID="gv_update" OnRowCommand="gv_update_RowCommand" OnRowDataBound="gv_update_RowDataBound" runat="server" ShowHeaderWhenEmpty="True" AllowSorting="True" CssClass="auto-style1" 
          AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC"
         BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlConUpdate" PageSize="7" Width="1172px" Visible="False" DataKeyNames="LoanRecoveryID">
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
            <asp:TemplateField HeaderText="LoanRecoveryID" InsertVisible="False" SortExpression="LoanRecoveryID" ItemStyle-CssClass="nowrap">
                    <EditItemTemplate>
                      <asp:Label ID="Label1" runat="server" Text='<%# Eval("LoanRecoveryID") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                      <asp:Label ID="Label1" runat="server" Text='<%# Bind("LoanRecoveryID") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="center" />
                    <ItemStyle CssClass="center" />
                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="BorrowerName" SortExpression="BorrowerName" ItemStyle-CssClass="nowrap">
                    <EditItemTemplate>
                      <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("[BorrowerName]") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                      <asp:Label ID="Label2" runat="server" Text='<%# Bind("[BorrowerName]") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="center" />
                    <ItemStyle CssClass="center" />
                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="AccountNumber" SortExpression="AccountNumber" ItemStyle-CssClass="nowrap">
                    <EditItemTemplate>
                      <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("[AccountNumber]") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                      <asp:Label ID="Label3" runat="server" Text='<%# Bind("[AccountNumber]") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="center" />
                    <ItemStyle CssClass="center" />
                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="Recovery Date" SortExpression="Recovery Date" ItemStyle-CssClass="nowrap">
                    <EditItemTemplate>
                      <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("[Recovery Date]") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                      <asp:Label ID="Label4" runat="server" Text='<%# Bind("[Recovery Date]") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="center" />
                    <ItemStyle CssClass="center" />
                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="source Of Recovery" SortExpression="source Of Recovery" ItemStyle-CssClass="nowrap">
                    <EditItemTemplate>
                      <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("[source Of Recovery]") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                      <asp:Label ID="Label5" runat="server" Text='<%# Bind("[source Of Recovery]") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="center" />
                    <ItemStyle CssClass="center" />
                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="Recovery Amount" SortExpression="Recovery Amount" ItemStyle-CssClass="nowrap">
                    <EditItemTemplate>
                      <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("[Recovery Amount]") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                      <asp:Label ID="Label6" runat="server" Text='<%# Bind("[Recovery Amount]") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="center" />
                    <ItemStyle CssClass="center" />
                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="Expenses Occurred" SortExpression="Expenses Occurred" ItemStyle-CssClass="nowrap">
                    <EditItemTemplate>
                      <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("[Expenses Occurred]") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                      <asp:Label ID="Label7" runat="server" Text='<%# Bind("[Expenses Occurred]") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="center" />
                    <ItemStyle CssClass="center" />
                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="Claim To be Paid" SortExpression="Claim To be Paid" ItemStyle-CssClass="nowrap">
                    <EditItemTemplate>
                      <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("[Claim To be Paid]") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                      <asp:Label ID="Label8" runat="server" Text='<%# Bind("[Claim To be Paid]") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="center" />
                    <ItemStyle CssClass="center" />
                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="Net Loss" SortExpression="Net Loss" ItemStyle-CssClass="nowrap">
                    <EditItemTemplate>
                      <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("[Net Loss]") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                      <asp:Label ID="Label9" runat="server" Text='<%# Bind("[Net Loss]") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="center" />
                    <ItemStyle CssClass="center" />
                  </asp:TemplateField>
<%--                  <asp:TemplateField HeaderText="Inserted By" SortExpression="Inserted By" ItemStyle-CssClass="nowrap">
                    <EditItemTemplate>
                      <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("[Inserted By]") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                      <asp:Label ID="Label10" runat="server" Text='<%# Bind("[Inserted By]") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="center" />
                    <ItemStyle CssClass="center" />
                  </asp:TemplateField>--%>
<%--                  <asp:TemplateField HeaderText="Updated By" SortExpression="Updated By" ItemStyle-CssClass="nowrap">
                    <EditItemTemplate>
                      <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("[Updated By]") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                      <asp:Label ID="Label11" runat="server" Text='<%# Bind("[Updated By]") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="center" />
                    <ItemStyle CssClass="center" />
                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="Approved By" SortExpression="Approved By" ItemStyle-CssClass="nowrap">
                    <EditItemTemplate>
                      <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("[Approved By]") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                      <asp:Label ID="Label12" runat="server" Text='<%# Bind("[Approved By]") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="center" />
                    <ItemStyle CssClass="center" />
                  </asp:TemplateField>--%>
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
   </>
   <asp:SqlDataSource ID="SqlConUpdate" runat="server" ConnectionString="<%$ ConnectionStrings:DBCon %>"
      SelectCommand="SELECT * FROM [LoanRecoveryDetails_Update]" 
     DeleteCommand="DELETE FROM [LoanRecoveryDetails_Update] WHERE [LoanRecoveryID] = @LoanRecoveryID">
      <DeleteParameters>
         <asp:Parameter Name="LoanRecoveryID" Type="Int32" />
      </DeleteParameters>
   </asp:SqlDataSource>
</div>
</asp:Content>
