<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="newmtr.aspx.cs" Inherits="Collateral.newmtr" %>
<asp:Content ID="Content1" ContentplaceholderID="MainContent" runat="server">
        <br />
    
<header>
 <script type="text/javascript">

        function ShowPopup(title, body) {
            $("#MyPopup .modal-title").html(title);
            $("#MyPopup .modal-body").html(body);
            $("#MyPopup").modal("show");
        }
</script>
<style>
 
</style>
        
</header>

<div style="border-top: 10px solid #0094ff; margin-top: -10px; text-align:center" class="alert alert-success" role="alert">
   <h4 class="alert-heading" style="font-family: Bahnschrift;">
      <strong>
         <asp:Label ID="pageLable" runat="server" Text="ADD NEW MANUAL TRANSACTION RECORD"></asp:Label>
      </strong>
   </h4>
</div>
<div class="row">
   <div class="col-md-2">
      <div class="form-group-sm">
         <asp:Label  ID="Label1" runat="server" Text="Client Name" Font-Names="Bahnschrift" Font-Size="x-small"></asp:Label>
         <%--                    <input runat="server" id="txtClientName" type="text" class="form-control" required="required"  />--%>
         <asp:TextBox ID="txtclientn" runat="server" type="text" class="form-control" required="required" ></asp:TextBox>
      </div>
   </div>
   <div class="col-md-2">
      <div class="form-group-sm">
         <asp:Label ID="Label2" runat="server" Text="Memo Ref No." Font-Names="Bahnschrift" Font-Size="x-small"></asp:Label>
         <%--                    <input runat="server" id="txtMemoRef" type="text" class="form-control" required="required"  />--%>
         <asp:TextBox ID="txtMemoR" runat="server" type="text" class="form-control" required="required" ></asp:TextBox>
      </div>
   </div>
   <div class="col-md-2">
      <div class="form-group-sm">
         <asp:Label ID="Label3" runat="server" Text="Debit Account" Font-Names="Bahnschrift" Font-Size="x-small"></asp:Label>
         <%--                   <input runat="server" id="txtDAccount" type="text" class="form-control" required="required"  />--%>
         <asp:TextBox ID="txtDAc" runat="server" type="text" class="form-control" required="required" ></asp:TextBox>
      </div>
   </div>
   <div class="col-md-2">
      <div class="form-group-sm">
         <asp:Label ID="Label4" runat="server" Text="Credit Account" Font-Names="Bahnschrift" Font-Size="x-small"></asp:Label>
         <%--                    <input runat="server" id="txtCAccount" type="text" class="form-control" required="required"  />--%>
         <asp:TextBox ID="txtCAcc" runat="server" type="text" class="form-control" required="required" ></asp:TextBox>
      </div>
   </div>
   <div class="col-md-2">
      <div class="form-group-sm">
         <asp:Label ID="Label5" runat="server" Text="Transaction Code" Font-Names="Bahnschrift" Font-Size="x-small"></asp:Label>
         <%--                     <input runat="server" id="txtTransactionCode" type="text" class="form-control" required="required"  />--%>
         <asp:TextBox ID="txtTransactionC" runat="server" type="text" class="form-control" required="required" ></asp:TextBox>
      </div>
   </div>
   <div class="col-md-2">
      <div class="form-group-sm">
         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Font-Size="X-Small" ErrorMessage="X" ControlToValidate="txtMemoS" ForeColor="Red"></asp:RequiredFieldValidator>
         <asp:Label ID="Label6" runat="server" Text="Memo Submission Date" Font-Names="Bahnschrift" Font-Size="x-small"></asp:Label>
         <%--                    <asp:TextBox ID="txtMemoSub" runat="server" TextMode="Date" CssClass="form-control" Font-Names="Bahnschrift" Font-Size="x-small"></asp:TextBox>--%>
         <asp:TextBox ID="txtMemoS" runat="server" type="text" class="form-control" required="required" ></asp:TextBox>
      </div>
   </div>
</div>
<%-- end of first row --%>
<div class="row">
   <div class="col-md-2">
      <div class="form-group-sm">
         <asp:Label ID="Label7" runat="server" Text="Amount" Font-Names="Bahnschrift" Font-Size="x-small"></asp:Label>
         <%--                    <input runat="server" id="txtAmount" type="text" class="form-control" required="required"  />--%>
         <asp:TextBox ID="txtAmoun" runat="server" type="text" class="form-control" required="required" ></asp:TextBox>
      </div>
   </div>
   <div class="col-md-2">
      <div class="form-group-sm">
         <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" Font-Size="X-Small" ErrorMessage="X" ControlToValidate="DropDownList1" ForeColor="Red" InitialValue="Currency"></asp:RequiredFieldValidator>
         <asp:Label ID="Label8" runat="server" Text="Currency" Font-Names="Bahnschrift" Font-Size="x-small"></asp:Label>
         <asp:DropDownList ID="DropDownList1" CssClass="form-control " runat="server" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="X-Small">
            <asp:ListItem>Currency</asp:ListItem>
            <asp:ListItem Value="AFN">AFN</asp:ListItem>
            <asp:ListItem Value="USD">USD</asp:ListItem>
            <asp:ListItem Value="EUR">EUR</asp:ListItem>
         </asp:DropDownList>
      </div>
   </div>
   <div class="col-md-2">
      <div class="form-group-sm">
         <asp:Label ID="Label9" runat="server" Text="Heading" Font-Names="Bahnschrift" Font-Size="x-small"></asp:Label>
         <%--<input runat="server" id="txtheading" type="text" class="form-control" required="required"  />--%>
         <asp:TextBox ID="txtheadg" runat="server" type="text" class="form-control" required="required" ></asp:TextBox>
      </div>
   </div>
   <div class="col-md-2">
      <div class="form-group-sm">
         <asp:Label ID="Label10" runat="server" Text="Transaction Detail" Font-Names="Bahnschrift" Font-Size="x-small"></asp:Label>
         <%--                    <input runat="server" id="txtTranDetail" type="text" class="form-control" required="required"  />--%>
         <asp:TextBox ID="txtTranDetails" runat="server" type="text" class="form-control" required="required" ></asp:TextBox>
      </div>
   </div>
   <div class="col-md-2">
      <div class="form-group-sm">
         <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Font-Size="X-Small" ErrorMessage="X" ControlToValidate="txtBookingDate" ForeColor="Red"></asp:RequiredFieldValidator>
         <asp:Label ID="Label11" runat="server" Text="Booking Date" Font-Names="Bahnschrift" Font-Size="x-small"></asp:Label>
         <asp:TextBox ID="txtBookingDate" runat="server" CssClass="form-control" TextMode="Date" Font-Names="Bahnschrift" Font-Size="x-small"></asp:TextBox>
      </div>
   </div>
   <div class="col-md-2">
      <div class="form-group-sm">
         <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Font-Size="X-Small" ErrorMessage="X" ControlToValidate="txtValueDate" ForeColor="Red"></asp:RequiredFieldValidator>
         <asp:Label ID="Label12" runat="server" Text="Value Date" Font-Names="Bahnschrift" Font-Size="x-small"></asp:Label>
         <asp:TextBox ID="txtValueDate" runat="server" TextMode="Date" CssClass="form-control" Font-Names="Bahnschrift" Font-Size="x-small"></asp:TextBox>
      </div>
   </div>
   <div class="col-sm-6">
      <div class="form-group-sm">
         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Font-Size="X-Small" ErrorMessage="X" ControlToValidate="statusList" ForeColor="Red" InitialValue="STATUS"></asp:RequiredFieldValidator>
         <asp:Label ID="Label13" runat="server" Text="Transaction Status" Font-Names="Bahnschrift" Font-Size="x-small"></asp:Label>
         <asp:DropDownList ID="statusList" CssClass="form-control " runat="server" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="X-Small">
            <asp:ListItem>STATUS</asp:ListItem>
            <asp:ListItem Value="DONE">DONE</asp:ListItem>
            <asp:ListItem Value="PENDING">PENDING</asp:ListItem>
            <asp:ListItem Value="PENDING">CANCELLED</asp:ListItem>
         </asp:DropDownList>
      </div>
   </div>
   <div class="col-sm-6">
      <div class="form-group-md">
         <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" Font-Size="X-Small" ErrorMessage="X" ControlToValidate="txtRemark" ForeColor="Red"></asp:RequiredFieldValidator>
         <asp:Label ID="Label14" runat="server" Text="Remark" Font-Names="Bahnschrift" Font-Size="x-small"></asp:Label>
         <asp:TextBox ID="txtRemark" runat="server"  CssClass="form-control" Font-Names="Bahnschrift" Width="100%" Font-Size="x-small"></asp:TextBox>
      </div>
   </div>
</div>
<br /><br />
<div class="row">
   <div class="col-md-6">
      <asp:UpdatePanel ID="UpdatePanel1" runat="server">
         <ContentTemplate>
            <asp:Button ID="SaveBtn" runat="server" Text="SAVE" Class="btn btn-success"  Width="100%" Font-Names="Bahnschrift" OnClick="SaveBtn_Click" />
            <input id="Reset1" type="reset" value="RESET" class="btn btn-danger" aria-multiline="False" style="font-family: Bahnschrift; font-size: small" />
         </ContentTemplate>
      </asp:UpdatePanel>
   </div>
</div>
<%-- end of second row --%>
<br />
<div id="MyPopup" class="modal fade" role="dialog">
   <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">
            &times;</button>
            <h4 class="modal-title">
            </h4>
         </div>
         <div class="modal-body">
         </div>
         <div class="modal-footer">
            <button type="button" class="btn btn-danger" data-dismiss="modal">
            Close</button>
         </div>
      </div>
   </div>
</div> 
</asp:Content>
