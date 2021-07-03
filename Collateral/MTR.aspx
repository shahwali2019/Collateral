<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MTR.aspx.cs" Inherits="Collateral.MTR" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="Scripts/bootstrap.min.js"></script>
    <style type="text/css">
        table {
            font: normal 11px "Trebuchet MS", Verdana, Arial;
            background: #fff;
            border: solid 1px rgba(0, 0, 0, .075);
        }

        td {
            padding: 3px 3px 3px 6px;
            color: #5D829B;
        }

        th {
            font-weight: bold;
            font-size: smaller;
            color: #fff;
            text-align:center;
            padding: 0px 3px 3px 6px;
            background: #286090
        }
 

    .GridPager a, .GridPager span
    {
        /*display: block;*/
        height: 20px;
        width: 20px;
        font-family:Bahnschrift;
        font-weight: bold;
        text-align: center;
        text-decoration: none;
    }
    .GridPager a
    {
       padding-right:5px;
       width:20px;
    }
    .GridPager span
    {
        /*background-color:#fff;*/
        /*color: #fff;*/
      
    }
    </style>




    <div style="text-align: center; height: 100px; margin-top: 10px;" class="alert alert-success" role="alert">
        <h4 class="alert-heading" style="font-family: Bahnschrift;"><strong>MANULAL TRANSACTION RECORDS</strong></h4>
    </div>
    <asp:Panel runat="server" DefaultButton="searchBtn">
        <table>
            <tr style="padding: 10px 10px;">
                <td>
                    <asp:TextBox ID="txtCname" placeholder="Client Name" runat="server" Height="31px" Width="168px" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Small" TabIndex="2" CssClass="form-control"></asp:TextBox></td>
                <td>&nbsp;</td>
                <td>
                    <asp:TextBox ID="txtBD" runat="server" TextMode="Date" placeholder="Booking Date" Height="31px" Width="143px" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Small" TabIndex="3" CssClass="form-control"></asp:TextBox>

                </td>
             
                <td>&nbsp;</td>
                <td>

                    <asp:Button ID="searchBtn" runat="server" CssClass="btn-primary focus" Font-Bold="True" Font-Size="Small" Height="31px" Text="Search" Width="67px" Font-Names="Bahnschrift" BorderStyle="None" OnClick="searchBtn_Click" />

                </td>
            </tr>
        </table>

    </asp:Panel>

    <div style="margin-left: 10px;">
        <asp:Label ID="resultLbl" runat="server" Font-Bold="True" Font-Size="Smaller" ForeColor="Red" Visible="False" Font-Names="Bahnschrift Condensed"></asp:Label>
    </div>

    <hr style="border-bottom: 5px solid #003399" />
    <div class="row">
        <div class="col-md-12">
            
            <asp:ImageButton ID="ConvertTOExc" runat="server" Height="16px" ImageUrl="~/image/excel1.png" Width="18px" ToolTip="Export to .xlsx(Excel)" OnClick="ConvertTOExc_Click" />
            
        </div>
    </div>
            
    <div>
              <div class="table">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">





        <asp:GridView CssClass="GridPager" ID="GridView1" runat="server" OnRowCommand="GridView1_RowCommand" ShowHeaderWhenEmpty="True" AutoGenerateColumns="False"  DataKeyNames="id" DataSourceID="StringCon" EnableTheming="True"  BorderStyle="None">
          
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
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" CommandArgument='<%# Bind("id") %>' Text="Edit"></asp:LinkButton>
                    </ItemTemplate>
                    <ControlStyle CssClass="center" />
                    <HeaderStyle CssClass="center" />
                    <ItemStyle CssClass="center" />
                </asp:TemplateField>

                <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" SortExpression="id" Visible="false">
                    <ControlStyle CssClass="center" />
                    <HeaderStyle CssClass="center" />
                    <ItemStyle CssClass="center" />
                </asp:BoundField>

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
                         <HeaderStyle CssClass="center" />
                         <ItemStyle CssClass="center" />
                     </asp:TemplateField>

                     <asp:TemplateField HeaderText="Amount" SortExpression="Amount">
                         <EditItemTemplate>
                             <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("[Amount]") %>'></asp:TextBox>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="Label8" runat="server" Text='<%# Bind("[Amount]") %>'></asp:Label>
                         </ItemTemplate>
                         <HeaderStyle CssClass="center" />
                         <ItemStyle CssClass="center" />
                     </asp:TemplateField>

                     <asp:TemplateField HeaderText="Currency" SortExpression="Currency">
                         <EditItemTemplate>
                             <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("[Currency]") %>'></asp:TextBox>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="Label9" runat="server" Text='<%# Bind("[Currency]") %>'></asp:Label>
                         </ItemTemplate>
                         <HeaderStyle CssClass="center" />
                         <ItemStyle CssClass="center" />
                     </asp:TemplateField>

                     <asp:TemplateField HeaderText="Heading" SortExpression="Heading">
                         <EditItemTemplate>
                             <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("[Heading]") %>'></asp:TextBox>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="Label10" runat="server" Text='<%# Bind("[Heading]") %>'></asp:Label>
                         </ItemTemplate>
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
                         <HeaderStyle CssClass="center" />
                         <ItemStyle CssClass="center" />
                     </asp:TemplateField>

                     <asp:TemplateField HeaderText="Status" SortExpression="Status">
                         <EditItemTemplate>
                             <asp:TextBox ID="TextBox13" runat="server" Text='<%# Bind("[Status]") %>'></asp:TextBox>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="Label14" runat="server" Text='<%# Bind("[Status]") %>'></asp:Label>
                         </ItemTemplate>
                         <HeaderStyle CssClass="center" />
                         <ItemStyle CssClass="center" />
                     </asp:TemplateField>

                     <asp:TemplateField HeaderText="Remark" SortExpression="Remark">
                         <EditItemTemplate>
                             <asp:TextBox ID="TextBox14" runat="server" Text='<%# Bind("[Remark]") %>'></asp:TextBox>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="Label15" runat="server" Text='<%# Bind("[Remark]") %>'></asp:Label>
                         </ItemTemplate>
                         <HeaderStyle CssClass="center" />
                         <ItemStyle CssClass="center" />
                     </asp:TemplateField>

                     <asp:TemplateField HeaderText="Inserted By" SortExpression="Inserted By">
                         <EditItemTemplate>
                             <asp:TextBox ID="TextBox15" runat="server" Text='<%# Bind("[InsertedBy]") %>'></asp:TextBox>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="Label16" runat="server" Text='<%# Bind("[InsertedBy]") %>'></asp:Label>
                         </ItemTemplate>
                         <HeaderStyle CssClass="center" />
                         <ItemStyle CssClass="center" />
                     </asp:TemplateField>

                     <asp:TemplateField HeaderText="Approved By" SortExpression="Approved By">
                         <EditItemTemplate>
                             <asp:TextBox ID="TextBox16" runat="server" Text='<%# Bind("[ApprovedBy]") %>'></asp:TextBox>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="Label17" runat="server" Text='<%# Bind("[ApprovedBy]") %>'></asp:Label>
                         </ItemTemplate>
                         <HeaderStyle CssClass="center" />
                         <ItemStyle CssClass="center" />
                     </asp:TemplateField>

                     <asp:TemplateField HeaderText="Updated By" SortExpression="Updated By">
                         <EditItemTemplate>
                             <asp:TextBox ID="TextBox17" runat="server" Text='<%# Bind("[UpdatedBy]") %>'></asp:TextBox>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="Label18" runat="server" Text='<%# Bind("[UpdatedBy]") %>'></asp:Label>
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
                        </div>
                    </div>
                  </div>
    </div>
    <br />
    <asp:SqlDataSource ID="StringCon" runat="server" ConnectionString="<%$ ConnectionStrings:DBCon %>"
        DeleteCommand="DELETE FROM [mtr] WHERE [id] = @original_id"
        InsertCommand="INSERT INTO [mtr] ([id],[Client Name],[Memo Ref],[Debit Account],[Credit Account],[Transaction Code],[Memo Submission],[Amount],[Currency],[Heading],[Transaction Detail],[Booding Date]
      ,[Value Date],[Status],[Remark],[InsertedBy],[ApprovedBy],[UpdatedBy]) VALUES (@id, @Client_Name,@Memo_Ref,@Debit_Account,@Credit_Account,@Transaction_Code,@Memo_Submission,@Amount,@Currency,@Heading,@Transaction_Detail,@Booding_Date
,@Value_Date,@Status,@Remark,@InsertedBy,@ApprovedBy,@UpdatedBy)"
        SelectCommand="SELECT * FROM [mtr]"
        UpdateCommand="UPDATE [mtr] SET [Account Name] = @Account_Name, [Approval Number] = @Approval_Number, [Facility Type] = @Facility_Type, [Facility Amount] = @Facility_Amount, [Currency] = @Currency, [Action Taken] = @Action_Taken, [TFL Instructed On] = @TFL_Instructed_On, [Confirmed By] = @Confirmed_By, [Date of Boking] = @Date_of_Boking, [CMLA SignOff Date] = @CMLA_SignOff_Date, [Remark] = @Remark, [Inserted By] = @Inserted_By, [Updated By] = @Updated_By, [Approved By] = @Approved_By WHERE [id] = @original_id" OldValuesParameterFormatString="original_{0}">
        <DeleteParameters>
            <asp:Parameter Name="original_id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="id" Type="Int32" />
            <asp:Parameter Name="Client_Name" Type="String" />
            <asp:Parameter Name="Memo_Ref" Type="String" />
            <asp:Parameter Name="Debit_Account" Type="String" />
            <asp:Parameter Name="Credit_Account" Type="String" />
            <asp:Parameter Name="Transaction_Code" Type="String" />
            <asp:Parameter Name="Memo_Submission" Type="String" />
            <asp:Parameter Name="Amount" Type="String" />
            <asp:Parameter Name="Currency" Type="String" />
            <asp:Parameter Name="Heading" DbType="Date" />
            <asp:Parameter Name="Heading" DbType="Date" />
            <asp:Parameter Name="Transaction_Detail" Type="String" />
            <asp:Parameter Name="Booding_Date" Type="String" />
            <asp:Parameter Name="Value_Date" Type="String" />
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
            <asp:Parameter Name="Heading" DbType="Date" />
            <asp:Parameter Name="Heading" DbType="Date" />
            <asp:Parameter Name="Transaction_Detail" Type="String" />
            <asp:Parameter Name="BoodingDate" Type="String" />
            <asp:Parameter Name="Value_Date" Type="String" />
            <asp:Parameter Name="Status" Type="String" />
            <asp:Parameter Name="Remark" Type="String" />
            <asp:Parameter Name="InsertedBy" Type="String" />
            <asp:Parameter Name="ApprovedBy" Type="String" />
            <asp:Parameter Name="UpdatedBy" Type="String" />
            <asp:Parameter Name="original_id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>
