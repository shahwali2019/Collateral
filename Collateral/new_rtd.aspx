<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="new_rtd.aspx.cs" Inherits="Collateral_int.new_rtd" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <header>
   <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

     <script type="text/javascript">
    $(function () {
        $('.date').datepicker({Add
            changeYear: true,  //Recently added
            changeMonth: true  //Recently added
        }
        );
    });
</script> 

   


   </header>

    <br />
  
<div style="text-align:center; margin-left:10px;">
       <div style=" height:120px;  text-align:center; margin:0 auto;  margin-top:-10px" class="alert alert-success" role="alert">
              <h4 class="alert-heading" style=" font-family:Bahnschrift;"><strong><asp:Label ID="addLbl" runat="server" Text="Avaliable Title Deeds" ></asp:Label></strong></h4>  
           </div>
</div>
    <div style="background-color:#fff; padding:50px; margin-top:-40px;">
    <style>
        .auto-style30{
            padding-left:20px;
            font-size:12px;
            font-weight:bold;
            font-family:Bahnschrift;
        }
        .center{
            text-align:center;
            color:blue;
            font-family:Bahnschrift,Arial;
        }
        .auto-style1 {
            font-size: 12px;
            font-weight: bold;
            font-family: Bahnschrift;
        }
        .auto-style3 {
            margin-left: 40px;
        }
        .auto-style5 {
            width: 323px;
            height: 46px;
        }
        .auto-style8 {
            width: 209px;
            height: 46px;
        }
        .auto-style17 {
            width: 96%;
            height: 219px;
        }
        td{
            padding-top:5px;
        }
        .auto-style23 {
            width: 323px;
            height: 43px;
        }
        .auto-style26 {
            width: 209px;
            height: 43px;
        }
        .auto-style27 {
            width: 220px;
            font-size: 12px;
            font-weight: bold;
            font-family: Bahnschrift;
        
        }
        .auto-style30 {
            width: 40px;
            padding-left:40px;
        }
        .auto-style35 {
            width: 323px;
            height: 51px;
        }
        .auto-style38 {
            margin-left: 40px;
            height: 51px;
        }
        .goUp{
            margin-top:-10px;
           
        }
       
              
        .auto-style40 {
            padding-right: 90px;
            height: 29px;
            width: 323px;
        }
    
              
                      
        /*td{
        padding-bottom:10px;
    }*/
              
        .auto-style61 {
            width: 341px;
            font-size: 12px;
            font-weight: bold;
            font-family: Bahnschrift;
        }
              
        .auto-style64 {
            width: 40px;
            padding-left: 40px;
            height: 29px;
        }
        .auto-style65 {
            width: 341px;
            font-size: 12px;
            font-weight: bold;
            font-family: Bahnschrift;
            height: 29px;
        }
        .auto-style67 {
            margin-left: 40px;
            height: 29px;
        }
              
        .auto-style70 {
            width: 478px;
            font-size: 12px;
            font-weight: bold;
            font-family: Bahnschrift;
            height: 51px;
        }
        .auto-style71 {
            width: 478px;
            font-size: 12px;
            font-weight: bold;
            font-family: Bahnschrift;
        }
        .auto-style72 {
            width: 478px;
            font-size: 12px;
            font-weight: bold;
            font-family: Bahnschrift;
            height: 29px;
        }
              
        .auto-style73 {
            width: 341px;
            font-size: 12px;
            font-weight: bold;
            font-family: Bahnschrift;
            height: 51px;
        }
        .auto-style74 {
            width: 323px;
            padding-right: 90px;
        }
        .auto-style75 {
            width: 323px;
            font-size: 12px;
            font-weight: bold;
            font-family: Bahnschrift;
            height: 51px;
        }
        .auto-style76 {
            width: 323px;
            font-size: 12px;
            font-weight: bold;
            font-family: Bahnschrift;
        }
              
        .auto-style79 {
            width: 323px;
            padding-right: 90px;
            height: 41px;
        }
        .auto-style81 {
            font-size: 12px;
            font-weight: bold;
            font-family: Bahnschrift;
            height: 41px;
        }
        .auto-style82 {
            width: 220px;
            font-size: 12px;
            font-weight: bold;
            font-family: Bahnschrift;
            height: 41px;
        }
        .auto-style84 {
            width: 341px;
            font-size: 12px;
            font-weight: bold;
            font-family: Bahnschrift;
            height: 41px;
        }
              
        .auto-style85 {
            padding-right: 90px;
        }
              
        .auto-style86 {
            font-size: 12px;
            font-weight: bold;
            font-family: Bahnschrift;
            width: 67px;
            padding-left: 40px;
        }
        .auto-style87 {
            font-size: 12px;
            font-weight: bold;
            font-family: Bahnschrift;
            height: 41px;
            width: 67px;
        }
              
    </style>
      
                  <table border="0" class="auto-style17" style=" ">
        <tr>
            <td class="auto-style1" colspan="4">
             
                    <div style="margin-left:-55px;"><asp:ImageButton ID="back" runat="server" Height="23px" ImageUrl="~/image/back.png" OnClick="back_Click" Width="30px" />
                        
                    </div>
               
                    <asp:Label ID="Label1" runat="server" Text="Shamsi Calander" ToolTip="Afghanistan Persian Calander"></asp:Label>
                    <br />
                  
                          <div runat="server" id="datePicker" style=""> 
                             

                                      <asp:DropDownList ID="DropDownList1" runat="server"  CssClass="btn-success" Font-Names="B Nazanin" Height="30px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Width="62px">
                                          <asp:ListItem Value="1">حمل</asp:ListItem>
                                          <asp:ListItem Value="2">ثور</asp:ListItem>
                                          <asp:ListItem Value="3">جوزا</asp:ListItem>
                                          <asp:ListItem Value="4">سرطان</asp:ListItem>
                                          <asp:ListItem Value="5">اسد</asp:ListItem>
                                          <asp:ListItem Value="6">سنبله</asp:ListItem>
                                          <asp:ListItem Value="7">میزان</asp:ListItem>
                                          <asp:ListItem Value="8">عقرب</asp:ListItem>
                                          <asp:ListItem Value="9">قوس</asp:ListItem>
                                          <asp:ListItem Value="10">جدی</asp:ListItem>
                                          <asp:ListItem Value="11">دلو</asp:ListItem>
                                          <asp:ListItem Value="12">حوت</asp:ListItem>
                                      </asp:DropDownList>
                                      <asp:DropDownList ID="DropDownList2" runat="server"  CssClass="btn-success" Font-Names="B Nazanin" Height="30px" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
                                          <asp:ListItem>1</asp:ListItem>
                                          <asp:ListItem>2</asp:ListItem>
                                          <asp:ListItem>3</asp:ListItem>
                                          <asp:ListItem>4</asp:ListItem>
                                          <asp:ListItem>5</asp:ListItem>
                                          <asp:ListItem>6</asp:ListItem>
                                          <asp:ListItem>7</asp:ListItem>
                                          <asp:ListItem>8</asp:ListItem>
                                          <asp:ListItem>9</asp:ListItem>
                                          <asp:ListItem>10</asp:ListItem>
                                          <asp:ListItem>11</asp:ListItem>
                                          <asp:ListItem>12</asp:ListItem>
                                          <asp:ListItem>13</asp:ListItem>
                                          <asp:ListItem>14</asp:ListItem>
                                          <asp:ListItem>15</asp:ListItem>
                                          <asp:ListItem>16</asp:ListItem>
                                          <asp:ListItem>17</asp:ListItem>
                                          <asp:ListItem>18</asp:ListItem>
                                          <asp:ListItem>19</asp:ListItem>
                                          <asp:ListItem>20</asp:ListItem>
                                          <asp:ListItem>21</asp:ListItem>
                                          <asp:ListItem>22</asp:ListItem>
                                          <asp:ListItem>23</asp:ListItem>
                                          <asp:ListItem>24</asp:ListItem>
                                          <asp:ListItem>25</asp:ListItem>
                                          <asp:ListItem>26</asp:ListItem>
                                          <asp:ListItem>27</asp:ListItem>
                                          <asp:ListItem>28</asp:ListItem>
                                          <asp:ListItem>29</asp:ListItem>
                                          <asp:ListItem>30</asp:ListItem>
                                          <asp:ListItem>31</asp:ListItem>
                                      </asp:DropDownList>
                             <div style=" width:60px; margin-left:103px; margin-top:-30px;">
                               
                                        <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="true" CssClass="btn-success" Font-Names="B Nazanin" Font-Size="Medium" Height="30px" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged"  Width="62px">
                                          <asp:ListItem>1300</asp:ListItem>
                                          <asp:ListItem>1301</asp:ListItem>
                                          <asp:ListItem>1302</asp:ListItem>
                                          <asp:ListItem>1303</asp:ListItem>
                                          <asp:ListItem>1304</asp:ListItem>
                                          <asp:ListItem>1305</asp:ListItem>
                                          <asp:ListItem>1306</asp:ListItem>
                                          <asp:ListItem>1307</asp:ListItem>
                                          <asp:ListItem>1308</asp:ListItem>
                                          <asp:ListItem>1309</asp:ListItem>
                                          <asp:ListItem>1310</asp:ListItem>
                                          <asp:ListItem>1311</asp:ListItem>
                                          <asp:ListItem>1312</asp:ListItem>
                                          <asp:ListItem>1313</asp:ListItem>
                                          <asp:ListItem>1314</asp:ListItem>
                                          <asp:ListItem>1315</asp:ListItem>
                                          <asp:ListItem>1316</asp:ListItem>
                                          <asp:ListItem>1317</asp:ListItem>
                                          <asp:ListItem>1318</asp:ListItem>
                                          <asp:ListItem>1319</asp:ListItem>
                                          <asp:ListItem>1320</asp:ListItem>
                                          <asp:ListItem>1321</asp:ListItem>
                                          <asp:ListItem>1322</asp:ListItem>
                                          <asp:ListItem>1323</asp:ListItem>
                                          <asp:ListItem>1324</asp:ListItem>
                                          <asp:ListItem>1325</asp:ListItem>
                                          <asp:ListItem>1326</asp:ListItem>
                                          <asp:ListItem>1327</asp:ListItem>
                                          <asp:ListItem>1328</asp:ListItem>
                                          <asp:ListItem>1329</asp:ListItem>
                                          <asp:ListItem>1330</asp:ListItem>
                                          <asp:ListItem>1331</asp:ListItem>
                                          <asp:ListItem>1332</asp:ListItem>
                                          <asp:ListItem>1333</asp:ListItem>
                                          <asp:ListItem>1334</asp:ListItem>
                                          <asp:ListItem>1335</asp:ListItem>
                                          <asp:ListItem>1336</asp:ListItem>
                                          <asp:ListItem>1337</asp:ListItem>
                                          <asp:ListItem>1338</asp:ListItem>
                                          <asp:ListItem>1339</asp:ListItem>
                                          <asp:ListItem>1340</asp:ListItem>
                                          <asp:ListItem>1341</asp:ListItem>
                                          <asp:ListItem>1342</asp:ListItem>
                                          <asp:ListItem>1343</asp:ListItem>
                                          <asp:ListItem>1344</asp:ListItem>
                                          <asp:ListItem>1345</asp:ListItem>
                                          <asp:ListItem>1346</asp:ListItem>
                                          <asp:ListItem>1347</asp:ListItem>
                                          <asp:ListItem>1348</asp:ListItem>
                                          <asp:ListItem>1349</asp:ListItem>
                                          <asp:ListItem>1350</asp:ListItem>
                                          <asp:ListItem>1351</asp:ListItem>
                                          <asp:ListItem>1352</asp:ListItem>
                                          <asp:ListItem>1353</asp:ListItem>
                                          <asp:ListItem>1354</asp:ListItem>
                                          <asp:ListItem>1355</asp:ListItem>
                                          <asp:ListItem>1356</asp:ListItem>
                                          <asp:ListItem>1357</asp:ListItem>
                                          <asp:ListItem>1358</asp:ListItem>
                                          <asp:ListItem>1359</asp:ListItem>
                                          <asp:ListItem>1360</asp:ListItem>
                                          <asp:ListItem>1361</asp:ListItem>
                                          <asp:ListItem>1362</asp:ListItem>
                                          <asp:ListItem>1363</asp:ListItem>
                                          <asp:ListItem>1364</asp:ListItem>
                                          <asp:ListItem>1365</asp:ListItem>
                                          <asp:ListItem>1366</asp:ListItem>
                                          <asp:ListItem>1367</asp:ListItem>
                                          <asp:ListItem>1368</asp:ListItem>
                                          <asp:ListItem>1369</asp:ListItem>
                                          <asp:ListItem>1370</asp:ListItem>
                                          <asp:ListItem>1371</asp:ListItem>
                                          <asp:ListItem>1372</asp:ListItem>
                                          <asp:ListItem>1373</asp:ListItem>
                                          <asp:ListItem>1374</asp:ListItem>
                                          <asp:ListItem>1375</asp:ListItem>
                                          <asp:ListItem>1376</asp:ListItem>
                                          <asp:ListItem>1377</asp:ListItem>
                                          <asp:ListItem>1378</asp:ListItem>
                                          <asp:ListItem>1379</asp:ListItem>
                                          <asp:ListItem>1380</asp:ListItem>
                                          <asp:ListItem>1381</asp:ListItem>
                                          <asp:ListItem>1382</asp:ListItem>
                                          <asp:ListItem>1383</asp:ListItem>
                                          <asp:ListItem>1384</asp:ListItem>
                                          <asp:ListItem>1385</asp:ListItem>
                                          <asp:ListItem>1386</asp:ListItem>
                                          <asp:ListItem>1387</asp:ListItem>
                                          <asp:ListItem>1388</asp:ListItem>
                                          <asp:ListItem>1389</asp:ListItem>
                                          <asp:ListItem>1390</asp:ListItem>
                                          <asp:ListItem>1391</asp:ListItem>
                                          <asp:ListItem>1392</asp:ListItem>
                                          <asp:ListItem>1393</asp:ListItem>
                                          <asp:ListItem>1394</asp:ListItem>
                                          <asp:ListItem>1395</asp:ListItem>
                                          <asp:ListItem>1396</asp:ListItem>
                                          <asp:ListItem>1397</asp:ListItem>
                                          <asp:ListItem>1398</asp:ListItem>
                                          <asp:ListItem>1399</asp:ListItem>
                                          <asp:ListItem>1400</asp:ListItem>
                                          <asp:ListItem>1401</asp:ListItem>
                                          <asp:ListItem>1402</asp:ListItem>
                                          <asp:ListItem>1403</asp:ListItem>
                                          <asp:ListItem>1404</asp:ListItem>
                                      </asp:DropDownList>
                             </div>
                           </div>
                <br />
                </td>
            <td colspan="3" rowspan="2">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:Label ID="msg" runat="server" Visible="False" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Smaller"></asp:Label>
                    </ContentTemplate>

                </asp:UpdatePanel>
                
            </td>
        </tr>
        <tr>
            <td class="auto-style1" colspan="3">
                &nbsp;</td>
            <td class="auto-style61">
                <asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="True" Text="Released Setting" OnCheckedChanged="CheckBox1_CheckedChanged" />
            </td>
        </tr>
        <tr>
            <td class="auto-style71">
                Client Name<strong><span style="color:red;">*</span></strong></td>
            <td class="auto-style30">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtClient" ErrorMessage="x" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style74">
                 <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                     <ContentTemplate>
                         <asp:TextBox ID="txtClient" runat="server" AutoPostBack="false" CssClass="center" Font-Bold="True" Font-Size="Smaller" Height="40px" OnTextChanged="txtClient_TextChanged" TabIndex="1" Width="196px"></asp:TextBox>
                     </ContentTemplate>
                 </asp:UpdatePanel>
            </td>
            <td class="auto-style61">
                Hujat Khaat N<strong>o.#</strong></td>
            <td class="auto-style30">
                &nbsp;</td>
            <td class="auto-style86">
                &nbsp;</td>
            <td class="auto-style3">
                <asp:TextBox ID="txtHNo" CssClass="center" runat="server" Height="40px" Width="196px"     Font-Bold="True" Font-Size="Smaller" TabIndex="16" ></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style71">
                Type of Loan<strong><span style="color:red;">*</span></strong></td>
            <td class="auto-style30">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtClient" ErrorMessage="x" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style74">
                <asp:DropDownList ID="drop_loantype" runat="server"  CssClass="btn-info" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Small" Height="40px" Width="196px" TabIndex="1">
                                 <asp:ListItem Text="Loan Type" Value="LT" Selected="True"></asp:ListItem>
                 <asp:ListItem Text="LSME" Value="LSME"></asp:ListItem>
                 <asp:ListItem Text=" LFSC" Value=" LFSC"></asp:ListItem>
                 <asp:ListItem Text=" LPIF" Value=" LPIF"></asp:ListItem>
                 <asp:ListItem Text="SBML" Value="SBML"></asp:ListItem>
                 <asp:ListItem Text=" SBSL" Value=" SBSL"></asp:ListItem>
                 <asp:ListItem Text=" LIND" Value=" LIND"></asp:ListItem>
                 <asp:ListItem Text="MCFP" Value="MCFP"></asp:ListItem>
                 <asp:ListItem Text=" MRCF" Value=" MRCF"></asp:ListItem>
                 <asp:ListItem Text="HELO" Value="HELO"></asp:ListItem>
                 <asp:ListItem Text="AZDL" Value="AZDL"></asp:ListItem>
                 <asp:ListItem Text="PAYL" Value="PAYL"></asp:ListItem>
                 <asp:ListItem Text="TLCL" Value="TLCL"></asp:ListItem>
                 <asp:ListItem Text="GTEP" Value="GTEP"></asp:ListItem>
                 <asp:ListItem Text=" GTEA" Value=" GTEA"></asp:ListItem>
                 <asp:ListItem Text=" GTEB" Value=" GTEB"></asp:ListItem>
                 <asp:ListItem Text=" GTIR" Value=" GTIR"></asp:ListItem>
                 <asp:ListItem Text=" LCSB" Value=" LCSB"></asp:ListItem>
                 <asp:ListItem Text="EXLC" Value="EXLC"></asp:ListItem>
                 <asp:ListItem Text="ABIL" Value="ABIL"></asp:ListItem>
                 <asp:ListItem Text="OFDC" Value="OFDC"></asp:ListItem>
                 <asp:ListItem Text="UILC" Value="UILC"></asp:ListItem>
                 <asp:ListItem Text="CCARDS" Value="CCARDS"></asp:ListItem>

                                 <asp:ListItem>One Day</asp:ListItem>

                </asp:DropDownList>
            </td>
            <td class="auto-style61">
                &nbsp;Hujat Khat Date</td>
            <td class="auto-style30">
                <asp:CheckBox ID="Chk_HKD" runat="server" ForeColor="#009900" />
            </td>
            <td class="auto-style86">
                &nbsp;</td>
            <td class="auto-style3">
                <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                    <ContentTemplate>
                        <asp:TextBox ID="txtHdate" runat="server" autocomplete="off" class="date" Height="40px" MaxLength="10" placeholder="mm/dd/yyyy" Width="197px" TabIndex="17" CssClass="center" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td class="auto-style71">
                Type of Qabala<strong><span style="color:red;">*</span></strong></td>
            <td class="auto-style30">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtClient" ErrorMessage="x" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style74">
                <asp:DropDownList ID="drop_QabalaType" runat="server" CssClass="btn-info" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Small" Height="40px" Width="196px" TabIndex="3">
                                 <asp:ListItem Text="Qabala Type" Value="QT" Selected="True"></asp:ListItem>
                 <asp:ListItem Text="Urofi" Value="Urofi"></asp:ListItem>
                 <asp:ListItem Text="Sharayee" Value=" Sharayee"></asp:ListItem>

                </asp:DropDownList>
            </td>
            <td class="auto-style61">
                Hujat Khat Value</td>
            <td class="auto-style30">
                &nbsp;</td>
            <td class="auto-style86">
                &nbsp;</td>
            <td class="auto-style3">
                <asp:TextBox ID="txthValue" CssClass="center" runat="server" Height="40px" Width="196px"     Font-Bold="True" Font-Size="Smaller" TabIndex="18" ></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style71">
                Qabala Number<strong><span style="color:red;">*</span></strong></td>
            <td class="auto-style30">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtClient" ErrorMessage="x" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style74">
                <asp:TextBox ID="txtQabalaNo" CssClass="center" runat="server" Height="40px" Width="196px"     Font-Bold="True" Font-Size="Smaller" TabIndex="4"  ></asp:TextBox>
            </td>
            <td class="auto-style61">
                Equitable Mortg_ N<strong>o.</strong></td>
            <td class="auto-style30">
                &nbsp;</td>
            <td class="auto-style86">
                &nbsp;</td>
            <td class="auto-style3">
                <asp:TextBox ID="txtEMN" CssClass="center" runat="server" Height="40px" Width="196px"     Font-Bold="True" Font-Size="Smaller" TabIndex="19" ></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style72">
                Qabala Date<strong><span style="color:red;">*</span></strong></td>
            <td class="auto-style64">
                     <asp:CheckBox ID="Chk_qabalaDate" runat="server" ForeColor="#009900"  />
            </td>
            <td class="auto-style40">
                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                    <ContentTemplate>
                      <asp:TextBox ID="txtQabalaDate" runat="server" autocomplete="off" class="date" Height="40px" MaxLength="10" placeholder="mm/dd/yyyy" Width="196px" TabIndex="5" ReadOnly="True" CssClass="center"  />
                    
                    </ContentTemplate>

                </asp:UpdatePanel>
            </td>
            <td class="auto-style65">
                Equitable Mortg_ Date</td>
            <td class="auto-style30">
                &nbsp;</td>
            <td class="auto-style86">
                &nbsp;</td>
            <td class="auto-style67">
                <asp:TextBox ID="txtEMD" runat="server" autocomplete="off" class="date" Height="40px" MaxLength="10" placeholder="mm/dd/yyyy" Width="197px" TabIndex="20" />
            </td>
        </tr>
        <tr>
            <td class="auto-style71">
                Owner of Qabala<strong><span style="color:red;">*</span></strong></td>
            <td class="auto-style30">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtClient" ErrorMessage="x" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style74">
                <asp:TextBox ID="txtOwnerOfQabala" CssClass="center" runat="server" Height="40px" Width="196px"     Font-Bold="True" Font-Size="Smaller" TabIndex="6" Font-Names="Bahnschrift" ></asp:TextBox>
            </td>
            <td class="auto-style61">
                Based On<strong><span style="color:red;">*</span></strong></td>
            <td class="auto-style30">
                &nbsp;</td>
            <td class="auto-style86">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ControlToValidate="txtClient" ErrorMessage="x" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style3">
                <asp:TextBox ID="txtBase" CssClass="center" runat="server" Height="40px" Width="196px"     Font-Bold="True" Font-Size="Smaller" TabIndex="21" ></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style71">
                Type of Property<strong><span style="color:red;">*</span></strong></td>
            <td class="auto-style30">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtClient" ErrorMessage="x" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style74">
                <asp:DropDownList ID="drop_PropertyType" runat="server" CssClass="btn-info" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Small" Height="40px" Width="196px" TabIndex="7">
                                 <asp:ListItem Text="Property Type" Value="Property Type" Selected="True"></asp:ListItem>
                 <asp:ListItem>Commercial</asp:ListItem>
                 <asp:ListItem>Residential</asp:ListItem>

                                 <asp:ListItem>Open Land</asp:ListItem>
                                 <asp:ListItem>Agriculture</asp:ListItem>

                </asp:DropDownList>
            </td>
                  <td class="auto-style61">
                <strong>Pending Item(s)</strong></td>
            <td class="auto-style30">
                &nbsp;</td>
            <td class="auto-style86">
                &nbsp;</td>
            <td class="auto-style3">
                <asp:TextBox ID="txtPending" AutoPostBack="true" runat="server" Height="40px" Width="196px" OnTextChanged="txtPending_TextChanged" CssClass="center" TabIndex="22"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style71">
                Value of Property<strong><span style="color:red;">*</span></strong></td>
            <td class="auto-style30">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtClient" ErrorMessage="x" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style74">
               <%-- <asp:ScriptManager ID="ScriptManager2" runat="server"></asp:ScriptManager>--%>
                <asp:UpdatePanel ID="UpdatePanel7" runat="server">
                    <ContentTemplate>
                        <asp:TextBox ID="txtPropertyvalue" CssClass="center" runat="server" Height="40px" Width="196px"     Font-Bold="True" Font-Size="Smaller" TabIndex="8" OnTextChanged="txtPropertyvalue_TextChanged" ></asp:TextBox>
                    </ContentTemplate>
                </asp:UpdatePanel>
                
            </td>
            <td class="auto-style61">
                &nbsp;Due Date(Pending Docs)</td>
            <td class="auto-style30">
                &nbsp;</td>
            <td class="auto-style86">
                &nbsp;</td>
            <td class="auto-style3">
                <asp:TextBox ID="txtPIDD"  runat="server" Height="40px" Width="196px" Enabled="False" TabIndex="23"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style71">
                Currency Type<strong><span style="color:red;">*</span></strong></td>
            <td class="auto-style30">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtClient" ErrorMessage="x" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style74">
                <asp:DropDownList ID="drop_Currency" runat="server" CssClass="btn-info" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Small" Height="40px" Width="196px" TabIndex="9">
                                 <asp:ListItem>Currency</asp:ListItem>
                                 <asp:ListItem>AFN</asp:ListItem>
                                 <asp:ListItem>USD</asp:ListItem>

                </asp:DropDownList>
            </td>
            <td class="auto-style61">
                <strong>Received By<span style="color:red;">*</span>&nbsp;&nbsp; </strong></td>
            <td class="auto-style30">
                &nbsp;</td>
            <td class="auto-style86">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ControlToValidate="txtClient" ErrorMessage="x" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style3">
                <asp:TextBox ID="txtRB" CssClass="center" runat="server" Height="40px" Width="196px"     Font-Bold="True" Font-Size="Smaller" TabIndex="24" OnTextChanged="txtRB_TextChanged" ></asp:TextBox>
            </td>
        </tr>
        <tr>
           <td class="auto-style70">
                Property Evaloator<strong><span style="color:red;">*</span></strong></td>
            <td class="auto-style30">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtClient" ErrorMessage="x" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style75">
                <asp:TextBox ID="txtevaluator" CssClass="center" runat="server" Height="40px" Width="196px"     Font-Bold="True" TabIndex="10" OnTextChanged="txtevaluator_TextChanged"  ></asp:TextBox>
            </td>
            <td class="auto-style73">
                Status<strong><span style="color:red;">*</span></strong></td>
            <td class="auto-style30">
                &nbsp;</td>
            <td class="auto-style86">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" ControlToValidate="txtClient" ErrorMessage="x" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style38">
                <asp:DropDownList ID="Drop_status" runat="server" CssClass="btn-info" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Small" Height="40px" Width="196px" TabIndex="25">
                          <asp:ListItem>Status</asp:ListItem>
                 <asp:ListItem>Pleaced</asp:ListItem>
                 <asp:ListItem>Released</asp:ListItem>

                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style71">
                Address<strong><span style="color:red;">*</span></strong></td>
            <td class="auto-style30">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtClient" ErrorMessage="x" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style35">
                
              
                <asp:TextBox ID="txtAddress" CssClass="center" runat="server" Height="40px" Width="196px"     Font-Bold="True" Font-Size="Smaller" TabIndex="11" ></asp:TextBox>
                
              
            </td>
            <td class="auto-style61">
                Remark</td>
            <td class="auto-style30">
                &nbsp;</td>
            <td class="auto-style86">
                &nbsp;</td>
            <td class="auto-style38">
                <asp:TextBox ID="txtRemark" CssClass="center" runat="server" Height="40px" Width="196px"     Font-Bold="True" Font-Size="Smaller" TabIndex="26" ></asp:TextBox>
            </td>
        </tr>
        <tr>
            
            <td class="auto-style71">Last Evaluation Date<strong><span style="color:red;">*</span></strong></td>
            <td class="auto-style30">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtClient" ErrorMessage="x" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style76">
                <asp:TextBox ID="txtLastEvaluation" runat="server" autocomplete="off" class="date" Height="40px" MaxLength="10" placeholder="mm/dd/yyyy" Width="197px" TabIndex="12" CssClass="center" TextMode="Date" />
            </td>
            <td class="auto-style61">
                Add Loan Status</td>
            <td class="auto-style30">
                 <td class="auto-style86">
                     &nbsp;<td style="width: 209px">
                <asp:DropDownList ID="Drop_LoanStatus" runat="server" CssClass="btn-success" Font-Bold="True" Font-Names="Bahnschrift" Height="40px" Width="196px" TabIndex="27">
                    <asp:ListItem>Loan Status</asp:ListItem>
                    <asp:ListItem>Standard</asp:ListItem>
                    <asp:ListItem>Watch</asp:ListItem>
                    <asp:ListItem>Substandard</asp:ListItem>
                    <asp:ListItem>Doubtful</asp:ListItem>
                    <asp:ListItem>WriteOff</asp:ListItem>
                    <asp:ListItem>Settled</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style71">&nbsp;Reg. Mortgage N<strong>o.#</strong></td>
            <td class="auto-style30">
                &nbsp;</td>
            <td class="auto-style5">
                <asp:TextBox ID="txtRMN" CssClass="center" runat="server" Height="40px" Width="196px"     Font-Bold="True" Font-Size="Smaller" TabIndex="13" ></asp:TextBox>
            </td>
            <td class="auto-style61">
                Inserted Date<strong><span id="Star4" style="color:red;" runat="server">*<span id="Star6" style="color:red;" runat="server">(sys Date)</span></span></strong></td>
            <td class="auto-style30">
                &nbsp;</td>
            <td class="auto-style86">
                &nbsp;</td>
            <td class="auto-style8">
                <strong><span id="Star5" style="color:red;" runat="server">
                <asp:TextBox ID="txtInsertedDate" runat="server" CssClass="text-info"  Enabled="False" Height="40px" Width="196px" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Small" ToolTip="Based on System Date and Time" Wrap="False" TabIndex="28"></asp:TextBox>
                </span></strong>
            </td>
        </tr>
        <tr>
            <td class="auto-style71">&nbsp;Reg. Mortgage Date</td>
            <td class="auto-style30">
                <asp:CheckBox ID="Chk_MortgageDate" runat="server" ForeColor="#009933" AutoPostBack="true" />
            </td>
       
            <td class="auto-style23">
                <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                    <ContentTemplate>
                        <asp:TextBox ID="txtRMD"  runat="server" autocomplete="off" class="date" Height="40px" MaxLength="10" placeholder="mm/dd/yyyy" Width="197px"  TabIndex="14" CssClass="center" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
            <td class="auto-style61">
                
                <asp:Label ID="rtdLbl" runat="server" Text="Released Title Deeds"></asp:Label>
                <strong><span id="Star1" style="color:red;" runat="server">*</span></strong></td>
            <td class="auto-style30">
               
                &nbsp;</td>
            <td class="auto-style86">
               
                &nbsp;</td>
            <td class="auto-style26">
                <asp:TextBox ID="txtRTD" CssClass="center" runat="server" Height="40px" Width="196px"     Font-Bold="True" Font-Size="Smaller" TabIndex="29" Visible="False"  ></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style71">Mortgage Value</td>
            <td class="auto-style30">
                &nbsp;</td>
            <td class="auto-style76">
                <asp:TextBox ID="txtMValue" CssClass="center" runat="server" Height="40px" Width="196px"     Font-Bold="True" Font-Size="Medium" TabIndex="15" ></asp:TextBox>
            </td>
            <td class="auto-style61">
                
                <asp:Label ID="RelBy" runat="server" Text="Released By"></asp:Label>
                <strong><span id="Star2" style="color:red;" runat="server">*</span></strong></td>
            <td class="auto-style30">
                &nbsp;</td>
            <td class="auto-style86">
                &nbsp;</td>
            <td class="auto-style27">
                <asp:TextBox ID="txtRelBy" CssClass="center" runat="server" Height="40px" Width="196px"     Font-Bold="True" Font-Size="Smaller" TabIndex="30" Visible="False" ></asp:TextBox>
                
                  </td>
        </tr>
        <tr>
            <td class="auto-style1" colspan="2" rowspan="2">
            </td>
            <td class="auto-style79">
                </td>
            <td class="auto-style84">
                <asp:Label ID="RelDate" runat="server" Text="Release Date"></asp:Label>
                <strong><span id="Star3" style="color:red;" runat="server">*</span></strong></td>
            <td class="auto-style81">
                &nbsp;</td>
            <td class="auto-style87">
                &nbsp;</td>
            <td class="auto-style82">
                <asp:TextBox ID="txtRelDate" CssClass="center" runat="server" Height="40px" Width="196px"     Font-Bold="True" Font-Size="Smaller" TabIndex="31" Visible="False" TextMode="Date" ></asp:TextBox>
                  </td>
        </tr>
        <tr>
            <td class="auto-style85" colspan="5">
                    <asp:Button  ID="subBtn" runat="server" CssClass="btn-info" Height="37px" Text="ADD" Width="81px" Font-Bold="True"  Font-Size="Small" TabIndex="32" OnClick="subBtn_Click" Font-Names="Bahnschrift" BorderStyle="None"   />
            </td>
        </tr>
        </table>

         
      
</div>

</asp:Content>





