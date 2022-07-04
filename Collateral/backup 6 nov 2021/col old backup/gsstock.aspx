<%@ Page Title="" Language="C#" MasterPageFile="~/MasterGS.Master" AutoEventWireup="true" CodeBehind="gsstock.aspx.cs" Inherits="Collateral_int.gsstock" %>
<asp:Content ID="Content1" ContentplaceholderID="MainContent" runat="server">

     <style>
            .center
            {
                text-align:center;
                font-size:14px;
                 font-family:Bahnschrift;
                 height:30px;
                 width:auto;
                 padding:0 5px 0 5px;
            }
         .auto-style1 {
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
              <h4 class="alert-heading" style="font-family:Bahnschrift;"><strong>PURCHASE LIST </strong></h4>  
           </div>
     <asp:Panel runat="server" DefaultButton="searchBtn">
             <table>
                 <tr style="padding:10px 10px;">
                     <td><asp:TextBox ID="txtCom" placeholder="Company Name" runat="server" Height="32px" Width="168px" BackColor="#FFFFCC" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="X-Small" TabIndex="2" CssClass="auto-style1" ForeColor="Black"></asp:TextBox></td>
                    <td>&nbsp;</td>
                     <td><asp:TextBox ID="txtDate" runat="server"  BackColor="#FFFFCC" Height="32px" Width="128px" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="X-Small" TabIndex="3" CssClass="auto-style1" TextMode="Date" ForeColor="Black"></asp:TextBox></td>
                    <td>&nbsp;</td>
                     <td>&nbsp;</td>
               <td>&nbsp;</td>
                     <td>
                          <asp:DropDownList ID="curList" runat="server" CssClass="btn-success" Height="32px" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="X-Small" TabIndex="5" Width="69px" BackColor="#FFFFCC" ForeColor="Black">
                 <asp:ListItem Selected="True" Value="Currency">Currency</asp:ListItem>
                 <asp:ListItem>USD</asp:ListItem>
                 <asp:ListItem>AFN</asp:ListItem>
                              <asp:ListItem>UERO</asp:ListItem>
             </asp:DropDownList>
                     </td>
                  <td>&nbsp;</td>
                     <td>
                           
            <asp:Button ID="searchBtn" runat="server" CssClass="btn-primary focus" Font-Bold="False" Font-Size="X-Small" Height="32px" OnClick="searchBtn_Click" Text="Search" Width="67px" Font-Names="Bahnschrift" BorderStyle="None" BackColor="#4472C4" />

                     </td>
                 </tr>
             </table>

         </asp:Panel>
    
         <div style="margin-left:10px;">
         <asp:Label ID="resultLbl" runat="server" Font-Bold="True" Font-Size="Smaller" ForeColor="Red" Visible="False" Font-Names="Bahnschrift Condensed"></asp:Label>
             </div>
 
    <hr style="border-bottom:5px solid #003399" />
   
   <div style="margin-left:20px;">
        <br />
        <asp:ImageButton ID="ImageButton1" runat="server" Height="19px" ImageUrl="~/image/excel1.png" ToolTip="Generate Report from selected items" Width="25px" OnClick="ImageButton1_Click" Enabled="False" />
        &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" Height="19px" ImageUrl="~/image/add.png" ToolTip="Add new item" Width="25px" OnClick="ImageButton2_Click" />
        &nbsp;<asp:ImageButton ID="shutdown" runat="server" Height="19px" ImageUrl="~/image/shutdown.jpg" ToolTip="Add new item" Width="25px" OnClick="shutdown_Click" />
        &nbsp;<asp:GridView ID="GridView1" runat="server" OnRowCommand="GridView1_RowCommand" ShowHeaderWhenEmpty="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" DataSourceID="StringCon" GridLines="Horizontal" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" EnableTheming="True" HorizontalAlign="Center" AllowSorting="True" Font-Names="Bahnschrift" Font-Size="X-Small" Width="942px">
            <AlternatingRowStyle BackColor="#FFFFCC" BorderStyle="None" HorizontalAlign="Center" />
        <Columns>
            <asp:TemplateField HeaderText="All">
                     <HeaderTemplate>
                    <asp:CheckBox ID="chkb1" runat="server" Text="All" OnCheckedChanged="chkb1_CheckedChanged" AutoPostBack="true" />
                    </HeaderTemplate>
                     <ControlStyle CssClass="center" />
                     <HeaderStyle CssClass="center" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="center" />
                    <ItemTemplate>
                     <asp:CheckBox ID="chkSelect" runat="server" OnCheckedChanged="chkSelect_CheckedChanged" AutoPostBack="true" />
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
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
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
                   <ControlStyle CssClass="center" />
                <HeaderStyle CssClass="center" />
                <ItemStyle CssClass="center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Date" SortExpression="Date">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Date") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Date") %>'></asp:Label>
                </ItemTemplate>
                   <ControlStyle CssClass="center" />
                <HeaderStyle CssClass="center" />
                <ItemStyle CssClass="center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Branch" SortExpression="Branch">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Branch") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Branch") %>'></asp:Label>
                </ItemTemplate>
                   <ControlStyle CssClass="center" />
                <HeaderStyle CssClass="center" />
                <ItemStyle CssClass="center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Description" SortExpression="Description">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Description") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                </ItemTemplate>
                   <ControlStyle CssClass="center" />
                <HeaderStyle CssClass="center" />
                <ItemStyle CssClass="center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Company Name" SortExpression="Company Name">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("[Company Name]") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("[Company Name]") %>'></asp:Label>
                </ItemTemplate>
                   <ControlStyle CssClass="center" />
                <HeaderStyle CssClass="center" />
                <ItemStyle CssClass="center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Quantity" SortExpression="Quantity">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Quantity") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("Quantity") %>'></asp:Label>
                </ItemTemplate>
                   <ControlStyle CssClass="center" />
                <HeaderStyle CssClass="center" />
                <ItemStyle CssClass="center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Currency" SortExpression="Currency">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Currency") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("Currency") %>'></asp:Label>
                </ItemTemplate>
                   <ControlStyle CssClass="center" />
                <HeaderStyle CssClass="center" />
                <ItemStyle CssClass="center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Unit Price" SortExpression="Unit Price">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("[Unit Price]") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("[Unit Price]") %>'></asp:Label>
                </ItemTemplate>
                   <ControlStyle CssClass="center" />
                <HeaderStyle CssClass="center" />
                <ItemStyle CssClass="center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Total Amount" SortExpression="Total Amount">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("[Total Amount]") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label9" runat="server" Text='<%# Bind("[Total Amount]") %>'></asp:Label>
                </ItemTemplate>
                   <ControlStyle CssClass="center" />
                <HeaderStyle CssClass="center" />
                <ItemStyle CssClass="center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Tax" SortExpression="Tax">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("Tax") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label10" runat="server" Text='<%# Bind("Tax") %>'></asp:Label>
                </ItemTemplate>
                   <ControlStyle CssClass="center" />
                <HeaderStyle CssClass="center" />
                <ItemStyle CssClass="center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Net Amount" SortExpression="Net Amount">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("[Net Amount]") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label11" runat="server" Text='<%# Bind("[Net Amount]") %>'></asp:Label>
                </ItemTemplate>
                   <ControlStyle CssClass="center" />
                <HeaderStyle CssClass="center" />
                <ItemStyle CssClass="center" />
            </asp:TemplateField>

        </Columns>
        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
        <HeaderStyle BackColor="#4472C4" Font-Bold="False" ForeColor="#CCCCFF" Font-Names="Bahnschrift" Font-Size="Small" />
        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" BorderStyle="None" />
        <RowStyle BackColor="White" ForeColor="#003399" />
        <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
        <SortedAscendingCellStyle BackColor="#EDF6F6" />
        <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
        <SortedDescendingCellStyle BackColor="#D6DFDF" />
        <SortedDescendingHeaderStyle BackColor="#002876" />

    </asp:GridView>
        
    </div>
    <br />
     <asp:SqlDataSource ID="StringCon" runat="server" ConnectionString="<%$ ConnectionStrings:DBCon %>" DeleteCommand="DELETE FROM [GS_repository] WHERE [id] = @id" InsertCommand="INSERT INTO [GS_repository] ([Date], [Branch], [Description], [Company Name], [Quantity], [Currency], [Unit Price], [Total Amount], [Tax], [Net Amount]) VALUES (@Date, @Branch, @Description, @Company_Name, @Quantity, @Currency, @Unit_Price, @Total_Amount, @Tax, @Net_Amount)" SelectCommand="SELECT * FROM [GS_repository]" UpdateCommand="UPDATE [GS_repository] SET [Date] = @Date, [Branch] = @Branch, [Description] = @Description, [Company Name] = @Company_Name, [Quantity] = @Quantity, [Currency] = @Currency, [Unit Price] = @Unit_Price, [Total Amount] = @Total_Amount, [Tax] = @Tax, [Net Amount] = @Net_Amount WHERE [id] = @id">
         <DeleteParameters>
             <asp:Parameter Name="id" Type="Int32" />
         </DeleteParameters>
         <InsertParameters>
             <asp:Parameter Name="Date" Type="String" />
             <asp:Parameter Name="Branch" Type="String" />
             <asp:Parameter Name="Description" Type="String" />
             <asp:Parameter Name="Company_Name" Type="String" />
             <asp:Parameter Name="Quantity" Type="Int32" />
             <asp:Parameter Name="Currency" Type="String" />
             <asp:Parameter Name="Unit_Price" Type="Decimal" />
             <asp:Parameter Name="Total_Amount" Type="Decimal" />
             <asp:Parameter Name="Tax" Type="Decimal" />
             <asp:Parameter Name="Net_Amount" Type="Decimal" />
         </InsertParameters>
         <UpdateParameters>
             <asp:Parameter Name="Date" Type="String" />
             <asp:Parameter Name="Branch" Type="String" />
             <asp:Parameter Name="Description" Type="String" />
             <asp:Parameter Name="Company_Name" Type="String" />
             <asp:Parameter Name="Quantity" Type="Int32" />
             <asp:Parameter Name="Currency" Type="String" />
             <asp:Parameter Name="Unit_Price" Type="Decimal" />
             <asp:Parameter Name="Total_Amount" Type="Decimal" />
             <asp:Parameter Name="Tax" Type="Decimal" />
             <asp:Parameter Name="Net_Amount" Type="Decimal" />
             <asp:Parameter Name="id" Type="Int32" />
         </UpdateParameters>
     </asp:SqlDataSource>
</asp:Content>
