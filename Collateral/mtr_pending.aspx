<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="mtr_pending.aspx.cs" Inherits="Collateral.mtr_pending" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

     ظ<br />
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
             <p>
                 <asp:Label ID="Label19" runat="server" Text="Label"></asp:Label>
             <hr style="margin-left:5px;border-bottom:5px solid #003399; background-color: #00FF00;" class="auto-style2" />
              <div style="margin-top:-15px;">
         <asp:Label ID="updateLbl" runat="server" Font-Size="Small" Text="Label" Visible="False" Font-Names="Bahnschrift" ForeColor="Red"></asp:Label>
               </div>
              <div style="margin-top:-15px;">
 <asp:Label ID="insertLbl" runat="server" Font-Size="Small" Text="Label" Visible="False" Font-Names="Bahnschrift" ForeColor="Red"></asp:Label>
   </div>

          
                    <asp:GridView ID="GridView2" OnRowCommand="GridView2_RowCommand1"   runat="server" ShowHeaderWhenEmpty="True" AllowSorting="True" CssClass="auto-style1" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC"
               BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="id" DataSourceID="SqlCon2" PageSize="7" Width="1172px" Visible="False" > <%-- OnSelectedIndexChanged="GridView2_SelectedIndexChanged"--%>
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

                  
                   <asp:TemplateField HeaderText="Client Name" SortExpression="Client Name">
                       <EditItemTemplate>
                           <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("[Client Name]") %>'></asp:TextBox>
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="Label2" runat="server" Text='<%# Bind("[Client Name]") %>'></asp:Label>
                       </ItemTemplate>
                       <HeaderStyle CssClass="center" />
                       <ItemStyle CssClass="center" />
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="Memo Ref" SortExpression="Memo Ref">
                       <EditItemTemplate>
                           <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("[Memo Ref]") %>'></asp:TextBox>
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="Label3" runat="server" Text='<%# Bind("[Memo Ref]") %>'></asp:Label>
                       </ItemTemplate>
                       <ControlStyle CssClass="center" />
                       <HeaderStyle CssClass="center" />
                       <ItemStyle CssClass="center" />
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="Debit Account" SortExpression="Debit Account">
                       <EditItemTemplate>
                           <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("[Debit Account]") %>'></asp:TextBox>
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="Label4" runat="server" Text='<%# Bind("[Debit Account]") %>'></asp:Label>
                       </ItemTemplate>
                       <ControlStyle CssClass="center" />
                       <HeaderStyle CssClass="center" />
                       <ItemStyle CssClass="center" />
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="Credit Account" SortExpression="Credit Account">
                       <EditItemTemplate>
                           <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("[Credit Account]") %>'></asp:TextBox>
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="Label5" runat="server" Text='<%# Bind("[Credit Account]") %>'></asp:Label>
                       </ItemTemplate>
                       <HeaderStyle CssClass="center" />
                       <ItemStyle CssClass="center" />
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="Transaction Code" SortExpression="Transaction Code">
                       <EditItemTemplate>
                           <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("[Transaction Code]") %>'></asp:TextBox>
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="Label6" runat="server" Text='<%# Bind("[Transaction Code]") %>'></asp:Label>
                       </ItemTemplate>
                       <ControlStyle CssClass="center" />
                       <HeaderStyle CssClass="center" />
                       <ItemStyle CssClass="center" />
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="Memo Submission" SortExpression="Memo Submission">
                       <EditItemTemplate>
                           <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("[Memo Submission]") %>'></asp:TextBox>
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="Label7" runat="server" Text='<%# Bind("[Memo Submission]") %>'></asp:Label>
                       </ItemTemplate>
                       <ControlStyle CssClass="center" />
                       <HeaderStyle CssClass="center" />
                       <ItemStyle CssClass="center" />
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="Amount" SortExpression="Amount">
                       <EditItemTemplate>
                           <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Amount") %>'></asp:TextBox>
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="Label8" runat="server" Text='<%# Bind("Amount") %>'></asp:Label>
                       </ItemTemplate>
                       <ControlStyle CssClass="center" />
                       <HeaderStyle CssClass="center" />
                       <ItemStyle CssClass="center" />
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="Currency" SortExpression="Currency">
                       <EditItemTemplate>
                           <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("Currency") %>'></asp:TextBox>
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="Label9" runat="server" Text='<%# Bind("Currency") %>'></asp:Label>
                       </ItemTemplate>
                        <ControlStyle CssClass="center" />
                       <HeaderStyle CssClass="center" />
                       <ItemStyle CssClass="center" />
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="Heading" SortExpression="Heading">
                       <EditItemTemplate>
                           <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("Heading") %>'></asp:TextBox>
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="Label10" runat="server" Text='<%# Bind("Heading") %>'></asp:Label>
                       </ItemTemplate>
                        <ControlStyle CssClass="center" />
                       <HeaderStyle CssClass="center" />
                       <ItemStyle CssClass="center" />
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="Transaction Detail" SortExpression="Transaction Detail">
                       <EditItemTemplate>
                           <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("[Transaction Detail]") %>'></asp:TextBox>
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="Label11" runat="server" Text='<%# Bind("[Transaction Detail]") %>'></asp:Label>
                       </ItemTemplate>
                        <ControlStyle CssClass="center" />
                       <HeaderStyle CssClass="center" />
                       <ItemStyle CssClass="center" />
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="Booding Date" SortExpression="Booding Date">
                       <EditItemTemplate>
                           <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("[Booding Date]") %>'></asp:TextBox>
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="Label12" runat="server" Text='<%# Bind("[Booding Date]") %>'></asp:Label>
                       </ItemTemplate>
                        <ControlStyle CssClass="center" />
                       <HeaderStyle CssClass="center" />
                       <ItemStyle CssClass="center" />
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="Value Date" SortExpression="Value Date">
                       <EditItemTemplate>
                           <asp:TextBox ID="TextBox12" runat="server" Text='<%# Bind("[Value Date]") %>'></asp:TextBox>
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="Label13" runat="server" Text='<%# Bind("[Value Date]") %>'></asp:Label>
                       </ItemTemplate>
                        <ControlStyle CssClass="center" />
                       <HeaderStyle CssClass="center" />
                       <ItemStyle CssClass="center" />
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="Status" SortExpression="Status">
                       <EditItemTemplate>
                           <asp:TextBox ID="TextBox13" runat="server" Text='<%# Bind("Status") %>'></asp:TextBox>
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="Label14" runat="server" Text='<%# Bind("Status") %>'></asp:Label>
                       </ItemTemplate>
                        <ControlStyle CssClass="center" />
                       <HeaderStyle CssClass="center" />
                       <ItemStyle CssClass="center" />
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="Remark" SortExpression="Remark">
                       <EditItemTemplate>
                           <asp:TextBox ID="TextBox14" runat="server" Text='<%# Bind("Remark") %>'></asp:TextBox>
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="Label15" runat="server" Text='<%# Bind("Remark") %>'></asp:Label>
                       </ItemTemplate>
                        <ControlStyle CssClass="center" />
                       <HeaderStyle CssClass="center" />
                       <ItemStyle CssClass="center" />
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="InsertedBy" SortExpression="InsertedBy">
                       <EditItemTemplate>
                           <asp:TextBox ID="TextBox15" runat="server" Text='<%# Bind("InsertedBy") %>'></asp:TextBox>
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="Label16" runat="server" Text='<%# Bind("InsertedBy") %>'></asp:Label>
                       </ItemTemplate>
                        <ControlStyle CssClass="center" />
                       <HeaderStyle CssClass="center" />
                       <ItemStyle CssClass="center" />
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="ApprovedBy" SortExpression="ApprovedBy">
                       <EditItemTemplate>
                           <asp:TextBox ID="TextBox16" runat="server" Text='<%# Bind("ApprovedBy") %>'></asp:TextBox>
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="Label17" runat="server" Text='<%# Bind("ApprovedBy") %>'></asp:Label>
                       </ItemTemplate>
                        <ControlStyle CssClass="center" />
                       <HeaderStyle CssClass="center" />
                       <ItemStyle CssClass="center" />
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="UpdatedBy" SortExpression="UpdatedBy">
                       <EditItemTemplate>
                           <asp:TextBox ID="TextBox17" runat="server" Text='<%# Bind("UpdatedBy") %>'></asp:TextBox>
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="Label18" runat="server" Text='<%# Bind("UpdatedBy") %>'></asp:Label>
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

                 
         <asp:SqlDataSource ID="SqlCon2" runat="server" ConnectionString="<%$ ConnectionStrings:DBCon %>" SelectCommand="SELECT * FROM [mtr_insert]" DeleteCommand="DELETE FROM [mtr_insert] WHERE [id] = @id">
<%--         <asp:SqlDataSource ID="SqlCon2" runat="server" ConnectionString="<%$ ConnectionStrings:DBCon %>" 
            DeleteCommand="DELETE FROM [mtr_insert] WHERE [id] = @id))"--%>
<%--            InsertCommand="INSERT INTO [mtr_insert] ([Client Name], [Memo Ref], [Debit Account], [Credit Account], [Transaction Code], [Memo Submission], [Amount], [Currency], [Heading], [Transaction Detail], [Booding Date], [Value Date], [Status], [Remark], [InsertedBy], [ApprovedBy], [UpdatedBy]) VALUES (@Client_Name, @Memo_Ref, @Debit_Account, @Credit_Account, @Transaction_Code, @Memo_Submission, @Amount, @Currency, @Heading, @Transaction_Detail, @Booding_Date, @Value_Date, @Status, @Remark, @InsertedBy, @ApprovedBy, @UpdatedBy)"--%>
<%--            SelectCommand="SELECT * FROM [mtr_insert]" UpdateCommand="UPDATE [mtr_insert] SET [Client Name] = @Client_Name, [Memo Ref] = @Memo_Ref, [Debit Account] = @Debit_Account, [Credit Account] = @Credit_Account, [Transaction Code] = @Transaction_Code, [Memo Submission] = @Memo_Submission, [Amount] = @Amount, [Currency] = @Currency, [Heading] = @Heading, [Transaction Detail] = @Transaction_Detail, [Booding Date] = @Booding_Date, [Value Date] = @Value_Date, [Status] = @Status, [Remark] = @Remark, [InsertedBy] = @InsertedBy, [ApprovedBy] = @ApprovedBy, [UpdatedBy] = @UpdatedBy WHERE [id] = @original_id AND [Client Name] = @original_Client_Name AND [Memo Ref] = @original_Memo_Ref AND [Debit Account] = @original_Debit_Account AND [Credit Account] = @original_Credit_Account AND (([Transaction Code] = @original_Transaction_Code) OR ([Transaction Code] IS NULL AND @original_Transaction_Code IS NULL)) AND [Memo Submission] = @original_Memo_Submission AND (([Amount] = @original_Amount) OR ([Amount] IS NULL AND @original_Amount IS NULL)) AND (([Currency] = @original_Currency) OR ([Currency] IS NULL AND @original_Currency IS NULL)) AND (([Heading] = @original_Heading) OR ([Heading] IS NULL AND @original_Heading IS NULL)) AND (([Transaction Detail] = @original_Transaction_Detail) OR ([Transaction Detail] IS NULL AND @original_Transaction_Detail IS NULL)) AND (([Booding Date] = @original_Booding_Date) OR ([Booding Date] IS NULL AND @original_Booding_Date IS NULL)) AND (([Value Date] = @original_Value_Date) OR ([Value Date] IS NULL AND @original_Value_Date IS NULL)) AND (([Status] = @original_Status) OR ([Status] IS NULL AND @original_Status IS NULL)) AND (([Remark] = @original_Remark) OR ([Remark] IS NULL AND @original_Remark IS NULL)) AND (([InsertedBy] = @original_InsertedBy) OR ([InsertedBy] IS NULL AND @original_InsertedBy IS NULL)) AND (([ApprovedBy] = @original_ApprovedBy) OR ([ApprovedBy] IS NULL AND @original_ApprovedBy IS NULL)) AND (([UpdatedBy] = @original_UpdatedBy) OR ([UpdatedBy] IS NULL AND @original_UpdatedBy IS NULL))" ConflictDetection="CompareAllValues" OldValuesParameterFormatString="original_{0}" >--%>
             <DeleteParameters>
                  <asp:Parameter Name="id" Type="Int32" DefaultValue="0" />
<%--                 <asp:Parameter Name="original_Client_Name" Type="String" />
                 <asp:Parameter Name="original_Memo_Ref" Type="String" />
                 <asp:Parameter Name="original_Debit_Account" Type="String" />
                 <asp:Parameter Name="original_Credit_Account" Type="String" />
                 <asp:Parameter Name="original_Transaction_Code" Type="String" />
                 <asp:Parameter Name="original_Memo_Submission" Type="String" />
                 <asp:Parameter Name="original_Amount" Type="String" />
                 <asp:Parameter Name="original_Currency" Type="String" />
                 <asp:Parameter Name="original_Heading" Type="String" />
                 <asp:Parameter Name="original_Transaction_Detail" Type="String" />
                 <asp:Parameter DbType="Date" Name="original_Booding_Date" />
                 <asp:Parameter DbType="Date" Name="original_Value_Date" />
                 <asp:Parameter Name="original_Status" Type="String" />
                 <asp:Parameter Name="original_Remark" Type="String" />
                 <asp:Parameter Name="original_InsertedBy" Type="String" />
                 <asp:Parameter Name="original_ApprovedBy" Type="String" />
                 <asp:Parameter Name="original_UpdatedBy" Type="String" />--%>
             </DeleteParameters>
<%--             <InsertParameters>
                 <asp:Parameter Name="Client_Name" Type="String" />
                 <asp:Parameter Name="Memo_Ref" Type="String" />
                 <asp:Parameter Name="Debit_Account" Type="String" />
                 <asp:Parameter Name="Credit_Account" Type="String" />
                 <asp:Parameter Name="Transaction_Code" Type="String" />
                 <asp:Parameter Name="Memo_Submission" Type="String" />
                 <asp:Parameter Name="Amount" Type="String" />
                 <asp:Parameter Name="Currency" Type="String" />
                 <asp:Parameter Name="Heading" Type="String" />
                 <asp:Parameter Name="Transaction_Detail" Type="String" />
                 <asp:Parameter Name="Booding_Date" DbType="Date" />
                 <asp:Parameter DbType="Date" Name="Value_Date" />
                 <asp:Parameter Name="Status" Type="String" />
                 <asp:Parameter Name="Remark" Type="String" />
                 <asp:Parameter Name="InsertedBy" Type="String" />
                 <asp:Parameter Name="ApprovedBy" Type="String" />
                 <asp:Parameter Name="UpdatedBy" Type="String" />
             </InsertParameters>
             <UpdateParameters>
                 <asp:Parameter Name="Client_Name" Type="String" />
                 <asp:Parameter Name="Memo_Ref" Type="String" />
                 <asp:Parameter Name="Debit_Account" Type="String" />
                 <asp:Parameter Name="Credit_Account" Type="String" />
                 <asp:Parameter Name="Transaction_Code" Type="String" />
                 <asp:Parameter Name="Memo_Submission" Type="String" />
                 <asp:Parameter Name="Amount" Type="String" />
                 <asp:Parameter Name="Currency" Type="String" />
                 <asp:Parameter Name="Heading" Type="String" />
                 <asp:Parameter Name="Transaction_Detail" Type="String" />
                 <asp:Parameter Name="Booding_Date" DbType="Date" />
                 <asp:Parameter Name="Value_Date" DbType="Date" />
                 <asp:Parameter Name="Status" Type="String" />
                 <asp:Parameter Name="Remark" Type="String" />
                 <asp:Parameter Name="InsertedBy" Type="String" />
                 <asp:Parameter Name="ApprovedBy" Type="String" />
                 <asp:Parameter Name="UpdatedBy" Type="String" />
                 <asp:Parameter Name="original_id" Type="Int32" />
                 <asp:Parameter Name="original_Client_Name" Type="String" />
                 <asp:Parameter Name="original_Memo_Ref" Type="String" />
                 <asp:Parameter Name="original_Debit_Account" Type="String" />
                 <asp:Parameter Name="original_Credit_Account" Type="String" />
                 <asp:Parameter Name="original_Transaction_Code" Type="String" />
                 <asp:Parameter Name="original_Memo_Submission" Type="String" />
                 <asp:Parameter Name="original_Amount" Type="String" />
                 <asp:Parameter Name="original_Currency" Type="String" />
                 <asp:Parameter Name="original_Heading" Type="String" />
                 <asp:Parameter Name="original_Transaction_Detail" Type="String" />
                 <asp:Parameter DbType="Date" Name="original_Booding_Date" />
                 <asp:Parameter DbType="Date" Name="original_Value_Date" />
                 <asp:Parameter Name="original_Status" Type="String" />
                 <asp:Parameter Name="original_Remark" Type="String" />
                 <asp:Parameter Name="original_InsertedBy" Type="String" />
                 <asp:Parameter Name="original_ApprovedBy" Type="String" />
                 <asp:Parameter Name="original_UpdatedBy" Type="String" />
             </UpdateParameters>--%>
        </asp:SqlDataSource>
             <div style="margin-top:-5px;">
                    <asp:GridView ID="GridView3" OnRowCommand="GridView3_RowCommand1"   runat="server" ShowHeaderWhenEmpty="True"
               AllowSorting="True" CssClass="auto-style1" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC"
               BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlConUpdate" PageSize="7" Width="1172px" Visible="False" > <%-- OnSelectedIndexChanged="GridView3_SelectedIndexChanged"--%>
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
                            <asp:TemplateField HeaderText="Client Name" SortExpression="Client Name">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("[Client Name]") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("[Client Name]") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle CssClass="center" />
                                <HeaderStyle CssClass="center" />
                                <ItemStyle CssClass="center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Memo Ref" SortExpression="Memo Ref">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("[Memo Ref]") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("[Memo Ref]") %>'></asp:Label>
                                </ItemTemplate>
                                   <ControlStyle CssClass="center" />
                                <HeaderStyle CssClass="center" />
                                <ItemStyle CssClass="center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Debit Account" SortExpression="Debit Account">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("[Debit Account]") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("[Debit Account]") %>'></asp:Label>
                                </ItemTemplate>
                                   <ControlStyle CssClass="center" />
                                <HeaderStyle CssClass="center" />
                                <ItemStyle CssClass="center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Credit Account" SortExpression="Credit Account">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("[Credit Account]") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("[Credit Account]") %>'></asp:Label>
                                </ItemTemplate>
                                   <ControlStyle CssClass="center" />
                                <HeaderStyle CssClass="center" />
                                <ItemStyle CssClass="center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Transaction Code" SortExpression="Transaction Code">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("[Transaction Code]") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("[Transaction Code]") %>'></asp:Label>
                                </ItemTemplate>
                                   <ControlStyle CssClass="center" />
                                <HeaderStyle CssClass="center" />
                                <ItemStyle CssClass="center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Memo Submission" SortExpression="Memo Submission">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("[Memo Submission]") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("[Memo Submission]") %>'></asp:Label>
                                </ItemTemplate>
                                   <ControlStyle CssClass="center" />
                                <HeaderStyle CssClass="center" />
                                <ItemStyle CssClass="center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Amount" SortExpression="Amount">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Amount") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("Amount") %>'></asp:Label>
                                </ItemTemplate>
                                   <ControlStyle CssClass="center" />
                                <HeaderStyle CssClass="center" />
                                <ItemStyle CssClass="center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Currency" SortExpression="Currency">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("Currency") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label9" runat="server" Text='<%# Bind("Currency") %>'></asp:Label>
                                </ItemTemplate>
                                   <ControlStyle CssClass="center" />
                                <HeaderStyle CssClass="center" />
                                <ItemStyle CssClass="center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Heading" SortExpression="Heading">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("Heading") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label10" runat="server" Text='<%# Bind("Heading") %>'></asp:Label>
                                </ItemTemplate>
                                   <ControlStyle CssClass="center" />
                                <HeaderStyle CssClass="center" />
                                <ItemStyle CssClass="center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Transaction Detail" SortExpression="Transaction Detail">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("[Transaction Detail]") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label11" runat="server" Text='<%# Bind("[Transaction Detail]") %>'></asp:Label>
                                </ItemTemplate>
                                   <ControlStyle CssClass="center" />
                                <HeaderStyle CssClass="center" />
                                <ItemStyle CssClass="center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Booding Date" SortExpression="Booding Date">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("[Booding Date]") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label12" runat="server" Text='<%# Bind("[Booding Date]") %>'></asp:Label>
                                </ItemTemplate>
                                   <ControlStyle CssClass="center" />
                                <HeaderStyle CssClass="center" />
                                <ItemStyle CssClass="center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Value Date" SortExpression="Value Date">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox12" runat="server" Text='<%# Bind("[Value Date]") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label13" runat="server" Text='<%# Bind("[Value Date]") %>'></asp:Label>
                                </ItemTemplate>
                                   <ControlStyle CssClass="center" />
                                <HeaderStyle CssClass="center" />
                                <ItemStyle CssClass="center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Status" SortExpression="Status">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox13" runat="server" Text='<%# Bind("Status") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label14" runat="server" Text='<%# Bind("Status") %>'></asp:Label>
                                </ItemTemplate>
                                   <ControlStyle CssClass="center" />
                                <HeaderStyle CssClass="center" />
                                <ItemStyle CssClass="center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Remark" SortExpression="Remark">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox14" runat="server" Text='<%# Bind("Remark") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label15" runat="server" Text='<%# Bind("Remark") %>'></asp:Label>
                                </ItemTemplate>
                                   <ControlStyle CssClass="center" />
                                <HeaderStyle CssClass="center" />
                                <ItemStyle CssClass="center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="InsertedBy" SortExpression="InsertedBy">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox15" runat="server" Text='<%# Bind("InsertedBy") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label16" runat="server" Text='<%# Bind("InsertedBy") %>'></asp:Label>
                                </ItemTemplate>
                                   <ControlStyle CssClass="center" />
                                <HeaderStyle CssClass="center" />
                                <ItemStyle CssClass="center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="ApprovedBy" SortExpression="ApprovedBy">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox16" runat="server" Text='<%# Bind("ApprovedBy") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label17" runat="server" Text='<%# Bind("ApprovedBy") %>'></asp:Label>
                                </ItemTemplate>
                                   <ControlStyle CssClass="center" />
                                <HeaderStyle CssClass="center" />
                                <ItemStyle CssClass="center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="UpdatedBy" SortExpression="UpdatedBy">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox17" runat="server" Text='<%# Bind("UpdatedBy") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label18" runat="server" Text='<%# Bind("UpdatedBy") %>'></asp:Label>
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
         SelectCommand="SELECT * FROM [mtr_update]" 
         >
        
     </asp:SqlDataSource>





   
  </div>



</asp:Content>
