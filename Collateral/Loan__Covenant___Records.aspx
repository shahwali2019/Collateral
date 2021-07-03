<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Loan__Covenant___Records.aspx.cs" Inherits="Collateral_int.Loan__Covenant___Records" %>
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
         .auto-style2 {
             display: block;
             padding: 6px 12px;
             font-size: 14px;
             line-height: 1.42857143;
             color: #555;
             background-color: #fff;
             background-image: none;
             border: 1px solid #ccc;
             border-radius: 4px;
             -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
             box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
             -webkit-transition: border-color ease-in-out .15s, -webkit-box-shadow ease-in-out .15s;
             -o-transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
             transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
         }
         </style>
     <div style=" text-align:center; height:100px; margin-top:10px; " class="alert alert-success" role="alert">
              <h4 class="alert-heading" style="font-family:Bahnschrift;"><strong>LCR RECORDS</strong></h4>  
           </div>
     <asp:Panel runat="server" DefaultButton="searchBtn">
             <table>
                 <tr style="padding:10px 10px;">
                     <td><asp:TextBox ID="txtComName" placeholder="Customer Name" runat="server" Height="31px" Width="168px" BackColor="#FFFF99" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Small" TabIndex="2" CssClass="form-control"></asp:TextBox></td>
                    <td>&nbsp;</td>
                     <td><asp:TextBox ID="txtAppNo" runat="server" placeholder="Approval Name" BackColor="#FFFF99" Height="31px" Width="168px" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Small" TabIndex="3" CssClass="auto-style2"></asp:TextBox></td>
                    <td>&nbsp;</td>
                     <td>
                         <asp:DropDownList ID="drop_down_facility_type" runat="server" CssClass="btn-info" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Small" Height="31px" TabIndex="4" Width="130px">
                             <asp:ListItem Selected="True" Value="CS">Condition Status</asp:ListItem>
                             <asp:ListItem Value="Active">Actived</asp:ListItem>
                             <asp:ListItem Value="Closed">Closed</asp:ListItem>
                 
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
        <asp:ImageButton ID="excelExporter" runat="server" Height="23px" ImageUrl="~/image/excel1.png" OnClick="excelExporter_Click" ToolTip="Export to excel" Width="17px" />
        &nbsp;<asp:ImageButton ID="addNew" runat="server" Height="25px" ImageUrl="~/image/add.png" OnClick="addNew_Click" Width="18px" />
    
        <br />
        <asp:GridView ID="GridView1" runat="server" OnRowCommand="GridView1_RowCommand" ShowHeaderWhenEmpty="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="StringCon" GridLines="Horizontal" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" EnableTheming="True" HorizontalAlign="Center" Width="999px">
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
                             <asp:Label ID="Label2" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                         </ItemTemplate>
                         <HeaderStyle CssClass="center" />
                         <ItemStyle CssClass="center" />
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="Customer Name" SortExpression="Customer Name">
                         <EditItemTemplate>
                             <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("[Customer Name]") %>'></asp:TextBox>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="Label3" runat="server" Text='<%# Bind("[Customer Name]") %>'></asp:Label>
                         </ItemTemplate>
                         <HeaderStyle CssClass="center" />
                         <ItemStyle CssClass="center" />
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="Approval Name" SortExpression="Approval Name">
                         <EditItemTemplate>
                             <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("[Approval Name]") %>'></asp:TextBox>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="Label4" runat="server" Text='<%# Bind("[Approval Name]") %>'></asp:Label>
                         </ItemTemplate>
                         <HeaderStyle CssClass="center" />
                         <ItemStyle CssClass="center" />
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="Date of Disbursement" SortExpression="Date of Disbursement">
                         <EditItemTemplate>
                             <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("[Date of Disbursement]") %>'></asp:TextBox>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="Label5" runat="server" Text='<%# Bind("[Date of Disbursement]") %>'></asp:Label>
                         </ItemTemplate>
                         <HeaderStyle CssClass="center" />
                         <ItemStyle CssClass="center" />
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="Conditions" SortExpression="Conditions">
                         <EditItemTemplate>
                             <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("[Conditions]") %>'></asp:TextBox>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="Label6" runat="server" Text='<%# Bind("[Conditions]") %>'></asp:Label>
                         </ItemTemplate>
                         <HeaderStyle CssClass="center" />
                         <ItemStyle CssClass="center" />
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="Due Date" SortExpression="Due Date">
                         <EditItemTemplate>
                             <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("[Due Date]") %>'></asp:TextBox>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="Label7" runat="server" Text='<%# Bind("[Due Date]") %>'></asp:Label>
                         </ItemTemplate>
                         <HeaderStyle CssClass="center" />
                         <ItemStyle CssClass="center" />
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="Condition Status" SortExpression="Condition Status">
                         <EditItemTemplate>
                             <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("[Condition Status]") %>'></asp:TextBox>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="Label8" runat="server" Text='<%# Bind("[Condition Status]") %>'></asp:Label>
                         </ItemTemplate>
                         <HeaderStyle CssClass="center" />
                         <ItemStyle CssClass="center" />
                     </asp:TemplateField>

                     <asp:TemplateField HeaderText="Remark" SortExpression="Remark">
                         <EditItemTemplate>
                             <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Remark") %>'></asp:TextBox>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="Label9" runat="server" Text='<%# Bind("Remark") %>'></asp:Label>
                         </ItemTemplate>
                         <HeaderStyle CssClass="center" />
                         <ItemStyle CssClass="center" />
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="Inserted By" SortExpression="Inserted By">
                         <EditItemTemplate>
                             <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("[Inserted By]") %>'></asp:TextBox>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="Label10" runat="server" Text='<%# Bind("[Inserted By]") %>'></asp:Label>
                         </ItemTemplate>
                         <HeaderStyle CssClass="center" />
                         <ItemStyle CssClass="center" />
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="Updated By" SortExpression="Updated By">
                         <EditItemTemplate>
                             <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("[Updated By]") %>'></asp:TextBox>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="Label11" runat="server" Text='<%# Bind("[Updated By]") %>'></asp:Label>
                         </ItemTemplate>
                         <HeaderStyle CssClass="center" />
                         <ItemStyle CssClass="center" />
                     </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Approved By" SortExpression="Approved By">
                         <EditItemTemplate>
                             <asp:TextBox ID="TextBox12" runat="server" Text='<%# Bind("[Approved By]") %>'></asp:TextBox>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="Label12" runat="server" Text='<%# Bind("[Approved By]") %>'></asp:Label>
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
         SelectCommand="SELECT * FROM [LCR]" OldValuesParameterFormatString="original_{0}">
     </asp:SqlDataSource>
</asp:Content>
