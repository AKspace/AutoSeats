<%@ Page Title="" Language="C#" MasterPageFile="~/ExamCell/ExamCell.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="ExamCell_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        #menu1 #default{
            background-color:#30A5FF !important;
            color:white;
        }
    .even{
        background-color:#f2f2f2;
    }
    .hei{
        height:30px;
    }
    .th{
        width:40px;
        text-align:center !important;
        font-size:20px;
    }
    .cen{
        text-align:center;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="height:100px"></div>

    <div class="container">
        
            <asp:Panel ID="PanelStatusTable" runat="server" Visible="true">
                <div class="col-md-6 col-lg-6 col-sm-6">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="form" style="">
                                <asp:Table ID="tblPlanStatus" runat="server" Style="width: 100%; text-align: center;">
                                </asp:Table>
                            </div>
                        </div>
                    </div>
                </div>
            </asp:Panel>
        
    </div>
      
</asp:Content>
