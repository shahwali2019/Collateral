<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="new_mcu_record.aspx.cs" Inherits="Collateral_int.new_mcu_record" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />

<style>
            .auto-style30 {
                font-size: 12px;
                font-weight: bold;
                font-family: Bahnschrift;
            }

            .center {
                text-align: center;
                color: blue;
                font-family: Bahnschrift,Arial;
            }

            .auto-style1 {
                font-size: 12px;
                font-weight: bold;
                font-family: Bahnschrift;
            }

            .auto-style5 {
                width: 148px;
                height: 46px;
            }

            .auto-style6 {
                width: 87px;
                font-size: 12px;
                font-weight: bold;
                font-family: Bahnschrift;
                height: 46px;
                padding-left:20px;
            }

            .auto-style7 {
                width: 154px;
                font-size: 12px;
                font-weight: bold;
                font-family: Bahnschrift;
                height: 46px;
            }

            .auto-style8 {
                width: 209px;
                height: 46px;
            }

            .auto-style17 {
                width: 95%;
                height: 266px;
            }

            td {
                padding-top: 5px;
            }

            .auto-style18 {
                width: 148px;
            }

            .auto-style32 {
                width: 75px;
                padding-left: 50px;
            }

            .auto-style33 {
                font-size: 12px;
                font-weight: bold;
                font-family: Bahnschrift;
                width: 154px;
            }

            .auto-style34 {
                width: 155px;
                font-size: 12px;
                font-weight: bold;
                font-family: Bahnschrift;
            }

            .auto-style35 {
                font-size: 12px;
                font-weight: bold;
                font-family: Bahnschrift;
                width: 136px;
            }
            .auto-style36 {
                width: 136px;
                font-size: 12px;
                font-weight: bold;
                font-family: Bahnschrift;
                height: 46px;
            }
            .auto-style37 {
                width: 87px;
                font-size: 12px;
                font-weight: bold;
                font-family: Bahnschrift;
                padding-left: 20px;
            }
            .auto-style38 {
                width: 36px;
            }

</style>
<div style="height: 120px; padding-left: 45%; border-top: 10px solid #0094ff; margin-top: -20px;" class="alert alert-success" role="alert">
   <h4 class="alert-heading" style="font-family: Bahnschrift;">
      <strong>
         <asp:Label ID="addLbl" runat="server" Text="NEW MCU RECORD"></asp:Label>
      </strong>
   </h4>
</div>
<div style="background-color: #fff; padding: 50px; margin-top: -40px;">
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
   <ContentTemplate>
      <table>
         <tr>
            <td>
               &nbsp;
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               <asp:GridView ID="GridView2" runat="server" CellPadding="4" GridLines="None" CssClass="center" Font-Size="Smaller" HorizontalAlign="Left" OnRowCommand="GridView2_RowCommand" Visible="False" Width="444px" ForeColor="#333333">
                  <AlternatingRowStyle BackColor="White" />
                  <Columns>
                     <asp:TemplateField HeaderText="SELECT">
                        <ItemTemplate>
                           <asp:Button ID="Button3" runat="server" CausesValidation="false" CommandArgument='<%# Bind("CUST_AC_NO") %>' CommandName="select" Text="SELECT" />
                        </ItemTemplate>
                        <HeaderStyle CssClass="center" />
                        <ItemStyle CssClass="center" />
                     </asp:TemplateField>
                  </Columns>
                  <EditRowStyle BackColor="#7C6F57" />
                  <FooterStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True" />
                  <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                  <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                  <RowStyle BackColor="#E3EAEB" />
                  <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                  <SortedAscendingCellStyle BackColor="#F8FAFA" />
                  <SortedAscendingHeaderStyle BackColor="#246B61" />
                  <SortedDescendingCellStyle BackColor="#D4DFE1" />
                  <SortedDescendingHeaderStyle BackColor="#15524A" />
               </asp:GridView>
<%--               <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:OracleCon %>" ProviderName="<%$ ConnectionStrings:OracleCon.ProviderName %>" SelectCommand="SELECT top 10 &quot;COUNTER_PARTY&quot; FROM &quot;FCXTB_FXDEAL_CONTRACT&quot;"></asp:SqlDataSource>--%>
            </td>
         </tr>
      </table>
   </ContentTemplate>
</asp:UpdatePanel>
<table class="auto-style17" style="padding-bottom: 5px;">
   <tr>
      <td class="auto-style1" colspan="8">
         <asp:Label ID="msg" runat="server" Visible="False" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Smaller"></asp:Label>
      </td>
   </tr>
   <tr>
      <td class="auto-style1" colspan="8">
         <div style="margin-left: -55px;" class="auto-style38">
            <asp:ImageButton ID="back" runat="server" Height="23px" ImageUrl="~/image/back.png" OnClick="back_Click" Width="30px" />
         </div>
         <br />
      </td>
   </tr>
   <tr>
      <td class="auto-style35">Client Name<strong><span style="color: red;">*</span></strong></td>
<%--      <td class="auto-style32">
         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtClient" ErrorMessage="X" Font-Names="Bahnschrift" Font-Size="XX-Small" ForeColor="Red"></asp:RequiredFieldValidator>
      </td>--%>
      <td class="auto-style18">
         <%-- <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>--%>
         <asp:TextBox ID="txtClient" AutoPostBack="true" CssClass="Control" runat="server" Height="40px" Width="196px" Font-Bold="True" Font-Size="Smaller" TabIndex="1" OnTextChanged="txtClient_TextChanged"></asp:TextBox>
         <%--       </ContentTemplate>
            </asp:UpdatePanel>--%>
      </td>
      <td class="auto-style37">
         <br />
         <br />
         <br />
      </td>
      <td class="auto-style33">
         <strong>Due Date of MCU<span style="color: red;">*</span></strong>
      </td>
      <td colspan="2">
         <asp:TextBox ID="txtDDM" CssClass="center" runat="server" Height="40px" Width="196px" Font-Bold="True" Font-Size="Smaller" TabIndex="6"></asp:TextBox>
      </td>
<%--      <td class="auto-style6">
         <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtDDM" ErrorMessage="X" Font-Names="Bahnschrift" Font-Size="XX-Small" ForeColor="Red"></asp:RequiredFieldValidator>
      </td>--%>
   </tr>
   <tr>
      <td class="auto-style35">Currency&nbsp;<strong><span style="color: red;">*</span></strong></td>
<%--      <td class="auto-style32">
         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="listCurrency" ErrorMessage="X" Font-Names="Bahnschrift" Font-Size="XX-Small" ForeColor="Red" InitialValue="Currency"></asp:RequiredFieldValidator>
      </td>--%>
      <td class="auto-style18">
         <asp:DropDownList ID="listCurrency" runat="server" CssClass="btn-success" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Smaller" Font-Strikeout="False" Font-Underline="False" ForeColor="White" Height="40px" Width="196px" TabIndex="2">
            <asp:ListItem>Currency</asp:ListItem>
            <asp:ListItem>USD</asp:ListItem>
            <asp:ListItem>AFN</asp:ListItem>
         </asp:DropDownList>
      </td>
      <td class="auto-style37">
         &nbsp;
      </td>
      <td class="auto-style33">M<strong>CU Date <span style="color: red;">*</span></strong></td>
      <td style="width: 209px" colspan="2">
         <asp:TextBox ID="txtmcudate" CssClass="center" runat="server" Height="40px" Width="196px" Font-Bold="True" Font-Size="Smaller" TabIndex="7"></asp:TextBox>
      </td>
<%--      <td  class="auto-style6">
         <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtmcudate" ErrorMessage="X" Font-Names="Bahnschrift" Font-Size="XX-Small" ForeColor="Red"></asp:RequiredFieldValidator>
      </td>--%>
   </tr>
   <tr>
      <td class="auto-style36"><strong>Account Number<span style="color: red;">*</span></strong></td>
<%--      <td class="auto-style32">
         <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtACNO" ErrorMessage="X" Font-Names="Bahnschrift" Font-Size="XX-Small" ForeColor="Red"></asp:RequiredFieldValidator>
      </td>--%>
      <td class="auto-style5">
         <asp:TextBox ID="txtACNO" CssClass="center" runat="server" Height="40px" Width="196px" Font-Bold="True" Font-Size="Smaller" TabIndex="3" OnTextChanged="txtClient_TextChanged"></asp:TextBox>
                                                    <asp:Label ID="txtlbl" ForeColor="Red" Font-Bold="true" Text="No Data In The FlexCube." runat="server" Visible="false" />

          </td>
      <td>
         <asp:ImageButton ID="ImageButton1" runat="server" BackColor="#CCCCCC" BorderStyle="None" Height="20px" ImageUrl="~/image/searchIcon.jfif" ToolTip="Search From FlexCube" OnClick="ImageButton1_Click" />
      </td>
      <td class="auto-style7">Loan Status<strong><span style="color: red;">*</span></strong>
      </td>
      <td class="auto-style8" colspan="2">
         <asp:DropDownList ID="listLoan" runat="server" CssClass="btn-success" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Smaller" Font-Strikeout="False" Font-Underline="False" ForeColor="White" Height="40px" Width="196px" TabIndex="8">
            <asp:ListItem Value="LS">Loan Status</asp:ListItem>
            <asp:ListItem>ACTIVE</asp:ListItem>
            <asp:ListItem>CLOSED</asp:ListItem>
         </asp:DropDownList>
      </td>
<%--      <td class="auto-style6">
         <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="listLoan" ErrorMessage="X" Font-Names="Bahnschrift" Font-Size="XX-Small" ForeColor="Red" InitialValue="LS"></asp:RequiredFieldValidator>
      </td>--%>
   </tr>
   <tr>
      <td class="auto-style35"><strong>Approval Number <span style="color: red;">*</span></strong></td>
<%--      <td class="auto-style32">
         <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtAppNo" ErrorMessage="X" Font-Names="Bahnschrift" Font-Size="XX-Small" ForeColor="Red"></asp:RequiredFieldValidator>
      </td>--%>
      <td class="auto-style18">
         <asp:TextBox ID="txtAppNo" CssClass="center" runat="server" Height="40px" Width="196px" Font-Bold="True" Font-Size="Smaller" TabIndex="4" OnTextChanged="txtClient_TextChanged"></asp:TextBox>
      </td>
      <td class="auto-style37">
         &nbsp;
      </td>
      <td class="auto-style33">Remark</td>
      <td style="width: 209px" colspan="2">
         <asp:TextBox ID="txtRemark" CssClass="center" runat="server" Height="40px" Width="196px" Font-Bold="True" Font-Size="Smaller" TabIndex="9" OnTextChanged="txtClient_TextChanged"></asp:TextBox>
      </td>
      <td style="width: 209px">
         &nbsp;
      </td>
      <td>
         &nbsp;
      </td>
   </tr>
   <tr>
      <td class="auto-style35">D<strong>isburesement Date<span style="color: red;">*</span></strong></td>
<%--      <td class="auto-style32">
         <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtDisburesment" ErrorMessage="X" Font-Names="Bahnschrift" Font-Size="XX-Small" ForeColor="Red"></asp:RequiredFieldValidator>
      </td>--%>
      <td class="auto-style18">
         <asp:TextBox ID="txtDisburesment" CssClass="center" runat="server" Height="40px" Width="196px" Font-Bold="True" Font-Size="Smaller" TabIndex="5" OnTextChanged="txtClient_TextChanged"></asp:TextBox>
      </td>
      <td class="auto-style37">
         &nbsp;
      </td>
      <td class="auto-style34" rowspan="4">
      </td>
      <td class="auto-style34" rowspan="4">
         <strong>
            <asp:Button ID="subBtn" runat="server" CssClass="btn-primary" Height="37px" Text="ADD" Width="81px" Font-Bold="True" Font-Size="Small" TabIndex="10" OnClick="subBtn_Click" BorderStyle="None" />
         </strong>
      </td>
      <td class="auto-style30" colspan="2" rowspan="4">
         &nbsp;
      </td>
   </tr>
   <tr>
      <td class="auto-style30" colspan="4" rowspan="3">
         <br />
         <br />
      </td>
   </tr>
   <tr>
      <td>&nbsp;</td>
   </tr>
   <tr>
      <td>
         &nbsp;
      </td>
   </tr>
</table>
</div>
</asp:Content>





