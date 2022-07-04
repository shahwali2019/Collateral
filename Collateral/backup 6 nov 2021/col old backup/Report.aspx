<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Report.aspx.cs" Inherits="Collateral_int.Report" %>
<asp:Content ID="Content1" ContentplaceholderID="MainContent" runat="server">
    <br />
    <br />
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


            .cen{
                margin-left:130px;
            }
        </style>

             <asp:TextBox ID="searchbarTxt" CssClass="cen" runat="server" Height="35px" Width="214px" placeholder="Company Name..."></asp:TextBox>
        <asp:Button  ID="Button1" runat="server" CssClass="btn-primary" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Small" Height="35px"  Text="Show" Width="51px" BackColor="#003399" />
    <br />
        <br />
    <asp:GridView ShowFooter="True" CssClass="cen" ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource1" Width="997px">
        <Columns>

           

           <%-- <asp:BoundField DataField="ReleaseDate" HeaderText="ReleaseDate" SortExpression="ReleaseDate">
                 <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
            </asp:BoundField>--%>


       <%--     <asp:BoundField DataField="Qty" HeaderText="Qty" SortExpression="Qty">
                 <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
            </asp:BoundField>--%>

            <asp:TemplateField HeaderText="Company Name" SortExpression="Customer">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Customer") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Customer") %>'></asp:Label>
                </ItemTemplate>
                <ControlStyle CssClass="center" />
                <HeaderStyle CssClass="center" />
                <ItemStyle CssClass="center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Pledged Date" SortExpression="Date">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Date") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Date") %>'></asp:Label>
                </ItemTemplate>
                <ControlStyle CssClass="center" />
                <HeaderStyle CssClass="center" />
                <ItemStyle CssClass="center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Telecom" SortExpression="Telecom">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Telecom") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Telecom") %>'></asp:Label>
                </ItemTemplate>
                <ControlStyle CssClass="center" />
                <HeaderStyle CssClass="center" />
                <ItemStyle CssClass="center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Value of Each Card" SortExpression="Dinomination">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Dinomination") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Dinomination") %>'></asp:Label>
                </ItemTemplate>
                <ControlStyle CssClass="center" />
                <HeaderStyle CssClass="center" />
                <ItemStyle CssClass="center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Quantity of Carton" SortExpression="No.# of Carton">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("[CartonNo]") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("[CartonNo]") %>'></asp:Label>
                </ItemTemplate>
                <ControlStyle CssClass="center" />
                <HeaderStyle CssClass="center" />
                <ItemStyle CssClass="center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Value of Each Carton" SortExpression="Value of Each Carton">
                <EditItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("[Value of Each Carton]") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("[Value of Each Carton]") %>'></asp:Label>
                </ItemTemplate>
                <ControlStyle CssClass="center" />
                <HeaderStyle CssClass="center" />
                <ItemStyle CssClass="center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Total Value of Carton in [AFN]" SortExpression="Carton Value">
                <EditItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("[Carton Value]") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("[Carton Value]") %>'></asp:Label>
                </ItemTemplate>
                <ControlStyle CssClass="center" />
                <HeaderStyle CssClass="center" />
                <ItemStyle CssClass="center" />
            </asp:TemplateField>

        </Columns>
        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" Font-Size="Small"/>
        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
        <RowStyle BackColor="White" ForeColor="#003399" />
        <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
        <SortedAscendingCellStyle BackColor="#EDF6F6" />
        <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
        <SortedDescendingCellStyle BackColor="#D6DFDF" />
        <SortedDescendingHeaderStyle BackColor="#002876" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DBCon %>" 
        SelectCommand="SELECT bname AS Customer, pdate AS Date, SUM(CartonValAfn) AS [Carton Value], ReleaseDate, Qty, Telecom, dino AS Dinomination, dbo.RowCounter(bname, dino, pdate) AS [CartonNo], dbo.CartonValFun(dino, Qty) AS [Value of Each Carton] FROM Loanadder_tbl GROUP BY pdate, bname, ReleaseDate, dino, Qty, Telecom HAVING (ReleaseDate IS NULL)"></asp:SqlDataSource>
</asp:Content>
