<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="wak.aspx.cs" Inherits="Collateral_int.wak" %>
<asp:Content ID="Content1" ContentplaceholderID="MainContent" runat="server">
     <style>
            .center
            {
                text-align:center;
                font-size:10px;
                 font-family:Bahnschrift;
                 height:30px;
                 width:auto;
                 padding:0 5px 0 5px;
            }
         .auto-style1 {
             font-weight: normal;
             color: #337ab7;
             border-radius: 0;
             -webkit-box-shadow: none;
             box-shadow: none;
             border-color: transparent;
             background-color: transparent;
         }
        </style>
    
    <div style=" height:90px; text-align:center; margin-left:10px; border-top:10px solid #0094ff; margin-top:0; padding-top:30px;" class="alert alert-success"  role="alert">
              <h4 class="alert-heading" style=" font-family:Bahnschrift;"><strong><asp:Label ID="addLbl" runat="server" >VAULT RECORD OF LOANS</asp:Label></strong></h4>  
           </div> 
   
    <asp:Label ID="SafeInDateLbl" runat="server" Text="Safe In Date Query:" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Small" ForeColor="#0033CC" Height="24px"></asp:Label>
    <br />
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
<asp:TextBox ID="txtDate1" runat="server" TextMode="Date" BackColor="#FFFF99" Height="30px" OnTextChanged="txtDate1_TextChanged"></asp:TextBox>
&nbsp;
        <asp:Label ID="ToLbl" runat="server" Font-Bold="True" Font-Size="Smaller" ForeColor="#003366" Font-Names="Bahnschrift">To</asp:Label>
        &nbsp;&nbsp;<asp:TextBox ID="txtDate2" runat="server" TextMode="Date" AutoPostBack="false" OnTextChanged="TextBox2_TextChanged" BackColor="#FFFF99" Height="31px"></asp:TextBox>
            &nbsp;<div  style="margin-left:350px; margin-top:-29px;"><asp:ImageButton  ID="ImageButton2" runat="server" Height="22px" ImageUrl="~/image/refresh.jpg" OnClick="ImageButton2_Click" Width="24px" /></div>
        </ContentTemplate>
    </asp:UpdatePanel>
     <br />
    <hr style="border-bottom:5px solid #003399" />
    <asp:Label ID="StaticLable" runat="server" Text="Search by: " Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Small" ForeColor="#0033CC" Height="24px"></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;<br />

             <asp:TextBox ID="txtSafeNo" runat="server" placeholder="Client Name" BackColor="#FFFF99" Height="31px" Width="133px"></asp:TextBox>
             &nbsp;<asp:DropDownList AutoPostBack="false" ID="StatusListbox" runat="server" CssClass="btn-success" Height="31px" OnSelectedIndexChanged="StatusListbox_SelectedIndexChanged" Font-Bold="True" Width="124px" Font-Size="Smaller" Font-Names="Bahnschrift">
                 <asp:ListItem Selected="True" Value="DocSta">Document Status</asp:ListItem>
                 <asp:ListItem>Placed</asp:ListItem>
                 <asp:ListItem>Archived</asp:ListItem>
             </asp:DropDownList>

             &nbsp;<asp:DropDownList ID="FacilityTypeList" runat="server" CssClass="btn-success" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Smaller" Font-Strikeout="False" Font-Underline="False" ForeColor="White" Height="34px" TabIndex="3" Width="92px" AutoPostBack="false" OnSelectedIndexChanged="FacilityTypeList_SelectedIndexChanged">
                 <asp:ListItem Text="Facility Type" Value="FacType"></asp:ListItem>
                 <asp:ListItem Text="LSME" Value="LSME"></asp:ListItem>
                 <asp:ListItem Text=" LFSC" Value=" LFSC"></asp:ListItem>
                 <asp:ListItem Text=" LPIF" Value=" LPIF"></asp:ListItem>
                 <asp:ListItem Text="SBML" Value="SBML"></asp:ListItem>
                 <asp:ListItem Text=" SBSL" Value=" SBSL"></asp:ListItem>
                 <asp:ListItem Text=" LIND" Value=" LIND"></asp:ListItem>
                 <asp:ListItem Text="MCFP" Value="MCFP"></asp:ListItem>
                 <asp:ListItem Text=" MRCF" Value=" MRCF"></asp:ListItem>
                 <asp:ListItem Text="HELO" Value="HELO"></asp:ListItem>
                 <asp:ListItem Text="AZDL" Value="AZDL"></asp:ListItem>
                 <asp:ListItem Text="PAYL" Value="PAYL"></asp:ListItem>
                 <asp:ListItem Text="TLCL" Value="TLCL"></asp:ListItem>
                 <asp:ListItem Text="GTEP" Value="GTEP"></asp:ListItem>
                 <asp:ListItem Text=" GTEA" Value=" GTEA"></asp:ListItem>
                 <asp:ListItem Text=" GTEB" Value=" GTEB"></asp:ListItem>
                 <asp:ListItem Text=" GTIR" Value=" GTIR"></asp:ListItem>
                 <asp:ListItem Text=" LCSB" Value=" LCSB"></asp:ListItem>
                 <asp:ListItem Text="EXLC" Value="EXLC"></asp:ListItem>
                 <asp:ListItem Text="ABIL" Value="ABIL"></asp:ListItem>
                 <asp:ListItem Text="OFDC" Value="OFDC"></asp:ListItem>
                 <asp:ListItem Text="UILC" Value="UILC"></asp:ListItem>
                 <asp:ListItem Text="CCARDS" Value="CCARDS"></asp:ListItem>
                 <asp:ListItem>OneDay</asp:ListItem>
     </asp:DropDownList>
             &nbsp;&nbsp;<asp:Button ID="searchBtn" runat="server" CssClass="auto-style1" Font-Bold="True" Font-Size="X-Small" Height="31px" OnClick="searchBtn_Click" Text="FIND" Width="40px" BackColor="#FF6666" BorderColor="#003399" BorderStyle="Solid" BorderWidth="1px" Font-Names="Bahnschrift" />

    <br />
        <asp:Label ID="resultLbl" runat="server" Font-Bold="True" Font-Size="Smaller" ForeColor="Red" Visible="False" Font-Names="Bahnschrift"></asp:Label>
        <br />

    <asp:ImageButton ID="addNew" runat="server" Height="23px" ImageUrl="~/image/add.png" OnClick="addNew_Click" Width="29px" />
    
         <asp:ImageButton ID="ImageButton1" runat="server" Height="20px" ImageUrl="~/image/excel1.png" Width="24px" OnClick="ImageButton1_Click" ToolTip="Export to .xlsx(Excel)" />
    
 <%--   <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>--%>

            <asp:GridView ID="GridView1" OnRowCommand="GridView1_RowCommand" runat="server" AutoGenerateColumns="False" 
         BackColor="White" BorderColor="#3366CC"
         ShowHeaderWhenEmpty="True" 
         BorderStyle="None" BorderWidth="1px" CellPadding="4" Width="1175px" GridLines="Horizontal" >
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

                <asp:TemplateField>
                 <ItemTemplate>
                     <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select" CommandArgument='<%# Bind("id") %>' Text="Select"></asp:LinkButton>
                 </ItemTemplate>
                 <ControlStyle CssClass="center" />
                 <HeaderStyle CssClass="center" HorizontalAlign="Center" VerticalAlign="Middle" />
                 <ItemStyle CssClass="center" />
             </asp:TemplateField>
             <asp:TemplateField HeaderText="id" InsertVisible="False" SortExpression="id" Visible="False">
                 <EditItemTemplate>
                     <asp:Label ID="Label19" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                 </EditItemTemplate>
                 <ItemTemplate>
                     <asp:Label ID="Label19" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                 </ItemTemplate>
                 <ControlStyle CssClass="center" />
                 <HeaderStyle CssClass="center" />
                 <ItemStyle CssClass="center" />
             </asp:TemplateField>
             <asp:TemplateField HeaderText="Client Name" SortExpression="ClientName">
                 <EditItemTemplate>
                     <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ClientName") %>'></asp:TextBox>
                 </EditItemTemplate>
                 <ItemTemplate>
                     <asp:Label ID="Label2" runat="server" Text='<%# Bind("ClientName") %>'></asp:Label>
                 </ItemTemplate>
                 <ControlStyle CssClass="center" />
                 <HeaderStyle CssClass="center" />
                 <ItemStyle CssClass="center" />
             </asp:TemplateField>
             <asp:TemplateField HeaderText="Facility Approval" SortExpression="FacilityApproval">
                 <EditItemTemplate>
                     <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("FacilityApproval") %>'></asp:TextBox>
                 </EditItemTemplate>
                 <ItemTemplate>
                     <asp:Label ID="Label3" runat="server" Text='<%# Bind("FacilityApproval") %>'></asp:Label>
                 </ItemTemplate>
                 <ControlStyle CssClass="center" />
                 <HeaderStyle CssClass="center" />
                 <ItemStyle CssClass="center" />
             </asp:TemplateField>
             <asp:TemplateField HeaderText="Facility Type" SortExpression="FacilityType">
                 <EditItemTemplate>
                     <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("FacilityType") %>'></asp:TextBox>
                 </EditItemTemplate>
                 <ItemTemplate>
                     <asp:Label ID="Label4" runat="server" Text='<%# Bind("FacilityType") %>'></asp:Label>
                 </ItemTemplate>
                 <ControlStyle CssClass="center" />
                 <HeaderStyle CssClass="center" />
                 <ItemStyle CssClass="center" />
             </asp:TemplateField>
             <asp:TemplateField HeaderText="Facility Status" SortExpression="FacilityStatus">
                 <EditItemTemplate>
                     <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("FacilityStatus") %>'></asp:TextBox>
                 </EditItemTemplate>
                 <ItemTemplate>
                     <asp:Label ID="Label5" runat="server" Text='<%# Bind("FacilityStatus") %>'></asp:Label>
                 </ItemTemplate>
                 <ControlStyle CssClass="center" />
                 <HeaderStyle CssClass="center" />
                 <ItemStyle CssClass="center" />
             </asp:TemplateField>
             <asp:TemplateField HeaderText="Safe No" SortExpression="SafeNo">
                 <EditItemTemplate>
                     <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("SafeNo") %>'></asp:TextBox>
                 </EditItemTemplate>
                 <ItemTemplate>
                     <asp:Label ID="Label6" runat="server" Text='<%# Bind("SafeNo") %>'></asp:Label>
                 </ItemTemplate>
                 <ControlStyle CssClass="center" />
                 <HeaderStyle CssClass="center" />
                 <ItemStyle CssClass="center" />
             </asp:TemplateField>
             <asp:TemplateField HeaderText="Drawer" SortExpression="drawer">
                 <EditItemTemplate>
                     <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("drawer") %>'></asp:TextBox>
                 </EditItemTemplate>
                 <ItemTemplate>
                     <asp:Label ID="Label7" runat="server" Text='<%# Bind("drawer") %>'></asp:Label>
                 </ItemTemplate>
                 <ControlStyle CssClass="center" />
                 <HeaderStyle CssClass="center" />
                 <ItemStyle CssClass="center" />
             </asp:TemplateField>
             <asp:TemplateField HeaderText="Folder No.#" SortExpression="FolderNo">
                 <EditItemTemplate>
                     <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("FolderNo") %>'></asp:TextBox>
                 </EditItemTemplate>
                 <ItemTemplate>
                     <asp:Label ID="Label8" runat="server" Text='<%# Bind("FolderNo") %>'></asp:Label>
                 </ItemTemplate>
                 <ControlStyle CssClass="center" />
                 <HeaderStyle CssClass="center" />
                 <ItemStyle CssClass="center" />
             </asp:TemplateField>
             <asp:TemplateField HeaderText="Extention" SortExpression="Extention">
                 <EditItemTemplate>
                     <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("Extention") %>'></asp:TextBox>
                 </EditItemTemplate>
                 <ItemTemplate>
                     <asp:Label ID="Label9" runat="server" Text='<%# Bind("Extention") %>'></asp:Label>
                 </ItemTemplate>
                 <ControlStyle CssClass="center" />
                 <HeaderStyle CssClass="center" />
                 <ItemStyle CssClass="center" />
             </asp:TemplateField>
             <asp:TemplateField HeaderText="Modification" SortExpression="modification">
                 <EditItemTemplate>
                     <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("modification") %>'></asp:TextBox>
                 </EditItemTemplate>
                 <ItemTemplate>
                     <asp:Label ID="Label10" runat="server" Text='<%# Bind("modification") %>'></asp:Label>
                 </ItemTemplate>
                 <ControlStyle CssClass="center" />
                 <HeaderStyle CssClass="center" />
                 <ItemStyle CssClass="center" />
             </asp:TemplateField>
             <asp:TemplateField HeaderText="Safe In Date" SortExpression="SafeInDate">
                 <EditItemTemplate>
                     <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("SafeInDate") %>'></asp:TextBox>
                 </EditItemTemplate>
                 <ItemTemplate>
                     <asp:Label ID="Label11" runat="server" Text='<%# Bind("SafeInDate") %>'></asp:Label>
                 </ItemTemplate>
                 <ControlStyle CssClass="center" />
                 <HeaderStyle CssClass="center" />
                 <ItemStyle CssClass="center" />
             </asp:TemplateField>
             <asp:TemplateField HeaderText="Document Status" SortExpression="DocStatus">
                 <EditItemTemplate>
                     <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("DocStatus") %>'></asp:TextBox>
                 </EditItemTemplate>
                 <ItemTemplate>
                     <asp:Label ID="Label12" runat="server" Text='<%# Bind("DocStatus") %>'></asp:Label>
                 </ItemTemplate>
                 <ControlStyle CssClass="center" />
                 <HeaderStyle CssClass="center" />
                 <ItemStyle CssClass="center" />
             </asp:TemplateField>
             <asp:TemplateField HeaderText="Safe Out Date" SortExpression="SafeOutDate">
                 <EditItemTemplate>
                     <asp:TextBox ID="TextBox12" runat="server" Text='<%# Bind("SafeOutDate") %>'></asp:TextBox>
                 </EditItemTemplate>
                 <ItemTemplate>
                     <asp:Label ID="Label13" runat="server" Text='<%# Bind("SafeOutDate") %>'></asp:Label>
                 </ItemTemplate>
                 <ControlStyle CssClass="center" />
                 <HeaderStyle CssClass="center" />
                 <ItemStyle CssClass="center" />
             </asp:TemplateField>
             <asp:TemplateField HeaderText="Remark" SortExpression="Remark">
                 <EditItemTemplate>
                     <asp:TextBox ID="TextBox13" runat="server" Text='<%# Bind("Remark") %>'></asp:TextBox>
                 </EditItemTemplate>
                 <ItemTemplate>
                     <asp:Label ID="Label14" runat="server" Text='<%# Bind("Remark") %>'></asp:Label>
                 </ItemTemplate>
                 <ControlStyle CssClass="center" />
                 <HeaderStyle CssClass="center" />
                 <ItemStyle CssClass="center" />
             </asp:TemplateField>
             <asp:TemplateField HeaderText="Inserted By" SortExpression="InsertedBy">
                 <EditItemTemplate>
                     <asp:TextBox ID="TextBox14" runat="server" Text='<%# Bind("InsertedBy") %>'></asp:TextBox>
                 </EditItemTemplate>
                 <ItemTemplate>
                     <asp:Label ID="Label15" runat="server" Text='<%# Bind("InsertedBy") %>'></asp:Label>
                 </ItemTemplate>
                 <ControlStyle CssClass="center" />
                 <HeaderStyle CssClass="center" />
                 <ItemStyle CssClass="center" />
             </asp:TemplateField>
             <asp:TemplateField HeaderText="Updated By" SortExpression="updatedBy">
                 <EditItemTemplate>
                     <asp:TextBox ID="TextBox15" runat="server" Text='<%# Bind("updatedBy") %>'></asp:TextBox>
                 </EditItemTemplate>
                 <ItemTemplate>
                     <asp:Label ID="Label16" runat="server" Text='<%# Bind("updatedBy") %>'></asp:Label>
                 </ItemTemplate>
                 <ControlStyle CssClass="center" />
                 <HeaderStyle CssClass="center" />
                 <ItemStyle CssClass="center" />
             </asp:TemplateField>
             <asp:TemplateField HeaderText="Approved By" SortExpression="approvedBy">
                 <EditItemTemplate>
                     <asp:TextBox ID="TextBox16" runat="server" Text='<%# Bind("approvedBy") %>'></asp:TextBox>
                 </EditItemTemplate>
                 <ItemTemplate>
                     <asp:Label ID="Label17" runat="server" Text='<%# Bind("approvedBy") %>'></asp:Label>
                 </ItemTemplate>
                 <ControlStyle CssClass="center" />
                 <HeaderStyle CssClass="center" />
                 <ItemStyle CssClass="center" />
             </asp:TemplateField>

             <asp:TemplateField HeaderText="Archived Doc" SortExpression="ArchDoc">
                 <EditItemTemplate>
                     <asp:TextBox ID="TextBox17" runat="server" Text='<%# Bind("ArchDoc") %>'></asp:TextBox>
                 </EditItemTemplate>
                 <ItemTemplate>
                     <asp:Label ID="Label18" runat="server" Text='<%# Bind("ArchDoc") %>'></asp:Label>
                 </ItemTemplate>
                  <ControlStyle CssClass="center" />
                 <HeaderStyle CssClass="center" />
                 <ItemStyle CssClass="center" />
             </asp:TemplateField>

              


             <asp:TemplateField HeaderText="Cabine|Safe Ref" SortExpression="SafeRef">
                 <EditItemTemplate>
                     <asp:TextBox ID="TextBox19" runat="server" Text='<%# Bind("SafeRef") %>'></asp:TextBox>
                 </EditItemTemplate>
                 <ItemTemplate>
                     <asp:Label ID="Label21" runat="server" Text='<%# Bind("SafeRef") %>'></asp:Label>
                 </ItemTemplate>
                    <ControlStyle CssClass="center" />
                 <HeaderStyle CssClass="center" />
                 <ItemStyle CssClass="center" />
             </asp:TemplateField>

              


             <asp:TemplateField HeaderText="Archived Date" SortExpression="ArchDate">
                 <EditItemTemplate>
                     <asp:TextBox ID="TextBox18" runat="server" Text='<%# Bind("ArchDate") %>'></asp:TextBox>
                 </EditItemTemplate>
                 <ItemTemplate>
                     <asp:Label ID="Label20" runat="server" Text='<%# Bind("ArchDate") %>'></asp:Label>
                 </ItemTemplate>
                  <ControlStyle CssClass="center" />
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

 <%--       </ContentTemplate>


    </asp:UpdatePanel>--%>
    
     <asp:SqlDataSource ID="DbCon" runat="server" ConnectionString="<%$ ConnectionStrings:DBCon %>" SelectCommand="SELECT * FROM [Wak_Tbl]" DeleteCommand="DELETE FROM [Wak_Tbl] WHERE [id] = @original_id" InsertCommand="INSERT INTO [Wak_Tbl] ([ClientName], [FacilityApproval], [FacilityType], [FacilityStatus], [SafeNo], [drawer], [FolderNo], [Extention], [modification], [SafeInDate], [DocStatus], [SafeOutDate], [Remark], [InsertedBy], [approvedBy], [updatedBy]) VALUES (@ClientName, @FacilityApproval, @FacilityType, @FacilityStatus, @SafeNo, @drawer, @FolderNo, @Extention, @modification, @SafeInDate, @DocStatus, @SafeOutDate, @Remark, @InsertedBy, @approvedBy, @updatedBy)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [Wak_Tbl] SET [ClientName] = @ClientName, [FacilityApproval] = @FacilityApproval, [FacilityType] = @FacilityType, [FacilityStatus] = @FacilityStatus, [SafeNo] = @SafeNo, [drawer] = @drawer, [FolderNo] = @FolderNo, [Extention] = @Extention, [modification] = @modification, [SafeInDate] = @SafeInDate, [DocStatus] = @DocStatus, [SafeOutDate] = @SafeOutDate, [Remark] = @Remark, [InsertedBy] = @InsertedBy, [approvedBy] = @approvedBy, [updatedBy] = @updatedBy WHERE [id] = @original_id">
         <DeleteParameters>
             <asp:Parameter Name="original_id" Type="Int32" />
         </DeleteParameters>
         <InsertParameters>
             <asp:Parameter Name="ClientName" Type="String" />
             <asp:Parameter Name="FacilityApproval" Type="String" />
             <asp:Parameter Name="FacilityType" Type="String" />
             <asp:Parameter Name="FacilityStatus" Type="String" />
             <asp:Parameter Name="SafeNo" Type="String" />
             <asp:Parameter Name="drawer" Type="String" />
             <asp:Parameter Name="FolderNo" Type="String" />
             <asp:Parameter Name="Extention" Type="String" />
             <asp:Parameter Name="modification" Type="String" />
             <asp:Parameter Name="SafeInDate" Type="String" />
             <asp:Parameter Name="DocStatus" Type="String" />
             <asp:Parameter Name="SafeOutDate" Type="String" />
             <asp:Parameter Name="Remark" Type="String" />
             <asp:Parameter Name="InsertedBy" Type="String" />
             <asp:Parameter Name="approvedBy" Type="String" />
             <asp:Parameter Name="updatedBy" Type="String" />
         </InsertParameters>
         <UpdateParameters>
             <asp:Parameter Name="ClientName" Type="String" />
             <asp:Parameter Name="FacilityApproval" Type="String" />
             <asp:Parameter Name="FacilityType" Type="String" />
             <asp:Parameter Name="FacilityStatus" Type="String" />
             <asp:Parameter Name="SafeNo" Type="String" />
             <asp:Parameter Name="drawer" Type="String" />
             <asp:Parameter Name="FolderNo" Type="String" />
             <asp:Parameter Name="Extention" Type="String" />
             <asp:Parameter Name="modification" Type="String" />
             <asp:Parameter Name="SafeInDate" Type="String" />
             <asp:Parameter Name="DocStatus" Type="String" />
             <asp:Parameter Name="SafeOutDate" Type="String" />
             <asp:Parameter Name="Remark" Type="String" />
             <asp:Parameter Name="InsertedBy" Type="String" />
             <asp:Parameter Name="approvedBy" Type="String" />
             <asp:Parameter Name="updatedBy" Type="String" />
             <asp:Parameter Name="original_id" Type="Int32" />
         </UpdateParameters>
     </asp:SqlDataSource>
    <br />
          
</asp:Content>
