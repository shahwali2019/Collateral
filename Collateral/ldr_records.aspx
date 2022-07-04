<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ldr_records.aspx.cs" Inherits="Collateral_int.ldr_records" %>
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

</style>
<div style=" text-align:center; height:100px; margin-top:10px; " class="alert alert-success" role="alert">
   <h4 class="alert-heading" style="font-family:Bahnschrift;"><strong>LDR RECORDS</strong></h4>
</div>
<asp:Panel runat="server" DefaultButton="searchBtn">
   <table>
      <tr style="padding:10px 10px;">
         <td>
            <asp:TextBox ID="txtComName" placeholder="Client Name" runat="server" Height="31px" Width="168px" BackColor="#FFFF99" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Small" TabIndex="2" CssClass="form-control"></asp:TextBox>
         </td>
         <td>&nbsp;</td>
         <td>
            <asp:TextBox ID="txtAppNo" runat="server" placeholder="Approval Number" BackColor="#FFFF99" Height="31px" Width="168px" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Small" TabIndex="3" CssClass="auto-style2"></asp:TextBox>
         </td>
         <td>&nbsp;</td>
         <td>
            <asp:DropDownList ID="drop_down_facility_type" runat="server" CssClass="btn-info" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Small" Height="31px" TabIndex="4" Width="116px">
               <asp:ListItem Selected="True" Value="FT">Facility Types</asp:ListItem>
               <asp:ListItem Value="BG">BG</asp:ListItem>
               <asp:ListItem Value="PG">PG</asp:ListItem>
               <asp:ListItem Value="APG">APG</asp:ListItem>
               <asp:ListItem Value="BG.EX">BG.EX</asp:ListItem>
               <asp:ListItem Value="PG.EX">PG.EX</asp:ListItem>
               <asp:ListItem Value="APG.EX">APG.EX</asp:ListItem>
               <asp:ListItem Value="BG.AM">BG.AM</asp:ListItem>
               <asp:ListItem Value="PG.AM">PG.AM</asp:ListItem>
               <asp:ListItem Value="APG.AM">APG.AM</asp:ListItem>
               <asp:ListItem Value="LC">LC</asp:ListItem>
               <asp:ListItem Value="ULC">ULC</asp:ListItem>
               <asp:ListItem Value="SLC">SLC</asp:ListItem>
               <asp:ListItem Value="OD">OD</asp:ListItem>
               <asp:ListItem Value="TL">TL</asp:ListItem>
               <asp:ListItem Value="ISB">ISB</asp:ListItem>
               <asp:ListItem Value="CC">CC</asp:ListItem>
               <asp:ListItem Value="Teach.Loan">Teach.Loan</asp:ListItem>
               <asp:ListItem Value="Pay.Loan">Pay.Loan</asp:ListItem>
               <asp:ListItem Value="One Day">One Day</asp:ListItem>
               <asp:ListItem Value="HELO">HELO</asp:ListItem>
               <asp:ListItem Value="Azad.Loan">Azad.Loan</asp:ListItem>
               <asp:ListItem Value="Restructuring">Restructuring</asp:ListItem>
            </asp:DropDownList>
         </td>
         <td>&nbsp;&nbsp;&nbsp;</td>
         <td>
            <asp:Button ID="searchBtn" runat="server" CssClass="btn-primary focus" Font-Bold="True" Font-Size="Small" Height="31px" OnClick="searchBtn_Click" Text="Search" Width="67px" Font-Names="Bahnschrift" BorderStyle="None" />
         </td>
      </tr>
   </table>
</asp:Panel>
<div style="margin-left:10px;">
   <asp:Label ID="resultLbl" runat="server" Font-Bold="True" Font-Size="Smaller" ForeColor="Red" Visible="False" Font-Names="Bahnschrift Condensed"></asp:Label>
</div>
<hr style="border-bottom:5px solid #003399" />
<div style="margin-left:20px;">
   <asp:ImageButton ID="excelExporter" runat="server" Height="23px" ImageUrl="~/image/excel1.png" OnClick="excelExporter_Click1" ToolTip="Export to excel" Width="17px" />
   &nbsp;
   <asp:ImageButton ID="addNew" runat="server" Height="25px" ImageUrl="~/image/add.png" OnClick="addNew_Click" Width="18px" />
   <br />
   <asp:GridView ID="GridView1" runat="server" OnRowCommand="GridView1_RowCommand" OnRowDataBound="GridView1_RowDataBound" ShowHeaderWhenEmpty="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" DataSourceID="StringCon" GridLines="Horizontal" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" EnableTheming="True" HorizontalAlign="Center">
      <AlternatingRowStyle BackColor="#CCFFFF" BorderStyle="None" HorizontalAlign="Center" />
      <Columns>
         <asp:TemplateField HeaderText="All">
            <HeaderTemplate>
               <asp:CheckBox ID="chkb1" runat="server" Text="All" OnCheckedChanged="chkb1_CheckedChanged1" AutoPostBack="true" />
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
               <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandArgument='<%# Bind("id") %>' CommandName="edit" Text="Edit"></asp:LinkButton>
            </ItemTemplate>
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
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
         <asp:TemplateField HeaderText="Second Verifier" SortExpression="Second Verifier" Visible="False">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("[Second Verifier]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label8" runat="server" Text='<%# Bind("[Second Verifier]") %>'></asp:Label>
            </ItemTemplate>
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Second Verifier" SortExpression="Approved By">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox12" runat="server" Text='<%# Bind("[Approved By]") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label13" runat="server" Text='<%# Bind("[Approved By]") %>'></asp:Label>
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
<br />
<asp:SqlDataSource ID="StringCon" runat="server" ConnectionString="<%$ ConnectionStrings:DBCon %>"
   DeleteCommand="DELETE FROM [LoanReg_tbl] WHERE [id] = @original_id AND [Received Date] = @original_Received_Date AND [Company Name] = @original_Company_Name AND [Approval Number] = @original_Approval_Number AND [Facility Type] = @original_Facility_Type AND [Document Received] = @original_Document_Received AND [Enter By] = @original_Enter_By AND [Second Verifier] = @original_Second_Verifier AND [Completion Date] = @original_Completion_Date AND [Remark] = @original_Remark AND (([Inserted By] = @original_Inserted_By) OR ([Inserted By] IS NULL AND @original_Inserted_By IS NULL)) AND (([Updated By] = @original_Updated_By) OR ([Updated By] IS NULL AND @original_Updated_By IS NULL)) AND (([Approved By] = @original_Approved_By) OR ([Approved By] IS NULL AND @original_Approved_By IS NULL))"
   InsertCommand="INSERT INTO [LoanReg_tbl] ([Received Date], [Company Name], [Approval Number], [Facility Type], [Document Received], [Enter By], [Second Verifier], [Completion Date], [Remark], [Inserted By], [Updated By], [Approved By]) VALUES (@Received_Date, @Company_Name, @Approval_Number, @Facility_Type, @Document_Received, @Enter_By, @Second_Verifier, @Completion_Date, @Remark, @Inserted_By, @Updated_By, @Approved_By)"
   SelectCommand="SELECT * FROM [LoanReg_tbl]"
   UpdateCommand="UPDATE [LoanReg_tbl] SET [Received Date] = @Received_Date, [Company Name] = @Company_Name, [Approval Number] = @Approval_Number, [Facility Type] = @Facility_Type, [Document Received] = @Document_Received, [Enter By] = @Enter_By, [Second Verifier] = @Second_Verifier, [Completion Date] = @Completion_Date, [Remark] = @Remark, [Inserted By] = @Inserted_By, [Updated By] = @Updated_By, [Approved By] = @Approved_By WHERE [id] = @original_id AND [Received Date] = @original_Received_Date AND [Company Name] = @original_Company_Name AND [Approval Number] = @original_Approval_Number AND [Facility Type] = @original_Facility_Type AND [Document Received] = @original_Document_Received AND [Enter By] = @original_Enter_By AND [Second Verifier] = @original_Second_Verifier AND [Completion Date] = @original_Completion_Date AND [Remark] = @original_Remark AND (([Inserted By] = @original_Inserted_By) OR ([Inserted By] IS NULL AND @original_Inserted_By IS NULL)) AND (([Updated By] = @original_Updated_By) OR ([Updated By] IS NULL AND @original_Updated_By IS NULL)) AND (([Approved By] = @original_Approved_By) OR ([Approved By] IS NULL AND @original_Approved_By IS NULL))" ConflictDetection="CompareAllValues" OldValuesParameterFormatString="original_{0}">
   <DeleteParameters>
      <asp:Parameter Name="original_id" Type="Int32" />
      <asp:Parameter Name="original_Received_Date" Type="String" />
      <asp:Parameter Name="original_Company_Name" Type="String" />
      <asp:Parameter Name="original_Approval_Number" Type="String" />
      <asp:Parameter Name="original_Facility_Type" Type="String" />
      <asp:Parameter Name="original_Document_Received" Type="String" />
      <asp:Parameter Name="original_Enter_By" Type="String" />
      <asp:Parameter Name="original_Second_Verifier" Type="String" />
      <asp:Parameter Name="original_Completion_Date" Type="String" />
      <asp:Parameter Name="original_Remark" Type="String" />
      <asp:Parameter Name="original_Inserted_By" Type="String" />
      <asp:Parameter Name="original_Updated_By" Type="String" />
      <asp:Parameter Name="original_Approved_By" Type="String" />
   </DeleteParameters>
   <InsertParameters>
      <asp:Parameter Name="Received_Date" Type="String" />
      <asp:Parameter Name="Company_Name" Type="String" />
      <asp:Parameter Name="Approval_Number" Type="String" />
      <asp:Parameter Name="Facility_Type" Type="String" />
      <asp:Parameter Name="Document_Received" Type="String" />
      <asp:Parameter Name="Enter_By" Type="String" />
      <asp:Parameter Name="Second_Verifier" Type="String" />
      <asp:Parameter Name="Completion_Date" Type="String" />
      <asp:Parameter Name="Remark" Type="String" />
      <asp:Parameter Name="Inserted_By" Type="String" />
      <asp:Parameter Name="Updated_By" Type="String" />
      <asp:Parameter Name="Approved_By" Type="String" />
   </InsertParameters>
   <UpdateParameters>
      <asp:Parameter Name="Received_Date" Type="String" />
      <asp:Parameter Name="Company_Name" Type="String" />
      <asp:Parameter Name="Approval_Number" Type="String" />
      <asp:Parameter Name="Facility_Type" Type="String" />
      <asp:Parameter Name="Document_Received" Type="String" />
      <asp:Parameter Name="Enter_By" Type="String" />
      <asp:Parameter Name="Second_Verifier" Type="String" />
      <asp:Parameter Name="Completion_Date" Type="String" />
      <asp:Parameter Name="Remark" Type="String" />
      <asp:Parameter Name="Inserted_By" Type="String" />
      <asp:Parameter Name="Updated_By" Type="String" />
      <asp:Parameter Name="Approved_By" Type="String" />
      <asp:Parameter Name="original_id" Type="Int32" />
      <asp:Parameter Name="original_Received_Date" Type="String" />
      <asp:Parameter Name="original_Company_Name" Type="String" />
      <asp:Parameter Name="original_Approval_Number" Type="String" />
      <asp:Parameter Name="original_Facility_Type" Type="String" />
      <asp:Parameter Name="original_Document_Received" Type="String" />
      <asp:Parameter Name="original_Enter_By" Type="String" />
      <asp:Parameter Name="original_Second_Verifier" Type="String" />
      <asp:Parameter Name="original_Completion_Date" Type="String" />
      <asp:Parameter Name="original_Remark" Type="String" />
      <asp:Parameter Name="original_Inserted_By" Type="String" />
      <asp:Parameter Name="original_Updated_By" Type="String" />
      <asp:Parameter Name="original_Approved_By" Type="String" />
   </UpdateParameters>
</asp:SqlDataSource>
</asp:Content>
