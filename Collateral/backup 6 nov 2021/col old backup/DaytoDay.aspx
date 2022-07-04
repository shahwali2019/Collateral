<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DaytoDay.aspx.cs" Inherits="Collateral_int.day2day" %>

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
        display: block;
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
        background-color:#fff;
        color: #fff;
      
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

                    <asp:Button ID="searchBtn" runat="server" CssClass="btn-primary focus" Font-Bold="True" Font-Size="Small" Height="31px" OnClick="searchBtn_Click" Text="Search" Width="67px" Font-Names="Bahnschrift" BorderStyle="None" />

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
            
            <asp:ImageButton ID="ImageButton2" runat="server" Height="10px" ImageUrl="~/image/excel1.png" Width="10px" OnClick="ImageButton2_Click" ToolTip="Export to .xlsx(Excel)" />
            
        </div>
    </div>
            
    <div>
              <div class="table">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">





        <asp:GridView   CssClass="GridPager" ID="GridView1" runat="server" OnRowCommand="GridView1_RowCommand" ShowHeaderWhenEmpty="True" AutoGenerateColumns="False"  DataKeyNames="id" DataSourceID="StringCon" EnableTheming="True"  BorderStyle="None">
          
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
                <asp:BoundField DataField="Account Name" HeaderText="Account Name" SortExpression="Account Name">
                    <ControlStyle CssClass="center" />
                    <HeaderStyle CssClass="center" />
                    <ItemStyle CssClass="center" />
                </asp:BoundField>


                <asp:BoundField DataField="Approval Number" HeaderText="Approval Number" SortExpression="Approval Number">
                    <ControlStyle CssClass="center" />
                    <HeaderStyle CssClass="center" />
                    <ItemStyle CssClass="center" />
                </asp:BoundField>

                <asp:BoundField DataField="Facility Type" HeaderText="Facility Type" SortExpression="Facility Type">
                    <ControlStyle CssClass="center" />
                    <HeaderStyle CssClass="center" />
                    <ItemStyle CssClass="center" />
                </asp:BoundField>

                <asp:BoundField DataField="Facility Amount" HeaderText="Facility Amount" SortExpression="Facility Amount">
                    <ControlStyle CssClass="center" />
                    <HeaderStyle CssClass="center" />
                    <ItemStyle CssClass="center" />
                </asp:BoundField>

                <asp:BoundField DataField="Currency" HeaderText="Currency" SortExpression="Currency">
                    <ControlStyle CssClass="center" />
                    <HeaderStyle CssClass="center" />
                    <ItemStyle CssClass="center" />
                </asp:BoundField>

                <asp:BoundField DataField="Action Taken" HeaderText="Action Taken" SortExpression="Action Taken">
                    <ControlStyle CssClass="center" />
                    <HeaderStyle CssClass="center" />
                    <ItemStyle CssClass="center" />
                </asp:BoundField>

                <asp:BoundField DataField="TFL Instructed On" HeaderText="TFL Instructed On" SortExpression="TFL Instructed On">
                    <ControlStyle CssClass="center" />
                    <HeaderStyle CssClass="center" />
                    <ItemStyle CssClass="center" />
                </asp:BoundField>

                <asp:BoundField DataField="Confirmed By" HeaderText="Confirmed By" SortExpression="Confirmed By">
                    <ControlStyle CssClass="center" />
                    <HeaderStyle CssClass="center" />
                    <ItemStyle CssClass="center" />
                </asp:BoundField>

                <asp:BoundField DataField="Date of Boking" HeaderText="Date of Boking" SortExpression="Date of Boking">
                    <ControlStyle CssClass="center" />
                    <HeaderStyle CssClass="center" />
                    <ItemStyle CssClass="center" />
                </asp:BoundField>

                <asp:BoundField DataField="CMLA SignOff Date" HeaderText="CMLA SignOff Date" SortExpression="CMLA SignOff Date">
                    <ControlStyle CssClass="center" />
                    <HeaderStyle CssClass="center" />
                    <ItemStyle CssClass="center" />
                </asp:BoundField>

                <asp:BoundField DataField="Remark" HeaderText="Remark" SortExpression="Remark">
                    <ControlStyle CssClass="center" />
                    <HeaderStyle CssClass="center" />
                    <ItemStyle CssClass="center" />

                </asp:BoundField>

                <asp:BoundField DataField="Inserted By" HeaderText="Inserted By" SortExpression="Inserted By" Visible="false">
                    <ControlStyle CssClass="center" />
                    <HeaderStyle CssClass="center" />
                    <ItemStyle CssClass="center" />
                </asp:BoundField>

                <asp:BoundField DataField="Updated By" HeaderText="Updated By" SortExpression="Updated By" Visible="false">
                    <ControlStyle CssClass="center" />
                    <HeaderStyle CssClass="center" />
                    <ItemStyle CssClass="center" />
                </asp:BoundField>

                <asp:BoundField DataField="Approved By" HeaderText="Approved By" SortExpression="Approved By" Visible="false">
                    <ControlStyle CssClass="center" />
                    <HeaderStyle CssClass="center" />
                    <ItemStyle CssClass="center" />
                </asp:BoundField>

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
        InsertCommand="INSERT INTO [DayToDayTbl] ([id], [Account Name], [Approval Number], [Facility Type], [Facility Amount], [Currency], [Action Taken], [TFL Instructed On], [Confirmed By], [Date of Boking], [CMLA SignOff Date], [Remark], [Inserted By], [Updated By], [Approved By]) VALUES (@id, @Account_Name, @Approval_Number, @Facility_Type, @Facility_Amount, @Currency, @Action_Taken, @TFL_Instructed_On, @Confirmed_By, @Date_of_Boking, @CMLA_SignOff_Date, @Remark, @Inserted_By, @Updated_By, @Approved_By)"
        SelectCommand="SELECT * FROM [DayToDayTbl]"
        UpdateCommand="UPDATE [DayToDayTbl] SET [Account Name] = @Account_Name, [Approval Number] = @Approval_Number, [Facility Type] = @Facility_Type, [Facility Amount] = @Facility_Amount, [Currency] = @Currency, [Action Taken] = @Action_Taken, [TFL Instructed On] = @TFL_Instructed_On, [Confirmed By] = @Confirmed_By, [Date of Boking] = @Date_of_Boking, [CMLA SignOff Date] = @CMLA_SignOff_Date, [Remark] = @Remark, [Inserted By] = @Inserted_By, [Updated By] = @Updated_By, [Approved By] = @Approved_By WHERE [id] = @original_id" OldValuesParameterFormatString="original_{0}">
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
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
