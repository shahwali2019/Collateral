<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MTR.aspx.cs" Inherits="Collateral_int.MTR" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <header>
        <link href="Content/bootstrap.min.css" rel="stylesheet" />
        <script src="Scripts/bootstrap.min.js"></script>
    <style>
        .center{
            font-size:14px;
            font-family:Bahnschrift;
            text-align:center;
        }
    </style>
    </header>
    
    <div class="container">
        <div style="text-align: center; height: 100px; margin-top: 10px;" class="alert alert-success" role="alert">
            <h4 class="alert-heading" style="font-family: Bahnschrift;"><strong>MANULAL TRANSACTION RECORDS</strong></h4>
        </div>
        <div class="row">
            <div class="col-md-2">
                <div class="form-group-sm">
                    <asp:Label ID="Label1" runat="server" Text="Client Name" Font-Names="Bahnschrift" Font-Size="X-Small"></asp:Label>
                    <asp:TextBox ID="txtClientName" placeholder="" runat="server" CssClass="form-control" Font-Names="Bahnschrift" Font-Size="Small"></asp:TextBox>
                </div>

            </div>


            <div class="col-md-2">
                <div class="form-group-sm">
                    <asp:Label ID="Label2" runat="server" Text="Booking Date" Font-Names="Bahnschrift" Font-Size="X-Small"></asp:Label>
                    <asp:TextBox ID="txtBookingDate" TextMode="Date" runat="server" CssClass="form-control" Font-Names="Bahnschrift" Font-Size="Small"></asp:TextBox>
                </div>
            </div>
        </div>
        <br />
         <div class="row">
                <div class="col-md-6">
                    <asp:Button ID="btnFind" runat="server" Text="FIND" CssClass="btn btn-success"  Font-Names="Bahnschrift" Font-Size="Small" Width="59px" Height="33px" OnClick="btnFind_Click" />
                </div>

            </div>
        <asp:Label ID="resultLbl" runat="server" Font-Names="Bahnschrift" Font-Size="X-Small" ForeColor="Red" Text="Label" Visible="False"></asp:Label>
        <br />

         <div class="row">
                <div class="col-md-6">
                    <asp:ImageButton ID="excelfile" runat="server" Height="23px" ImageUrl="~/image/excel1.png" Width="25px" ToolTip="Convert to Excel" OnClick="excelfile_Click" />
                    <asp:ImageButton ID="newmtrIcon" runat="server" Height="23px" ImageUrl="~/image/add.png" Width="25px" ToolTip="Convert to Excel" OnClick="newmtrIcon_Click" />
                </div>
            </div>

    </div>
    <asp:CheckBox ID="All" runat="server" AutoPostBack="True" OnCheckedChanged="All_CheckedChanged" Text="All" Font-Names="Bahnschrift" Font-Size="XX-Small" />
    <br />

    <div class="row" style="">
        <div class="col-md-12" >
            <asp:GridView CssClass="table table-responsive" ShowHeaderWhenEmpty="True" ID="GridView1" OnRowCommand="GridView1_RowCommand" runat="server" AutoGenerateColumns="False" DataKeyNames="id" Font-Names="Bahnschrift" DataSourceID="MTRSqlSource" BackColor="White" BorderColor="White" BorderStyle="None" BorderWidth="1px" CellPadding="4" GridLines="Horizontal" Width="967px">
                <Columns>
                    <%-- <asp:CommandField ShowSelectButton="True" ShowHeader="true" HeaderText="SELECT" />--%>
                    <%-- <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />--%>
                       <%-- <asp:BoundField DataField="InsertedBy" HeaderText="InsertedBy" SortExpression="InsertedBy" />
                     <asp:BoundField DataField="ApprovedBy" HeaderText="ApprovedBy" SortExpression="ApprovedBy" />
                                    <asp:BoundField DataField="UpdatedBy" HeaderText="UpdatedBy" SortExpression="UpdatedBy" />--%>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:CheckBox ID="chkb1" runat="server" OnCheckedChanged="chkb1_CheckedChanged" AutoPostBack="true" />
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
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" CommandArgument='<%# Bind("id") %>' Text="Edit"></asp:LinkButton>
                        </ItemTemplate>
                        <ControlStyle CssClass="center" />
                        <HeaderStyle CssClass="center" />
                        <ItemStyle CssClass="center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Name" SortExpression="Client Name">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("[Client Name]") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("[Client Name]") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Ref" SortExpression="Memo Ref">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("[Memo Ref]") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("[Memo Ref]") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="D_Account" SortExpression="Debit Account">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("[Debit Account]") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("[Debit Account]") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="C_Account" SortExpression="Credit Account">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("[Credit Account]") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("[Credit Account]") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="T_Code" SortExpression="Transaction Code">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("[Transaction Code]") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("[Transaction Code]") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Memo" SortExpression="Memo Submission">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("[Memo Submission]") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("[Memo Submission]") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Amount" SortExpression="Amount">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Amount") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("Amount") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Currency" SortExpression="Currency">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("Currency") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label8" runat="server" Text='<%# Bind("Currency") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Heading" SortExpression="Heading">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("Heading") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label9" runat="server" Text='<%# Bind("Heading") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Detail" SortExpression="Transaction Detail">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("[Transaction Detail]") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label10" runat="server" Text='<%# Bind("[Transaction Detail]") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Booding Date" SortExpression="Booding Date">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("[Booding Date]") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label11" runat="server" Text='<%# Bind("[Booding Date]") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Value Date" SortExpression="Value Date">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox12" runat="server" Text='<%# Bind("[Value Date]") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label12" runat="server" Text='<%# Bind("[Value Date]") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Status" SortExpression="Status">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox13" runat="server" Text='<%# Bind("Status") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label13" runat="server" Text='<%# Bind("Status") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Remark" SortExpression="Remark">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox14" runat="server" Text='<%# Bind("Remark") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label14" runat="server" Text='<%# Bind("Remark") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Inserted By" SortExpression="InsertedBy">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox17" runat="server" Text='<%# Bind("InsertedBy") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label17" runat="server" Text='<%# Bind("InsertedBy") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Updated By" SortExpression="UpdatedBy">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox16" runat="server" Text='<%# Bind("UpdatedBy") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label16" runat="server" Text='<%# Bind("UpdatedBy") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Approved By" SortExpression="ApprovedBy">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox15" runat="server" Text='<%# Bind("ApprovedBy") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label15" runat="server" Text='<%# Bind("ApprovedBy") %>'></asp:Label>
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
            <asp:SqlDataSource ID="MTRSqlSource" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:DBCon %>" DeleteCommand="DELETE FROM [mtr] WHERE [id] = @original_id AND [Client Name] = @original_Client_Name AND [Memo Ref] = @original_Memo_Ref AND [Debit Account] = @original_Debit_Account AND [Credit Account] = @original_Credit_Account AND (([Transaction Code] = @original_Transaction_Code) OR ([Transaction Code] IS NULL AND @original_Transaction_Code IS NULL)) AND [Memo Submission] = @original_Memo_Submission AND (([Amount] = @original_Amount) OR ([Amount] IS NULL AND @original_Amount IS NULL)) AND (([Currency] = @original_Currency) OR ([Currency] IS NULL AND @original_Currency IS NULL)) AND (([Heading] = @original_Heading) OR ([Heading] IS NULL AND @original_Heading IS NULL)) AND (([Transaction Detail] = @original_Transaction_Detail) OR ([Transaction Detail] IS NULL AND @original_Transaction_Detail IS NULL)) AND (([Booding Date] = @original_Booding_Date) OR ([Booding Date] IS NULL AND @original_Booding_Date IS NULL)) AND (([Value Date] = @original_Value_Date) OR ([Value Date] IS NULL AND @original_Value_Date IS NULL)) AND (([Status] = @original_Status) OR ([Status] IS NULL AND @original_Status IS NULL)) AND (([Remark] = @original_Remark) OR ([Remark] IS NULL AND @original_Remark IS NULL)) AND (([InsertedBy] = @original_InsertedBy) OR ([InsertedBy] IS NULL AND @original_InsertedBy IS NULL)) AND (([ApprovedBy] = @original_ApprovedBy) OR ([ApprovedBy] IS NULL AND @original_ApprovedBy IS NULL)) AND (([UpdatedBy] = @original_UpdatedBy) OR ([UpdatedBy] IS NULL AND @original_UpdatedBy IS NULL))" InsertCommand="INSERT INTO [mtr] ([Client Name], [Memo Ref], [Debit Account], [Credit Account], [Transaction Code], [Memo Submission], [Amount], [Currency], [Heading], [Transaction Detail], [Booding Date], [Value Date], [Status], [Remark], [InsertedBy], [ApprovedBy], [UpdatedBy]) VALUES (@Client_Name, @Memo_Ref, @Debit_Account, @Credit_Account, @Transaction_Code, @Memo_Submission, @Amount, @Currency, @Heading, @Transaction_Detail, @Booding_Date, @Value_Date, @Status, @Remark, @InsertedBy, @ApprovedBy, @UpdatedBy)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [mtr]" UpdateCommand="UPDATE [mtr] SET [Client Name] = @Client_Name, [Memo Ref] = @Memo_Ref, [Debit Account] = @Debit_Account, [Credit Account] = @Credit_Account, [Transaction Code] = @Transaction_Code, [Memo Submission] = @Memo_Submission, [Amount] = @Amount, [Currency] = @Currency, [Heading] = @Heading, [Transaction Detail] = @Transaction_Detail, [Booding Date] = @Booding_Date, [Value Date] = @Value_Date, [Status] = @Status, [Remark] = @Remark, [InsertedBy] = @InsertedBy, [ApprovedBy] = @ApprovedBy, [UpdatedBy] = @UpdatedBy WHERE [id] = @original_id AND [Client Name] = @original_Client_Name AND [Memo Ref] = @original_Memo_Ref AND [Debit Account] = @original_Debit_Account AND [Credit Account] = @original_Credit_Account AND (([Transaction Code] = @original_Transaction_Code) OR ([Transaction Code] IS NULL AND @original_Transaction_Code IS NULL)) AND [Memo Submission] = @original_Memo_Submission AND (([Amount] = @original_Amount) OR ([Amount] IS NULL AND @original_Amount IS NULL)) AND (([Currency] = @original_Currency) OR ([Currency] IS NULL AND @original_Currency IS NULL)) AND (([Heading] = @original_Heading) OR ([Heading] IS NULL AND @original_Heading IS NULL)) AND (([Transaction Detail] = @original_Transaction_Detail) OR ([Transaction Detail] IS NULL AND @original_Transaction_Detail IS NULL)) AND (([Booding Date] = @original_Booding_Date) OR ([Booding Date] IS NULL AND @original_Booding_Date IS NULL)) AND (([Value Date] = @original_Value_Date) OR ([Value Date] IS NULL AND @original_Value_Date IS NULL)) AND (([Status] = @original_Status) OR ([Status] IS NULL AND @original_Status IS NULL)) AND (([Remark] = @original_Remark) OR ([Remark] IS NULL AND @original_Remark IS NULL)) AND (([InsertedBy] = @original_InsertedBy) OR ([InsertedBy] IS NULL AND @original_InsertedBy IS NULL)) AND (([ApprovedBy] = @original_ApprovedBy) OR ([ApprovedBy] IS NULL AND @original_ApprovedBy IS NULL)) AND (([UpdatedBy] = @original_UpdatedBy) OR ([UpdatedBy] IS NULL AND @original_UpdatedBy IS NULL))">
                <DeleteParameters>
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
                </DeleteParameters>
                <InsertParameters>
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
                    <asp:Parameter DbType="Date" Name="Booding_Date" />
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
                    <asp:Parameter DbType="Date" Name="Booding_Date" />
                    <asp:Parameter DbType="Date" Name="Value_Date" />
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
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </div>

    </div>

    <br />
    <br />


</asp:Content>
