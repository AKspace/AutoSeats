<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RommView.aspx.cs" Inherits="ExamCell_RommView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        #menu1 #view{
            background-color:#30A5FF !important;
            color:white;
        }

        .panelstyle1{
            width:100%;
            display:inline-block;

        }
        .imagestyle{
            float:left;
            vertical-align:central;
            margin-left:2px;
            margin-top:2px;
            border:1px solid green;
            width:70px;
            height:100px;

        }
        .panelstyle2{
            width:7%;
            margin-left:5px;
            display:inline-block;
            border:2px solid black;
            
        }

        .tabstyle
        {
            float:right;
            margin:2px;
            width:90%;
            border: 1px solid red;
        }

        .doorstyle{
            text-align:center;
            margin-left:5px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div style="height:50px"></div>
        <div class="container" style="margin-left:150px; margin-right:150px">

        <asp:Panel ID="Panel1" runat="server" BorderStyle="Solid" BorderWidth="2px">
            <asp:Table ID="Table2" runat="server" Width="100%">
                <asp:TableRow Height="25px">
                    <asp:TableCell Width="20%" ></asp:TableCell>
                    <asp:TableCell BackColor="SeaGreen" width="60%"></asp:TableCell>
                    <asp:TableCell Width="20%" ></asp:TableCell>

                </asp:TableRow>
            </asp:Table>
            <div style="height: 50px;"></div>
        </asp:Panel>
            <script type="text/javascript">
                var lbl = document.getElementById('door');
                lbl.innerHTML = "<br/><div class='doorstyle'><span >D<br/>O<br/>O<br/>R<br/></span></div>"
            </script>
    </div>
    </form>
</body>
</html>
