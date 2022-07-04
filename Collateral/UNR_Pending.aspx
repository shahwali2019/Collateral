<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UNR_Pending.aspx.cs" Inherits="Collateral.UNR_Pending" %>
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
      <asp:ImageButton ID="ApproveUpdateBtn" runat="server" Height="32px" ImageUrl="~/image/updatebtn.png" OnClick="ApproveUpdateBtn_Click" ToolTip="Approved Updated Records" Width="28px" Enabled="False"  />
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
   <asp:GridView ID="Gridv_LAR" OnRowDataBound="Gridv_LAR_RowDataBound" OnRowCommand="Gridv_LAR_RowCommand"   runat="server" ShowHeaderWhenEmpty="True"
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
                  <asp:TemplateField HeaderText="Group Name" SortExpression="Group Name" ItemStyle-CssClass="nowrap">
                    <EditItemTemplate>
                      <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("[Group Name]") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                      <asp:Label ID="Label2" runat="server" Text='<%# Bind("[Group Name]") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="center" />
                    <ItemStyle CssClass="center" />
                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="Respective Name" SortExpression="Respective Name" ItemStyle-CssClass="nowrap">
                    <EditItemTemplate>
                      <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("[Respective Name]") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                      <asp:Label ID="Label3" runat="server" Text='<%# Bind("[Respective Name]") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="center" />
                    <ItemStyle CssClass="center" />
                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="Approval Number" SortExpression="Approval Number" ItemStyle-CssClass="nowrap">
                    <EditItemTemplate>
                      <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("[Approval Number]") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                      <asp:Label ID="Label4" runat="server" Text='<%# Bind("[Approval Number]") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="center" />
                    <ItemStyle CssClass="center" />
                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="Facility Type" SortExpression="Facility Type" ItemStyle-CssClass="nowrap">
                    <EditItemTemplate>
                      <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("[Facility Type]") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                      <asp:Label ID="Label5" runat="server" Text='<%# Bind("[Facility Type]") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="center" />
                    <ItemStyle CssClass="center" />
                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="Facility Amount" SortExpression="Facility Amount" ItemStyle-CssClass="nowrap">
                    <EditItemTemplate>
                      <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("[Facility Amount]") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                      <asp:Label ID="Label6" runat="server" Text='<%# Bind("[Facility Amount]") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="center" />
                    <ItemStyle CssClass="center" />
                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="Currency" SortExpression="Currency" ItemStyle-CssClass="nowrap">
                    <EditItemTemplate>
                      <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("[Currency]") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                      <asp:Label ID="Label7" runat="server" Text='<%# Bind("[Currency]") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="center" />
                    <ItemStyle CssClass="center" />
                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="Expire Date" SortExpression="Expire Date" ItemStyle-CssClass="nowrap">
                    <EditItemTemplate>
                      <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("[Expire Date]") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                      <asp:Label ID="Label8" runat="server" Text='<%# Bind("[Expire Date]") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="center" />
                    <ItemStyle CssClass="center" />
                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="Description of Notice Received" SortExpression="Description of Notice Received" ItemStyle-CssClass="nowrap">
                    <EditItemTemplate>
                      <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("[Received]") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                      <asp:Label ID="Label9" runat="server" Text='<%# Bind("[Received]") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="center" />
                    <ItemStyle CssClass="center" />
                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="Status" SortExpression="Status" ItemStyle-CssClass="nowrap">
                    <EditItemTemplate>
                      <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("[Status]") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                      <asp:Label ID="Label10" runat="server" Text='<%# Bind("[Status]") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="center" />
                    <ItemStyle CssClass="center" />
                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="Inserted By" SortExpression="Inserted By" ItemStyle-CssClass="nowrap">
                    <EditItemTemplate>
                      <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("[Inserted By]") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                      <asp:Label ID="Label11" runat="server" Text='<%# Bind("[Inserted By]") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="center" />
                    <ItemStyle CssClass="center" />
                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="Updated By" SortExpression="Updated By" ItemStyle-CssClass="nowrap">
                    <EditItemTemplate>
                      <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("[Updated By]") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                      <asp:Label ID="Label12" runat="server" Text='<%# Bind("[Updated By]") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="center" />
                    <ItemStyle CssClass="center" />
                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="Approved By" SortExpression="Approved By" ItemStyle-CssClass="nowrap">
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
   <br />
  <asp:SqlDataSource ID="SqlCon2" runat="server" ConnectionString="<%$ ConnectionStrings:DBCon %>"
      SelectCommand="SELECT * FROM [UNR_Insert]" DeleteCommand="DELETE FROM [UNR_Insert] WHERE [Id] = @id">
   </asp:SqlDataSource>
      <asp:GridView ID="gv3" OnRowDataBound="gv3_RowDataBound" OnRowCommand="gv3_RowCommand" runat="server" ShowHeaderWhenEmpty="True" AllowSorting="True" CssClass="auto-style1" 
          AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC"
         BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlConUpdate" PageSize="7" Width="1172px" Visible="False" DataKeyNames="Id">
         <Columns>

           <asp:TemplateField HeaderText="">
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
                  <asp:TemplateField HeaderText="Group Name" SortExpression="Group Name" ItemStyle-CssClass="nowrap">
                    <EditItemTemplate>
                      <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("[Group Name]") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                      <asp:Label ID="Label2" runat="server" Text='<%# Bind("[Group Name]") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="center" />
                    <ItemStyle CssClass="center" />
                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="Respective Name" SortExpression="Respective Name" ItemStyle-CssClass="nowrap">
                    <EditItemTemplate>
                      <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("[Respective Name]") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                      <asp:Label ID="Label3" runat="server" Text='<%# Bind("[Respective Name]") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="center" />
                    <ItemStyle CssClass="center" />
                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="Approval Number" SortExpression="Approval Number" ItemStyle-CssClass="nowrap">
                    <EditItemTemplate>
                      <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("[Approval Number]") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                      <asp:Label ID="Label4" runat="server" Text='<%# Bind("[Approval Number]") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="center" />
                    <ItemStyle CssClass="center" />
                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="Facility Type" SortExpression="Facility Type" ItemStyle-CssClass="nowrap">
                    <EditItemTemplate>
                      <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("[Facility Type]") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                      <asp:Label ID="Label5" runat="server" Text='<%# Bind("[Facility Type]") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="center" />
                    <ItemStyle CssClass="center" />
                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="Facility Amount" SortExpression="Facility Amount" ItemStyle-CssClass="nowrap">
                    <EditItemTemplate>
                      <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("[Facility Amount]") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                      <asp:Label ID="Label6" runat="server" Text='<%# Bind("[Facility Amount]") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="center" />
                    <ItemStyle CssClass="center" />
                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="Currency" SortExpression="Currency" ItemStyle-CssClass="nowrap">
                    <EditItemTemplate>
                      <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("[Currency]") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                      <asp:Label ID="Label7" runat="server" Text='<%# Bind("[Currency]") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="center" />
                    <ItemStyle CssClass="center" />
                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="Expire Date" SortExpression="Expire Date" ItemStyle-CssClass="nowrap">
                    <EditItemTemplate>
                      <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("[Expire Date]") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                      <asp:Label ID="Label8" runat="server" Text='<%# Bind("[Expire Date]") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="center" />
                    <ItemStyle CssClass="center" />
                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="Description of Notice Received" SortExpression="Description of Notice Received" ItemStyle-CssClass="nowrap">
                    <EditItemTemplate>
                      <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("[Received]") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                      <asp:Label ID="Label9" runat="server" Text='<%# Bind("[Received]") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="center" />
                    <ItemStyle CssClass="center" />
                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="Status" SortExpression="Status" ItemStyle-CssClass="nowrap">
                    <EditItemTemplate>
                      <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("[Status]") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                      <asp:Label ID="Label10" runat="server" Text='<%# Bind("[Status]") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="center" />
                    <ItemStyle CssClass="center" />
                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="Inserted By" SortExpression="Inserted By" ItemStyle-CssClass="nowrap">
                    <EditItemTemplate>
                      <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("[Inserted By]") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                      <asp:Label ID="Label11" runat="server" Text='<%# Bind("[Inserted By]") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="center" />
                    <ItemStyle CssClass="center" />
                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="Updated By" SortExpression="Updated By" ItemStyle-CssClass="nowrap">
                    <EditItemTemplate>
                      <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("[Updated By]") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                      <asp:Label ID="Label12" runat="server" Text='<%# Bind("[Updated By]") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="center" />
                    <ItemStyle CssClass="center" />
                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="Approved By" SortExpression="Approved By" ItemStyle-CssClass="nowrap">
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
   </>
   <asp:SqlDataSource ID="SqlConUpdate" runat="server" ConnectionString="<%$ ConnectionStrings:DBCon %>"
      SelectCommand="SELECT * FROM [UNR_Updated]" 
      DeleteCommand="DELETE FROM [UNR_Updated] WHERE [Id] = @id">
      <DeleteParameters>
         <asp:Parameter Name="Id" Type="Int32" />
      </DeleteParameters>
   </asp:SqlDataSource>
</div>
</asp:Content>
