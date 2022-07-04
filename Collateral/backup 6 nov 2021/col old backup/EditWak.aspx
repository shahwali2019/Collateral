<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditWak.aspx.cs" Inherits="Collateral_int.EditWak" %>
<asp:Content ID="Content1" ContentplaceholderID="MainContent" runat="server">
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
      <div style=" height:120px;padding-left: 45%;border-top:10px solid #0094ff; margin-top:0; padding-top:30px;" class="alert alert-success"  role="alert">
              <h4 class="alert-heading" style=" font-family:Bahnschrift;"><strong><asp:Label ID="addLbl" runat="server" Text="Edit WAK Records" ></asp:Label></strong></h4>  
           </div> 
    <br />
    <asp:ImageButton ID="back" runat="server" Height="23px" ImageUrl="~/image/back.png" OnClick="back_Click" Width="30px" />
    <br />
    <asp:SqlDataSource ID="DbCon" runat="server" ConnectionString="<%$ ConnectionStrings:DBCon %>" 
        SelectCommand="SELECT * FROM [Wak_Tbl] where id=@wak_id" 
        DeleteCommand="DELETE FROM [Wak_Tbl] WHERE [id] = @id" 
        InsertCommand="INSERT INTO [Wak_Tbl] ([ClientName], [FacilityApproval], [FacilityType], [FacilityStatus], [SafeNo], [drawer], [FolderNo], [Extention], [modification], [SafeInDate], [DocStatus], [SafeOutDate], [Remark], [InsertedBy]) VALUES (@ClientName, @FacilityApproval, @FacilityType, @FacilityStatus, @SafeNo, @drawer, @FolderNo, @Extention, @modification, @SafeInDate, @DocStatus, @SafeOutDate, @Remark, @InsertedBy)"

        UpdateCommand="UPDATE [Wak_Tbl] SET [ClientName] = @ClientName, [FacilityApproval] = @FacilityApproval, [FacilityType] = @FacilityType, [FacilityStatus] = @FacilityStatus, [SafeNo] = @SafeNo, [drawer] = @drawer, [FolderNo] = @FolderNo, [Extention] = @Extention, [modification] = @modification, [SafeInDate] = @SafeInDate, [DocStatus] = @DocStatus, [SafeOutDate] = @SafeOutDate, [Remark] = @Remark, [InsertedBy] = @InsertedBy WHERE [id] = @id">
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
        <SelectParameters>
            <asp:SessionParameter SessionField="wakID" Name="wak_id" Type="Int16" />

        </SelectParameters>
    </asp:SqlDataSource>

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="id" DataSourceID="DbCon">
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" OnClientClick="<script>alert('Are you sure to delete this record!');</script>" CommandName="Delete" Text="Delete"></asp:LinkButton>
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
            <asp:BoundField DataField="ClientName" HeaderText="ClientName" SortExpression="ClientName" >
                 <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
            </asp:BoundField>
           

            <asp:BoundField DataField="FacilityApproval" HeaderText="FacilityApproval" SortExpression="FacilityApproval">
                     <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
            </asp:BoundField>
           

            <asp:BoundField DataField="FacilityType" HeaderText="FacilityType" SortExpression="FacilityType" >
                     <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
            </asp:BoundField>
           

            <asp:BoundField DataField="FacilityStatus" HeaderText="FacilityStatus" SortExpression="FacilityStatus" >
                     <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
            </asp:BoundField>
           

            <asp:BoundField DataField="SafeNo" HeaderText="SafeNo" SortExpression="SafeNo" >
                     <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
            </asp:BoundField>
           

            <asp:BoundField DataField="drawer" HeaderText="Shelf | Drawer No.#" SortExpression="drawer" >
                     <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
            </asp:BoundField>
           


            <asp:BoundField DataField="FolderNo" HeaderText="Folder No.#" SortExpression="FolderNo" >
                     <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
            </asp:BoundField>
           

            <asp:BoundField DataField="Extention" HeaderText="Extention" SortExpression="Extention" >
                     <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
            </asp:BoundField>
           

            <asp:BoundField DataField="modification" HeaderText="Modification" SortExpression="modification" >
                     <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
            </asp:BoundField>
           

            <asp:BoundField DataField="SafeInDate" HeaderText="Safe In Date" SortExpression="SafeInDate" >
                     <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
            </asp:BoundField>
           


            <asp:BoundField DataField="DocStatus" HeaderText="Doc Status" SortExpression="DocStatus" >
                     <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
            </asp:BoundField>
           

            <asp:BoundField DataField="SafeOutDate" HeaderText="Safe Out Date" SortExpression="SafeOutDate" >
                     <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
            </asp:BoundField>
           


            <asp:BoundField DataField="Remark" HeaderText="Remark" SortExpression="Remark" >
                     <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
            </asp:BoundField>
           

            <asp:BoundField DataField="InsertedBy" HeaderText="InsertedBy" SortExpression="InsertedBy" >
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

</asp:Content>
