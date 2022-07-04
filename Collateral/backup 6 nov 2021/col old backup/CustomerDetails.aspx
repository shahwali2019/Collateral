<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CustomerDetails.aspx.cs" Inherits="Collateral_int.CustomerDetails" %>
<asp:Content ID="Content1" ContentplaceholderID="MainContent" runat="server">
    <header>
      <style>
            .center{
                text-align:center;
                font-size:12px;
                padding:2px 5px 2px 5px;
                height:40px;
                 font-family:Bahnschrift;
              }
        </style>
</header>
    <div style=" height:100px; padding-left:375px; border-top:10px solid #0094ff" class="alert alert-success" role="alert">
              <h4 class="alert-heading" style="padding-left: 15%;"><strong>Customer Details Interface</strong></h4>  
           </div>
    <br />
    <asp:Label ID="msg" runat="server" Text="Label" Visible="False" ForeColor="#FF3300"></asp:Label>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None"
        BorderWidth="1px" CellPadding="4" DataKeyNames="id">
        <Columns>
            <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" SortExpression="id" HeaderStyle-CssClass="center" ItemStyle-CssClass="center" />
            <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" HeaderStyle-CssClass="center" ItemStyle-CssClass="center" />
            <asp:BoundField DataField="ClosingBlance" HeaderText="Closing Balance" SortExpression="ClosingBlance" HeaderStyle-CssClass="center"  ItemStyle-CssClass="center" />
            <asp:BoundField DataField="NoDays" HeaderText="No.# of Days" SortExpression="NoDays" HeaderStyle-CssClass="center" ItemStyle-CssClass="center" />
            <asp:BoundField DataField="fund" HeaderText="Fund Received" SortExpression="fund" HeaderStyle-CssClass="center" ItemStyle-CssClass="center" />
            <asp:BoundField DataField="OD_balance" HeaderText="OD Balance" SortExpression="OD_balance" HeaderStyle-CssClass="center" ItemStyle-CssClass="center" />
            <asp:BoundField DataField="USPrimeRate" HeaderText="US Prime Rate" SortExpression="USPrimeRate" HeaderStyle-CssClass="center" ItemStyle-CssClass="center" />
            <asp:BoundField DataField="interestRate" HeaderText="Interest Rate" SortExpression="interestRate" HeaderStyle-CssClass="center" ItemStyle-CssClass="center" />
            <asp:BoundField DataField="minrate" HeaderText="Minimum Rate" SortExpression="minrate" HeaderStyle-CssClass="center" ItemStyle-CssClass="center" />
            <asp:BoundField DataField="IterestCharge" HeaderText="Interest To be Charge" SortExpression="IterestCharge" HeaderStyle-CssClass="center" ItemStyle-CssClass="center" />
            <asp:BoundField DataField="NormalInterest" HeaderText="Normal Interest" SortExpression="NormalInterest" HeaderStyle-CssClass="center" ItemStyle-CssClass="center" />
            <asp:BoundField DataField="PanelInerest" HeaderText="Panel Inerest" SortExpression="PanelInerest" HeaderStyle-CssClass="center" ItemStyle-CssClass="center" />
            <asp:BoundField DataField="InterestCollected" HeaderText="Interest To be Collected" SortExpression="InterestCollected" HeaderStyle-CssClass="center" ItemStyle-CssClass="center" />
            <asp:BoundField DataField="Acc_bySys" HeaderText="Accrued by the System" SortExpression="Acc_bySys" HeaderStyle-CssClass="center" ItemStyle-CssClass="center" />
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
     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DBCon %>" DeleteCommand="DELETE FROM [Customer_detail] WHERE [id] = @id" InsertCommand="INSERT INTO [Customer_detail] ([id], [Date], [ClosingBlance], [NoDays], [fund], [OD_balance], [USPrimeRate], [interestRate], [minrate], [IterestCharge], [NormalInterest], [PanelInerest], [InterestCollected], [Acc_bySys]) VALUES (@id, @Date, @ClosingBlance, @NoDays, @fund, @OD_balance, @USPrimeRate, @interestRate, @minrate, @IterestCharge, @NormalInterest, @PanelInerest, @InterestCollected, @Acc_bySys)" SelectCommand="SELECT * FROM [Customer_detail]" UpdateCommand="UPDATE [Customer_detail] SET [Date] = @Date, [ClosingBlance] = @ClosingBlance, [NoDays] = @NoDays, [fund] = @fund, [OD_balance] = @OD_balance, [USPrimeRate] = @USPrimeRate, [interestRate] = @interestRate, [minrate] = @minrate, [IterestCharge] = @IterestCharge, [NormalInterest] = @NormalInterest, [PanelInerest] = @PanelInerest, [InterestCollected] = @InterestCollected, [Acc_bySys] = @Acc_bySys WHERE [id] = @id">
         <DeleteParameters>
             <asp:Parameter Name="id" Type="Int32" />
         </DeleteParameters>
         <InsertParameters>
             <asp:Parameter Name="id" Type="Int32" />
             <asp:Parameter Name="Date" Type="String" />
             <asp:Parameter Name="ClosingBlance" Type="String" />
             <asp:Parameter Name="NoDays" Type="String" />
             <asp:Parameter Name="fund" Type="String" />
             <asp:Parameter Name="OD_balance" Type="String" />
             <asp:Parameter Name="USPrimeRate" Type="String" />
             <asp:Parameter Name="interestRate" Type="String" />
             <asp:Parameter Name="minrate" Type="String" />
             <asp:Parameter Name="IterestCharge" Type="String" />
             <asp:Parameter Name="NormalInterest" Type="String" />
             <asp:Parameter Name="PanelInerest" Type="String" />
             <asp:Parameter Name="InterestCollected" Type="String" />
             <asp:Parameter Name="Acc_bySys" Type="String" />
         </InsertParameters>
         <UpdateParameters>
             <asp:Parameter Name="Date" Type="String" />
             <asp:Parameter Name="ClosingBlance" Type="String" />
             <asp:Parameter Name="NoDays" Type="String" />
             <asp:Parameter Name="fund" Type="String" />
             <asp:Parameter Name="OD_balance" Type="String" />
             <asp:Parameter Name="USPrimeRate" Type="String" />
             <asp:Parameter Name="interestRate" Type="String" />
             <asp:Parameter Name="minrate" Type="String" />
             <asp:Parameter Name="IterestCharge" Type="String" />
             <asp:Parameter Name="NormalInterest" Type="String" />
             <asp:Parameter Name="PanelInerest" Type="String" />
             <asp:Parameter Name="InterestCollected" Type="String" />
             <asp:Parameter Name="Acc_bySys" Type="String" />
             <asp:Parameter Name="id" Type="Int32" />
         </UpdateParameters>
     </asp:SqlDataSource>
</asp:Content>
