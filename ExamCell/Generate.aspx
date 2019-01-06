<%@ Page Title="Generate Sitting Plan" Language="C#" MasterPageFile="~/ExamCell/ExamCell.master" AutoEventWireup="true" CodeFile="Generate.aspx.cs" Inherits="ExamCell_Generate" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
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
    <div style="height: 100px"></div>
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
            <asp:Button ID="Generate" ClientIDMode="Static" CssClass="buttonview" runat="server" Text="Generate" OnClick="Generate_Click" />
        </div>
    </div>
        <br />


        <div>

            <script type="text/javascript">
                var prm = Sys.WebForms.PageRequestManager.getInstance();

                prm.add_initializeRequest(InitializeRequest);
                prm.add_endRequest(EndRequest);
                var postBackElement;
                function InitializeRequest(sender, args) {

                    if (prm.get_isInAsyncPostBack())
                        args.set_cancel(true);
                    postBackElement = args.get_postBackElement();
                    if (postBackElement.id == 'Generate')
                        $get('UpdateProgress1').style.display = 'block';
                }



                function EndRequest(sender, args) {
                    if (postBackElement.id == 'Generate')
                        $get('UpdateProgress1').style.display = 'none';
                }
            </script>
            <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                <ContentTemplate>
                    <div class="col-lg-4 col-md-4 col-sm-4 col-lg-offset-4 col-md-offset-4 col-sm-offset-4">
                    <asp:Label ID="Label1" runat="server" Width="100%" Font-Size="18px"></asp:Label>
                    </div>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="Generate" EventName="Click" />
                </Triggers>
            </asp:UpdatePanel>

            <asp:UpdateProgress ID="UpdateProgress1" ClientIDMode="Static" AssociatedUpdatePanelID="UpdatePanel3" runat="server">
                <ProgressTemplate>
                    <br />
                    Generating ...... <br />

                </ProgressTemplate>
            </asp:UpdateProgress>

            
        </div>

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
                   
                    <div class="col-lg-1 col-md-1 col-sm-1 col-lg-offset-11 col-md-offset-11 col-sm-offset-11">
                        <asp:Button ID="Save" runat="server" CssClass="buttonview" Visible="false" Text="Save" OnClick="Save_Click" />
                    </div>
                </ContentTemplate>

            </asp:UpdatePanel>
        </div>
    </div>






</asp:Content>

