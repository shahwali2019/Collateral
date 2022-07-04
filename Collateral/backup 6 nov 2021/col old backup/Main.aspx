<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="Collateral_int.Main" %>

<asp:Content ID="Content1" ContentplaceholderID="MainContent" runat="server">
<header>
      <style>
            .center{
                text-align:center;
                font-size:12px;
                padding:2px 5px 2px 5px;
                 font-family:Bahnschrift;
              }
        </style>
</header>
      <div style="height:100px; padding-left:375px; border-top:10px solid #0094ff" class="alert alert-success" role="alert">
          
          <h3 class="alert-heading" style="padding-left: 15%;"><strong>Pledge Interface</strong></h3>  
           </div>
    <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
    <br />
    
    <div id="main">
        <asp:GridView  OnRowCommand="GridView1_RowCommand1" ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:TemplateField HeaderText="Edit" ShowHeader="True">
                    <EditItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                    </EditItemTemplate>



                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Select" CommandArgument='<%# Bind("id") %>' Text="Select"></asp:LinkButton>
                       
                        
                        <asp:LinkButton Font-Size="X-Small" Font-Bold="true" CommandArgument='<%# Bind("id") %>' ID="BtnDelete" runat="server" CausesValidation="true" 
                        CommandName="delete" OnClientClick="return confirm('Are you sure you want to delete this record?');" Text="DELETE" />
                    </ItemTemplate>
                    
                    
                    
                    
                    
                    <HeaderStyle CssClass="center" Font-Size="X-Small" />
                    <ItemStyle CssClass="center" ForeColor="White" Width="50px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="ID" SortExpression="id">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="center" Font-Size="X-Small" />
                    <ItemStyle CssClass="center" Width="50px" />
                </asp:TemplateField>
                <asp:BoundField DataField="CustomerName" HeaderStyle-Font-Size="X-Small" HeaderText="Customer Name" ItemStyle-Width="100" SortExpression="CustomerName" HeaderStyle-CssClass="center"  ItemStyle-CssClass="center">
                <HeaderStyle CssClass="center" Font-Size="X-Small" />
                <ItemStyle CssClass="center" Width="100px" />
                </asp:BoundField>
                <asp:BoundField DataField="Acc_No" HeaderStyle-Font-Size="X-Small" HeaderText="Account No.#" ItemStyle-Width="120" SortExpression="Acc_No"  HeaderStyle-CssClass="center" ItemStyle-CssClass="center">
                <HeaderStyle CssClass="center" Font-Size="X-Small" />
                <ItemStyle CssClass="center" Width="120px" />
                </asp:BoundField>
                <asp:BoundField DataField="Fac_type" HeaderStyle-Font-Size="X-Small" HeaderText="Facility Type" ItemStyle-Width="50" SortExpression="Fac_type" HeaderStyle-CssClass="center" ItemStyle-CssClass="center">
<HeaderStyle CssClass="center" Font-Size="X-Small"></HeaderStyle>

<ItemStyle CssClass="center" Width="50px"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="Org_limit" HeaderStyle-Font-Size="X-Small" HeaderText="Original Limits" ItemStyle-Width="100" SortExpression="Org_limit" HeaderStyle-CssClass="center"  ItemStyle-CssClass="center">
<HeaderStyle CssClass="center" Font-Size="X-Small"></HeaderStyle>

<ItemStyle CssClass="center" Width="100px"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="Ccy" HeaderStyle-Font-Size="X-Small" HeaderText="Currency" SortExpression="Ccy" ItemStyle-Width="50" HeaderStyle-CssClass="center" ItemStyle-CssClass="center" >
<HeaderStyle CssClass="center" Font-Size="X-Small"></HeaderStyle>

<ItemStyle CssClass="center" Width="50px"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="OLW_amount" HeaderStyle-Font-Size="X-Small" HeaderText="[Outstanding | Loss | WriteOff Amount]" ItemStyle-Width="10" SortExpression="OLW_amount" HeaderStyle-CssClass="center" ItemStyle-CssClass="center">
<HeaderStyle CssClass="center" Font-Size="X-Small"></HeaderStyle>

<ItemStyle CssClass="center" Width="10px"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="WONOFF" HeaderStyle-Font-Size="X-Small" HeaderText="Written Off ON" ItemStyle-Width="80" SortExpression="WONOFF" HeaderStyle-CssClass="center" ItemStyle-CssClass="center">
<HeaderStyle CssClass="center" Font-Size="X-Small"></HeaderStyle>

<ItemStyle CssClass="center" Width="80px"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="Rec_Deg" HeaderStyle-Font-Size="X-Small" HeaderText="Recovered from DEG" ItemStyle-Width="180" SortExpression="Rec_Deg" HeaderStyle-CssClass="center" >
<HeaderStyle CssClass="center" Font-Size="X-Small"></HeaderStyle>

<ItemStyle Width="180px"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="ReC_Client" HeaderStyle-Font-Size="X-Small" HeaderText="Recovered from client" ItemStyle-Width="80" SortExpression="ReC_Client" HeaderStyle-CssClass="center" ItemStyle-CssClass="center" >
<HeaderStyle CssClass="center" Font-Size="X-Small"></HeaderStyle>

<ItemStyle CssClass="center" Width="80px"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="NetLoss" HeaderStyle-Font-Size="X-Small" HeaderText="Net Loss till date" ItemStyle-Width="80" SortExpression="NetLoss" HeaderStyle-CssClass="center" ItemStyle-CssClass="center">
<HeaderStyle CssClass="center" Font-Size="X-Small"></HeaderStyle>

<ItemStyle CssClass="center" Width="80px"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="Paid_DEG" HeaderStyle-Font-Size="X-Small" HeaderText="Paid to DEG" ItemStyle-Width="80" SortExpression="Paid_DEG" HeaderStyle-CssClass="center"  ItemStyle-CssClass="center">
<HeaderStyle CssClass="center" Font-Size="X-Small"></HeaderStyle>

<ItemStyle CssClass="center" Width="80px"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="DateFirstOcc" HeaderStyle-Font-Size="X-Small" HeaderText="DateFirst Occpured" ItemStyle-Width="80" SortExpression="DateFirstOcc" HeaderStyle-CssClass="center" ItemStyle-CssClass="center">
<HeaderStyle CssClass="center" Font-Size="X-Small"></HeaderStyle>

<ItemStyle CssClass="center" Width="80px"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="Status" HeaderStyle-Font-Size="X-Small" HeaderText="Status" ItemStyle-Width="80" SortExpression="Status" HeaderStyle-CssClass="center" ItemStyle-CssClass="center">
<HeaderStyle CssClass="center" Font-Size="X-Small"></HeaderStyle>

<ItemStyle CssClass="center" Width="80px"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="Recoversies" HeaderStyle-Font-Size="X-Small" HeaderText="Recoversies" ItemStyle-Width="80" SortExpression="Recoversies" HeaderStyle-CssClass="center" ItemStyle-CssClass="center">
<HeaderStyle CssClass="center" Font-Size="X-Small"></HeaderStyle>

<ItemStyle CssClass="center" Width="80px"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="Memorandom" HeaderStyle-Font-Size="X-Small"  HeaderText="Memorandum Interest" ItemStyle-Width="80" SortExpression="Memorandom" HeaderStyle-CssClass="center" ItemStyle-CssClass="center">
<HeaderStyle CssClass="center" Font-Size="X-Small"></HeaderStyle>

<ItemStyle CssClass="center" Width="80px"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="Loan_Class" HeaderStyle-Font-Size="X-Small" HeaderText="Loan Class" ItemStyle-Width="80" SortExpression="Loan_Class" HeaderStyle-CssClass="center" ItemStyle-CssClass="center" >
<HeaderStyle CssClass="center" Font-Size="X-Small"></HeaderStyle>

<ItemStyle CssClass="center" Width="80px"></ItemStyle>
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




        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DBCon %>" DeleteCommand="DELETE FROM [main_tbl] WHERE [id] = @id" InsertCommand="INSERT INTO [main_tbl] ([id], [CustomerName], [Acc_No], [Fac_type], [Org_limit], [Ccy], [OLW_amount], [WONOFF], [Rec_Deg], [ReC_Client], [NetLoss], [Paid_DEG], [DateFirstOcc], [Status], [Recoversies], [Memorandom], [Loan_Class]) VALUES (@id, @CustomerName, @Acc_No, @Fac_type, @Org_limit, @Ccy, @OLW_amount, @WONOFF, @Rec_Deg, @ReC_Client, @NetLoss, @Paid_DEG, @DateFirstOcc, @Status, @Recoversies, @Memorandom, @Loan_Class)" SelectCommand="SELECT * FROM [main_tbl]" UpdateCommand="UPDATE [main_tbl] SET [CustomerName] = @CustomerName, [Acc_No] = @Acc_No, [Fac_type] = @Fac_type, [Org_limit] = @Org_limit, [Ccy] = @Ccy, [OLW_amount] = @OLW_amount, [WONOFF] = @WONOFF, [Rec_Deg] = @Rec_Deg, [ReC_Client] = @ReC_Client, [NetLoss] = @NetLoss, [Paid_DEG] = @Paid_DEG, [DateFirstOcc] = @DateFirstOcc, [Status] = @Status, [Recoversies] = @Recoversies, [Memorandom] = @Memorandom, [Loan_Class] = @Loan_Class WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="id" Type="Int32" />
                <asp:Parameter Name="CustomerName" Type="String" />
                <asp:Parameter Name="Acc_No" Type="String" />
                <asp:Parameter Name="Fac_type" Type="String" />
                <asp:Parameter Name="Org_limit" Type="String" />
                <asp:Parameter Name="Ccy" Type="String" />
                <asp:Parameter Name="OLW_amount" Type="String" />
                <asp:Parameter Name="WONOFF" Type="String" />
                <asp:Parameter Name="Rec_Deg" Type="String" />
                <asp:Parameter Name="ReC_Client" Type="String" />
                <asp:Parameter Name="NetLoss" Type="String" />
                <asp:Parameter Name="Paid_DEG" Type="String" />
                <asp:Parameter Name="DateFirstOcc" Type="String" />
                <asp:Parameter Name="Status" Type="String" />
                <asp:Parameter Name="Recoversies" Type="String" />
                <asp:Parameter Name="Memorandom" Type="String" />
                <asp:Parameter Name="Loan_Class" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="CustomerName" Type="String" />
                <asp:Parameter Name="Acc_No" Type="String" />
                <asp:Parameter Name="Fac_type" Type="String" />
                <asp:Parameter Name="Org_limit" Type="String" />
                <asp:Parameter Name="Ccy" Type="String" />
                <asp:Parameter Name="OLW_amount" Type="String" />
                <asp:Parameter Name="WONOFF" Type="String" />
                <asp:Parameter Name="Rec_Deg" Type="String" />
                <asp:Parameter Name="ReC_Client" Type="String" />
                <asp:Parameter Name="NetLoss" Type="String" />
                <asp:Parameter Name="Paid_DEG" Type="String" />
                <asp:Parameter Name="DateFirstOcc" Type="String" />
                <asp:Parameter Name="Status" Type="String" />
                <asp:Parameter Name="Recoversies" Type="String" />
                <asp:Parameter Name="Memorandom" Type="String" />
                <asp:Parameter Name="Loan_Class" Type="String" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>




    </div>
</asp:Content>
