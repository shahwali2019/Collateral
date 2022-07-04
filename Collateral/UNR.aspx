<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UNR.aspx.cs" Inherits="Collateral.under_ntc_Views" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<style>
.nowrap {
      white-space: nowrap;
      text-align: center;
      width: 170px;
        }

.container{
    font-size: small;
    margin-left:2px;
padding-left:32px;
font-family:Times New Roman;
align-content: center;
}
</style>
<div id="mainContainer" class="container" >
  <div class="shadowBox">
    <div class="page-container">
      <div class="container">
        <div class="jumbotron">
           <h5>
                <asp:Label ID="lblsuccessmessage" Text="" runat="server" ForeColor="Green" />
                <br />
                <asp:Label ID="lblerrormessage" Text="" runat="server" ForeColor="red" />
            </h5>
<%--          <p class="text-danger">Collateral </p>--%>
          <span class="text-info">UNDER NOTICE APPROVAL RECORD </span>  
        </div>
          <asp:Panel runat="server" DefaultButton="searchBtn">
      <table>
      <tr style="padding:10px 10px;">
         <td>
            <asp:TextBox ID="txtrespct_name" placeholder="Respective Name" runat="server" Visible="true" Height="31px" Width="168px" BackColor="#FFFF99" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Small" TabIndex="4" CssClass="form-control"></asp:TextBox>
         </td>
          <td>
            <asp:TextBox ID="txtapprno" placeholder="Approval Number" runat="server" Visible="true" Height="31px" Width="168px" BackColor="#FFFF99" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Small" TabIndex="4" CssClass="form-control"></asp:TextBox>
         </td>
         <td>
            <asp:DropDownList ID="txtgroupname" runat="server" CssClass="btn-info" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Small" Height="31px" Width="168px" TabIndex="4">
               <asp:ListItem Value="sor" Selected="True">Group Name</asp:ListItem>
					<asp:ListItem Text="Funded" Value="Funded"></asp:ListItem>
					<asp:ListItem Text="Non Funded" Value="Non Funded"></asp:ListItem>
					<asp:ListItem Text="Others" Value="Others"></asp:ListItem>
            </asp:DropDownList>
         </td>
                             <td>
            <asp:Button ID="searchBtn" runat="server" CssClass="btn-primary focus" Font-Bold="True" Font-Size="Small" Height="31px" OnClick="searchBtn_Click" Text="Search" Width="67px" Font-Names="Bahnschrift" BorderStyle="None" />
         </td>
      </tr>

   </table>
          </asp:Panel>
        <div class="row" style="font-size: 11px; max-width: 2000px">
          <div class="col-lg-12">
            <div style="margin-left:10px;">
              <asp:Label ID="resultLbl" runat="server" Font-Bold="True" Font-Size="Smaller" ForeColor="Red" Visible="False" Font-Names="Bahnschrift Condensed"></asp:Label>
            </div>
            <hr style="border-bottom:5px solid #003399" />
            <div class="table-responsive" style="">
              <asp:ImageButton ID="excelExporter" runat="server" Height="23px" ImageUrl="~/image/excel1.png" OnClick="excelExporter_Click" ToolTip="Export to excel" Width="17px" />
              &nbsp;
              <asp:ImageButton ID="addNew" runat="server" Height="25px" ImageUrl="~/image/add.png" OnClick="addNew_Click" ToolTip="Add New Record" Width="18px" />
              <br />
              <asp:GridView ID="GridView1" runat="server" OnRowDataBound="GridView1_RowDataBound" OnRowCreated="GridView1_RowCreated" HeaderStyle-ForeColor="#636363" OnRowDeleting="GridView1_RowDeleting" ShowHeaderWhenEmpty="False" AutoGenerateColumns="False" CellPadding="4" GridLines="Horizontal" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" EnableTheming="True" HorizontalAlign="Center" OnRowCommand="GridView1_RowCommand" CssClass="table table-striped table-bordered table-hover" ItemStyle-Width="200px" HeaderStyle-BackColor="#3AC0F2">
                <AlternatingRowStyle BorderStyle="None" HorizontalAlign="Center" />                 
                <Columns>
                 <asp:TemplateField HeaderText="">
                     <ItemTemplate>
                      <asp:ImageButton ID="btnDelete" runat="server" OnClientClick="return confirm('Are you sure you want to delete?');" ImageUrl="image/Delete.png" CommandName="Delete" CommandArgument='<%#Eval("Id") %>' ToolTip="Delete" Width="20px" Height="20px" />
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
                  <asp:TemplateField   ShowHeader="False">
                    <ItemTemplate>
                      <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandArgument='<%# Bind("Id") %>' CommandName="edit" Text="Edit"></asp:LinkButton>
                    </ItemTemplate>
                    <HeaderStyle CssClass="center" />
                    <ItemStyle CssClass="center" />
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
                  <asp:TemplateField HeaderText="Group Name" SortExpression="Group Name"  HeaderStyle-CssClass="font-size: 200px"  ItemStyle-CssClass="nowrap">
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
                  <asp:TemplateField HeaderText="Description of Notice Received" SortExpression="Full Description of the notice" ItemStyle-CssClass="nowrap">
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
                <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" Width="1500px" />
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
  </div>
</div>
</asp:Content>
