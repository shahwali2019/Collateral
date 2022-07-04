<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="Collateral_int.acgf_records" CodeBehind="acgf_records.aspx.cs" %>



<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

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
              <h4 class="alert-heading" style="font-family:Bahnschrift;"><strong>ACGF RECORDSaaa</strong></h4>  
           </div>
     <asp:Panel runat="server" DefaultButton="searchBtn">
             <table>
                 <tr style="padding:10px 10px;">
                     <td><asp:TextBox ID="txtbname" placeholder="Borrower Name" runat="server" Height="31px" Width="168px" BackColor="#FFFF99" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Small" TabIndex="2" CssClass="form-control"></asp:TextBox></td>
                    <td>&nbsp;</td>
                     <td><asp:TextBox ID="txtCode" runat="server" placeholder="Code" BackColor="#FFFF99" Height="31px" Width="60px" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Small" TabIndex="3" CssClass="form-control"></asp:TextBox></td>
                    <td>&nbsp;</td>
                     <td><asp:TextBox ID="txtLog" runat="server" BackColor="#FFFF99" Height="31px" placeholder="LOG" Width="74px" Font-Names="Bahnschrift" Font-Size="Small" TabIndex="4" CssClass="form-control" Font-Bold="True"></asp:TextBox></td>
               <td>&nbsp;</td>
                     <td>
                          <asp:DropDownList ID="statusList" runat="server" CssClass="btn-success" Height="31px" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Small" TabIndex="5">
                 <asp:ListItem Selected="True" Value="GC">Guarantee Claimed </asp:ListItem>
                 <asp:ListItem>YES</asp:ListItem>
                 <asp:ListItem>NO</asp:ListItem>
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
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select" CommandArgument='<%# Bind("id") %>' Text="Select"></asp:LinkButton>
                </ItemTemplate>
                <ControlStyle CssClass="center" />
                <HeaderStyle CssClass="center" />
                <ItemStyle CssClass="center" />
            </asp:TemplateField>
            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" >
            <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
            </asp:BoundField>
            <asp:BoundField DataField="Borrower Name" HeaderText="Borrower Name" SortExpression="Borrower Name" >
                  <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
            </asp:BoundField>

            <asp:BoundField DataField="Faciliy Approval No" HeaderText="Faciliy Approval No." SortExpression="Faciliy Approval No">
                  <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
            </asp:BoundField>

            <asp:BoundField DataField="Product Code" HeaderText="Product Code" SortExpression="Product Code">
                  <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
            </asp:BoundField>

            <asp:BoundField DataField="LOG No" HeaderText="LOG No.#" SortExpression="LOG No">
                  <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
            </asp:BoundField>

            <asp:BoundField DataField="Maturity Date of Facility" HeaderText="Maturity Date of Facility" SortExpression="Maturity Date of Facility">
                  <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
            </asp:BoundField>

            <asp:BoundField DataField="ACGF Expiry Date" HeaderText="ACGF Expiry Date" SortExpression="ACGF Expiry Date">
                  <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
            </asp:BoundField>

            <asp:BoundField DataField="Guarantee Claimed" HeaderText="Guarantee Claimed" SortExpression="Guarantee Claimed">
                  <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
            </asp:BoundField>

            <asp:BoundField DataField="Remark" HeaderText="Remark" SortExpression="Remark" >
                  <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
            </asp:BoundField>

            <asp:BoundField DataField="InsertedBy" HeaderText="InsertedBy" SortExpression="InsertedBy">
                  <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
            </asp:BoundField>

            <asp:BoundField DataField="Approved By" HeaderText="Approved By" SortExpression="Approved By" >
                  <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
            </asp:BoundField>

            <asp:BoundField DataField="Updated By" HeaderText="Updated By" SortExpression="Updated By" >
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
     <asp:SqlDataSource ID="StringCon" runat="server" ConnectionString="<%$ ConnectionStrings:DBCon %>" DeleteCommand="DELETE FROM [ACGF] WHERE [id] = @id" InsertCommand="INSERT INTO [ACGF] ([Borrower Name], [Faciliy Approval No.], [Product Code], [LOG No.#], [Maturity Date of Facility], [ACGF Expiry Date], [Guarantee Claimed], [Remark], [InsertedBy], [Approved By], [Updated By]) VALUES (@Borrower_Name, @column1, @Product_Code, @column2, @Maturity_Date_of_Facility, @ACGF_Expiry_Date, @Guarantee_Claimed, @Remark, @InsertedBy, @Approved_By, @Updated_By)" SelectCommand="SELECT * FROM [ACGF]" UpdateCommand="UPDATE [ACGF] SET [Borrower Name] = @Borrower_Name, [Faciliy Approval No.] = @column1, [Product Code] = @Product_Code, [LOG No.#] = @column2, [Maturity Date of Facility] = @Maturity_Date_of_Facility, [ACGF Expiry Date] = @ACGF_Expiry_Date, [Guarantee Claimed] = @Guarantee_Claimed, [Remark] = @Remark, [InsertedBy] = @InsertedBy, [Approved By] = @Approved_By, [Updated By] = @Updated_By WHERE [id] = @id">
         <DeleteParameters>
             <asp:Parameter Name="id" Type="Int32" />
         </DeleteParameters>
         <InsertParameters>
             <asp:Parameter Name="Borrower_Name" Type="String" />
             <asp:Parameter Name="column1" Type="String" />
             <asp:Parameter Name="Product_Code" Type="String" />
             <asp:Parameter Name="column2" Type="String" />
             <asp:Parameter Name="Maturity_Date_of_Facility" Type="String" />
             <asp:Parameter Name="ACGF_Expiry_Date" Type="String" />
             <asp:Parameter Name="Guarantee_Claimed" Type="String" />
             <asp:Parameter Name="Remark" Type="String" />
             <asp:Parameter Name="InsertedBy" Type="String" />
             <asp:Parameter Name="Approved_By" Type="String" />
             <asp:Parameter Name="Updated_By" Type="String" />
         </InsertParameters>
         <UpdateParameters>
             <asp:Parameter Name="Borrower_Name" Type="String" />
             <asp:Parameter Name="column1" Type="String" />
             <asp:Parameter Name="Product_Code" Type="String" />
             <asp:Parameter Name="column2" Type="String" />
             <asp:Parameter Name="Maturity_Date_of_Facility" Type="String" />
             <asp:Parameter Name="ACGF_Expiry_Date" Type="String" />
             <asp:Parameter Name="Guarantee_Claimed" Type="String" />
             <asp:Parameter Name="Remark" Type="String" />
             <asp:Parameter Name="InsertedBy" Type="String" />
             <asp:Parameter Name="Approved_By" Type="String" />
             <asp:Parameter Name="Updated_By" Type="String" />
             <asp:Parameter Name="id" Type="Int32" />
         </UpdateParameters>
     </asp:SqlDataSource>
</asp:Content>
