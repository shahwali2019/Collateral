<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="loan.aspx.cs" Inherits="Collateral_int.loan1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
	<br />
	<style> .center {
		text-align: center;
		font-size: 10px;
		font-family: Bahnschrift;
		height: 30px;
		width: auto;
		padding: 0 5px 0 5px;
	}
	.auto-style1 {
		display: block;
		padding: 6px 12px;
		font-size: 14px;
		line-height: 1.42857143;
		color: #555;
		background-color: #fff;
		background-image: none;
		border: 1px solid #ccc;
		border-radius: 4px;
		-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
		box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
		-webkit-transition: border-color ease-in-out .15s, -webkit-box-shadow ease-in-out .15s;
		-o-transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
		transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
	}
	.auto-style2 {
		width: 91px;
		height: 69px;
	}
	</style>
	<div style=" text-align:center; height:100px;border-top:10px solid #0094ff; margin-top:-20px; " class="alert alert-success" role="alert">
		<h4 class="alert-heading" style="font-family:Bahnschrift;"><strong>PLEDGE RECORDS</strong></h4> 
	</div>
	<div style="margin-left:0px; margin-top:-20px;  " class="auto-style2">
		<br /> <span style="color: #007acc; font-size: 12px; font-family: Bahnschrift; margin-top: 190px;">
<%--            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>--%>
        </span>
		<br />
		<asp:ImageButton ID="ImageButton2" runat="server" Height="21px" ImageUrl="~/image/add.png" Width="23px" ToolTip="Add new Record" OnClick="ImageButton2_Click" TabIndex="4" />
		<asp:ImageButton ID="ImageButton1" runat="server" Height="20px" ImageUrl="~/image/excel1.png" Width="24px" OnClick="ImageButton1_Click" ToolTip="Export to MS Excel 2016" TabIndex="5" />&nbsp;
		<asp:ImageButton ID="ImageButton3" runat="server" Height="20px" ImageUrl="~/image/update.jpg" Width="24px" ToolTip="Bulk update" OnClick="ImageButton3_Click" TabIndex="6" />
	</div>
	<asp:Panel runat="server" DefaultButton="searchBtn">
		<table>
			<tr style="padding:10px 10px;">
				<td>
					<asp:TextBox ID="searchbarTxt" placeholder="Customer Name" runat="server" Height="31px" Width="168px" BackColor="#FFFF99" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Small" TabIndex="2" CssClass="form-control"></asp:TextBox>
				</td>
				<td>&nbsp;</td>
				<td>
					<asp:TextBox ID="txtDino" runat="server" placeholder="Dino" BackColor="#FFFF99" Height="31px" Width="60px" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Small" TabIndex="3" CssClass="auto-style1"></asp:TextBox>
				</td>
				<td>&nbsp;</td>
				<td>
					<asp:TextBox ID="txtPdate" runat="server" BackColor="#FFFF99" Height="31px" placeholder="Dino" TextMode="Date" Width="155px" Font-Names="Bahnschrift" Font-Size="Small" TabIndex="4" CssClass="form-control"></asp:TextBox>
				</td>
				<td>&nbsp;</td>
				<td>
					<asp:DropDownList ID="statusList" runat="server" CssClass="btn-success" Height="31px" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Small" TabIndex="5">
						<asp:ListItem Value="status" Selected="True">Status</asp:ListItem>
						<asp:ListItem Value="Pledged">Pledged</asp:ListItem>
						<asp:ListItem Value="Released">Released</asp:ListItem>
					</asp:DropDownList>
				</td>
				<td>&nbsp;</td>
				<td>
					<asp:Button ID="searchBtn" runat="server" CssClass="btn-primary focus" Font-Bold="True" Font-Size="Small" Height="31px" OnClick="searchBtn_Click" Text="Search" Width="67px" Font-Names="Bahnschrift" BorderStyle="None" />
				</td>
			</tr>
		</table>
	</asp:Panel>
	<%-- <asp:CheckBox AutoPostBack="true" ID="Main" runat="server" Font-Bold="True" Font-Size="X-Small" ForeColor="Blue" OnCheckedChanged="Main_CheckedChanged" Text="Main Records" Visible="False" />
	<asp:CheckBox AutoPostBack="true" ID="pending" runat="server" Font-Bold="True" Font-Size="X-Small" ForeColor="Blue" Text="Pending Records" OnCheckedChanged="pending_CheckedChanged" Visible="False" />--%>
	<asp:Label ID="resultLbl" runat="server" Font-Bold="True" Font-Size="Smaller" ForeColor="Red" Visible="False" Font-Names="Bahnschrift Condensed"></asp:Label> <strong>
        <br />
        
             <%-- <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                  <ContentTemplate>--%>
                       <%--DataSourceID="SqlCon"--%> 
                      <asp:GridView ID="GridView1" runat="server" OnRowCommand="GridView1_RowCommand"  AutoGenerateColumns="False" DataKeyNames="id" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" GridLines="Horizontal">
                          <AlternatingRowStyle BackColor="#CCFFFF" />
            <Columns>
                 <asp:TemplateField HeaderText="All">
                     <HeaderTemplate>
                    <asp:CheckBox ID="chkb1" runat="server" Text="All" OnCheckedChanged="chkb1_CheckedChanged" AutoPostBack="true" />
                    </HeaderTemplate>
                     <ControlStyle CssClass="center" />
                     <HeaderStyle CssClass="center" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="center" />
                    <ItemTemplate>
                     <asp:CheckBox ID="chkSelect" runat="server" />
                     </ItemTemplate>
                    <ItemStyle HorizontalAlign="center" />
                     </asp:TemplateField>
                 <asp:TemplateField HeaderText="id" InsertVisible="False" SortExpression="id">
                     <EditItemTemplate>
                         <asp:Label ID="Label1" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                     </EditItemTemplate>
                     <ItemTemplate>
                         <asp:Label ID="Label19" runat="server" Text='<%# Bind("id") %>'></asp:Label>
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
                         <asp:Label ID="Label1" runat="server" Text='<%# Bind("CID") %>'></asp:Label>
                     </ItemTemplate>
                      <ControlStyle CssClass="center" />
                     <HeaderStyle CssClass="center" />
                     <ItemStyle CssClass="center" />
                 </asp:TemplateField>
                 <asp:TemplateField HeaderText="Beneficiary Name" SortExpression="bname">
                     <EditItemTemplate>
                         <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("bname") %>'></asp:TextBox>
                     </EditItemTemplate>
                     <ItemTemplate>
                         <asp:Label ID="Label2" runat="server" Text='<%# Bind("bname") %>'></asp:Label>
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
                         <asp:Label ID="Label3" runat="server" Text='<%# Bind("pdate") %>'></asp:Label>
                     </ItemTemplate>
                       <ControlStyle CssClass="center" />
                     <HeaderStyle CssClass="center" />
                     <ItemStyle CssClass="center" />
                 </asp:TemplateField>
                 <asp:TemplateField HeaderText="Telecom" SortExpression="Telecom">
                     <EditItemTemplate>
                         <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Telecom") %>'></asp:TextBox>
                     </EditItemTemplate>
                     <ItemTemplate>
                         <asp:Label ID="Label4" runat="server" Text='<%# Bind("Telecom") %>'></asp:Label>
                     </ItemTemplate>
                       <ControlStyle CssClass="center" />
                     <HeaderStyle CssClass="center" />
                     <ItemStyle CssClass="center" />
                 </asp:TemplateField>
                 <asp:TemplateField HeaderText="Dino" SortExpression="dino">
                     <EditItemTemplate>
                         <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("dino") %>'></asp:TextBox>
                     </EditItemTemplate>
                     <ItemTemplate>
                         <asp:Label ID="Label5" runat="server" Text='<%# Bind("dino") %>'></asp:Label>
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
                         <asp:Label ID="Label6" runat="server" Text='<%# Bind("ourRef") %>'></asp:Label>
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
                         <asp:Label ID="Label7" runat="server" Text='<%# Bind("CardSerialStart") %>'></asp:Label>
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
                         <asp:Label ID="Label8" runat="server" Text='<%# Bind("CardSerialEnd") %>'></asp:Label>
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
                         <asp:Label ID="Label9" runat="server" Text='<%# Bind("Qty") %>'></asp:Label>
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
                         <asp:Label ID="Label10" runat="server" Text='<%# Bind("CartonValAfn") %>'></asp:Label>
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
                         <asp:Label ID="Label11" runat="server" Text='<%# Bind("status") %>'></asp:Label>
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
                         <asp:Label ID="Label12" runat="server" Text='<%# Bind("ReleaseDate") %>'></asp:Label>
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
                         <asp:Label ID="Label13" runat="server" Text='<%# Bind("RotationDate") %>'></asp:Label>
                     </ItemTemplate>
                       <ControlStyle CssClass="center" />
                     <HeaderStyle CssClass="center" />
                     <ItemStyle CssClass="center" />
                 </asp:TemplateField>
                 <asp:TemplateField HeaderText="2nd Rotation Date" SortExpression="SecRotationDate">
                     <EditItemTemplate>
                         <asp:TextBox ID="TextBox14" runat="server" Text='<%# Bind("SecRotationDate") %>'></asp:TextBox>
                     </EditItemTemplate>
                     <ItemTemplate>
                         <asp:Label ID="Label14" runat="server" Text='<%# Bind("SecRotationDate") %>'></asp:Label>
                     </ItemTemplate>
                       <ControlStyle CssClass="center" />
                     <HeaderStyle CssClass="center" />
                     <ItemStyle CssClass="center" />

                 </asp:TemplateField>
                 <asp:TemplateField HeaderText="3rd Rotation Date" SortExpression="ThirdRotationDate">
                     <EditItemTemplate>
                         <asp:TextBox ID="TextBox15" runat="server" Text='<%# Bind("ThirdRotationDate") %>'></asp:TextBox>
                     </EditItemTemplate>
                     <ItemTemplate>
                         <asp:Label ID="Label15" runat="server" Text='<%# Bind("ThirdRotationDate") %>'></asp:Label>
                     </ItemTemplate>
                       <ControlStyle CssClass="center" />
                     <HeaderStyle CssClass="center" />
                     <ItemStyle CssClass="center" />

                 </asp:TemplateField>
                 <asp:TemplateField HeaderText="Updated By" SortExpression="UpdatedBy">
                     <EditItemTemplate>
                         <asp:TextBox ID="TextBox16" runat="server" Text='<%# Bind("UpdatedBy") %>'></asp:TextBox>
                     </EditItemTemplate>
                     <ItemTemplate>
                         <asp:Label ID="Label16" runat="server" Text='<%# Bind("UpdatedBy") %>'></asp:Label>
                     </ItemTemplate>
                       <ControlStyle CssClass="center" />
                     <HeaderStyle CssClass="center" />
                     <ItemStyle CssClass="center" />
                 </asp:TemplateField>
                 <asp:TemplateField HeaderText="Inserted By" SortExpression="InsertedBy">
                     <EditItemTemplate>
                         <asp:TextBox ID="TextBox17" runat="server" Text='<%# Bind("InsertedBy") %>'></asp:TextBox>
                     </EditItemTemplate>
                     <ItemTemplate>
                         <asp:Label ID="Label17" runat="server" Text='<%# Bind("InsertedBy") %>'></asp:Label>
                     </ItemTemplate>
                       <ControlStyle CssClass="center" />
                     <HeaderStyle CssClass="center" />
                     <ItemStyle CssClass="center" />
                 </asp:TemplateField>
                 <asp:TemplateField HeaderText="Approved By" SortExpression="ApprovedBy">
                     <EditItemTemplate>
                         <asp:TextBox ID="TextBox18" runat="server" Text='<%# Bind("ApprovedBy") %>'></asp:TextBox>
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
            <PagerStyle BackColor="#2461BF" ForeColor="white" Font-Size="XX-Small" />

        </asp:GridView>


         
           
             <%-- </ContentTemplate>
              </asp:UpdatePanel>--%>
        </strong>
	<br />
	<asp:GridView ID="GridView2" OnRowCommand="GridView2_RowCommand" runat="server" AllowSorting="True" CssClass="center" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="id" DataSourceID="SqlCon2" PageSize="7" Visible="False">
		<Columns>
			<%-- <asp:BoundField DataField="SecRotationDate" HeaderText="2nd Rotation Date" SortExpression="SecRotationDate">
				<ControlStyle CssClass="center" />
				<HeaderStyle CssClass="center" />
				<ItemStyle CssClass="center" />
				</asp:BoundField>
				<asp:BoundField DataField="ThirdRotationDate" HeaderText="3rd Rotation Date" SortExpression="ThirdRotationDate">
					<ControlStyle CssClass="center" />
					<HeaderStyle CssClass="center" />
					<ItemStyle CssClass="center" />
				</asp:BoundField>--%>
				<asp:TemplateField HeaderText="Select">
					<ItemTemplate>
						<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandArgument='<%# Bind("id") %>' CommandName="Select" Text="Select"></asp:LinkButton>
					</ItemTemplate>
					<ControlStyle CssClass="center" />
					<HeaderStyle CssClass="center" />
					<ItemStyle CssClass="center" />
				</asp:TemplateField>
				<asp:TemplateField ShowHeader="true" HeaderText="Approve">
					<ItemTemplate>
						<asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Bind("id") %>' CausesValidation="False" CommandName="Insert" Text="Approve"></asp:LinkButton>
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
						<asp:Label ID="Label1" runat="server" Text='<%# Bind("id") %>'></asp:Label>
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
	<asp:SqlDataSource ID="SqlCon" runat="server" ConnectionString="<%$ ConnectionStrings:DBCon %>" DeleteCommand="DELETE FROM [Loanadder_tbl] WHERE [id] = @original_id AND (([CID] = @original_CID) OR ([CID] IS NULL AND @original_CID IS NULL)) AND (([bname] = @original_bname) OR ([bname] IS NULL AND @original_bname IS NULL)) AND (([pdate] = @original_pdate) OR ([pdate] IS NULL AND @original_pdate IS NULL)) AND (([Telecom] = @original_Telecom) OR ([Telecom] IS NULL AND @original_Telecom IS NULL)) AND (([dino] = @original_dino) OR ([dino] IS NULL AND @original_dino IS NULL)) AND (([ourRef] = @original_ourRef) OR ([ourRef] IS NULL AND @original_ourRef IS NULL)) AND (([CardSerialStart] = @original_CardSerialStart) OR ([CardSerialStart] IS NULL AND @original_CardSerialStart IS NULL)) AND (([CardSerialEnd] = @original_CardSerialEnd) OR ([CardSerialEnd] IS NULL AND @original_CardSerialEnd IS NULL)) AND (([Qty] = @original_Qty) OR ([Qty] IS NULL AND @original_Qty IS NULL)) AND (([CartonValAfn] = @original_CartonValAfn) OR ([CartonValAfn] IS NULL AND @original_CartonValAfn IS NULL)) AND (([status] = @original_status) OR ([status] IS NULL AND @original_status IS NULL)) AND (([ReleaseDate] = @original_ReleaseDate) OR ([ReleaseDate] IS NULL AND @original_ReleaseDate IS NULL)) AND (([RotationDate] = @original_RotationDate) OR ([RotationDate] IS NULL AND @original_RotationDate IS NULL)) AND (([SecRotationDate] = @original_SecRotationDate) OR ([SecRotationDate] IS NULL AND @original_SecRotationDate IS NULL)) AND (([ThirdRotationDate] = @original_ThirdRotationDate) OR ([ThirdRotationDate] IS NULL AND @original_ThirdRotationDate IS NULL)) AND (([UpdatedBy] = @original_UpdatedBy) OR ([UpdatedBy] IS NULL AND @original_UpdatedBy IS NULL)) AND (([InsertedBy] = @original_InsertedBy) OR ([InsertedBy] IS NULL AND @original_InsertedBy IS NULL)) AND (([ApprovedBy] = @original_ApprovedBy) OR ([ApprovedBy] IS NULL AND @original_ApprovedBy IS NULL))" InsertCommand="INSERT INTO [Loanadder_tbl] ([CID], [bname], [pdate], [Telecom], [dino], [ourRef], [CardSerialStart], [CardSerialEnd], [Qty], [CartonValAfn], [status], [ReleaseDate], [RotationDate], [SecRotationDate], [ThirdRotationDate], [UpdatedBy], [InsertedBy], [ApprovedBy]) VALUES (@CID, @bname, @pdate, @Telecom, @dino, @ourRef, @CardSerialStart, @CardSerialEnd, @Qty, @CartonValAfn, @status, @ReleaseDate, @RotationDate, @SecRotationDate, @ThirdRotationDate, @UpdatedBy, @InsertedBy, @ApprovedBy)" SelectCommand="SELECT * FROM [Loanadder_tbl]" UpdateCommand="UPDATE [Loanadder_tbl] SET [CID] = @CID, [bname] = @bname, [pdate] = @pdate, [Telecom] = @Telecom, [dino] = @dino, [ourRef] = @ourRef, [CardSerialStart] = @CardSerialStart, [CardSerialEnd] = @CardSerialEnd, [Qty] = @Qty, [CartonValAfn] = @CartonValAfn, [status] = @status, [ReleaseDate] = @ReleaseDate, [RotationDate] = @RotationDate, [SecRotationDate] = @SecRotationDate, [ThirdRotationDate] = @ThirdRotationDate, [UpdatedBy] = @UpdatedBy, [InsertedBy] = @InsertedBy, [ApprovedBy] = @ApprovedBy WHERE [id] = @original_id AND (([CID] = @original_CID) OR ([CID] IS NULL AND @original_CID IS NULL)) AND (([bname] = @original_bname) OR ([bname] IS NULL AND @original_bname IS NULL)) AND (([pdate] = @original_pdate) OR ([pdate] IS NULL AND @original_pdate IS NULL)) AND (([Telecom] = @original_Telecom) OR ([Telecom] IS NULL AND @original_Telecom IS NULL)) AND (([dino] = @original_dino) OR ([dino] IS NULL AND @original_dino IS NULL)) AND (([ourRef] = @original_ourRef) OR ([ourRef] IS NULL AND @original_ourRef IS NULL)) AND (([CardSerialStart] = @original_CardSerialStart) OR ([CardSerialStart] IS NULL AND @original_CardSerialStart IS NULL)) AND (([CardSerialEnd] = @original_CardSerialEnd) OR ([CardSerialEnd] IS NULL AND @original_CardSerialEnd IS NULL)) AND (([Qty] = @original_Qty) OR ([Qty] IS NULL AND @original_Qty IS NULL)) AND (([CartonValAfn] = @original_CartonValAfn) OR ([CartonValAfn] IS NULL AND @original_CartonValAfn IS NULL)) AND (([status] = @original_status) OR ([status] IS NULL AND @original_status IS NULL)) AND (([ReleaseDate] = @original_ReleaseDate) OR ([ReleaseDate] IS NULL AND @original_ReleaseDate IS NULL)) AND (([RotationDate] = @original_RotationDate) OR ([RotationDate] IS NULL AND @original_RotationDate IS NULL)) AND (([SecRotationDate] = @original_SecRotationDate) OR ([SecRotationDate] IS NULL AND @original_SecRotationDate IS NULL)) AND (([ThirdRotationDate] = @original_ThirdRotationDate) OR ([ThirdRotationDate] IS NULL AND @original_ThirdRotationDate IS NULL)) AND (([UpdatedBy] = @original_UpdatedBy) OR ([UpdatedBy] IS NULL AND @original_UpdatedBy IS NULL)) AND (([InsertedBy] = @original_InsertedBy) OR ([InsertedBy] IS NULL AND @original_InsertedBy IS NULL)) AND (([ApprovedBy] = @original_ApprovedBy) OR ([ApprovedBy] IS NULL AND @original_ApprovedBy IS NULL))" ConflictDetection="CompareAllValues" OldValuesParameterFormatString="original_{0}">
		<DeleteParameters>
			<asp:Parameter Name="original_id" Type="Int64" />
			<asp:Parameter Name="original_CID" Type="Int64" />
			<asp:Parameter Name="original_bname" Type="String" />
			<asp:Parameter Name="original_pdate" Type="String" />
			<asp:Parameter Name="original_Telecom" Type="String" />
			<asp:Parameter Name="original_dino" Type="Double" />
			<asp:Parameter Name="original_ourRef" Type="Double" />
			<asp:Parameter Name="original_CardSerialStart" Type="Int64" />
			<asp:Parameter Name="original_CardSerialEnd" Type="Int64" />
			<asp:Parameter Name="original_Qty" Type="Int64" />
			<asp:Parameter Name="original_CartonValAfn" Type="Int64" />
			<asp:Parameter Name="original_status" Type="String" />
			<asp:Parameter Name="original_ReleaseDate" Type="String" />
			<asp:Parameter Name="original_RotationDate" Type="String" />
			<asp:Parameter Name="original_SecRotationDate" Type="String" />
			<asp:Parameter Name="original_ThirdRotationDate" Type="String" />
			<asp:Parameter Name="original_UpdatedBy" Type="String" />
			<asp:Parameter Name="original_InsertedBy" Type="String" />
			<asp:Parameter Name="original_ApprovedBy" Type="String" />
		</DeleteParameters>
		<InsertParameters>
			<asp:Parameter Name="CID" Type="Int64" />
			<asp:Parameter Name="bname" Type="String" />
			<asp:Parameter Name="pdate" Type="String" />
			<asp:Parameter Name="Telecom" Type="String" />
			<asp:Parameter Name="dino" Type="Double" />
			<asp:Parameter Name="ourRef" Type="Double" />
			<asp:Parameter Name="CardSerialStart" Type="Int64" />
			<asp:Parameter Name="CardSerialEnd" Type="Int64" />
			<asp:Parameter Name="Qty" Type="Int64" />
			<asp:Parameter Name="CartonValAfn" Type="Int64" />
			<asp:Parameter Name="status" Type="String" />
			<asp:Parameter Name="ReleaseDate" Type="String" />
			<asp:Parameter Name="RotationDate" Type="String" />
			<asp:Parameter Name="SecRotationDate" Type="String" />
			<asp:Parameter Name="ThirdRotationDate" Type="String" />
			<asp:Parameter Name="UpdatedBy" Type="String" />
			<asp:Parameter Name="InsertedBy" Type="String" />
			<asp:Parameter Name="ApprovedBy" Type="String" />
		</InsertParameters>
		<UpdateParameters>
			<asp:Parameter Name="CID" Type="Int64" />
			<asp:Parameter Name="bname" Type="String" />
			<asp:Parameter Name="pdate" Type="String" />
			<asp:Parameter Name="Telecom" Type="String" />
			<asp:Parameter Name="dino" Type="Double" />
			<asp:Parameter Name="ourRef" Type="Double" />
			<asp:Parameter Name="CardSerialStart" Type="Int64" />
			<asp:Parameter Name="CardSerialEnd" Type="Int64" />
			<asp:Parameter Name="Qty" Type="Int64" />
			<asp:Parameter Name="CartonValAfn" Type="Int64" />
			<asp:Parameter Name="status" Type="String" />
			<asp:Parameter Name="ReleaseDate" Type="String" />
			<asp:Parameter Name="RotationDate" Type="String" />
			<asp:Parameter Name="SecRotationDate" Type="String" />
			<asp:Parameter Name="ThirdRotationDate" Type="String" />
			<asp:Parameter Name="UpdatedBy" Type="String" />
			<asp:Parameter Name="InsertedBy" Type="String" />
			<asp:Parameter Name="ApprovedBy" Type="String" />
			<asp:Parameter Name="original_id" Type="Int64" />
			<asp:Parameter Name="original_CID" Type="Int64" />
			<asp:Parameter Name="original_bname" Type="String" />
			<asp:Parameter Name="original_pdate" Type="String" />
			<asp:Parameter Name="original_Telecom" Type="String" />
			<asp:Parameter Name="original_dino" Type="Double" />
			<asp:Parameter Name="original_ourRef" Type="Double" />
			<asp:Parameter Name="original_CardSerialStart" Type="Int64" />
			<asp:Parameter Name="original_CardSerialEnd" Type="Int64" />
			<asp:Parameter Name="original_Qty" Type="Int64" />
			<asp:Parameter Name="original_CartonValAfn" Type="Int64" />
			<asp:Parameter Name="original_status" Type="String" />
			<asp:Parameter Name="original_ReleaseDate" Type="String" />
			<asp:Parameter Name="original_RotationDate" Type="String" />
			<asp:Parameter Name="original_SecRotationDate" Type="String" />
			<asp:Parameter Name="original_ThirdRotationDate" Type="String" />
			<asp:Parameter Name="original_UpdatedBy" Type="String" />
			<asp:Parameter Name="original_InsertedBy" Type="String" />
			<asp:Parameter Name="original_ApprovedBy" Type="String" />
		</UpdateParameters>
	</asp:SqlDataSource>
	<asp:SqlDataSource ID="SqlCon2" runat="server" ConnectionString="<%$ ConnectionStrings:DBCon %>" DeleteCommand="DELETE FROM [Loanadder_tbl2] WHERE [id] = @id order by id desc" InsertCommand="INSERT INTO [Loanadder_tbl2] ([bname], [pdate], [Telecom], [dino], [ourRef], [CardSerialStart], [CardSerialEnd], [Qty], [CartonValAfn], [status], [ReleaseDate], [RotationDate], [SecRotationDate], [ThirdRotationDate]) VALUES (@bname, @pdate, @Telecom, @dino, @ourRef, @CardSerialStart, @CardSerialEnd, @Qty, @CartonValAfn, @status, @ReleaseDate, @RotationDate, @SecRotationDate, @ThirdRotationDate)" SelectCommand="SELECT * FROM [Loanadder_tbl2]" UpdateCommand="UPDATE [Loanadder_tbl2] SET [bname] = @bname,
            [pdate] = @pdate, 
            [Telecom] = @Telecom,
            [ourRef] = @ourRef,
            [CardSerialStart] = @CardSerialStart,
            [CardSerialEnd] = @CardSerialEnd, 
            [Qty] = @CardSerialEnd - @CardSerialStart,
            [status] = @status, 
            [ReleaseDate] = @ReleaseDate,
            [RotationDate] = @RotationDate,
            [SecRotationDate] = @SecRotationDate,
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
	</asp:SqlDataSource>
	<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DBCon %>" SelectCommand="select bname as Customer,count(id) as Amount,Telecom,pdate Date from loanadder_tbl 
group by Telecom,bname,pdate 
"></asp:SqlDataSource>
</div>
</asp:Content>
