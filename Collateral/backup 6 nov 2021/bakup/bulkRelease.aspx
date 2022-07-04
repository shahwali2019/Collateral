<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="bulkRelease.aspx.cs" Inherits="Collateral_int.upload_xlsx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <header>
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
                  .center2
            {
                text-align:center;
                font-size:10px;
                 font-family:Bahnschrift;
                
                 width:auto;
                 padding:5px 0 5px 0;
            }
                  .btnborder{
                      border-bottom:10px solid #007acc;

                  }
                  .goLeft{
                      margin-right:-50px;
                      background-color:#d9534f;
                      color:#fff;

                  }
            </style>
    </header>
    <div style=" height:100px; padding-left:375px; border-top:10px solid #0094ff; margin-top:0; " class="alert alert-success" role="alert">
              <h4 class="alert-heading" style="padding-left: 15%; font-family:Bahnschrift;"><strong>Release Pleage Interface</strong></h4>  
           </div>
    <br />
     <span style="color: #007acc; font-size: 12px; font-family: Bahnschrift; margin-top: 190px;">
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        </span>
    <div id="hide" runat="server">
    <asp:Label ID="Label21" runat="server" CssClass="btnborder"  Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Small" ForeColor="Black" Height="34px" Text="Single Update " Width="1169px"></asp:Label>

    <br />
    <br />
    <asp:Label ID="msg" runat="server" Font-Bold="True" Font-Size="X-Small" ForeColor="#0099FF" Visible="False"></asp:Label>
    <br />
       
        <strong>
       
        &nbsp;<asp:Label ID="Label17" runat="server" Font-Bold="True" Font-Size="Smaller" ForeColor="Black" Text="Find Borrower name" Font-Names="Bahnschrift"></asp:Label>&nbsp; <asp:TextBox ID="bname" runat="server" Width="150px" Font-Bold="True" Font-Size="Small" Font-Names="Bahnschrift"></asp:TextBox>
       
        &nbsp;
       
        <asp:Label ID="Label18" runat="server" Font-Bold="True" Font-Size="Smaller" ForeColor="Black" Text="with Dino" Font-Names="Bahnschrift"></asp:Label>&nbsp;&nbsp;<asp:TextBox ID="dino" runat="server" Width="59px" Font-Names="Bahnschrift"></asp:TextBox>
       
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       
        <asp:Label ID="Label20" runat="server" Font-Bold="True" Font-Size="Smaller" ForeColor="Black" Text="with Card Serial Start" Font-Names="Bahnschrift"></asp:Label>&nbsp;&nbsp; &nbsp; <asp:TextBox ID="css" runat="server" Width="130px" Font-Names="Bahnschrift"></asp:TextBox>
    &nbsp;&nbsp; &nbsp;<asp:Button ID="Button1" runat="server" CssClass="btn-danger" Font-Names="Bahnschrift" Text="   " Width="25px" OnClick="Button1_Click" BorderStyle="None" />
    &nbsp;&nbsp;&nbsp;
    <asp:Button ID="Button4" runat="server" CssClass="btn-primary" Font-Bold="True" Font-Size="XX-Small" Height="29px" OnClick="Button4_Click" Text="UPDATE" Width="63px" BorderStyle="None" Font-Names="Bahnschrift" />
    <br />
    <br />
        <asp:Label ID="resultLbl" runat="server" Font-Bold="True" Font-Size="Smaller" ForeColor="Black" Font-Names="Bahnschrift">Number of Card you want to release:</asp:Label>
        &nbsp;<asp:TextBox ID="txtQty" runat="server" Width="51px" Font-Names="Arial Black" OnTextChanged="txtQty_TextChanged"></asp:TextBox>
&nbsp;
        <asp:Label ID="resultLbl0" runat="server" Font-Bold="True" Font-Size="Smaller" ForeColor="Black" Font-Names="Bahnschrift">of :</asp:Label>
        &nbsp;<asp:Label ID="lblQty" runat="server" Font-Bold="True" Font-Size="Smaller" ForeColor="#FF3300" Visible="False" Font-Names="Bahnschrift"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br />
   
            </div>
            <br />
    <br />
    <asp:Label ID="Label22" runat="server" CssClass="btnborder"  Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Small" ForeColor="Black" Height="34px" Text="Bulk Release" Width="1169px"></asp:Label>

    <br />
    <br />
    <br />
     <asp:Panel runat="server" DefaultButton="Button2" Height="55px" Width="1218px"> 
            &nbsp;<strong><asp:Label ID="Label23" runat="server" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Smaller" ForeColor="Black" Text="Find Borrower name"></asp:Label>
            </strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="bulkbname" placeholder="Customer name" runat="server" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Small" Width="150px" BackColor="#FFFF99" Height="29px"></asp:TextBox>
            &nbsp;
       
        <asp:Label ID="Label24" runat="server" Font-Bold="True" Font-Size="Smaller" ForeColor="Black" Text="with Dino" Font-Names="Bahnschrift"></asp:Label>&nbsp;
            
             
            <asp:TextBox ID="bulkdino" placeholder="Dino" runat="server" Width="59px" Font-Names="Bahnschrift" BackColor="#FFFF99" Height="29px"></asp:TextBox>
       
        &nbsp;&nbsp;&nbsp;<asp:Button ID="Button2" runat="server" CssClass="btn-danger" Font-Names="Wingdings" Text="   " Width="25px" OnClick="Button2_Click"  />
       
            &nbsp;<strong><asp:Label ID="Label25" runat="server" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Smaller" ForeColor="Black" Text="Pledge Date to Release"></asp:Label>
            <asp:TextBox ID="bulkPdate" runat="server" BackColor="#FFFF99" Font-Names="Bahnschrift" Font-Size="Small" Height="29px" TextMode="Date" Width="130px"></asp:TextBox>
            <asp:Label ID="Label26" runat="server" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Smaller" ForeColor="Black" Text="Number of Carton to Release"></asp:Label>
            <asp:TextBox ID="txtCartonVal" runat="server" AutoPostBack="true" placeholder=" .i.e 25" BackColor="#FFFF99" Font-Names="Bahnschrift" Height="29px" OnTextChanged="txtCartonVal_TextChanged" Width="44px"></asp:TextBox>
            <asp:Label ID="Label27" runat="server" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Smaller" ForeColor="Black" Text="of"></asp:Label>
            </strong>&nbsp; <strong>
            <asp:Label ID="CartonNo" runat="server" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Smaller" ForeColor="#FF3300">0</asp:Label>
            </strong>&nbsp;&nbsp; <strong>
            <asp:Button ID="Button5" runat="server" CssClass="btn-primary" Font-Bold="True" Font-Size="XX-Small" Height="29px" OnClick="Button5_Click" Text="UPDATE" Width="63px" />
            &nbsp;<asp:Button ID="btnJump" runat="server" CssClass="btn-danger" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Small" Height="29px" Text="Queue Jump" Visible="False" Width="112px" OnClick="btnJump_Click" />
            <br />
            <br />
            </strong>
                  </asp:Panel>

            &nbsp;<br />
    &nbsp;&nbsp;<asp:Label ID="msg2" runat="server" Font-Bold="True" Font-Size="X-Small" ForeColor="#0099FF" Visible="False"></asp:Label>
    
            
            <br />
        <asp:SqlDataSource ID="SqlCon" runat="server" ConnectionString="<%$ ConnectionStrings:DBCon %>"
            SelectCommand="SELECT * FROM [Loanadder_tbl] where id <1 ">
        </asp:SqlDataSource>
   
            <asp:GridView ID="GridView1" OnRowCommand="GridView1_RowCommand" runat="server"
               AllowSorting="True" CssClass="center" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC"
               BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="id" DataSourceID="SqlCon" PageSize="7" >
               <Columns>
                     <asp:TemplateField HeaderStyle-Height="45px" HeaderStyle-CssClass="text-center" ShowHeader="True" HeaderText="All">
                         <HeaderTemplate>
                             <asp:CheckBox AutoPostBack="true" ID="chkb1" runat="server" OnCheckedChanged="chkb1_CheckedChanged"/>
                         </HeaderTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="childch"  runat="server" AutoPostBack="true" OnCheckedChanged="childch_CheckedChanged" />
                            </ItemTemplate>
                         <ControlStyle CssClass="center" />
                      <HeaderStyle CssClass="center" Height="45px"></HeaderStyle>             
                         <ItemStyle CssClass="center" />
                </asp:TemplateField>

                <asp:TemplateField ShowHeader="true" HeaderText="Select">
                       <ItemTemplate>
                           <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Bind("id") %>' CausesValidation="False" CommandName="Select" Text="Select"></asp:LinkButton>
                       </ItemTemplate>
                       <ControlStyle CssClass="center" />
                       <HeaderStyle CssClass="center" />
                       <ItemStyle CssClass="Center" />
                   </asp:TemplateField>
                     <asp:TemplateField HeaderText="Customer ID" SortExpression="CID">
                         <EditItemTemplate>
                             <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("CID") %>'></asp:TextBox>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="Label6" runat="server" Text='<%# Bind("CID") %>'></asp:Label>
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
                           <asp:Label ID="Label16" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                       </ItemTemplate>
                       <ControlStyle CssClass="center" />
                       <HeaderStyle CssClass="center" />
                       <ItemStyle CssClass="center" />
                   </asp:TemplateField>
                     <asp:TemplateField HeaderText="Borrower Name" SortExpression="bname">
                         <EditItemTemplate>
                             <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("bname") %>'></asp:TextBox>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="Label7" runat="server" Text='<%# Bind("bname") %>'></asp:Label>
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
                           <asp:Label ID="Label4" runat="server" DataFormatString="{0:MM-dd-yyyy}" Text='<%# Bind("pdate") %>'></asp:Label>
                       </ItemTemplate>
                       <ControlStyle CssClass="center" />
                       <HeaderStyle CssClass="center" />
                       <ItemStyle CssClass="center" />
                   </asp:TemplateField>
                     <asp:TemplateField HeaderText="Telecom Company" SortExpression="Telecom">
                         <EditItemTemplate>
                             <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Telecom") %>'></asp:TextBox>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="Label8" runat="server" Text='<%# Bind("Telecom") %>'></asp:Label>
                         </ItemTemplate>
                         <ControlStyle CssClass="center" />
                         <HeaderStyle CssClass="center" />
                         <ItemStyle CssClass="center" />
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="Dinomination" SortExpression="dino">
                         <EditItemTemplate>
                             <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("dino") %>'></asp:TextBox>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="Label9" runat="server" Text='<%# Bind("dino") %>'></asp:Label>
                         </ItemTemplate>
                         <ControlStyle CssClass="center" />
                         <HeaderStyle CssClass="center" />
                         <ItemStyle CssClass="center" />
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="Our Tag" SortExpression="ourRef">
                         <EditItemTemplate>
                             <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("ourRef") %>'></asp:TextBox>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="Label10" runat="server" Text='<%# Bind("ourRef") %>'></asp:Label>
                         </ItemTemplate>
                         <ControlStyle CssClass="center" />
                         <HeaderStyle CssClass="center" />
                         <ItemStyle CssClass="center" />
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="Card Serial Start" SortExpression="CardSerialStart">
                         <EditItemTemplate>
                             <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("CardSerialStart") %>'></asp:TextBox>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="Label11" runat="server" Text='<%# Bind("CardSerialStart") %>'></asp:Label>
                         </ItemTemplate>
                         <ControlStyle CssClass="center" />
                         <HeaderStyle CssClass="center" />
                         <ItemStyle CssClass="center" />
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="Card Serial End" SortExpression="CardSerialEnd">
                         <EditItemTemplate>
                             <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("CardSerialEnd") %>'></asp:TextBox>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="Label12" runat="server" Text='<%# Bind("CardSerialEnd") %>'></asp:Label>
                         </ItemTemplate>
                         <ControlStyle CssClass="center" />
                         <HeaderStyle CssClass="center" />
                         <ItemStyle CssClass="center" />
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="Quantity" SortExpression="Qty">
                         <EditItemTemplate>
                             <asp:TextBox ID="TextBox12" runat="server" Text='<%# Bind("Qty") %>'></asp:TextBox>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="Label13" runat="server" Text='<%# Bind("Qty") %>'></asp:Label>
                         </ItemTemplate>
                         <ControlStyle CssClass="center" />
                         <HeaderStyle CssClass="center" />
                         <ItemStyle CssClass="center" />
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="Carton Value in AFN" SortExpression="CartonValAfn">
                         <EditItemTemplate>
                             <asp:TextBox ID="TextBox13" runat="server" Text='<%# Bind("CartonValAfn") %>'></asp:TextBox>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="Label14" runat="server" Text='<%# Bind("CartonValAfn") %>'></asp:Label>
                         </ItemTemplate>
                         <ControlStyle CssClass="center" />
                         <HeaderStyle CssClass="center" />
                         <ItemStyle CssClass="center" />
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="Status" SortExpression="status">
                         <EditItemTemplate>
                             <asp:TextBox ID="TextBox14" runat="server" Text='<%# Bind("status") %>'></asp:TextBox>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="Label15" runat="server" Text='<%# Bind("status") %>'></asp:Label>
                         </ItemTemplate>
                         <ControlStyle CssClass="center" />
                         <HeaderStyle CssClass="center" />
                         <ItemStyle CssClass="center" />
                     </asp:TemplateField>
                   <asp:TemplateField HeaderText="Release Date" SortExpression="ReleaseDate">
                       <EditItemTemplate>
                           <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ReleaseDate") %>'></asp:TextBox>
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="Label2" runat="server" Text='<%# Bind("ReleaseDate") %>'></asp:Label>
                       </ItemTemplate>
                       <ControlStyle CssClass="center" />
                       <HeaderStyle CssClass="center" />
                       <ItemStyle CssClass="center" />
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="Rotation Date" SortExpression="RotationDate">
                       <EditItemTemplate>
                           <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("RotationDate") %>'></asp:TextBox>
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="Label3" runat="server" DataFormatString="{0:d}" Text='<%# Bind("RotationDate") %>'></asp:Label>
                       </ItemTemplate>
                       <ControlStyle CssClass="center" />
                       <HeaderStyle CssClass="center" />
                       <ItemStyle CssClass="center" />
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="Inserted By" SortExpression="insertedBy">
                       <EditItemTemplate>
                           <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("insertedBy") %>'></asp:TextBox>
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="Label5" runat="server" Text='<%# Bind("insertedBy") %>'></asp:Label>
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
      
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False"
                BackColor="White" BorderColor="#3366CC" BorderStyle="None"
                BorderWidth="1px" CellPadding="4" DataKeyNames="id" Width="1268px" >
                <Columns>
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
                    <asp:TemplateField HeaderText="Our Taq" SortExpression="ourRef">
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

                     <asp:TemplateField HeaderText="Inserted By" SortExpression="insertedBy">
                       <EditItemTemplate>
                           <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("insertedBy") %>'></asp:TextBox>
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="Label15" runat="server" Text='<%# Bind("insertedBy") %>'></asp:Label>
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



        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DBCon %>" SelectCommand="SELECT * FROM [Loanadder_tbl]"></asp:SqlDataSource>



        </strong>
        
         























    </div>
</asp:Content>
