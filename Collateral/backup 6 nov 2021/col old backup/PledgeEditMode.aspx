<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PledgeEditMode.aspx.cs" Inherits="Collateral_int.PledgeEditMode" %>
<asp:Content ID="Content1" ContentplaceholderID="MainContent" runat="server">
    <div style="margin-top:20px;">
        p<style>
            .center
            {
                text-align:center;
                font-size:12px;
                 font-family:Bahnschrift;
                 height:30px;
                 width:auto;
                 padding:0 5px 0 5px;
            }
        </style><div style=" height:100px; padding-left:375px; border-top:10px solid #0094ff; margin-top:-20px; " class="alert alert-success" role="alert">
              <h4 class="alert-heading" style="padding-left: 15%; font-family:Bahnschrift;"><strong><asp:Label ID="Editlbl" runat="server" Text="Edit Pledge Interface" ></asp:Label></strong></h4>
              <p class="alert-heading" style="padding-left: 15%; font-family:Bahnschrift;">
                  &nbsp;</p>
           </div>
        <br />
<asp:ImageButton ID="back" runat="server" Height="23px" ImageUrl="~/image/back.png" OnClick="back_Click" Width="30px" />
        <br /><br />

    <asp:GridView OnRowUpdating="GridView1_RowUpdating" OnRowCommand="GridView1_RowCommand"
        ID="GridView1" runat="server" AutoGenerateColumns="False"
        BackColor="White" BorderColor="#3366CC" BorderStyle="None" 
        BorderWidth="1px" CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:TemplateField ShowHeader="True" HeaderText="Admin User Edit">
                <EditItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                </EditItemTemplate>
              
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                    
              
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" OnClientClick="return confirm('Are you sure you want to delete this record?');" Text="Delete"></asp:LinkButton>
                </ItemTemplate>
                <ControlStyle CssClass=" center" />
                <HeaderStyle CssClass=" center" />
                <ItemStyle CssClass=" center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Customer ID" SortExpression="CID">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox13" runat="server" Text='<%# Bind("CID") %>'></asp:TextBox>
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
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                </ItemTemplate>
                <ControlStyle CssClass="center" />
                <HeaderStyle CssClass=" center" />
                <ItemStyle CssClass=" center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Borrower Name" SortExpression="bname">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("bname") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("bname") %>'></asp:Label>
                </ItemTemplate>
                <ControlStyle CssClass="center" />
                <HeaderStyle CssClass="center" />
                <ItemStyle CssClass="center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Pledge Date" SortExpression="pdate">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("pdate") %>'></asp:TextBox>
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
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Telecom") %>'></asp:TextBox>
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
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("dino") %>'></asp:TextBox>
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
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("ourRef") %>'></asp:TextBox>
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
                    <asp:TextBox ID="TextBox12" runat="server" Text='<%# Bind("CardSerialStart") %>'></asp:TextBox>
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
                    <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("CardSerialEnd") %>'></asp:TextBox>
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
                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Qty") %>'></asp:TextBox>
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
                    <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("CartonValAfn") %>'></asp:TextBox>
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
                    <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("status") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                   
                      
                    <asp:Label ID="Label12" runat="server" Text='<%# Eval("ReleaseDate").ToString() == "" ? "Pledged" : "Released" %>'></asp:Label>
                </ItemTemplate>
                <ControlStyle CssClass="center" />
                <HeaderStyle CssClass="center" />
                <ItemStyle CssClass="center" />
            </asp:TemplateField>







            <asp:TemplateField HeaderText="Release Date" SortExpression="ReleaseDate">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox10"  runat="server" Text='<%# Bind("ReleaseDate") %>'></asp:TextBox>
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
                    <asp:TextBox ID="TextBox11" TextMode="Date" runat="server" Text='<%# Bind("RotationDate") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label14" runat="server" Text='<%# Bind("RotationDate") %>'></asp:Label>
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
        <asp:SqlDataSource OnUpdating="SqlDataSource1_Updating" ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DBCon %>"
            DeleteCommand="DELETE FROM [Loanadder_tbl] WHERE [id] = @id"
            InsertCommand="INSERT INTO [Loanadder_tbl] ([bname], [pdate], [Telecom], [dino], [ourRef], [CardSerialStart], [CardSerialEnd], [Qty], [CartonValAfn], [status], [ReleaseDate], [RotationDate], [SecRotationDate], [ThirdRotationDate]) VALUES (@bname, @pdate, @Telecom, @dino, @ourRef, @CardSerialStart, @CardSerialEnd, @Qty, @CartonValAfn, @status, @ReleaseDate, @RotationDate, @SecRotationDate, @ThirdRotationDate)"
            SelectCommand="SELECT * FROM [Loanadder_tbl] where id=@id" 
            UpdateCommand="UPDATE [Loanadder_tbl] SET [bname] = @bname,
            [pdate] = @pdate, 
            [Telecom] = @Telecom,
            [ourRef] = @ourRef,
            [CardSerialStart] = @CardSerialStart,
            [CardSerialEnd] = @CardSerialEnd, 
            [Qty] = @CardSerialEnd - @CardSerialStart,
            [status] = @status, 
            [ReleaseDate] = @ReleaseDate,
            [RotationDate] = @RotationDate,
            [SecRotationDate] =@SecRotationDate,
            [ThirdRotationDate] = @ThirdRotationDate,
            [dino] = @dino,
            [CartonValAfn] =( @Qty * @dino)
            WHERE [id] = @id">
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
            <SelectParameters>
              <asp:SessionParameter
                Name="id" SessionField="id" Type="String"

               />
          </SelectParameters>
        </asp:SqlDataSource>

        <br />
</div>
    

</asp:Content>
