<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RTD_pending.aspx.cs" Inherits="Collateral_int.RTD_pending" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .center {
            text-align: center;
            font-size: 12px;
            font-family: Bahnschrift;
            height: 30px;
            width: auto;
            padding: 0 5px 0 5px;
        }

        .auto-style1 {
            text-align: center;
            font-size: 12px;
            font-family: Bahnschrift;
            padding: 0 5px 0 5px;
        }
    </style>
    <br />
    <br />
    <div class="main">
      

                <p>
                    <asp:CheckBox AutoPostBack="true" ID="insertCheck" runat="server" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="X-Small" ForeColor="#003399" Text="Insert Pending Record(s)" OnCheckedChanged="insertCheck_CheckedChanged" />
                    &nbsp;
         <asp:CheckBox AutoPostBack="true" ID="updatedCheck" runat="server" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="X-Small" ForeColor="#003399" Text="Updated Pending Record(s)" OnCheckedChanged="updatedCheck_CheckedChanged" />
                &nbsp;<asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="true" Checked="false" Font-Names="Bahnschrift" Font-Size="Small" ForeColor="Red" Text="SHOW ALL" OnCheckedChanged="CheckBox1_CheckedChanged" ToolTip="Show all fields" />
                        <p>
                    <asp:ImageButton ID="ApproveBtnImg" runat="server" Height="32px" ImageUrl="~/image/insertBtn.jpg" OnClick="ImageButton1_Click" ToolTip="Approve Inserted Records" Width="30px" Enabled="False" />

                    &nbsp;<asp:ImageButton ID="ApproveUpdateBtn" runat="server" Height="32px" ImageUrl="~/image/updatebtn.png" ToolTip="Approved Updated Records" Width="28px" Enabled="False" OnClick="ApproveUpdateBtn_Click" />
                    <hr style="margin-left: 5px; border-bottom: 5px solid #003399; width: 1100px; background-color: #00FF00;" />
                    <div style="margin-top: -15px;">
                        <asp:Label ID="updateLbl" runat="server" Font-Size="Small" Text="Label" Visible="False" Font-Names="Bahnschrift" ForeColor="Red"></asp:Label>
                    </div>
                    <div style="margin-top: -15px; color:red" >
                        <asp:Label ID="insertLbl" runat="server" Font-Size="Small" Text="Label" Visible="False" Font-Names="Bahnschrift" ForeColor="Red"></asp:Label>
                    </div>
                  
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:GridView ID="GridView2" OnRowCommand="GridView2_RowCommand" runat="server" ShowHeaderWhenEmpty="True"
                                AllowSorting="True" CssClass="auto-style1" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC"
                                BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="id" DataSourceID="SqlCon2" PageSize="7" Width="1253px" Visible="False" OnSelectedIndexChanged="GridView2_SelectedIndexChanged">
                                <Columns>
                                    <asp:CommandField ShowDeleteButton="True" />
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
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="id" InsertVisible="False" SortExpression="id">
                                        <EditItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ControlStyle CssClass="center" Font-Names="Bahnschrift" />
                                        <HeaderStyle CssClass="center" />
                                        <ItemStyle CssClass="center" Font-Bold="True" Font-Names="Bahnschrift" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Client Name" SortExpression="Client Name">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("[Client Name]") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("[Client Name]") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ControlStyle CssClass="center" Font-Names="Bahnschrift" />
                                        <HeaderStyle CssClass="center" />
                                        <ItemStyle CssClass="center" Font-Bold="True" Font-Names="Bahnschrift" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Loan Type" SortExpression="Loan Type">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("[Loan Type]") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("[Loan Type]") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ControlStyle CssClass="center" Font-Names="Bahnschrift" />
                                        <HeaderStyle CssClass="center" />
                                        <ItemStyle CssClass="center" Font-Bold="True" Font-Names="Bahnschrift" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Qabala Type" SortExpression="Qabala Type">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("[Qabala Type]") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("[Qabala Type]") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ControlStyle CssClass="center" Font-Names="Bahnschrift" />
                                        <HeaderStyle CssClass="center" />
                                        <ItemStyle CssClass="center" Font-Bold="True" Font-Names="Bahnschrift" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Qabala Number" SortExpression="Qabala Number">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("[Qabala Number]") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("[Qabala Number]") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ControlStyle CssClass="center" Font-Names="Bahnschrift" />
                                        <HeaderStyle CssClass="center" />
                                        <ItemStyle CssClass="center" Font-Bold="True" Font-Names="Bahnschrift" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Qabala Date" SortExpression="Qabala Date">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("[Qabala Date]") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("[Qabala Date]") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ControlStyle CssClass="center" Font-Names="Bahnschrift" />
                                        <HeaderStyle CssClass="center" />
                                        <ItemStyle CssClass="center" Font-Bold="True" Font-Names="Bahnschrift" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Owner of Qabala" SortExpression="Owner of Qabala">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("[Owner of Qabala]") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("[Owner of Qabala]") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ControlStyle CssClass="center" Font-Names="Bahnschrift" />
                                        <HeaderStyle CssClass="center" />
                                        <ItemStyle CssClass="center" Font-Bold="True" Font-Names="Bahnschrift" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Type of Property" SortExpression="Type of Property">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("[Type of Property]") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label8" runat="server" Text='<%# Bind("[Type of Property]") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ControlStyle CssClass="center" Font-Names="Bahnschrift" />
                                        <HeaderStyle CssClass="center" />
                                        <ItemStyle CssClass="center" Font-Bold="True" Font-Names="Bahnschrift" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Value of Property" SortExpression="Value of Property">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("[Value of Property]") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label9" runat="server" Text='<%# Bind("[Value of Property]") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ControlStyle CssClass="center" Font-Names="Bahnschrift" />
                                        <HeaderStyle CssClass="center" />
                                        <ItemStyle CssClass="center" Font-Bold="True" Font-Names="Bahnschrift" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Currency" SortExpression="Currency">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("Currency") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label10" runat="server" Text='<%# Bind("Currency") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ControlStyle CssClass="center" Font-Names="Bahnschrift" />
                                        <HeaderStyle CssClass="center" />
                                        <ItemStyle CssClass="center" Font-Bold="True" Font-Names="Bahnschrift" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Property Evaluator" SortExpression="Property Evaluator">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("[Property Evaluator]") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label11" runat="server" Text='<%# Bind("[Property Evaluator]") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ControlStyle CssClass="center" Font-Names="Bahnschrift" />
                                        <HeaderStyle CssClass="center" />
                                        <ItemStyle CssClass="center" Font-Bold="True" Font-Names="Bahnschrift" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Address" SortExpression="Address">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("Address") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label12" runat="server" Text='<%# Bind("Address") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ControlStyle CssClass="center" Font-Names="Bahnschrift" />
                                        <HeaderStyle CssClass="center" />
                                        <ItemStyle CssClass="center" Font-Bold="True" Font-Names="Bahnschrift" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Last Evaluation Date" SortExpression="Last Evaluation Date">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox13" runat="server" Text='<%# Bind("[Last Evaluation Date]") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label14" runat="server" Text='<%# Bind("[Last Evaluation Date]") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ControlStyle CssClass="center" Font-Names="Bahnschrift" />
                                        <HeaderStyle CssClass="center" />
                                        <ItemStyle CssClass="center" Font-Bold="True" Font-Names="Bahnschrift" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Registered Mortgage No" SortExpression="Registered Mortgage No">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox12" runat="server" Text='<%# Bind("[Registered Mortgage No]") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label13" runat="server" Text='<%# Bind("[Registered Mortgage No]") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ControlStyle CssClass="center" Font-Names="Bahnschrift" />
                                        <HeaderStyle CssClass="center" />
                                        <ItemStyle CssClass="center" Font-Bold="True" Font-Names="Bahnschrift" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Registered Mortgage Date" SortExpression="Registered Mortgage Date">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox14" runat="server" Text='<%# Bind("[Registered Mortgage Date]") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label15" runat="server" Text='<%# Bind("[Registered Mortgage Date]") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ControlStyle CssClass="center" Font-Names="Bahnschrift" />
                                        <HeaderStyle CssClass="center" />
                                        <ItemStyle CssClass="center" Font-Bold="True" Font-Names="Bahnschrift" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Mortgage Value" SortExpression="Mortgage Value">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox15" runat="server" Text='<%# Bind("[Mortgage Value]") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label16" runat="server" Text='<%# Bind("[Mortgage Value]") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ControlStyle CssClass="center" Font-Names="Bahnschrift" />
                                        <HeaderStyle CssClass="center" />
                                        <ItemStyle CssClass="center" Font-Bold="True" Font-Names="Bahnschrift" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Hujat Khaat Number" SortExpression="Hujat Khaat Number">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox16" runat="server" Text='<%# Bind("[Hujat Khaat Number]") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label17" runat="server" Text='<%# Bind("[Hujat Khaat Number]") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ControlStyle CssClass="center" Font-Names="Bahnschrift" />
                                        <HeaderStyle CssClass="center" />
                                        <ItemStyle CssClass="center" Font-Bold="True" Font-Names="Bahnschrift" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Hujat Khaat Date" SortExpression="Hujat Khaat Date">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox17" runat="server" Text='<%# Bind("[Hujat Khaat Date]") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label18" runat="server" Text='<%# Bind("[Hujat Khaat Date]") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ControlStyle CssClass="center" Font-Names="Bahnschrift" />
                                        <HeaderStyle CssClass="center" />
                                        <ItemStyle CssClass="center" Font-Bold="True" Font-Names="Bahnschrift" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Hujat Khaat Vallue" SortExpression="Hujat Khaat Vallue">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox18" runat="server" Text='<%# Bind("[Hujat Khaat Vallue]") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label19" runat="server" Text='<%# Bind("[Hujat Khaat Vallue]") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ControlStyle CssClass="center" Font-Names="Bahnschrift" />
                                        <HeaderStyle CssClass="center" />
                                        <ItemStyle CssClass="center" Font-Bold="True" Font-Names="Bahnschrift" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Equitable Mortgage Number" SortExpression="Equitable Mortgage Number">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox19" runat="server" Text='<%# Bind("[Equitable Mortgage Number]") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label20" runat="server" Text='<%# Bind("[Equitable Mortgage Number]") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ControlStyle CssClass="center" Font-Names="Bahnschrift" />
                                        <HeaderStyle CssClass="center" />
                                        <ItemStyle CssClass="center" Font-Bold="True" Font-Names="Bahnschrift" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Equitable Mortgage Date" SortExpression="Equitable Mortgage Date">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox20" runat="server" Text='<%# Bind("[Equitable Mortgage Date]") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label21" runat="server" Text='<%# Bind("[Equitable Mortgage Date]") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ControlStyle CssClass="center" Font-Names="Bahnschrift" />
                                        <HeaderStyle CssClass="center" />
                                        <ItemStyle CssClass="center" Font-Bold="True" Font-Names="Bahnschrift" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Released Date" SortExpression="Released Date">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox21" runat="server" Text='<%# Bind("[Released Date]") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label22" runat="server" Text='<%# Bind("[Released Date]") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ControlStyle CssClass="center" Font-Names="Bahnschrift" />
                                        <HeaderStyle CssClass="center" />
                                        <ItemStyle CssClass="center" Font-Bold="True" Font-Names="Bahnschrift" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Released By" SortExpression="Released By">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox22" runat="server" Text='<%# Bind("[Released By]") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label23" runat="server" Text='<%# Bind("[Released By]") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ControlStyle CssClass="center" Font-Names="Bahnschrift" />
                                        <HeaderStyle CssClass="center" />
                                        <ItemStyle CssClass="center" Font-Bold="True" Font-Names="Bahnschrift" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Released Title Deeds" SortExpression="Released Title Deeds">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox23" runat="server" Text='<%# Bind("[Released Title Deeds]") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label24" runat="server" Text='<%# Bind("[Released Title Deeds]") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ControlStyle CssClass="center" Font-Names="Bahnschrift" />
                                        <HeaderStyle CssClass="center" />
                                        <ItemStyle CssClass="center" Font-Bold="True" Font-Names="Bahnschrift" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Based On" SortExpression="Based On">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox24" runat="server" Text='<%# Bind("[Based On]") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label25" runat="server" Text='<%# Bind("[Based On]") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ControlStyle CssClass="center" Font-Names="Bahnschrift" />
                                        <HeaderStyle CssClass="center" />
                                        <ItemStyle CssClass="center" Font-Bold="True" Font-Names="Bahnschrift" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Pending Item For Accomplishment" SortExpression="Pending Item For Accomplishment">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox25" runat="server" Text='<%# Bind("[Pending Item For Accomplishment]") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label26" runat="server" Text='<%# Bind("[Pending Item For Accomplishment]") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ControlStyle CssClass="center" Font-Names="Bahnschrift" />
                                        <HeaderStyle CssClass="center" />
                                        <ItemStyle CssClass="center" Font-Bold="True" Font-Names="Bahnschrift" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Due Date" SortExpression="Due Date">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox26" runat="server" Text='<%# Bind("[Due Date]") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label27" runat="server" Text='<%# Bind("[Due Date]") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ControlStyle CssClass="center" Font-Names="Bahnschrift" />
                                        <HeaderStyle CssClass="center" />
                                        <ItemStyle CssClass="center" Font-Bold="True" Font-Names="Bahnschrift" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Received By" SortExpression="Received By">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox27" runat="server" Text='<%# Bind("[Received By]") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label28" runat="server" Text='<%# Bind("[Received By]") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ControlStyle CssClass="center" Font-Names="Bahnschrift" />
                                        <HeaderStyle CssClass="center" />
                                        <ItemStyle CssClass="center" Font-Bold="True" Font-Names="Bahnschrift" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Status" SortExpression="Status">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox28" runat="server" Text='<%# Bind("Status") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label29" runat="server" Text='<%# Bind("Status") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ControlStyle CssClass="center" Font-Names="Bahnschrift" />
                                        <HeaderStyle CssClass="center" />
                                        <ItemStyle CssClass="center" Font-Bold="True" Font-Names="Bahnschrift" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Remark" SortExpression="Remark">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox29" runat="server" Text='<%# Bind("Remark") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label30" runat="server" Text='<%# Bind("Remark") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ControlStyle CssClass="center" Font-Names="Bahnschrift" />
                                        <HeaderStyle CssClass="center" />
                                        <ItemStyle CssClass="center" Font-Bold="True" Font-Names="Bahnschrift" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Add Loan Status" SortExpression="Add Loan Status">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox30" runat="server" Text='<%# Bind("[Add Loan Status]") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label31" runat="server" Text='<%# Bind("[Add Loan Status]") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ControlStyle CssClass="center" Font-Names="Bahnschrift" />
                                        <HeaderStyle CssClass="center" />
                                        <ItemStyle CssClass="center" Font-Bold="True" Font-Names="Bahnschrift" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Inserted By" SortExpression="Inserted By">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox31" runat="server" Text='<%# Bind("[Inserted By]") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label32" runat="server" Text='<%# Bind("[Inserted By]") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ControlStyle CssClass="center" Font-Names="Bahnschrift" />
                                        <HeaderStyle CssClass="center" />
                                        <ItemStyle CssClass="center" Font-Bold="True" Font-Names="Bahnschrift" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Updated By" SortExpression="Updated By">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox32" runat="server" Text='<%# Bind("[Updated By]") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label33" runat="server" Text='<%# Bind("[Updated By]") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ControlStyle CssClass="center" Font-Names="Bahnschrift" />
                                        <HeaderStyle CssClass="center" />
                                        <ItemStyle CssClass="center" Font-Bold="True" Font-Names="Bahnschrift" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Approved By" SortExpression="Approved By">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox33" runat="server" Text='<%# Bind("[Approved By]") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label34" runat="server" Text='<%# Bind("[Approved By]") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ControlStyle CssClass="center" Font-Names="Bahnschrift" />
                                        <HeaderStyle CssClass="center" />
                                        <ItemStyle CssClass="center" Font-Bold="True" Font-Names="Bahnschrift" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Inserted Date" SortExpression="Inserted Date">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox34" runat="server" Text='<%# Bind("[Inserted Date]") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label35" runat="server" Text='<%# Bind("[Inserted Date]") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ControlStyle CssClass="center" Font-Names="Bahnschrift" />
                                        <HeaderStyle CssClass="center" />
                                        <ItemStyle CssClass="center" Font-Bold="True" Font-Names="Bahnschrift" />
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
                        DeleteCommand="DELETE FROM [RTD_Temp_Insert] WHERE [id] = @id"
                        InsertCommand="INSERT INTO [RTD_Temp_Insert] ([Client Name], [Loan Type], [Qabala Type], [Qabala Number], [Qabala Date], [Owner of Qabala], [Type of Property], [Value of Property], [Currency], [Property Evaluator], [Address], [Last Evaluation Date], [Registered Mortgage No], [Registered Mortgage Date], [Mortgage Value], [Hujat Khaat Number], [Hujat Khaat Date], [Hujat Khaat Vallue], [Equitable Mortgage Number], [Equitable Mortgage Date], [Released Date], [Released By], [Released Title Deeds], [Based On], [Pending Item For Accomplishment], [Due Date], [Received By], [Status], [Remark], [Add Loan Status], [Inserted By], [Updated By], [Approved By], [Inserted Date]) VALUES (@Client_Name, @Loan_Type, @Qabala_Type, @Qabala_Number, @Qabala_Date, @Owner_of_Qabala, @Type_of_Property, @Value_of_Property, @Currency, @Property_Evaluator, @Address, @Last_Evaluation_Date, @Registered_Mortgage_No, @Registered_Mortgage_Date, @Mortgage_Value, @Hujat_Khaat_Number, @Hujat_Khaat_Date, @Hujat_Khaat_Vallue, @Equitable_Mortgage_Number, @Equitable_Mortgage_Date, @Released_Date, @Released_By, @Released_Title_Deeds, @Based_On, @Pending_Item_For_Accomplishment, @Due_Date, @Received_By, @Status, @Remark, @Add_Loan_Status, @Inserted_By, @Updated_By, @Approved_By, @Inserted_Date)"
                        SelectCommand="SELECT * FROM [RTD_Temp_Insert]" UpdateCommand="UPDATE [RTD_Temp_Insert] SET [Client Name] = @Client_Name, [Loan Type] = @Loan_Type, [Qabala Type] = @Qabala_Type, [Qabala Number] = @Qabala_Number, [Qabala Date] = @Qabala_Date, [Owner of Qabala] = @Owner_of_Qabala, [Type of Property] = @Type_of_Property, [Value of Property] = @Value_of_Property, [Currency] = @Currency, [Property Evaluator] = @Property_Evaluator, [Address] = @Address, [Last Evaluation Date] = @Last_Evaluation_Date, [Registered Mortgage No] = @Registered_Mortgage_No, [Registered Mortgage Date] = @Registered_Mortgage_Date, [Mortgage Value] = @Mortgage_Value, [Hujat Khaat Number] = @Hujat_Khaat_Number, [Hujat Khaat Date] = @Hujat_Khaat_Date, [Hujat Khaat Vallue] = @Hujat_Khaat_Vallue, [Equitable Mortgage Number] = @Equitable_Mortgage_Number, [Equitable Mortgage Date] = @Equitable_Mortgage_Date, [Released Date] = @Released_Date, [Released By] = @Released_By, [Released Title Deeds] = @Released_Title_Deeds, [Based On] = @Based_On, [Pending Item For Accomplishment] = @Pending_Item_For_Accomplishment, [Due Date] = @Due_Date, [Received By] = @Received_By, [Status] = @Status, [Remark] = @Remark, [Add Loan Status] = @Add_Loan_Status, [Inserted By] = @Inserted_By, [Updated By] = @Updated_By, [Approved By] = @Approved_By, [Inserted Date] = @Inserted_Date WHERE [id] = @id">
                        <DeleteParameters>
                            <asp:Parameter Name="id" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="Client_Name" Type="String" />
                            <asp:Parameter Name="Loan_Type" Type="String" />
                            <asp:Parameter Name="Qabala_Type" Type="String" />
                            <asp:Parameter Name="Qabala_Number" Type="String" />
                            <asp:Parameter Name="Qabala_Date" Type="String" />
                            <asp:Parameter Name="Owner_of_Qabala" Type="String" />
                            <asp:Parameter Name="Type_of_Property" Type="String" />
                            <asp:Parameter Name="Value_of_Property" Type="String" />
                            <asp:Parameter Name="Currency" Type="String" />
                            <asp:Parameter Name="Property_Evaluator" Type="String" />
                            <asp:Parameter Name="Address" Type="String" />
                            <asp:Parameter Name="Last_Evaluation_Date" Type="String" />
                            <asp:Parameter Name="Registered_Mortgage_No" Type="String" />
                            <asp:Parameter Name="Registered_Mortgage_Date" Type="String" />
                            <asp:Parameter Name="Mortgage_Value" Type="String" />
                            <asp:Parameter Name="Hujat_Khaat_Number" Type="String" />
                            <asp:Parameter Name="Hujat_Khaat_Date" Type="String" />
                            <asp:Parameter Name="Hujat_Khaat_Vallue" Type="String" />
                            <asp:Parameter Name="Equitable_Mortgage_Number" Type="String" />
                            <asp:Parameter Name="Equitable_Mortgage_Date" Type="String" />
                            <asp:Parameter Name="Released_Date" Type="String" />
                            <asp:Parameter Name="Released_By" Type="String" />
                            <asp:Parameter Name="Released_Title_Deeds" Type="String" />
                            <asp:Parameter Name="Based_On" Type="String" />
                            <asp:Parameter Name="Pending_Item_For_Accomplishment" Type="String" />
                            <asp:Parameter Name="Due_Date" Type="String" />
                            <asp:Parameter Name="Received_By" Type="String" />
                            <asp:Parameter Name="Status" Type="String" />
                            <asp:Parameter Name="Remark" Type="String" />
                            <asp:Parameter Name="Add_Loan_Status" Type="String" />
                            <asp:Parameter Name="Inserted_By" Type="String" />
                            <asp:Parameter Name="Updated_By" Type="String" />
                            <asp:Parameter Name="Approved_By" Type="String" />
                            <asp:Parameter Name="Inserted_Date" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Client_Name" Type="String" />
                            <asp:Parameter Name="Loan_Type" Type="String" />
                            <asp:Parameter Name="Qabala_Type" Type="String" />
                            <asp:Parameter Name="Qabala_Number" Type="String" />
                            <asp:Parameter Name="Qabala_Date" Type="String" />
                            <asp:Parameter Name="Owner_of_Qabala" Type="String" />
                            <asp:Parameter Name="Type_of_Property" Type="String" />
                            <asp:Parameter Name="Value_of_Property" Type="String" />
                            <asp:Parameter Name="Currency" Type="String" />
                            <asp:Parameter Name="Property_Evaluator" Type="String" />
                            <asp:Parameter Name="Address" Type="String" />
                            <asp:Parameter Name="Last_Evaluation_Date" Type="String" />
                            <asp:Parameter Name="Registered_Mortgage_No" Type="String" />
                            <asp:Parameter Name="Registered_Mortgage_Date" Type="String" />
                            <asp:Parameter Name="Mortgage_Value" Type="String" />
                            <asp:Parameter Name="Hujat_Khaat_Number" Type="String" />
                            <asp:Parameter Name="Hujat_Khaat_Date" Type="String" />
                            <asp:Parameter Name="Hujat_Khaat_Vallue" Type="String" />
                            <asp:Parameter Name="Equitable_Mortgage_Number" Type="String" />
                            <asp:Parameter Name="Equitable_Mortgage_Date" Type="String" />
                            <asp:Parameter Name="Released_Date" Type="String" />
                            <asp:Parameter Name="Released_By" Type="String" />
                            <asp:Parameter Name="Released_Title_Deeds" Type="String" />
                            <asp:Parameter Name="Based_On" Type="String" />
                            <asp:Parameter Name="Pending_Item_For_Accomplishment" Type="String" />
                            <asp:Parameter Name="Due_Date" Type="String" />
                            <asp:Parameter Name="Received_By" Type="String" />
                            <asp:Parameter Name="Status" Type="String" />
                            <asp:Parameter Name="Remark" Type="String" />
                            <asp:Parameter Name="Add_Loan_Status" Type="String" />
                            <asp:Parameter Name="Inserted_By" Type="String" />
                            <asp:Parameter Name="Updated_By" Type="String" />
                            <asp:Parameter Name="Approved_By" Type="String" />
                            <asp:Parameter Name="Inserted_Date" Type="String" />
                            <asp:Parameter Name="id" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <div style="margin-top: -5px;">
                        <asp:GridView ID="GridView3" OnRowCommand="GridView3_RowCommand" runat="server" ShowHeaderWhenEmpty="True"
                            AllowSorting="True" CssClass="auto-style1" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC"
                            BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlConUpdate" PageSize="7" Width="1251px" Visible="False" OnSelectedIndexChanged="GridView3_SelectedIndexChanged">
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


                                <asp:TemplateField HeaderText="id" SortExpression="id">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("id") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="center" />
                                    <ItemStyle CssClass="center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Client Name" SortExpression="Client Name">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("[Client Name]") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("[Client Name]") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="center" />
                                    <ItemStyle CssClass="center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Loan Type" SortExpression="Loan Type">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("[Loan Type]") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("[Loan Type]") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="center" />
                                    <ItemStyle CssClass="center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Qabala Type" SortExpression="Qabala Type">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("[Qabala Type]") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("[Qabala Type]") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="center" />
                                    <ItemStyle CssClass="center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Qabala Number" SortExpression="Qabala Number">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("[Qabala Number]") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("[Qabala Number]") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="center" />
                                    <ItemStyle CssClass="center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Qabala Date" SortExpression="Qabala Date">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("[Qabala Date]") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("[Qabala Date]") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="center" />
                                    <ItemStyle CssClass="center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Owner of Qabala" SortExpression="Owner of Qabala">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("[Owner of Qabala]") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("[Owner of Qabala]") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="center" />
                                    <ItemStyle CssClass="center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Type of Property" SortExpression="Type of Property">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("[Type of Property]") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label8" runat="server" Text='<%# Bind("[Type of Property]") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="center" />
                                    <ItemStyle CssClass="center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Value of Property" SortExpression="Value of Property">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("[Value of Property]") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label9" runat="server" Text='<%# Bind("[Value of Property]") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="center" />
                                    <ItemStyle CssClass="center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Currency" SortExpression="Currency">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("Currency") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label10" runat="server" Text='<%# Bind("Currency") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="center" />
                                    <ItemStyle CssClass="center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Property Evaluator" SortExpression="Property Evaluator">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("[Property Evaluator]") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label11" runat="server" Text='<%# Bind("[Property Evaluator]") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="center" />
                                    <ItemStyle CssClass="center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Address" SortExpression="Address">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox12" runat="server" Text='<%# Bind("Address") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label12" runat="server" Text='<%# Bind("Address") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="center" />
                                    <ItemStyle CssClass="center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Last Evaluation Date" SortExpression="Last Evaluation Date">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox13" runat="server" Text='<%# Bind("[Last Evaluation Date]") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label13" runat="server" Text='<%# Bind("[Last Evaluation Date]") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="center" />
                                    <ItemStyle CssClass="center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Registered Mortgage No" SortExpression="Registered Mortgage No">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox14" runat="server" Text='<%# Bind("[Registered Mortgage No]") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label14" runat="server" Text='<%# Bind("[Registered Mortgage No]") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="center" />
                                    <ItemStyle CssClass="center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Registered Mortgage Date" SortExpression="Registered Mortgage Date">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox15" runat="server" Text='<%# Bind("[Registered Mortgage Date]") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label15" runat="server" Text='<%# Bind("[Registered Mortgage Date]") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="center" />
                                    <ItemStyle CssClass="center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Mortgage Value" SortExpression="Mortgage Value">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox16" runat="server" Text='<%# Bind("[Mortgage Value]") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label16" runat="server" Text='<%# Bind("[Mortgage Value]") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="center" />
                                    <ItemStyle CssClass="center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Hujat Khaat Number" SortExpression="Hujat Khaat Number">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox17" runat="server" Text='<%# Bind("[Hujat Khaat Number]") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label17" runat="server" Text='<%# Bind("[Hujat Khaat Number]") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="center" />
                                    <ItemStyle CssClass="center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Hujat Khaat Date" SortExpression="Hujat Khaat Date">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox18" runat="server" Text='<%# Bind("[Hujat Khaat Date]") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label18" runat="server" Text='<%# Bind("[Hujat Khaat Date]") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="center" />
                                    <ItemStyle CssClass="center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Hujat Khaat Vallue" SortExpression="Hujat Khaat Vallue">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox19" runat="server" Text='<%# Bind("[Hujat Khaat Vallue]") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label19" runat="server" Text='<%# Bind("[Hujat Khaat Vallue]") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="center" />
                                    <ItemStyle CssClass="center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Equitable Mortgage Number" SortExpression="Equitable Mortgage Number">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox20" runat="server" Text='<%# Bind("[Equitable Mortgage Number]") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label20" runat="server" Text='<%# Bind("[Equitable Mortgage Number]") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="center" />
                                    <ItemStyle CssClass="center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Equitable Mortgage Date" SortExpression="Equitable Mortgage Date">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox21" runat="server" Text='<%# Bind("[Equitable Mortgage Date]") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label21" runat="server" Text='<%# Bind("[Equitable Mortgage Date]") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="center" />
                                    <ItemStyle CssClass="center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Released Date" SortExpression="Released Date">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox22" runat="server" Text='<%# Bind("[Released Date]") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label22" runat="server" Text='<%# Bind("[Released Date]") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="center" />
                                    <ItemStyle CssClass="center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Released By" SortExpression="Released By">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox23" runat="server" Text='<%# Bind("[Released By]") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label23" runat="server" Text='<%# Bind("[Released By]") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="center" />
                                    <ItemStyle CssClass="center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Released Title Deeds" SortExpression="Released Title Deeds">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox24" runat="server" Text='<%# Bind("[Released Title Deeds]") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label24" runat="server" Text='<%# Bind("[Released Title Deeds]") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="center" />
                                    <ItemStyle CssClass="center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Based On" SortExpression="Based On">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox25" runat="server" Text='<%# Bind("[Based On]") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label25" runat="server" Text='<%# Bind("[Based On]") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="center" />
                                    <ItemStyle CssClass="center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Pending Item For Accomplishment" SortExpression="Pending Item For Accomplishment">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox26" runat="server" Text='<%# Bind("[Pending Item For Accomplishment]") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label26" runat="server" Text='<%# Bind("[Pending Item For Accomplishment]") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="center" />
                                    <ItemStyle CssClass="center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Received By" SortExpression="Received By">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox27" runat="server" Text='<%# Bind("[Received By]") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label27" runat="server" Text='<%# Bind("[Received By]") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="center" />
                                    <ItemStyle CssClass="center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Status" SortExpression="Status">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox28" runat="server" Text='<%# Bind("Status") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label28" runat="server" Text='<%# Bind("Status") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="center" />
                                    <ItemStyle CssClass="center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Remark" SortExpression="Remark">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox29" runat="server" Text='<%# Bind("Remark") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label29" runat="server" Text='<%# Bind("Remark") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="center" />
                                    <ItemStyle CssClass="center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Inserted By" SortExpression="Inserted By">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox30" runat="server" Text='<%# Bind("[Inserted By]") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label30" runat="server" Text='<%# Bind("[Inserted By]") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="center" />
                                    <ItemStyle CssClass="center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Updated By" SortExpression="Updated By">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox31" runat="server" Text='<%# Bind("[Updated By]") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label31" runat="server" Text='<%# Bind("[Updated By]") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="center" />
                                    <ItemStyle CssClass="center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Approved By" SortExpression="Approved By">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox32" runat="server" Text='<%# Bind("[Approved By]") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label32" runat="server" Text='<%# Bind("[Approved By]") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="center" />
                                    <ItemStyle CssClass="center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Inserted Date" SortExpression="Inserted Date">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox33" runat="server" Text='<%# Bind("[Inserted Date]") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label33" runat="server" Text='<%# Bind("[Inserted Date]") %>'></asp:Label>
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

                    <asp:SqlDataSource ID="SqlConUpdate" runat="server" ConnectionString="<%$ ConnectionStrings:DBCon %>"
                        SelectCommand="SELECT * FROM [RTD_Pending_Update]" InsertCommand="INSERT INTO [RTD_Pending_Update] ([id], [Client Name], [Loan Type], [Qabala Type], [Qabala Number], [Qabala Date], [Owner of Qabala], [Type of Property], [Value of Property], [Currency], [Property Evaluator], [Address], [Last Evaluation Date], [Registered Mortgage No], [Registered Mortgage Date], [Mortgage Value], [Hujat Khaat Number], [Hujat Khaat Date], [Hujat Khaat Vallue], [Equitable Mortgage Number], [Equitable Mortgage Date], [Released Date], [Released By], [Released Title Deeds], [Based On], [Pending Item For Accomplishment], [Received By], [Status], [Remark], [Inserted By], [Updated By], [Approved By], [Inserted Date]) VALUES (@id, @Client_Name, @Loan_Type, @Qabala_Type, @Qabala_Number, @Qabala_Date, @Owner_of_Qabala, @Type_of_Property, @Value_of_Property, @Currency, @Property_Evaluator, @Address, @Last_Evaluation_Date, @Registered_Mortgage_No, @Registered_Mortgage_Date, @Mortgage_Value, @Hujat_Khaat_Number, @Hujat_Khaat_Date, @Hujat_Khaat_Vallue, @Equitable_Mortgage_Number, @Equitable_Mortgage_Date, @Released_Date, @Released_By, @Released_Title_Deeds, @Based_On, @Pending_Item_For_Accomplishment, @Received_By, @Status, @Remark, @Inserted_By, @Updated_By, @Approved_By, @Inserted_Date)">
                        <InsertParameters>
                            <asp:Parameter Name="id" Type="Int32" />
                            <asp:Parameter Name="Client_Name" Type="String" />
                            <asp:Parameter Name="Loan_Type" Type="String" />
                            <asp:Parameter Name="Qabala_Type" Type="String" />
                            <asp:Parameter Name="Qabala_Number" Type="String" />
                            <asp:Parameter Name="Qabala_Date" Type="String" />
                            <asp:Parameter Name="Owner_of_Qabala" Type="String" />
                            <asp:Parameter Name="Type_of_Property" Type="String" />
                            <asp:Parameter Name="Value_of_Property" Type="String" />
                            <asp:Parameter Name="Currency" Type="String" />
                            <asp:Parameter Name="Property_Evaluator" Type="String" />
                            <asp:Parameter Name="Address" Type="String" />
                            <asp:Parameter Name="Last_Evaluation_Date" Type="String" />
                            <asp:Parameter Name="Registered_Mortgage_No" Type="String" />
                            <asp:Parameter Name="Registered_Mortgage_Date" Type="String" />
                            <asp:Parameter Name="Mortgage_Value" Type="String" />
                            <asp:Parameter Name="Hujat_Khaat_Number" Type="String" />
                            <asp:Parameter Name="Hujat_Khaat_Date" Type="String" />
                            <asp:Parameter Name="Hujat_Khaat_Vallue" Type="String" />
                            <asp:Parameter Name="Equitable_Mortgage_Number" Type="String" />
                            <asp:Parameter Name="Equitable_Mortgage_Date" Type="String" />
                            <asp:Parameter Name="Released_Date" Type="String" />
                            <asp:Parameter Name="Released_By" Type="String" />
                            <asp:Parameter Name="Released_Title_Deeds" Type="String" />
                            <asp:Parameter Name="Based_On" Type="String" />
                            <asp:Parameter Name="Pending_Item_For_Accomplishment" Type="String" />
                            <asp:Parameter Name="Received_By" Type="String" />
                            <asp:Parameter Name="Status" Type="String" />
                            <asp:Parameter Name="Remark" Type="String" />
                            <asp:Parameter Name="Inserted_By" Type="String" />
                            <asp:Parameter Name="Updated_By" Type="String" />
                            <asp:Parameter Name="Approved_By" Type="String" />
                            <asp:Parameter Name="Inserted_Date" Type="String" />
                        </InsertParameters>

                    </asp:SqlDataSource>

            </ContentTemplate>


        </asp:UpdatePanel>

    </div>

    <%--<script type="text/javascript">
    function HideLabel() {
        var seconds = 3;
        setTimeout(function () {
            document.getElementById("<%=Lblresult.ClientID %>").style.display = "none";
        }, seconds * 1000);
    };
</script>--%>
</asp:Content>
