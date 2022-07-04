<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="mcu_record.aspx.cs" Inherits="Collateral_int.mcu_record" %>
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
              <h4 class="alert-heading" style="font-family:Bahnschrift;"><strong>MCU RECORDS</strong></h4>  
           </div>
     <asp:Panel runat="server" DefaultButton="searchBtn">
             <table>
                 <tr style="padding:10px 10px;">
                     <td><asp:TextBox ID="txtbname" placeholder="Customer Name" runat="server" Height="31px" Width="168px" BackColor="#FFFF99" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Small" TabIndex="2" CssClass="form-control"></asp:TextBox></td>
                    <td>&nbsp;</td>
                     <td><asp:TextBox ID="txtCode" runat="server" placeholder="Account Number" BackColor="#FFFF99" Height="31px" Width="168px" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Small" TabIndex="3" CssClass="auto-style2"></asp:TextBox></td>
                    <td>&nbsp;</td>
                     <td><asp:TextBox ID="txtLog" runat="server" BackColor="#FFFF99" Height="31px" placeholder="Approved Number" Width="168px" Font-Names="Bahnschrift" Font-Size="Small" TabIndex="4" CssClass="auto-style2" Font-Bold="True"></asp:TextBox></td>
               <td>&nbsp;</td>
                     <td>
                          <asp:DropDownList ID="statusList" runat="server" CssClass="btn-success" Height="31px" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Small" TabIndex="5">
                 <asp:ListItem Selected="True" Value="LS">Loan Status</asp:ListItem>
                 <asp:ListItem>ACTIVE</asp:ListItem>
                 <asp:ListItem>CLOSED</asp:ListItem>
             </asp:DropDownList>
                     </td>
                  <td>&nbsp;</td>
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
        <asp:ImageButton ID="addNew" runat="server" Height="25px" ImageUrl="~/image/add.png" OnClick="addNew_Click" Width="18px" />
    
        <br />
        <asp:GridView ID="GridView1" runat="server" OnRowCommand="GridView1_RowCommand" ShowHeaderWhenEmpty="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" DataSourceID="StringCon" GridLines="Horizontal" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" EnableTheming="True" HorizontalAlign="Center">
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
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select" CommandArgument='<%# Bind("id") %>'  Text="Edit"></asp:LinkButton>
                </ItemTemplate>
                <HeaderStyle BorderStyle="NotSet" CssClass="center" />
                <ItemStyle BorderStyle="NotSet" CssClass="center" />
            </asp:TemplateField>


            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" >
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
            </asp:BoundField>
            <asp:BoundField DataField="Customre Name" HeaderText="Customre Name" SortExpression="Customre Name" >
                   <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
            </asp:BoundField>

            <asp:BoundField DataField="Currency" HeaderText="Currency" SortExpression="Currency">
                   <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
            </asp:BoundField>

            <asp:BoundField DataField="Account Number" HeaderText="Account Number" SortExpression="Account Number">
                   <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
            </asp:BoundField>

            <asp:BoundField DataField="Approval Number" HeaderText="Approval Number" SortExpression="Approval Number">
                   <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
            </asp:BoundField>

            <asp:BoundField DataField="[Disburesement" HeaderText="Disburesement" SortExpression="[Disburesement">
                   <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
            </asp:BoundField>

            <asp:BoundField DataField="Due Date of MCU" HeaderText="MCU Due Date" SortExpression="Due Date of MCU">
                   <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
            </asp:BoundField>

            <asp:BoundField DataField="MCU Date" HeaderText="MCU Date" SortExpression="MCU Date">
                   <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
            </asp:BoundField>

            <asp:BoundField DataField="Loan Status" HeaderText="Loan Status" SortExpression="Loan Status" >
                   <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
            </asp:BoundField>

            <asp:BoundField DataField="Remark" HeaderText="Remark" SortExpression="Remark">
                   <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
            </asp:BoundField>


            <asp:BoundField DataField="Inserted By" HeaderText="Inserted By" SortExpression="Inserted By" >
                   <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
            </asp:BoundField>

            <asp:BoundField DataField="Approved By" HeaderText="Approved By" SortExpression="Approved By" >
                   <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
            </asp:BoundField>

            <asp:BoundField DataField="Updated By" HeaderText="Updated By" SortExpression="Updated By" >
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
    <br />
     <asp:SqlDataSource ID="StringCon" runat="server" ConnectionString="<%$ ConnectionStrings:DBCon %>" DeleteCommand="DELETE FROM [mcu_tbl] WHERE [id] = @id" InsertCommand="INSERT INTO [mcu_tbl] ([Customre Name], [Currency], [Account Number], [Approval Number], [[Disburesement], [Due Date of MCU], [MCU Date], [Loan Status], [Remark], [Inserted By], [Approved By], [Updated By]) VALUES (@Customre_Name, @Currency, @Account_Number, @Approval_Number, @column1, @Due_Date_of_MCU, @MCU_Date, @Loan_Status, @Remark, @Inserted_By, @Approved_By, @Updated_By)" SelectCommand="SELECT * FROM [mcu_tbl]" UpdateCommand="UPDATE [mcu_tbl] SET [Customre Name] = @Customre_Name, [Currency] = @Currency, [Account Number] = @Account_Number, [Approval Number] = @Approval_Number, [[Disburesement] = @column1, [Due Date of MCU] = @Due_Date_of_MCU, [MCU Date] = @MCU_Date, [Loan Status] = @Loan_Status, [Remark] = @Remark, [Inserted By] = @Inserted_By, [Approved By] = @Approved_By, [Updated By] = @Updated_By WHERE [id] = @id">
         <DeleteParameters>
             <asp:Parameter Name="id" Type="Int32" />
         </DeleteParameters>
         <InsertParameters>
             <asp:Parameter Name="Customre_Name" Type="String" />
             <asp:Parameter Name="Currency" Type="String" />
             <asp:Parameter Name="Account_Number" Type="String" />
             <asp:Parameter Name="Approval_Number" Type="String" />
             <asp:Parameter Name="column1" Type="String" />
             <asp:Parameter Name="Due_Date_of_MCU" Type="String" />
             <asp:Parameter Name="MCU_Date" Type="String" />
             <asp:Parameter Name="Loan_Status" Type="String" />
             <asp:Parameter Name="Remark" Type="String" />
             <asp:Parameter Name="Inserted_By" Type="String" />
             <asp:Parameter Name="Approved_By" Type="String" />
             <asp:Parameter Name="Updated_By" Type="String" />
         </InsertParameters>
         <UpdateParameters>
             <asp:Parameter Name="Customre_Name" Type="String" />
             <asp:Parameter Name="Currency" Type="String" />
             <asp:Parameter Name="Account_Number" Type="String" />
             <asp:Parameter Name="Approval_Number" Type="String" />
             <asp:Parameter Name="column1" Type="String" />
             <asp:Parameter Name="Due_Date_of_MCU" Type="String" />
             <asp:Parameter Name="MCU_Date" Type="String" />
             <asp:Parameter Name="Loan_Status" Type="String" />
             <asp:Parameter Name="Remark" Type="String" />
             <asp:Parameter Name="Inserted_By" Type="String" />
             <asp:Parameter Name="Approved_By" Type="String" />
             <asp:Parameter Name="Updated_By" Type="String" />
             <asp:Parameter Name="id" Type="Int32" />
         </UpdateParameters>
     </asp:SqlDataSource>
</asp:Content>
