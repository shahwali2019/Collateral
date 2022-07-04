<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DaytoDay.aspx.cs" Inherits="Collateral.DaytoDay" %>
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
 
            .body-content {
    padding: 0;
    padding-right: 100px;
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
        <h4 class="alert-heading" style="font-family: Bahnschrift;"><strong>Day To Day RECORDS</strong></h4>
    </div>
    <asp:Panel runat="server" DefaultButton="searchBtn">
        <table>
            <tr style="padding: 10px 10px;">
                <td>
                    <asp:TextBox ID="txtbname" placeholder="Account Name" runat="server" Height="31px" Width="168px" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Small" TabIndex="2" CssClass="form-control"></asp:TextBox></td>
                <td>&nbsp;</td>
                <td>
                    <asp:TextBox ID="txtCode" runat="server" placeholder="Approval Number" Height="31px" Width="143px" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Small" TabIndex="3" CssClass="form-control"></asp:TextBox></td>
             
                <td>
                    <asp:DropDownList ID="FacilityType" runat="server" CssClass="form-control" Height="31px" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Small" TabIndex="5">
                        <asp:ListItem Selected="True" Value="FT">Facility Type</asp:ListItem>
                        <asp:ListItem>Credit Card</asp:ListItem>
                        <asp:ListItem>Debit Card</asp:ListItem>
                    </asp:DropDownList>
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
            
            <asp:ImageButton ID="ImageButton2" runat="server" Height="10px" ImageUrl="~/image/excel1.png" Width="10px" ToolTip="Export to .xlsx(Excel)" OnClick="ImageButton2_Click" />
            
        </div>
    </div>
            
    <div>
              <div class="table table-responsive">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">





        <asp:GridView CssClass="GridPager" ID="GridView1" runat="server" OnRowDataBound="GridView1_RowDataBound" OnRowCommand="GridView1_RowCommand" ShowHeaderWhenEmpty="True" AutoGenerateColumns="False"  DataKeyNames="id" DataSourceID="StringCon" EnableTheming="True"  BorderStyle="None">
          
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
                     <asp:TemplateField HeaderText="Account Name" SortExpression="Account Name">
                         <EditItemTemplate>
                             <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("[Account Name]") %>'></asp:TextBox>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="Label2" runat="server" Text='<%# Bind("[Account Name]") %>'></asp:Label>
                         </ItemTemplate>
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
                         <HeaderStyle CssClass="center" />
                         <ItemStyle CssClass="center" />
                     </asp:TemplateField>

                     <asp:TemplateField HeaderText="Currency" SortExpression="Currency">
                         <EditItemTemplate>
                             <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("[Currency]") %>'></asp:TextBox>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="Label6" runat="server" Text='<%# Bind("[Currency]") %>'></asp:Label>
                         </ItemTemplate>
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
                         <HeaderStyle CssClass="center" />
                         <ItemStyle CssClass="center" />
                     </asp:TemplateField>
                      <asp:TemplateField HeaderText="Number of Extension/Renewa" SortExpression="Number of Extension/Renewa">
                          <EditItemTemplate>
                              <asp:TextBox ID="TextBox15" runat="server" Text='<%# Bind("[Number of Extension Renewa]") %>'></asp:TextBox>
                          </EditItemTemplate>
                          <ItemTemplate>
                              <asp:Label ID="Label16" runat="server" Text='<%# Bind("[Number of Extension Renewa]") %>'></asp:Label>
                          </ItemTemplate>
                              <ControlStyle CssClass="center" />
                          <HeaderStyle CssClass="center" />
                          <ItemStyle CssClass="center" />
                      </asp:TemplateField>
                     <asp:TemplateField HeaderText="Remark" SortExpression="Remark">
                         <EditItemTemplate>
                             <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("[Remark]") %>'></asp:TextBox>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="Label12" runat="server" Text='<%# Bind("[Remark]") %>'></asp:Label>
                         </ItemTemplate>
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
        DeleteCommand="DELETE FROM [DayToDayTbl] WHERE [id] = @original_id"
        InsertCommand="INSERT INTO [DayToDayTbl] ([id], [Account Name], [Approval Number], [Facility Type], [Facility Amount], [Currency], [Action Taken], [TFL Instructed On], [Confirmed By], [Date of Boking], [CMLA SignOff Date],[Number of Extension Renewa], [Remark], [Inserted By], [Updated By], [Approved By]) VALUES (@id, @Account_Name, @Approval_Number, @Facility_Type, @Facility_Amount, @Currency, @Action_Taken, @TFL_Instructed_On, @Confirmed_By, @Date_of_Boking, @CMLA_SignOff_Date,@num_exten @Remark, @Inserted_By, @Updated_By, @Approved_By)"
        SelectCommand="SELECT * FROM [DayToDayTbl]"
        UpdateCommand="UPDATE [DayToDayTbl] SET [Account Name] = @Account_Name, [Approval Number] = @Approval_Number, [Facility Type] = @Facility_Type, [Facility Amount] = @Facility_Amount, [Currency] = @Currency, [Action Taken] = @Action_Taken, [TFL Instructed On] = @TFL_Instructed_On, [Confirmed By] = @Confirmed_By, [Date of Boking] = @Date_of_Boking, [CMLA SignOff Date] = @CMLA_SignOff_Date,[Number of Extension Renewa] =@num_exten [Remark] = @Remark, [Inserted By] = @Inserted_By, [Updated By] = @Updated_By, [Approved By] = @Approved_By WHERE [id] = @original_id" OldValuesParameterFormatString="original_{0}">
        <DeleteParameters>
            <asp:Parameter Name="original_id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="id" Type="Int32" />
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
            <asp:Parameter Name="num_exten" DbType="Date" />
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
            <asp:Parameter Name="num_exten" DbType="String" />
            <asp:Parameter Name="Remark" Type="String" />
            <asp:Parameter Name="Inserted_By" Type="String" />
            <asp:Parameter Name="Updated_By" Type="String" />
            <asp:Parameter Name="Approved_By" Type="String" />
            <asp:Parameter Name="original_id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
