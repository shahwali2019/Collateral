<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="loading.aspx.cs" Inherits="Collateral_int.loading" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <script src="https://code.jquery.com/jquery-3.4.0.min.js"></script>
    <title>Loading ...</title>
    <style>
        .overlayClass{
       
         
         margin:0 auto;
         text-align:center;
         vertical-align:middle;
         margin-top:250px;
     

        }

        .auto-style1 {
            width: 6%;
            height: 69px;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="overlayID" class="overlayClass" style="pointer-events:none;">
            <img src="image/loading.gif" class="auto-style1" />
        </div>
    </form>
</body>
</html>
