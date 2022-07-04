<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SaveExcelToDB.aspx.cs" Inherits="Collateral_int.SaveExcelToDB" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server"><br />

    &nbsp;<asp:Label ID="Note" runat="server" Text="Note:<br/>1. Dear Basic User ,First Upload xlsx file<br />2.Then Admin user(s) will upload data after verification.<br />3. Please upload xlsx file as FIFO order." Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Small" ForeColor="#007ACC"></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <br />
    <hr style="border:1px solid #007acc" />
    <asp:FileUpload ID="FileUpload1" runat="server" Height="36px" OnLoad="FileUpload1_Load" ToolTip="Please Select .xlsx file format only" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Small" CssClass="form-group" />  
        <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="Upload" CssClass="btn-info" Font-Bold="True" Font-Names="Bahnschrift" Height="32px" Width="69px" ToolTip="Upload to pending table(Should be approved by Admin user)" BorderStyle="None" />  
     
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
    &nbsp;<asp:Button ID="Button1" runat="server" CssClass="btn-danger" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Small" Height="32px" OnClick="Button1_Click" Text="Delete" ToolTip="Clear Shared Drive(All Uploaded files )" Width="69px" BorderStyle="None" />
    <br />
    <hr style="border:1px solid #007acc" />
    <asp:Label ID="msg" runat="server" Text="Label" Visible="False" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Small" ForeColor="#66FF66"></asp:Label>
    <asp:GridView ID="GridView1" OnRowDeleting="GridView1_RowDeleting"
        OnRowCommand="GridView1_RowCommand" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="id" ShowHeaderWhenEmpty="True"  BackColor="White"
        BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" Width="1173px" GridLines="Horizontal" >
        <AlternatingRowStyle BorderColor="#CCFFFF" />
        <Columns>
          
            <asp:CommandField ShowDeleteButton="True"  ShowHeader="true" HeaderText="Delete"> 

            <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" Width="30px" />
            </asp:CommandField>


      

            <asp:TemplateField ShowHeader="True" HeaderText="Upload">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandArgument='<%# Eval("Name") %>' 
                        CommandName="Select" Text="Upload"></asp:LinkButton>
                </ItemTemplate>
                <ControlStyle CssClass="center" />
                <HeaderStyle CssClass="center" />
                <ItemStyle CssClass="center" Width="30px" />
            </asp:TemplateField>
           
            <asp:TemplateField HeaderText="Uploader" SortExpression="Uploaduser">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Uploaduser") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Uploaduser") %>'></asp:Label>
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
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                </ItemTemplate>
                <ControlStyle CssClass="center" />
                <HeaderStyle CssClass="center" />
                <ItemStyle CssClass="center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Name" SortExpression="Name">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                </ItemTemplate>
                <ControlStyle CssClass="center" />
                <HeaderStyle CssClass="center" />
                <ItemStyle CssClass="center" />
            </asp:TemplateField>
             <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Download to ~/(Excel File) Directory" ShowHeader="true">  
                    <ItemTemplate>  
                        <asp:LinkButton ID="lnkDownload" runat="server" Text="Download" OnClick="DownloadFile"  
                            CommandArgument='<%# Eval("Id") %>'></asp:LinkButton>  
                    </ItemTemplate>  

                    <ControlStyle CssClass="center" />
                    <HeaderStyle CssClass="center" />

<ItemStyle HorizontalAlign="Center" CssClass="center"></ItemStyle>
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
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DBCon %>"
        DeleteCommand="DELETE FROM [tblFiles] WHERE [id] = @id"
        InsertCommand="INSERT INTO [tblFiles] ([Name], [ContentType], [Data], [UPloaduser]) VALUES (@Name, @ContentType, @Data, @UPloaduser)"
        
        UpdateCommand="UPDATE [tblFiles] SET [Name] = @Name, [ContentType] = @ContentType, [Data] = @Data, [UPloaduser] = @UPloaduser WHERE [id] = @id">
        <DeleteParameters>
            <asp:Parameter Name="id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="ContentType" Type="String" />
            <asp:Parameter Name="Data" Type="Object" />
            <asp:Parameter Name="UPloaduser" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="ContentType" Type="String" />
            <asp:Parameter Name="Data" Type="Object" />
            <asp:Parameter Name="UPloaduser" Type="String" />
            <asp:Parameter Name="id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />

    
    <div>

        <span style="color: #007acc; font-size: 12px; font-family: Bahnschrift; margin-top: 190px;">
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        </span>
    </div>
       </asp:Content>
