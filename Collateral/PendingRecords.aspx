<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PendingRecords.aspx.cs" Inherits="Collateral_int.PendingRecords" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
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
</style>
    
<br />

<asp:Label ID="Lblresult" runat="server" Font-Size="Small" Text="Label" Visible="False" Font-Names="Bahnschrift"></asp:Label>

<hr style="border:1px solid #007acc" />
<p>
   <br />
   <asp:TextBox ID="searchbarTxt" runat="server" Height="35px" Width="214px" placeholder="Who update ?" CssClass="center"></asp:TextBox>
   &nbsp;
   <asp:Button ID="Button1" runat="server" CssClass="btn-primary" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Small" Height="35px" OnClick="Button1_Click" Text="Show" Width="73px" BorderStyle="None" />
</p>
<p>
   <asp:Label ID="resultLbl" runat="server" Font-Bold="True" Font-Size="Smaller" ForeColor="Red" Visible="False"></asp:Label>
   <br />
   <asp:GridView ID="GridView2" OnRowCommand="GridView2_RowCommand"  runat="server" ShowHeaderWhenEmpty="True"
      AllowSorting="True" CssClass="center" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC"
      BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="id" DataSourceID="SqlCon2" PageSize="7"
      >
      <Columns>
         <asp:TemplateField ShowHeader="true" HeaderText="Approve">
            <ItemTemplate>
               <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Bind("id") %>' 
                  CausesValidation="False" CommandName="Insert" Text="Approve"></asp:LinkButton>
            </ItemTemplate>
            <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
         </asp:TemplateField>
         <asp:TemplateField ShowHeader="true" HeaderText="Reject">
            <ItemTemplate>
               <asp:LinkButton ID="DeleteLbl" runat="server" CommandArgument='<%# Bind("id") %>' 
                  CausesValidation="False" CommandName="delete" Text="Reject"></asp:LinkButton>
            </ItemTemplate>
            <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Customer ID" SortExpression="CID">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("CID") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label2" runat="server" Text='<%# Bind("CID") %>'></asp:Label>
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
               <asp:Label ID="Label15" runat="server" Text='<%# Bind("id") %>'></asp:Label>
            </ItemTemplate>
            <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Borrower Name" SortExpression="bname">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("bname") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label3" runat="server" Text='<%# Bind("bname") %>'></asp:Label>
            </ItemTemplate>
            <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Pledged Date" SortExpression="pdate">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("pdate") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label4" runat="server" Text='<%# Bind("pdate") %>'></asp:Label>
            </ItemTemplate>
            <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Telecom Company" SortExpression="Telecom">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Telecom") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label5" runat="server" Text='<%# Bind("Telecom") %>'></asp:Label>
            </ItemTemplate>
            <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Dinomination" SortExpression="dino">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("dino") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label6" runat="server" Text='<%# Bind("dino") %>'></asp:Label>
            </ItemTemplate>
            <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Our Tag" SortExpression="ourRef">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("ourRef") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label7" runat="server" Text='<%# Bind("ourRef") %>'></asp:Label>
            </ItemTemplate>
            <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Card Serial Start" SortExpression="CardSerialStart">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("CardSerialStart") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label8" runat="server" Text='<%# Bind("CardSerialStart") %>'></asp:Label>
            </ItemTemplate>
            <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Card Serial End" SortExpression="CardSerialEnd">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("CardSerialEnd") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label9" runat="server" Text='<%# Bind("CardSerialEnd") %>'></asp:Label>
            </ItemTemplate>
            <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Quantity" SortExpression="Qty">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("Qty") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label10" runat="server" Text='<%# Bind("Qty") %>'></asp:Label>
            </ItemTemplate>
            <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Carton Value in AFN" SortExpression="CartonValAfn">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("CartonValAfn") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label11" runat="server" Text='<%# Bind("CartonValAfn") %>'></asp:Label>
            </ItemTemplate>
            <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Status" SortExpression="status">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("status") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label12" runat="server" Text='<%# Bind("status") %>'></asp:Label>
            </ItemTemplate>
            <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Release Date" SortExpression="ReleaseDate">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox12" runat="server" Text='<%# Bind("ReleaseDate") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label13" runat="server" Text='<%# Bind("ReleaseDate") %>'></asp:Label>
            </ItemTemplate>
            <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Rotation Date" SortExpression="RotationDate">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox13" runat="server" Text='<%# Bind("RotationDate") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label14" runat="server" Text='<%# Bind("RotationDate") %>'></asp:Label>
            </ItemTemplate>
            <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Updated By" SortExpression="updatedBy">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox14" runat="server" Text='<%# Bind("updatedBy") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label16" runat="server" Text='<%# Bind("updatedBy") %>'></asp:Label>
            </ItemTemplate>
            <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Inserted By" SortExpression="InsertedBy">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox15" runat="server" Text='<%# Bind("InsertedBy") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label17" runat="server" Text='<%# Bind("InsertedBy") %>'></asp:Label>
            </ItemTemplate>
            <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Approved BY" SortExpression="ApprovedBy">
            <EditItemTemplate>
               <asp:TextBox ID="TextBox16" runat="server" Text='<%# Bind("ApprovedBy") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
               <asp:Label ID="Label18" runat="server" Text='<%# Bind("ApprovedBy") %>'></asp:Label>
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
   <br />
   <asp:SqlDataSource ID="SqlCon2" runat="server" ConnectionString="<%$ ConnectionStrings:DBCon %>" 
      DeleteCommand="DELETE FROM [Loanadder_tbl2] WHERE [id] = @id"
      InsertCommand="INSERT INTO [Loanadder_tbl2] ([bname], [pdate], [Telecom], [dino], [ourRef], [CardSerialStart], [CardSerialEnd], [Qty], [CartonValAfn], [status], [ReleaseDate], [RotationDate], [SecRotationDate], [ThirdRotationDate]) VALUES (@bname, @pdate, @Telecom, @dino, @ourRef, @CardSerialStart, @CardSerialEnd, @Qty, @CartonValAfn, @status, @ReleaseDate, @RotationDate, @SecRotationDate, @ThirdRotationDate)"
      SelectCommand="SELECT  * FROM [Loanadder_tbl3] order by id desc" >
      <DeleteParameters>
         <asp:Parameter Name="id" Type="Int32" />
      </DeleteParameters>
      <InsertParameters>
         <asp:Parameter Name="bname" Type="String" />
         <asp:Parameter Name="pdate" Type="String" />
         <asp:Parameter Name="Telecom" Type="String" />
         <asp:Parameter Name="dino" Type="String" />
         <asp:Parameter Name="ourRef" Type="String" />
         <asp:Parameter Name="CardSerialStart" Type="String" />
         <asp:Parameter Name="CardSerialEnd" Type="String" />
         <asp:Parameter Name="Qty" Type="String" />
         <asp:Parameter Name="CartonValAfn" Type="String" />
         <asp:Parameter Name="status" Type="String" />
         <asp:Parameter Name="ReleaseDate" Type="String" />
         <asp:Parameter Name="RotationDate" Type="String" />
         <asp:Parameter Name="SecRotationDate" Type="String" />
         <asp:Parameter Name="ThirdRotationDate" Type="String" />
      </InsertParameters>
      <UpdateParameters>
         <asp:Parameter Name="bname" Type="String" />
         <asp:Parameter Name="pdate" Type="String" />
         <asp:Parameter Name="Telecom" Type="String" />
         <asp:Parameter Name="dino" Type="Int64" />
         <asp:Parameter Name="ourRef" Type="String" />
         <asp:Parameter Name="CardSerialStart" Type="Int64" />
         <asp:Parameter Name="CardSerialEnd" Type="Int64" />
         <asp:Parameter Name="Qty" Type="Int64" />
         <asp:Parameter Name="CartonValAfn" Type="Int64" />
         <asp:Parameter Name="status" Type="String" />
         <asp:Parameter Name="ReleaseDate" Type="String" />
         <asp:Parameter Name="RotationDate" Type="String" />
         <asp:Parameter Name="SecRotationDate" Type="String" />
         <asp:Parameter Name="ThirdRotationDate" Type="String" />
         <asp:Parameter Name="id" Type="Int32" />
      </UpdateParameters>
   </asp:SqlDataSource>

        </p>
     <script type="text/javascript">
    function HideLabel() {
        var seconds = 3;
        setTimeout(function () {
            document.getElementById("<%=Lblresult.ClientID %>").style.display = "none";
        }, seconds * 1000);
    };
</script>

</asp:Content>
