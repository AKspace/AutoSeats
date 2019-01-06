<%@ Page Title="" Language="C#" MasterPageFile="~/ExamCell/ExamCell.master" AutoEventWireup="true" CodeFile="TimeTable.aspx.cs" Inherits="ExamCell_TimeTable" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        #menu1 #timetable{
            background-color:#30A5FF !important;
            color:white;
        }
        .boxview
        {
            width:70%;
            height:40px;
            border-radius:3px;
            padding-left:5px;
            border:1px solid #566573;
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
        .marg{
            margin-left:20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="height:100px"></div>

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
        <ContentTemplate>
            <div class="container">
                <div class="col-md-6 col-lg-6 col-sm-6 ">
                    <asp:Label ID="Label2" runat="server" CssClass="labelview" Text="Date"></asp:Label>
                    <asp:TextBox ID="txtExamDate" CssClass="boxview marg"  runat="server" placeholder="yyyy-MM-dd" BackColor="White">  </asp:TextBox>
                    <ajaxToolkit:CalendarExtender ID="CalendarExtender1" TargetControlID="txtExamDate" runat="server" Format="yyyy-MM-dd" PopupPosition="BottomLeft" TodaysDateFormat="MMMM d,yyyy" />
                </div>

                <div class="col-md-6 col-lg-6 col-sm-6 ">
                    <asp:Label ID="Label1" runat="server" CssClass="labelview" Text="Shift"></asp:Label>
                    <input id="txtShift" class="boxview marg" type="number" max="6" min="1" placeholder="1" runat="server" aria-disabled="False" />
                </div>


            </div>
    <div style="height: 30px"></div>


            <div class="container">
              <div class="col-lg-6 col-md-6 col-sm-6">
                    <asp:Label ID="Label3" runat="server" CssClass="labelview" Text="Branch"></asp:Label>
                    <asp:DropDownList ID="DropDownListBranch" CssClass="boxview" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownListBranch_SelectedIndexChanged"></asp:DropDownList>
                </div>

                <div class="col-lg-6 col-md-6 col-sm-6">

                    <asp:Label ID="Label4" runat="server" CssClass="labelview" Text="Subject"></asp:Label>
                    <asp:DropDownList ID="DropDownListSubject" CssClass="boxview" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownListSubject_SelectedIndexChanged">
                        <asp:ListItem>Select</asp:ListItem>
                    </asp:DropDownList>

                </div>
            </div>
            <div style="height: 15px"></div>
            <div class="container">
                <div class="col-lg-1 col-md-1 col-sm-1 col-lg-offset-9 col-md-offset-9 col-sm-offset-9" style="float: right; margin-right: 10%">
                    <asp:Button ID="ButtonAdd" runat="server" CssClass="buttonview" Text="Add" OnClick="ButtonAdd_Click" />
                </div>

            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
                    <div style="height:30px"></div>
                    <div class="container">
                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                        <div class="col-lg-11 col-md-11 col-sm-11 col-lg-offset-0 col-md-offset-0 col-sm-offset-0">


                            <asp:GridView ID="GridViewTimeTable" GridLines="None" runat="server" AutoGenerateColumns="false" CssClass="viewgrid" AlternatingRowStyle-BackColor="#F4F4F4" HeaderStyle-Height="40px" HeaderStyle-BackColor="#0099FF" HeaderStyle-ForeColor="Black" HeaderStyle-HorizontalAlign="Center" HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" RowStyle-VerticalAlign="Middle" RowHeaderColumn="middle" HeaderStyle-BorderWidth="0px" RowStyle-Height="50px">
                                <Columns>
                                    <asp:BoundField DataField="date" ItemStyle-CssClass="columnview" HeaderStyle-CssClass="headerview" HeaderText="Date" ItemStyle-Width="400px" />
                                    <asp:BoundField DataField="shift" HeaderStyle-CssClass="headerview" ItemStyle-CssClass="columnview" HeaderText="Shift" />
                                    <asp:BoundField DataField="subject_id" HeaderStyle-CssClass="headerview" ItemStyle-CssClass="columnview" HeaderText="Subject Code" />
                                    <asp:BoundField DataField="subject_name" HeaderStyle-CssClass="headerview" ItemStyle-CssClass="columnview" HeaderText="Subject Name " />
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                    <div style="height: 15px"></div>
                    
                </ContentTemplate>
            </asp:UpdatePanel>
                        <div class="container">
                        <div class="col-lg-1 col-md-1 col-sm-1 col-lg-offset-9 col-md-offset-9 col-sm-offset-9" style="float: right; margin-right: 10%">
                            <asp:Button ID="Save" Visible="false" CssClass="buttonview" runat="server" Text="Save" OnClick="Save_Click" />
                        </div>
                    </div>
        </div>
        
    
</asp:Content>

