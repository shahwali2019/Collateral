<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ExcelUploadApproval.aspx.cs" Inherits="Collateral_int.ExcelUploadApproval" %>
<asp:Content ID="Content1" ContentplaceholderID="MainContent" runat="server">
    <header>

        <script type="text/javascript">
    function GetSelectedRow(lnk) {
        //Reference the GridView Row.
        var row = lnk.parentNode.parentNode;
 
        //Determine the Row Index.
        var message = "Row Index: " + (row.rowIndex - 1);
 
        //Read values from Cells.
        message += "\nCustomer Id: " + row.cells[0].innerHTML;
        message += "\nName: " + row.cells[1].innerHTML;
 
        //Reference the TextBox and read value.
        message += "\nCountry: " + row.cells[2].getElementsByTagName("input")[0].value;
 
        //Display the data using JavaScript Alert Message Box.
        alert(message);
        return false;
    }
</script>
    </header> 
    
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
     <br />
     <br />
     <br />
     <div style=" height:100px; padding-left:375px; border-top:10px solid #0094ff; margin-top:-57px; " class="alert alert-success" role="alert">
              <h4 class="alert-heading" style="padding-left: 15%; font-family:Bahnschrift;"><strong>Bulk .xlsx File Uploading Interface</strong></h4>  
           </div>
    <asp:FileUpload ID="FileUpload1" runat="server" BackColor="#003399" BorderColor="White" BorderStyle="Solid" BorderWidth="1px" CssClass="alert-success" Font-Bold="True" Font-Size="X-Small" ForeColor="White" Height="40px" ToolTip="Upload Excel file to verify by your admin" Width="260px" TabIndex="1" />
     <br />
<asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="UploadFile" CssClass="btn-info" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Small" Height="31px" Width="64px" TabIndex="2" />
    <br />
     <asp:Label ID="Label2" runat="server" Text="Label" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Small" ForeColor="#3399FF" Visible="False"></asp:Label>
    <br />
    
<asp:GridView ID="GridView1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowCommand="GridView1_RowCommand"
    runat="server" AutoGenerateColumns="False" EmptyDataText = "No files uploaded" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" Width="1251px">
    <Columns>
        <asp:TemplateField HeaderText="ID" SortExpression="id">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label2" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
            </ItemTemplate>
            <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Upload">
            <ItemTemplate>
                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" OnClientClick="return GetSelectedRow(this);"  CommandName="Select" Text="Select"></asp:LinkButton>
            </ItemTemplate>
            <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="File Name">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Text") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Text") %>'></asp:Label>
            </ItemTemplate>
            <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Uploaded by Basic User">
            <ItemTemplate>
                <asp:LinkButton ID="lnkDownload" Text = "Download" CommandArgument = '<%# Eval("Value") %>' runat="server" OnClick = "DownloadFile"></asp:LinkButton>
            </ItemTemplate>
            <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Delete .xlsx">
            <ItemTemplate>
                <asp:LinkButton ID = "lnkDelete" Text = "Delete" CommandArgument = '<%# Eval("Value") %>' runat = "server" OnClick = "DeleteFile" />
            </ItemTemplate>
            <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
        </asp:TemplateField>

         <asp:TemplateField HeaderText="Bulk Upload .xlsx">
            <ItemTemplate>
                <asp:LinkButton ID = "lnkUpload" Text = "Upload" CommandArgument = '<%# Eval("Value") %>' runat = "server" OnClick = "UploadFileByAdmin" />
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




</asp:Content>
