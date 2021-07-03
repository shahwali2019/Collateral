<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RTDL.aspx.cs" Inherits="Collateral_int.RTDL" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <header>

        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

      
        <style>
            .center {
                text-align: center;
                font-size: 11px;
                font-family: Bahnschrift;
                height: 30px;
                width: auto;
                padding: 10px 5px 10px 5px;
            }
        </style>
    </header>
    <div style="height:90px; text-align: center; margin: 0 auto; margin-top:10px;" class="alert alert-success" role="alert">
        <h4 class="alert-heading" style="font-family: Bahnschrift;"><strong>
            <asp:Label ID="addLbl" runat="server" Text="TITLE DEEDS RECORD"></asp:Label></strong></h4>
    </div>
    <asp:Label ID="SafeInDateLbl" runat="server" Text="Search by Insertion Date" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Small" ForeColor="#0033CC" Height="24px"></asp:Label>
    <br />






    <asp:UpdatePanel ID="UpdatePanel4" runat="server">
        <ContentTemplate>
            <asp:TextBox ID="txtDate1" runat="server" Height="26px" Width="155px" TextMode="Date"></asp:TextBox>
            <asp:Label ID="Label32" runat="server" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Small" ForeColor="#003399" Text="to"></asp:Label>



            <asp:TextBox ID="txtDate2" runat="server" Height="26px" Width="155px" TextMode="Date"></asp:TextBox>

            <asp:ImageButton ID="ImageButton2" runat="server" Height="15px" ImageUrl="~/image/refresh.jpg" OnClick="ImageButton2_Click" Width="23px" />


        </ContentTemplate>

    </asp:UpdatePanel>


    <hr style="border-bottom: 5px solid #003399" />
    <asp:Label ID="StaticLable" runat="server" Text="Search by: " Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Small" ForeColor="#0033CC" Height="24px"></asp:Label>
    <br />
 

            <asp:TextBox ID="txtClientName" runat="server" placeholder="Client Name" BackColor="#FFFF99" Height="31px" Width="139px" Font-Names="Bahnschrift" Font-Size="Small"></asp:TextBox>
            <asp:DropDownList ID="drop_QabalaType" runat="server" CssClass="btn-info" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Small" Height="31px" Width="99px" TabIndex="3">
                <asp:ListItem Text="Qabala Type" Value="Qabala Type" Selected="True"></asp:ListItem>
                <asp:ListItem Text="Urofi" Value="Urofi"></asp:ListItem>
                <asp:ListItem Text="Sharayee" Value=" Sharayee"></asp:ListItem>

            </asp:DropDownList>
            <asp:TextBox ID="txtQNo" runat="server" placeholder="Qabala No." BackColor="#FFFF99" Height="31px" Width="80px" Font-Names="Bahnschrift" Font-Size="Small"></asp:TextBox>

            <asp:TextBox ID="txtToP" runat="server" placeholder="Type of Property" BackColor="#FFFF99" Height="31px" Width="119px" Font-Names="Bahnschrift" Font-Size="Small"></asp:TextBox>

            <asp:DropDownList ID="Drop_status" runat="server" CssClass="btn-info" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Small" Height="31px" Width="97px" TabIndex="24">
                <asp:ListItem>Status</asp:ListItem>
                <asp:ListItem>Pleaced</asp:ListItem>
                <asp:ListItem>Avaliable</asp:ListItem>

            </asp:DropDownList>

            &nbsp;<asp:Button ID="searchBtn" runat="server" CssClass="auto-style1" Font-Bold="True" Font-Size="X-Small" Height="31px" OnClick="searchBtn_Click" Text="FIND" Width="50px" BackColor="#FF6666" BorderColor="#003399" BorderStyle="None" BorderWidth="1px" Font-Names="Bahnschrift" />

            &nbsp;<br />
            <asp:Label ID="resultLbl" runat="server" Font-Bold="True" Font-Size="Smaller" ForeColor="Red" Visible="False" Font-Names="Bahnschrift"></asp:Label>
            <br />

            <asp:ImageButton ID="addNew" runat="server" Height="23px" ImageUrl="~/image/add.png" OnClick="addNew_Click" Width="29px" />

            <asp:ImageButton ID="ImageButton1" runat="server" Height="20px" ImageUrl="~/image/excel1.png" Width="24px" OnClick="ImageButton1_Click" ToolTip="Export to .xlsx(Excel)" />
            <div>

               
                        <asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="true" Checked="false" Font-Names="Bahnschrift" Font-Size="Small" ForeColor="Red" Text="All" OnCheckedChanged="CheckBox1_CheckedChanged" />
                        <br />
                                <asp:GridView ID="GridView1" runat="server" OnRowCommand="GridView1_RowCommand" AutoGenerateColumns="False"
                                    BackColor="White" BorderColor="#3366CC"
                                    ShowHeaderWhenEmpty="True"
                                    BorderStyle="None" BorderWidth="1px" CellPadding="4" Width="1175px" DataKeyNames="id" DataSourceID="DBConn" GridLines="Horizontal">
                                    <AlternatingRowStyle BackColor="#CCFFFF" />
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

                                        <asp:TemplateField ShowHeader="true" HeaderText="EDIT">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="edit" CommandArgument='<%# Bind("id") %>' Text="Edit"></asp:LinkButton>
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
                                            <ControlStyle CssClass="center" Font-Names="Bahnschrift" Font-Size="X-Small" />
                                            <HeaderStyle CssClass="center" Font-Names="Bahnschrift" />
                                            <ItemStyle CssClass="center" Font-Names="Bahnschrift" Font-Size="X-Small" />
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
                                        <asp:TemplateField HeaderText="Loan Type" SortExpression="Loan Type">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox29" runat="server" Text='<%# Bind("[Loan Type]") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label30" runat="server" Text='<%# Bind("[Loan Type]") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle CssClass="center" />
                                            <ItemStyle CssClass="center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Qabala Type" SortExpression="Qabala Type">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("[Qabala Type]") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("[Qabala Type]") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle CssClass="center" />
                                            <ItemStyle CssClass="center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Qabala Number" SortExpression="Qabala Number">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("[Qabala Number]") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("[Qabala Number]") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle CssClass="center" />
                                            <ItemStyle CssClass="center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Qabala Date" SortExpression="Qabala Date">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("[Qabala Date]") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("[Qabala Date]") %>'></asp:Label>
                                                <headerstyle cssclass="center" />
                                                <itemstyle cssclass="center" />
                                            </ItemTemplate>
                                            <HeaderStyle CssClass="center" />
                                            <ItemStyle CssClass="center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Owner of Qabala" SortExpression="Owner of Qabala">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("[Owner of Qabala]") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("[Owner of Qabala]") %>'></asp:Label>

                                            </ItemTemplate>
                                            <HeaderStyle CssClass="center" />
                                            <ItemStyle CssClass="center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Type of Property" SortExpression="Type of Property">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("[Type of Property]") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label7" runat="server" Text='<%# Bind("[Type of Property]") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle CssClass="center" />
                                            <ItemStyle CssClass="center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Value of Property" SortExpression="Value of Property">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("[Value of Property]") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label8" runat="server" Text='<%# Bind("[Value of Property]") %>'></asp:Label>
                                            </ItemTemplate>
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
                                            <HeaderStyle CssClass="center" />
                                            <ItemStyle CssClass="center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Property Evaluator" SortExpression="Property Evaluator">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("[Property Evaluator]") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label10" runat="server" Text='<%# Bind("[Property Evaluator]") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle CssClass="center" />
                                            <ItemStyle CssClass="center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Address" SortExpression="Address">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("Address") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label11" runat="server" Text='<%# Bind("Address") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle CssClass="center" />
                                            <ItemStyle CssClass="center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Last Evaluation Date" SortExpression="Last Evaluation Date">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("[Last Evaluation Date]") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label12" runat="server" Text='<%# Bind("[Last Evaluation Date]") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle CssClass="center" />
                                            <ItemStyle CssClass="center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Registered Mortgage No" SortExpression="Registered Mortgage No">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox12" runat="server" Text='<%# Bind("[Registered Mortgage No]") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label13" runat="server" Text='<%# Bind("[Registered Mortgage No]") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle CssClass="center" />
                                            <ItemStyle CssClass="center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Registered Mortgage Date" SortExpression="Registered Mortgage Date">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox13" runat="server" Text='<%# Bind("[Registered Mortgage Date]") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label14" runat="server" Text='<%# Bind("[Registered Mortgage Date]") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ControlStyle CssClass="center" />
                                            <HeaderStyle CssClass="center" />
                                            <ItemStyle CssClass="center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Mortgage Value" SortExpression="Mortgage Value">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox15" runat="server" Text='<%# Bind("[Mortgage Value]") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label16" runat="server" Text='<%# Bind("[Mortgage Value]") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle CssClass="center" />
                                            <ItemStyle CssClass="center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Hujat Khaat Number" SortExpression="Hujat Khaat Number">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox14" runat="server" Text='<%# Bind("[Hujat Khaat Number]") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label15" runat="server" Text='<%# Bind("[Hujat Khaat Number]") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle CssClass="center" />
                                            <ItemStyle CssClass="center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Hujat Khaat Date" SortExpression="Hujat Khaat Date">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox16" runat="server" Text='<%# Bind("[Hujat Khaat Date]") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label17" runat="server" Text='<%# Bind("[Hujat Khaat Date]") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle CssClass="center" />
                                            <ItemStyle CssClass="center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Hujat Khaat Vallue" SortExpression="Hujat Khaat Vallue">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox17" runat="server" Text='<%# Bind("[Hujat Khaat Vallue]") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label18" runat="server" Text='<%# Bind("[Hujat Khaat Vallue]") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle CssClass="center" />
                                            <ItemStyle CssClass="center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Equitable Mortgage Number" SortExpression="Equitable Mortgage Number">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox19" runat="server" Text='<%# Bind("[Equitable Mortgage Number]") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label20" runat="server" Text='<%# Bind("[Equitable Mortgage Number]") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle CssClass="center" />
                                            <ItemStyle CssClass="center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Equitable Mortgage Date" SortExpression="Equitable Mortgage Date">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox30" runat="server" Text='<%# Bind("[Equitable Mortgage Date]") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label31" runat="server" Text='<%# Bind("[Equitable Mortgage Date]") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle CssClass="center" />
                                            <ItemStyle CssClass="center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Based On" SortExpression="Based On">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox28" runat="server" Text='<%# Bind("[Based On]") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label29" runat="server" Text='<%# Bind("[Based On]") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle CssClass="center" />
                                            <ItemStyle CssClass="center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Released Date" SortExpression="Released Date">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox18" runat="server" Text='<%# Bind("[Released Date]") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label19" runat="server" Text='<%# Bind("[Released Date]") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle CssClass="center" />
                                            <ItemStyle CssClass="center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Released By" SortExpression="Released By">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox20" runat="server" Text='<%# Bind("[Released By]") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label21" runat="server" Text='<%# Bind("[Released By]") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle CssClass="center" />
                                            <ItemStyle CssClass="center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Released Title Deeds" SortExpression="Released Title Deeds">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox21" runat="server" Text='<%# Bind("[Released Title Deeds]") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label22" runat="server" Text='<%# Bind("[Released Title Deeds]") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle CssClass="center" />
                                            <ItemStyle CssClass="center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Pending Items" SortExpression="Pending Item For Accomplishment">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox22" runat="server" Text='<%# Bind("[Pending Item For Accomplishment]") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label23" runat="server" Text='<%# Bind("[Pending Item For Accomplishment]") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle CssClass="center" />
                                            <ItemStyle CssClass="center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Received By" SortExpression="Received By">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox27" runat="server" Text='<%# Bind("[Received By]") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label28" runat="server" Text='<%# Bind("[Received By]") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle CssClass="center" />
                                            <ItemStyle CssClass="center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Status" SortExpression="Status">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox26" runat="server" Text='<%# Bind("Status") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label27" runat="server" Text='<%# Bind("Status") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle CssClass="center" />
                                            <ItemStyle CssClass="center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Inserted By" SortExpression="Inserted By">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox25" runat="server" Text='<%# Bind("[Inserted By]") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label26" runat="server" Text='<%# Bind("[Inserted By]") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle CssClass="center" />
                                            <ItemStyle CssClass="center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Updated By" SortExpression="Updated By">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox24" runat="server" Text='<%# Bind("[Updated By]") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label25" runat="server" Text='<%# Bind("[Updated By]") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle CssClass="center" />
                                            <ItemStyle CssClass="center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Approved By" SortExpression="Approved By">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox23" runat="server" Text='<%# Bind("[Approved By]") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label24" runat="server" Text='<%# Bind("[Approved By]") %>'></asp:Label>
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
            <asp:SqlDataSource ID="DBConn" runat="server" ConnectionString="<%$ ConnectionStrings:DBCon %>" SelectCommand="SELECT * FROM [RTD]"></asp:SqlDataSource>
           


            </div>



</asp:Content>
