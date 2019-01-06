<%@ Page Title="View Sitting Plan" Language="C#" MasterPageFile="~/ExamCell/ExamCell.master" AutoEventWireup="true" CodeFile="View.aspx.cs" Inherits="ExamCell_View" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <    <style>
        #menu1 #generate{
            background-color:#30A5FF !important;
            color:white;
        }
        .boxview
        {
            width:70%;
            height:40px;
            border-radius:3px;
        }
        .buttonview
        {
            background-color:#3498DB  ; /* Green */
            border: none;
            color: white;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
            padding: 5px 20px;
            border-radius:2px;
        }
        .labelview
        {
            font-size:15px;
            font-family:'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
            font-weight:bolder;
        }
        .viewgrid
        {
            border:2px solid black;
            width:100%;
        }
        .columnview
        {
            text-align:center;

        }
        .headerview
        {
            background-color:black!important ;
            height:40px;
            text-align:center;
            font-family:'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
            font-weight:bold;
            font-size:16px;
            color:white;
        }
        .evenp
        {
            background-color:white;
            color:black;
            border-top:2px solid black !important ;
            text-align:center;
        }
        .oddp
        {
            background-color:red;
            color:white;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div style="height:100px"></div>
    <div class="container">
        <div class="col-lg-4 col-md-4 col-sm-4">
            <div class="form-group">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:Label ID="Label2" runat="server" CssClass="labelview" Text="Exam Date"></asp:Label>
                        <asp:DropDownList ID="DropDownListDate" runat="server" AutoPostBack="true" CssClass="boxview" OnSelectedIndexChanged="DropDownListDate_SelectedIndexChanged"></asp:DropDownList>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>

        <div class="col-lg-4 col-md-4 col-sm-4">
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <asp:Label ID="Label3" runat="server" CssClass="labelview" Text="Shift"></asp:Label>
                    <asp:DropDownList ID="DropDownListShift" CssClass="boxview" runat="server">
                        <asp:ListItem>Select</asp:ListItem>
                    </asp:DropDownList>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div class="col-lg-4 col-md-4 col-sm-4">
            <asp:Button ID="View" ClientIDMode="Static" CssClass="buttonview" runat="server" Text="View" OnClick="View_Click" />
        </div>
    </div>
    <br />
    <div class="container">
        <div class="col-lg-12 col-md-12 col-sm-12 ">
            <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                <ContentTemplate>
                    <asp:GridView ID="GridViewSummary" OnRowCommand="GridViewSummary_RowCommand" EmptyDataText="NO RECORDS!" DataKeyNames="room_id" GridLines="None" runat="server" AutoGenerateColumns="false" OnRowDataBound="GridViewSummary_RowDataBound" CssClass="viewgrid" AlternatingRowStyle-BackColor="#F4F4F4" HeaderStyle-CssClass="headerview"   HeaderStyle-BorderWidth="1px" RowStyle-Height="50px">
                        <Columns>
                            <asp:ButtonField ButtonType="Link" DataTextField="room_id" CommandName="Redirect" />
                            <asp:BoundField DataField="rollnumber" ItemStyle-CssClass="columnview" HeaderStyle-CssClass="headerview" HeaderText="Roll Number" />

                        </Columns>
                    </asp:GridView>
                    <br />
                </ContentTemplate>

            </asp:UpdatePanel>
        </div>
    </div>

</asp:Content>

