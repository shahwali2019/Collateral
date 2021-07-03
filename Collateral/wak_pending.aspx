<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="wak_pending.aspx.cs" Inherits="Collateral_int.wak_pending" %>
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
         <p>
             <asp:ImageButton ID="ApproveBtnImg" runat="server" Height="32px" ImageUrl="~/image/insertBtn.jpg" OnClick="ImageButton1_Click" ToolTip="Approve Inserted Records" Width="30px" Enabled="False" />

             &nbsp;<asp:ImageButton ID="ApproveUpdateBtn" runat="server" Height="32px" ImageUrl="~/image/updatebtn.png" ToolTip="Approved Updated Records" Width="28px" Enabled="False" OnClick="ApproveUpdateBtn_Click" />
             <hr style="margin-left:5px;border-bottom:5px solid #003399; width:1100px; background-color: #00FF00;" />
              <div style="margin-top:-15px;">
         <asp:Label ID="updateLbl" runat="server" Font-Size="Small" Text="Label" Visible="False" Font-Names="Bahnschrift" ForeColor="Red"></asp:Label>
               </div>
              <div style="margin-top:-15px;">
 <asp:Label ID="insertLbl" runat="server" Font-Size="Small" Text="Label" Visible="False" Font-Names="Bahnschrift" ForeColor="Red"></asp:Label>
   </div>

             &nbsp;<asp:UpdatePanel ID="UpdatePanel1" runat="server">

         </asp:UpdatePanel>
     

        <br />

         <asp:SqlDataSource ID="SqlCon2" runat="server" ConnectionString="<%$ ConnectionStrings:DBCon %>" 
            DeleteCommand="DELETE FROM [Wak_Tbl_temp] WHERE [id] = @id"
            InsertCommand="INSERT INTO [Wak_Tbl_temp] ([ClientName], [FacilityApproval], [FacilityType], [FacilityStatus], [SafeNo], [drawer], [FolderNo], [Extention], [modification], [SafeInDate], [DocStatus], [SafeOutDate], [Remark], [InsertedBy]) VALUES (@ClientName, @FacilityApproval, @FacilityType, @FacilityStatus, @SafeNo, @drawer, @FolderNo, @Extention, @modification, @SafeInDate, @DocStatus, @SafeOutDate, @Remark, @InsertedBy)"
            SelectCommand="SELECT * FROM [Wak_Tbl_temp]" UpdateCommand="UPDATE [Wak_Tbl_temp] SET [ClientName] = @ClientName, [FacilityApproval] = @FacilityApproval, [FacilityType] = @FacilityType, [FacilityStatus] = @FacilityStatus, [SafeNo] = @SafeNo, [drawer] = @drawer, [FolderNo] = @FolderNo, [Extention] = @Extention, [modification] = @modification, [SafeInDate] = @SafeInDate, [DocStatus] = @DocStatus, [SafeOutDate] = @SafeOutDate, [Remark] = @Remark, [InsertedBy] = @InsertedBy WHERE [id] = @id" >
             <DeleteParameters>
                 <asp:Parameter Name="id" Type="Int32" />
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
                 <asp:Parameter Name="id" Type="Int32" />
             </UpdateParameters>
        </asp:SqlDataSource>
                    <asp:GridView ID="GridView2" OnRowCommand="GridView2_RowCommand"   runat="server" ShowHeaderWhenEmpty="True"
               AllowSorting="True" CssClass="auto-style1" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC"
               BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="id" DataSourceID="SqlCon2" PageSize="7" Width="645px" Visible="False" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" GridLines="Horizontal">
                        <AlternatingRowStyle BackColor="#99FF99" />
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

                  <%--<asp:TemplateField ShowHeader="true" HeaderText="Approve">
                       <ItemTemplate>
                           <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Bind("id") %>' 
                               CausesValidation="False" CommandName="Insert" Text="Approve"></asp:LinkButton>
                       </ItemTemplate>
                       <ControlStyle CssClass="center" />
                       <HeaderStyle CssClass="center" />
                       <ItemStyle CssClass="center" />
                   </asp:TemplateField>--%>

                   <asp:TemplateField ShowHeader="true" HeaderText="Reject">
                       <ItemTemplate>
                           <asp:LinkButton ID="DeleteLbl" runat="server" CommandArgument='<%# Bind("id") %>' 
                               CausesValidation="False" CommandName="delete" Text="Reject"></asp:LinkButton>
                       </ItemTemplate>
                       <ControlStyle CssClass="center" />
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
                   <asp:TemplateField HeaderText="ClientName" SortExpression="ClientName">
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
                   <asp:TemplateField HeaderText="FacilityApproval" SortExpression="FacilityApproval">
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
                   <asp:TemplateField HeaderText="FacilityType" SortExpression="FacilityType">
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
                   <asp:TemplateField HeaderText="FacilityStatus" SortExpression="FacilityStatus">
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
                   <asp:TemplateField HeaderText="SafeNo" SortExpression="SafeNo">
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
                   <asp:TemplateField HeaderText="drawer" SortExpression="drawer">
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
                   <asp:TemplateField HeaderText="FolderNo" SortExpression="FolderNo">
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
                   <asp:TemplateField HeaderText="modification" SortExpression="modification">
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
                   <asp:TemplateField HeaderText="SafeInDate" SortExpression="SafeInDate">
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
                   <asp:TemplateField HeaderText="DocStatus" SortExpression="DocStatus">
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
                   <asp:TemplateField HeaderText="SafeOutDate" SortExpression="SafeOutDate">
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
                   <asp:TemplateField HeaderText="InsertedBy" SortExpression="InsertedBy">
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
  

             <div style="margin-top:-5px;">
                    <asp:GridView ID="GridView3" OnRowCommand="GridView3_RowCommand" DataKeyNames="id"   runat="server" ShowHeaderWhenEmpty="True"
               AllowSorting="True" CssClass="auto-style1" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC"
               BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlConUpdate" PageSize="7" Width="910px" Visible="False" OnSelectedIndexChanged="GridView3_SelectedIndexChanged" GridLines="Horizontal">
                        <AlternatingRowStyle BackColor="#99FF99" />
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
                     </asp:TemplateField>
                  <asp:TemplateField ShowHeader="true" HeaderText="Approve">
                       <ItemTemplate>
                           <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Bind("id") %>' 
                               CausesValidation="False" CommandName="Insert" Text="Approve"></asp:LinkButton>
                       </ItemTemplate>
                       <ControlStyle CssClass="center" />
                       <HeaderStyle CssClass="center" />
                       <ItemStyle CssClass="center" />
                   </asp:TemplateField>

                            <asp:CommandField ShowDeleteButton="True" HeaderText="Reject" >

                             <ControlStyle CssClass="center" />
                            <HeaderStyle CssClass="center" />
                            <ItemStyle CssClass="center" />
                            </asp:CommandField>

                            <asp:TemplateField HeaderText="id" SortExpression="id">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("id") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle CssClass="center" />
                                <HeaderStyle CssClass="center" />
                                <ItemStyle CssClass="center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="ClientName" SortExpression="ClientName">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("ClientName") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("ClientName") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle CssClass="center" />
                                <HeaderStyle CssClass="center" />
                                <ItemStyle CssClass="center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="FacilityApproval" SortExpression="FacilityApproval">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("FacilityApproval") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("FacilityApproval") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle CssClass="center" />
                                <HeaderStyle CssClass="center" />
                                <ItemStyle CssClass="center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="FacilityType" SortExpression="FacilityType">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("FacilityType") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("FacilityType") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle CssClass="center" />
                                <HeaderStyle CssClass="center" />
                                <ItemStyle CssClass="center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="FacilityStatus" SortExpression="FacilityStatus">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("FacilityStatus") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("FacilityStatus") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle CssClass="center" />
                                <HeaderStyle CssClass="center" />
                                <ItemStyle CssClass="center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="SafeNo" SortExpression="SafeNo">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("SafeNo") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("SafeNo") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle CssClass="center" />
                                <HeaderStyle CssClass="center" />
                                <ItemStyle CssClass="center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="drawer" SortExpression="drawer">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("drawer") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("drawer") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle CssClass="center" />
                                <HeaderStyle CssClass="center" />
                                <ItemStyle CssClass="center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="FolderNo" SortExpression="FolderNo">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("FolderNo") %>'></asp:TextBox>
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
                                    <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("Extention") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label9" runat="server" Text='<%# Bind("Extention") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle CssClass="center" />
                                <HeaderStyle CssClass="center" />
                                <ItemStyle CssClass="center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="modification" SortExpression="modification">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("modification") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label10" runat="server" Text='<%# Bind("modification") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle CssClass="center" />
                                <HeaderStyle CssClass="center" />
                                <ItemStyle CssClass="center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="SafeInDate" SortExpression="SafeInDate">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("SafeInDate") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label11" runat="server" Text='<%# Bind("SafeInDate") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle CssClass="center" />
                                <HeaderStyle CssClass="center" />
                                <ItemStyle CssClass="center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="DocStatus" SortExpression="DocStatus">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox12" runat="server" Text='<%# Bind("DocStatus") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label12" runat="server" Text='<%# Bind("DocStatus") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle CssClass="center" />
                                <HeaderStyle CssClass="center" />
                                <ItemStyle CssClass="center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="SafeOutDate" SortExpression="SafeOutDate">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox13" runat="server" Text='<%# Bind("SafeOutDate") %>'></asp:TextBox>
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
                                    <asp:TextBox ID="TextBox14" runat="server" Text='<%# Bind("Remark") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label14" runat="server" Text='<%# Bind("Remark") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle CssClass="center" />
                                <HeaderStyle CssClass="center" />
                                <ItemStyle CssClass="center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="UpdatedBy" SortExpression="updatedBy">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox15" runat="server" Text='<%# Bind("updatedBy") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label15" runat="server" Text='<%# Bind("updatedBy") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle CssClass="center" />
                                <HeaderStyle CssClass="center" />
                                <ItemStyle CssClass="center" />
                            </asp:TemplateField>


                              <asp:TemplateField HeaderText="Archived Doc" SortExpression="ArchDoc">
                                  <EditItemTemplate>
                                      <asp:TextBox ID="TextBox16" runat="server" Text='<%# Bind("ArchDoc") %>'></asp:TextBox>
                                  </EditItemTemplate>
                                  <ItemTemplate>
                                      <asp:Label ID="Label16" runat="server" Text='<%# Bind("ArchDoc") %>'></asp:Label>
                                  </ItemTemplate>
                                    <ControlStyle CssClass="center" />
                                <HeaderStyle CssClass="center" />
                                <ItemStyle CssClass="center" />
                              </asp:TemplateField>

                              <asp:TemplateField HeaderText="Cabine | Safe Ref" SortExpression="SafeRef">
                                  <EditItemTemplate>
                                      <asp:TextBox ID="TextBox18" runat="server" Text='<%# Bind("SafeRef") %>'></asp:TextBox>
                                  </EditItemTemplate>
                                  <ItemTemplate>
                                      <asp:Label ID="Label18" runat="server" Text='<%# Bind("SafeRef") %>'></asp:Label>
                                  </ItemTemplate>
                                    <ControlStyle CssClass="center" />
                                <HeaderStyle CssClass="center" />
                                <ItemStyle CssClass="center" />
                              </asp:TemplateField>

                              <asp:TemplateField HeaderText="Archived Date" SortExpression="ArchDate">
                                  <EditItemTemplate>
                                      <asp:TextBox ID="TextBox17" runat="server" Text='<%# Bind("ArchDate") %>'></asp:TextBox>
                                  </EditItemTemplate>
                                  <ItemTemplate>
                                      <asp:Label ID="Label17" runat="server" Text='<%# Bind("ArchDate") %>'></asp:Label>
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
  </div>

     <asp:SqlDataSource ID="SqlConUpdate" runat="server" ConnectionString="<%$ ConnectionStrings:DBCon %>"
         SelectCommand="SELECT * FROM [Wak_update_temp]" 
         DeleteCommand="DELETE FROM [Wak_update_temp] WHERE [id] = @id" 
         >
         <DeleteParameters>
             <asp:Parameter Name="id" Type="Int32" />
         </DeleteParameters>
        
     </asp:SqlDataSource>





   
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
