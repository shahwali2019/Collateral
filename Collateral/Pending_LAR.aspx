<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Pending_LAR.aspx.cs" Inherits="Collateral.Pending_LAR" %>
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
      <asp:Label ID="insertLbl" runat="server" Font-Size="Small" Text="" Visible="true" Font-Names="Bahnschrift" ForeColor="Red"></asp:Label>
   </div>
       <br />

          <div style="margin-top:-15px;">
      <asp:Label ID="Label26" runat="server" Font-Size="Small" Visible="false" Font-Names="Bahnschrift" ForeColor="Red"></asp:Label>
   </div>
   <asp:GridView ID="Gridv_LAR" OnRowCommand="Gridv_LAR_RowCommand" OnRowDataBound="Gridv_LAR_RowDataBound"   runat="server" ShowHeaderWhenEmpty="True"
      AllowSorting="True" CssClass="auto-style1" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC"
      BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="Id" DataSourceID="SqlCon2" PageSize="7" Width="1172px" Visible="False">
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
               <asp:Label ID="Label1" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label1" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
            </ItemTemplate>
            <HeaderStyle CssClass="center" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Disbursement date" SortExpression="Disbursement date">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("[Disbursementdate]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label2" runat="server" Text='<%# Bind("[Disbursementdate]") %>'></asp:Label>
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
         <asp:TemplateField HeaderText="Case Number" SortExpression="Case Number">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("[CaseNumber]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label4" runat="server" Text='<%# Bind("[CaseNumber]") %>'></asp:Label>
            </ItemTemplate>
            <HeaderStyle CssClass="center" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Facility type" SortExpression="Facility type">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("[FacilityType]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label5" runat="server" Text='<%# Bind("[FacilityType]") %>'></asp:Label>
            </ItemTemplate>
            <HeaderStyle CssClass="center" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="facility event" SortExpression="facility event">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("[facilityevent]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label6" runat="server" Text='<%# Bind("[facilityevent]") %>'></asp:Label>
            </ItemTemplate>
            <HeaderStyle CssClass="center" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Ccy" SortExpression="Ccy">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("[Ccy]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label7" runat="server" Text='<%# Bind("[Ccy]") %>'></asp:Label>
            </ItemTemplate>
            <HeaderStyle CssClass="center" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="FacilityAmount" SortExpression="FacilityAmount">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("[FacilityAmount]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label8" runat="server" Text='<%# Bind("[FacilityAmount]") %>'></asp:Label>
            </ItemTemplate>
            <HeaderStyle CssClass="center" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="HOCC Approval Date" SortExpression="HOCC Approval Date">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("[HOCCApprovalDate]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label9" runat="server" Text='<%# Bind("[HOCCApprovalDate]") %>'></asp:Label>
            </ItemTemplate>
            <HeaderStyle CssClass="center" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="CEO" SortExpression="CEO">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("[CEO]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label10" runat="server" Text='<%# Bind("[CEO]") %>'></asp:Label>
            </ItemTemplate>
            <HeaderStyle CssClass="center" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="CFO" SortExpression="CFO">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("[CFO]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label11" runat="server" Text='<%# Bind("[CFO]") %>'></asp:Label>
            </ItemTemplate>
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="BOD Requirement" SortExpression="BOD Requirement">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("[BODRequirement]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label12" runat="server" Text='<%# Bind("[BODRequirement]") %>'></asp:Label>
            </ItemTemplate>
            <HeaderStyle CssClass="center" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="BoDApprovalDate" SortExpression="BoDApprovalDate">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox12" runat="server" Text='<%# Bind("[BoDApprovalDate]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label13" runat="server" Text='<%# Bind("[BoDApprovalDate]") %>'></asp:Label>
            </ItemTemplate>
            <HeaderStyle CssClass="center" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="BOD chairman" SortExpression="BOD chairman">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox13" runat="server" Text='<%# Bind("[LutfullahRahmat]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label14" runat="server" Text='<%# Bind("[LutfullahRahmat]") %>'></asp:Label>
            </ItemTemplate>
            <HeaderStyle CssClass="center" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="BOD1" SortExpression="BOD1">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox14" runat="server" Text='<%# Bind("[HamidullahMohib]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label15" runat="server" Text='<%# Bind("[HamidullahMohib]") %>'></asp:Label>
            </ItemTemplate>
            <HeaderStyle CssClass="center" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="BOD2" SortExpression="BOD2">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox15" runat="server" Text='<%# Bind("[HugoMinderhod]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label16" runat="server" Text='<%# Bind("[HugoMinderhod]") %>'></asp:Label>
            </ItemTemplate>
            <HeaderStyle CssClass="center" />
         </asp:TemplateField>
          <asp:TemplateField HeaderText ="BOD3" SortExpression ="BOD3">
              <EditItemTemplate>
                  <asp:TextBox ID="TextBox16" runat="server" Text='<%# Bind("[RS]") %>'></asp:TextBox>
              </EditItemTemplate>
              <ItemTemplate>
                  <asp:Label ID="Label17" runat="server" Text='<%# Bind("[RS]") %>'></asp:Label>
              </ItemTemplate>
          </asp:TemplateField>
          <asp:TemplateField HeaderText ="BOD4" SortExpression ="BOD4">
              <EditItemTemplate>
                  <asp:TextBox ID="TextBox17" runat="server" Text='<%# Bind("[SS]") %>'></asp:TextBox>
              </EditItemTemplate>
              <ItemTemplate>
                  <asp:Label ID="Label18" runat="server" Text='<%# Bind("[SS]") %>'></asp:Label>
              </ItemTemplate>
          </asp:TemplateField>
          <asp:TemplateField HeaderText ="BOD5" SortExpression ="BOD5">
              <EditItemTemplate>
                  <asp:TextBox ID="TextBox18" runat="server" Text='<%# Bind("[MT]") %>'></asp:TextBox>
              </EditItemTemplate>
              <ItemTemplate>
                  <asp:Label ID="Label19" runat="server" Text='<%# Bind("[MT]") %>'></asp:Label>
              </ItemTemplate>
          </asp:TemplateField>
          <asp:TemplateField HeaderText ="BOD6" SortExpression ="BOD6">
              <EditItemTemplate>
                  <asp:TextBox ID="TextBox19" runat="server" Text='<%# Bind("[AS]") %>'></asp:TextBox>
              </EditItemTemplate>
              <ItemTemplate>
                  <asp:Label ID="Label20" runat="server" Text='<%# Bind("[AS]") %>'></asp:Label>
              </ItemTemplate>
          </asp:TemplateField>
          <asp:TemplateField HeaderText ="Facility Status" SortExpression ="Facility Status">
              <EditItemTemplate>
                  <asp:TextBox ID="TextBox20" runat="server" Text='<%# Bind("[FacilityStatus]") %>'></asp:TextBox>
              </EditItemTemplate>
              <ItemTemplate>
                  <asp:Label ID="Label21" runat="server" Text='<%# Bind("[FacilityStatus]") %>'></asp:Label>
              </ItemTemplate>
          </asp:TemplateField>
          <asp:TemplateField HeaderText ="Remarks" SortExpression ="Remarks">
              <EditItemTemplate>
                  <asp:TextBox ID="TextBox21" runat="server" Text='<%# Bind("[Remarks]") %>'></asp:TextBox>
              </EditItemTemplate>
              <ItemTemplate>
                  <asp:Label ID="Label22" runat="server" Text='<%# Bind("[Remarks]") %>'></asp:Label>
              </ItemTemplate>
          </asp:TemplateField>
          <asp:TemplateField HeaderText ="Inserted By" SortExpression ="Inserted By">
              <EditItemTemplate>
                  <asp:TextBox ID="TextBox22" runat="server"  Text='<%# Bind("[Inserted By]") %>'></asp:TextBox>
              </EditItemTemplate>
              <ItemTemplate>
                  <asp:Label ID="Label23" runat="server" Text='<%# Bind("[Inserted By]") %>'></asp:Label>
              </ItemTemplate>
          </asp:TemplateField>
          <asp:TemplateField HeaderText ="Updated By" SortExpression ="Updated By">
              <EditItemTemplate>
                  <asp:TextBox ID="TextBox23" runat="server" Text='<%# Bind("[Updated By]") %>'></asp:TextBox>
              </EditItemTemplate>
              <ItemTemplate>
                  <asp:Label ID="Label24" runat="server" Text='<%# Bind("[Updated By]") %>'></asp:Label>
              </ItemTemplate>
          </asp:TemplateField>
          <asp:TemplateField HeaderText ="Approved By" SortExpression ="Approved By">
              <EditItemTemplate>
                  <asp:TextBox ID="TextBox24" runat="server" Text='<%# Bind("[Approved By]") %>'></asp:TextBox>
              </EditItemTemplate>
              <ItemTemplate>
                  <asp:Label ID="Label25" runat="server" Text='<%# Bind("[Approved By]") %>'></asp:Label>
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
      SelectCommand="SELECT * FROM [LAR_Insert]" DeleteCommand="DELETE FROM [LAR_Insert] WHERE [Id] = @id">

<%--      DeleteCommand="DELETE FROM [OLDs_insert] WHERE [id] = @id" InsertCommand="INSERT INTO [OLDs_insert] ([Document checking date], [Borrower], [Department], [Case Number], [Facility type], [Currency], [Facility amount], [Customers type], [initial observations], [Outstanding observations], [Status of Observation] ,[Status of Facility],[1st checker],[2nd checker],[Remarks],[Updated By]) VALUES (@Document_checking_date,@Borrower ,@Department,@Case_Number,@Facility_type,@Currency,@Facility_amount,@Customers_type,@initial_observations,@Outstanding_observations,@Status_of_Observation,@Status_of_Facility,@1st_checker,@2nd_checker,@Remarks,@Updated_By)"
      UpdateCommand="UPDATE [OLDs_insert] SET [Document checking date] = @Document_checking_date, [Borrower] = @Borrower, [Department] = @Department, [Case Number] = @Case_Number, [Facility type] = @Facility_type, [Currency] = @Currency, [Facility amount] = @Facility_amount, [Customers type] = @Customers_type, [initial observations] = @initial_observations, [Outstanding observations] = @Outstanding_observations, [Status of Observation] = @Status_of_Observation ,[Status of Facility] = @Status_of_Facility,[1st checker] = @1st_checker,[2nd checker] = @2nd_checker,[Remarks] = @Remarks,[Updated By] = @Updated_By [id] = @id">
      <DeleteParameters>
         <asp:Parameter Name="id" Type="Int32" />
      </DeleteParameters>
      <InsertParameters>
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
      </InsertParameters>
      <UpdateParameters>
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
      <asp:GridView ID="gv3" OnRowCommand="gv3_RowCommand" OnRowDataBound="gv3_RowDataBound" runat="server" ShowHeaderWhenEmpty="True" AllowSorting="True" CssClass="auto-style1" 
          AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC"
         BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlConUpdate" PageSize="7" Width="1172px" Visible="False" DataKeyNames="Id">
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
            <asp:TemplateField HeaderText="Id" InsertVisible="False" SortExpression="Id" ItemStyle-CssClass="nowrap">
                    <EditItemTemplate>
                      <asp:Label ID="Label1" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                      <asp:Label ID="Label1" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="center" />
                    <ItemStyle CssClass="center" />
                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="Disbursement eedate" SortExpression="Disbursement date" ItemStyle-CssClass="nowrap">
                    <EditItemTemplate>
                      <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("[Disbursementdate]") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                      <asp:Label ID="Label2" runat="server" Text='<%# Bind("[Disbursementdate]") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="center" />
                    <ItemStyle CssClass="center" />
                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="Borrower" SortExpression="Borrower" ItemStyle-CssClass="nowrap">
                    <EditItemTemplate>
                      <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("[Borrower]") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                      <asp:Label ID="Label3" runat="server" Text='<%# Bind("[Borrower]") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="center" />
                    <ItemStyle CssClass="center" />
                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="Case Number" SortExpression="Case Number" ItemStyle-CssClass="nowrap">
                    <EditItemTemplate>
                      <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("[CaseNumber]") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                      <asp:Label ID="Label4" runat="server" Text='<%# Bind("[CaseNumber]") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="center" />
                    <ItemStyle CssClass="center" />
                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="Facility Type" SortExpression="Facility Type" ItemStyle-CssClass="nowrap">
                    <EditItemTemplate>
                      <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("[FacilityType]") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                      <asp:Label ID="Label5" runat="server" Text='<%# Bind("[FacilityType]") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="center" />
                    <ItemStyle CssClass="center" />
                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="facility event" SortExpression="facility event" ItemStyle-CssClass="nowrap">
                    <EditItemTemplate>
                      <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("[facilityevent]") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                      <asp:Label ID="Label6" runat="server" Text='<%# Bind("[facilityevent]") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="center" />
                    <ItemStyle CssClass="center" />
                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="Ccy" SortExpression="Ccy" ItemStyle-CssClass="nowrap">
                    <EditItemTemplate>
                      <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("[Ccy]") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                      <asp:Label ID="Label7" runat="server" Text='<%# Bind("[Ccy]") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="center" />
                    <ItemStyle CssClass="center" />
                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="Facility Amount" SortExpression="Facility Amount" ItemStyle-CssClass="nowrap">
                    <EditItemTemplate>
                      <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("[FacilityAmount]") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                      <asp:Label ID="Label8" runat="server" Text='<%# Bind("[FacilityAmount]") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="center" />
                    <ItemStyle CssClass="center" />
                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="HOCC Approval Date" SortExpression="HOCC Approval Date" ItemStyle-CssClass="nowrap">
                    <EditItemTemplate>
                      <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("[HOCCApprovalDate]") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                      <asp:Label ID="Label9" runat="server" Text='<%# Bind("[HOCCApprovalDate]") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="center" />
                    <ItemStyle CssClass="center" />
                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="CEO" SortExpression="CEO" ItemStyle-CssClass="nowrap">
                    <EditItemTemplate>
                      <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("[CEO]") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                      <asp:Label ID="Label10" runat="server" Text='<%# Bind("[CEO]") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="center" />
                    <ItemStyle CssClass="center" />
                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="CFO" SortExpression="CFO" ItemStyle-CssClass="nowrap">
                    <EditItemTemplate>
                      <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("[CFO]") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                      <asp:Label ID="Label11" runat="server" Text='<%# Bind("[CFO]") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="center" />
                    <ItemStyle CssClass="center" />
                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="BOD Requirement" SortExpression="BOD Requirement" ItemStyle-CssClass="nowrap">
                    <EditItemTemplate>
                      <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("[BODRequirement]") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                      <asp:Label ID="Label12" runat="server" Text='<%# Bind("[BODRequirement]") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="center" />
                    <ItemStyle CssClass="center" />
                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="BoD Approval Date" SortExpression="BoD Approval Date" ItemStyle-CssClass="nowrap">
                    <EditItemTemplate>
                      <asp:TextBox ID="TextBox12" runat="server" Text='<%# Bind("[BoDApprovalDate]") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                      <asp:Label ID="Label13" runat="server" Text='<%# Bind("[BoDApprovalDate]") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="center" />
                    <ItemStyle CssClass="center" />
                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="BOD chairman" SortExpression="BOD chairman" ItemStyle-CssClass="nowrap">
                    <EditItemTemplate>
                      <asp:TextBox ID="TextBox13" runat="server" Text='<%# Bind("[LutfullahRahmat]") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                      <asp:Label ID="Label14" runat="server" Text='<%# Bind("[LutfullahRahmat]") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="center" />
                    <ItemStyle CssClass="center" />
                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="BOD1" SortExpression="BOD1" ItemStyle-CssClass="nowrap">
                    <EditItemTemplate>
                      <asp:TextBox ID="TextBox14" runat="server" Text='<%# Bind("[HamidullahMohib]") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                      <asp:Label ID="Label15" runat="server" Text='<%# Bind("[HamidullahMohib]") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="center" />
                    <ItemStyle CssClass="center" />
                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="BOD2" SortExpression="BOD2" ItemStyle-CssClass="nowrap">
                    <EditItemTemplate>
                      <asp:TextBox ID="TextBox15" runat="server" Text='<%# Bind("[HugoMinderhod]") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                      <asp:Label ID="Label16" runat="server" Text='<%# Bind("[HugoMinderhod]") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="center" />
                    <ItemStyle CssClass="center" />
                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="BOD3" SortExpression="BOD3" ItemStyle-CssClass="nowrap">
                    <EditItemTemplate>
                      <asp:TextBox ID="TextBox16" runat="server" Text='<%# Bind("[RS]") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                      <asp:Label ID="Label17" runat="server" Text='<%# Bind("[RS]") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="center" />
                    <ItemStyle CssClass="center" />
                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="BOD4" SortExpression="BOD4" ItemStyle-CssClass="nowrap">
                    <EditItemTemplate>
                      <asp:TextBox ID="TextBox17" runat="server" Text='<%# Bind("[SS]") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                      <asp:Label ID="Label18" runat="server" Text='<%# Bind("[SS]") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="center" />
                    <ItemStyle CssClass="center" />
                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="BOD5" SortExpression="BOD5" ItemStyle-CssClass="nowrap">
                    <EditItemTemplate>
                      <asp:TextBox ID="TextBox18" runat="server" Text='<%# Bind("[MT]") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                      <asp:Label ID="Label19" runat="server" Text='<%# Bind("[MT]") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="center" />
                    <ItemStyle CssClass="center" />
                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="BOD6" SortExpression="BOD6" ItemStyle-CssClass="nowrap">
                    <EditItemTemplate>
                      <asp:TextBox ID="TextBox19" runat="server" Text='<%# Bind("[AS]") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                      <asp:Label ID="Label20" runat="server" Text='<%# Bind("[AS]") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="center" />
                    <ItemStyle CssClass="center" />
                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="Facility Status" SortExpression="Facility Status" ItemStyle-CssClass="nowrap">
                    <EditItemTemplate>
                      <asp:TextBox ID="TextBox20" runat="server" Text='<%# Bind("[FacilityStatus]") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                      <asp:Label ID="Label21" runat="server" Text='<%# Bind("[FacilityStatus]") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="center" />
                    <ItemStyle CssClass="center" />
                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="Remarks" SortExpression="Remarks" ItemStyle-CssClass="nowrap">
                    <EditItemTemplate>
                      <asp:TextBox ID="TextBox21" runat="server" Text='<%# Bind("[Remarks]") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                      <asp:Label ID="Label22" runat="server" Text='<%# Bind("[Remarks]") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="center" />
                    <ItemStyle CssClass="center" />
                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="Inserted By" SortExpression="Inserted By" ItemStyle-CssClass="nowrap">
                    <EditItemTemplate>
                      <asp:TextBox ID="TextBox22" runat="server" Text='<%# Bind("[Inserted By]") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                      <asp:Label ID="Label23" runat="server" Text='<%# Bind("[Inserted By]") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="center" />
                    <ItemStyle CssClass="center" />
                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="Updated By" SortExpression="Updated By" ItemStyle-CssClass="nowrap">
                    <EditItemTemplate>
                      <asp:TextBox ID="TextBox23" runat="server" Text='<%# Bind("[Updated By]") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                      <asp:Label ID="Label24" runat="server" Text='<%# Bind("[Updated By]") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="center" />
                    <ItemStyle CssClass="center" />
                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="Approved By" SortExpression="Approved By" ItemStyle-CssClass="nowrap">
                    <EditItemTemplate>
                      <asp:TextBox ID="TextBox24" runat="server" Text='<%# Bind("[Approved By]") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                      <asp:Label ID="Label25" runat="server" Text='<%# Bind("[Approved By]") %>'></asp:Label>
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
   </>
   <asp:SqlDataSource ID="SqlConUpdate" runat="server" ConnectionString="<%$ ConnectionStrings:DBCon %>"
      SelectCommand="SELECT * FROM [LAR_update]" 
      DeleteCommand="DELETE FROM [LAR_update] WHERE [id] = @id">
      <DeleteParameters>
         <asp:Parameter Name="id" Type="Int32" />
      </DeleteParameters>
   </asp:SqlDataSource>
</div>
</asp:Content>
