<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="obsr_loan_docs.aspx.cs" Inherits="Collateral.obsr_loan_docs" %>
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

         </style>
     <div style=" text-align:center; height:100px; margin-top:10px; " class="alert alert-success" role="alert">
              <h4 class="alert-heading" style="font-family:Bahnschrift;"><strong>OLDs RECORDS</strong></h4>  
           </div>
     <asp:Panel runat="server" DefaultButton="searchBtn">
             <table>
                 <tr style="padding:10px 10px;">
                     <td><asp:TextBox ID="txtcustcase" placeholder="Case Number" runat="server" Height="31px" Width="168px" BackColor="#FFFF99" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Small" TabIndex="2" CssClass="form-control"></asp:TextBox></td>
                    <td>&nbsp;</td>
                     <td>
                         <asp:DropDownList ID="txtfcility_type" runat="server" CssClass="btn-info" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Small" Height="31px" TabIndex="4" Width="130px">
                             <asp:ListItem Value="FT" Selected="True">Facility type</asp:ListItem>
                        <asp:ListItem  Value="LSME"></asp:ListItem>
                        <asp:ListItem  Value=" LFSC"></asp:ListItem>
                        <asp:ListItem  Value=" LPIF"></asp:ListItem>
                        <asp:ListItem  Value="SBML"></asp:ListItem>
                        <asp:ListItem  Value=" SBSL"></asp:ListItem>
                        <asp:ListItem  Value=" LIND"></asp:ListItem>
                        <asp:ListItem  Value="MCFP"></asp:ListItem>
                        <asp:ListItem  Value=" MRCF"></asp:ListItem>
                        <asp:ListItem  Value="HELO"></asp:ListItem>
                        <asp:ListItem  Value="AZDL"></asp:ListItem>
                        <asp:ListItem  Value="PAYL"></asp:ListItem>
                        <asp:ListItem  Value="TLCL"></asp:ListItem>
                        <asp:ListItem  Value="GTEP"></asp:ListItem>
                        <asp:ListItem  Value=" GTEA"></asp:ListItem>
                        <asp:ListItem  Value=" GTEB"></asp:ListItem>
                        <asp:ListItem  Value=" GTIR"></asp:ListItem>
                        <asp:ListItem  Value=" LCSB"></asp:ListItem>
                        <asp:ListItem  Value="EXLC"></asp:ListItem>
                        <asp:ListItem  Value="ABIL"></asp:ListItem>
                        <asp:ListItem  Value="OFDC"></asp:ListItem>
                        <asp:ListItem  Value="UILC"></asp:ListItem>
                        <asp:ListItem  Value="CCARDS"></asp:ListItem>
                 
                         </asp:DropDownList>
                     </td>                    <td>&nbsp;</td>
                     <td>
                         <asp:DropDownList ID="txtcust_type" runat="server" CssClass="btn-info" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Small" Height="31px" TabIndex="4" Width="130px">
                             <asp:ListItem Value="CT" Selected="True">Customer type ( PEP /None)</asp:ListItem>
                             <asp:ListItem Value="PEP">PEP</asp:ListItem>
                             <asp:ListItem Value="NONE">NONE</asp:ListItem>
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
                             <asp:Label ID="Label1" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                         </ItemTemplate>
                         <HeaderStyle CssClass="center" />
                         <ItemStyle CssClass="center" />
                     </asp:TemplateField>
                    <asp:TemplateField HeaderText="Document checking date" SortExpression="Document checking date">
                         <EditItemTemplate>
                             <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("[Document checking date]") %>'></asp:TextBox>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="Label2" runat="server" Text='<%# Bind("[Document checking date]") %>'></asp:Label>
                         </ItemTemplate>
                         <HeaderStyle CssClass="center" />
                         <ItemStyle CssClass="center" />
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="Borrower" SortExpression="Borrower">
                         <EditItemTemplate>
                             <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("[Borrower]") %>'></asp:TextBox>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="Label3" runat="server" Text='<%# Bind("[Borrower]") %>'></asp:Label>
                         </ItemTemplate>
                         <HeaderStyle CssClass="center" />
                         <ItemStyle CssClass="center" />
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="Case Number" SortExpression="Case Number">
                         <EditItemTemplate>
                             <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("[Case Number]") %>'></asp:TextBox>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="Label4" runat="server" Text='<%# Bind("[Case Number]") %>'></asp:Label>
                         </ItemTemplate>
                         <HeaderStyle CssClass="center" />
                         <ItemStyle CssClass="center" />
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="Facility type" SortExpression="Facility type">
                         <EditItemTemplate>
                             <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("[Facility type]") %>'></asp:TextBox>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="Label5" runat="server" Text='<%# Bind("[Facility type]") %>'></asp:Label>
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
                     <asp:TemplateField HeaderText="Facility amount" SortExpression="Facility amount">
                         <EditItemTemplate>
                             <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("[Facility amount]") %>'></asp:TextBox>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="Label7" runat="server" Text='<%# Bind("[Facility amount]") %>'></asp:Label>
                         </ItemTemplate>
                         <HeaderStyle CssClass="center" />
                         <ItemStyle CssClass="center" />
                     </asp:TemplateField>

                     <asp:TemplateField HeaderText="Customers type" SortExpression="Customers type">
                         <EditItemTemplate>
                             <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("[Customers type]") %>'></asp:TextBox>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="Label8" runat="server" Text='<%# Bind("[Customers type]") %>'></asp:Label>
                         </ItemTemplate>
                         <HeaderStyle CssClass="center" />
                         <ItemStyle CssClass="center" />
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="initial observations" SortExpression="initial observations">
                         <EditItemTemplate>
                             <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("[initial observations]") %>'></asp:TextBox>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="Label9" runat="server" Text='<%# Bind("[initial observations]") %>'></asp:Label>
                         </ItemTemplate>
                         <HeaderStyle CssClass="center" />
                         <ItemStyle CssClass="center" />
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="Outstanding observations" SortExpression="Outstanding observations">
                         <EditItemTemplate>
                             <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("[Outstanding observations]") %>'></asp:TextBox>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="Label10" runat="server" Text='<%# Bind("[Outstanding observations]") %>'></asp:Label>
                         </ItemTemplate>
                         <HeaderStyle CssClass="center" />
                         <ItemStyle CssClass="center" />
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="Status of Observation" SortExpression="Status of Observation">
                         <EditItemTemplate>
                             <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("[Status of Observation]") %>'></asp:TextBox>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="Label11" runat="server" Text='<%# Bind("[Status of Observation]") %>'></asp:Label>
                         </ItemTemplate>
                         <HeaderStyle CssClass="center" />
                         <ItemStyle CssClass="center" />
                     </asp:TemplateField>


                     <asp:TemplateField HeaderText="Status of Facility" SortExpression="Status of Facility">
                         <EditItemTemplate>
                             <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("[Status of Facility]") %>'></asp:TextBox>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="Label12" runat="server" Text='<%# Bind("[Status of Facility]") %>'></asp:Label>
                         </ItemTemplate>
                         <HeaderStyle CssClass="center" />
                         <ItemStyle CssClass="center" />
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="Inserted By" SortExpression="Inserted By">
                         <EditItemTemplate>
                             <asp:TextBox ID="TextBox12" runat="server" Text='<%# Bind("[1st checker]") %>'></asp:TextBox>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="Label13" runat="server" Text='<%# Bind("[1st checker]") %>'></asp:Label>
                         </ItemTemplate>
                         <HeaderStyle CssClass="center" />
                         <ItemStyle CssClass="center" />
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="Approved By" SortExpression="Approved By">
                         <EditItemTemplate>
                             <asp:TextBox ID="TextBox13" runat="server" Text='<%# Bind("[2nd checker]") %>'></asp:TextBox>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="Label14" runat="server" Text='<%# Bind("[2nd checker]") %>'></asp:Label>
                         </ItemTemplate>
                         <HeaderStyle CssClass="center" />
                         <ItemStyle CssClass="center" />
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="Remarks" SortExpression="Remarks">
                         <EditItemTemplate>
                             <asp:TextBox ID="TextBox14" runat="server" Text='<%# Bind("[Remarks]") %>'></asp:TextBox>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="Label15" runat="server" Text='<%# Bind("[Remarks]") %>'></asp:Label>
                         </ItemTemplate>
                         <HeaderStyle CssClass="center" />
                         <ItemStyle CssClass="center" />
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="Updated By" SortExpression="Updated By">
                         <EditItemTemplate>
                             <asp:TextBox ID="TextBox15" runat="server" Text='<%# Bind("[Updated By]") %>'></asp:TextBox>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="Label16" runat="server" Text='<%# Bind("[Updated By]") %>'></asp:Label>
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
         SelectCommand="SELECT * FROM [OLDs]" OldValuesParameterFormatString="original_{0}">
     </asp:SqlDataSource>



</asp:Content>
