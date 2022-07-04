<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserDashboard.aspx.cs" Inherits="Collateral_int.UserDashboard" %>
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
    <div style=" height:100px; padding-left:375px; border-top:10px solid #0094ff; margin-top:0px; " class="alert alert-success" role="alert">
              <h4 class="alert-heading" style="padding-left: 15%; font-family:Bahnschrift;"><strong>User Management Dashboard</strong></h4>
           </div>
   <%-- <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
       --%>     <table border="0" class="responsive" style="padding:10px 10px; color:red">
                <tr>
                    <td style="padding:10px 10px;"> 
                 <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Small" ForeColor="#C94141" Text="Current Login User(s)"></asp:Label>
                  </td>
                    <td style="width:100px;">&nbsp;</td>
                     <td> 
                 <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Small" ForeColor="#C94141" Text="User Managment List"></asp:Label>
                  </td>
                    </tr>
                <tr>
                    <td>
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="id" DataSourceID="SqlCon" Width="267px" GridLines="None" CssClass="table table-responsive">
         <AlternatingRowStyle BackColor="#99CCFF" />
         <Columns>
       <asp:CommandField Visible="false" ButtonType="Image" CancelImageUrl="~/image/cancel.png" EditImageUrl="~/image/Edit.png"
     ShowEditButton ="True" UpdateImageUrl="~/image/update.jfif" >
             <ControlStyle Height="20px" Width="20px" />
             <HeaderStyle CssClass="center" />
             <ItemStyle CssClass="center" />
             </asp:CommandField>
            <asp:CommandField ButtonType="Image" DeleteImageUrl="~/image/Delete.png" ShowDeleteButton="True" >




             <ControlStyle Height="20px" Width="20px" />
             </asp:CommandField>




             <asp:TemplateField HeaderText="Edit" Visible="False">
                 <EditItemTemplate>
                     <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                     &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                 </EditItemTemplate>
                 <ItemTemplate>
                     <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                     &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" OnClientClick="return confirm('Are you sure you want to delete this record?');" Text="Delete"></asp:LinkButton>
                 </ItemTemplate>
                 <ControlStyle CssClass="center" />
                 <HeaderStyle CssClass="center" />
                 <ItemStyle CssClass="center" />
             </asp:TemplateField>
           




          <%--   <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" SortExpression="id" >
             <ControlStyle CssClass="center" />
             <HeaderStyle CssClass="center" />
             <ItemStyle CssClass="center" />
             </asp:BoundField>--%>

             <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username" >
                   <ControlStyle CssClass="center" />
             <HeaderStyle CssClass="center" />
             <ItemStyle CssClass="center" />
             </asp:BoundField>


             <asp:BoundField DataField="LoginDate" HeaderText="LoginDate" SortExpression="LoginDate">
             <ControlStyle CssClass="center" />
             <HeaderStyle CssClass="center" />
             <ItemStyle CssClass="center" />
             </asp:BoundField>


         </Columns>
         <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
         <HeaderStyle BackColor="#ccc" Font-Bold="True" ForeColor="#CCCCFF" />
         <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
         <RowStyle BackColor="White" ForeColor="#003399" />
         <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
         <SortedAscendingCellStyle BackColor="#EDF6F6" />
         <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
         <SortedDescendingCellStyle BackColor="#D6DFDF" />
         <SortedDescendingHeaderStyle BackColor="#002876" />
    </asp:GridView>

                    </td>
                    <td>
                        &nbsp;</td>
                    <td>
                        <asp:GridView ID="GridView2" runat="server" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" DataKeyNames="id" GridLines="None">
                            <AlternatingRowStyle BackColor="#A0CFFE" />
                            <Columns>
                                <asp:TemplateField ShowHeader="False">
                                    <EditItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:LinkButton  ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                                    </ItemTemplate>
                                    <ControlStyle CssClass="center" />
                                    <HeaderStyle CssClass="center" />
                                    <ItemStyle CssClass="center" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" InsertVisible="False" ReadOnly="True">
                                <ControlStyle CssClass="center" />
                                <HeaderStyle CssClass="center" />
                                <ItemStyle CssClass="center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="username" HeaderText="username" SortExpression="username">
                                     <ControlStyle CssClass="center" />
                                <HeaderStyle CssClass="center" />
                                <ItemStyle CssClass="center" />
                                </asp:BoundField>

                                <asp:BoundField DataField="Access_role" HeaderText="Access_role" SortExpression="Access_role">
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



                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DBCon %>"
                            SelectCommand="SELECT * FROM [userMng]" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [userMng] WHERE [id] = @original_id AND [username] = @original_username AND [Access_role] = @original_Access_role" InsertCommand="INSERT INTO [userMng] ([username], [Access_role]) VALUES (@username, @Access_role)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [userMng] SET [username] = @username, [Access_role] = @Access_role WHERE [id] = @original_id AND [username] = @original_username AND [Access_role] = @original_Access_role">
                            <DeleteParameters>
                                <asp:Parameter Name="original_id" Type="Int32" />
                                <asp:Parameter Name="original_username" Type="String" />
                                <asp:Parameter Name="original_Access_role" Type="String" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="username" Type="String" />
                                <asp:Parameter Name="Access_role" Type="String" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="username" Type="String" />
                                <asp:Parameter Name="Access_role" Type="String" />
                                <asp:Parameter Name="original_id" Type="Int32" />
                                <asp:Parameter Name="original_username" Type="String" />
                                <asp:Parameter Name="original_Access_role" Type="String" />
                            </UpdateParameters>
                        </asp:SqlDataSource>



                    </td>
                    <td style="width:100px">
                       
                    </td>
                    <td>
                        <asp:TextBox ID="Username" placeholder="Domain Credintial" runat="server" Height="30px" Width="154px"></asp:TextBox>
                        <br />
                        <asp:DropDownList ID="accessList" runat="server" CssClass="btn-danger" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Small" Height="30px" Width="154px">
                            <asp:ListItem Value="role">Access_role</asp:ListItem>
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                        </asp:DropDownList>
                        <br />
                        <br />
                        <asp:Button ID="Button1" runat="server" Text="Register" Font-Bold="True" Font-Names="Bahnschrift" BorderColor="#CC3300" BorderStyle="Solid" OnClick="Button1_Click" />


                    </td>
                </tr>
              
                <%-- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --%>










            </table>
            
           
           

     
    <asp:SqlDataSource ID="SqlCon" runat="server" ConnectionString="<%$ ConnectionStrings:DBCon %>"
        DeleteCommand="DELETE FROM [registration] WHERE [id] = @id"
        InsertCommand="INSERT INTO [registration] ([id], [Username], [Email], [Password], [passwordconfirm], [viewuser], [entryuser]) VALUES (@id, @Username, @Email, @Password, @passwordconfirm, @viewuser, @entryuser)" 
        SelectCommand="select *from registration"
        UpdateCommand="UPDATE [registration] SET [Username] = @Username, [Email] = @Email, [Password] = @Password, [passwordconfirm] = @passwordconfirm, [viewuser] = @viewuser, [entryuser] = @entryuser WHERE [id] = @id">
        <DeleteParameters>
            <asp:Parameter Name="id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="id" Type="Int32" />
            <asp:Parameter Name="Username" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Password" Type="String" />
            <asp:Parameter Name="passwordconfirm" Type="String" />
            <asp:Parameter Name="viewuser" Type="String" />
            <asp:Parameter Name="entryuser" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Username" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Password" Type="String" />
            <asp:Parameter Name="passwordconfirm" Type="String" />
            <asp:Parameter Name="viewuser" Type="String" />
            <asp:Parameter Name="entryuser" Type="String" />
            <asp:Parameter Name="id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
             <br />
<%--        </ContentTemplate>


    </asp:UpdatePanel>--%>
   
</asp:Content>
