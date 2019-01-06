<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default"  %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <!-- CSS -->
    <link href="Shared/css/bootstrap.min.css" rel="stylesheet" />
    <link href="Shared/css/datepicker3.css" rel="stylesheet" />
    <link href="Shared/css/font-awesome.min.css" rel="stylesheet" />
    <link href="Shared/css/styles.css" rel="stylesheet" />
    <link href="Shared/css/style.css" rel="stylesheet" />

    <!-- JavaScript -->
    <script src="/Shared/js/jquery-3.3.1.min.js"></script>
    <script src="/Shared/js/bootstrap.min.js"></script>

    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

    <style>
        .jumb
        {
            font-size:50px !important;
            text-align:center;
        }
        .jumb1
        {
            font-size:25px !important;
            text-align:center;
        }
    </style>
    <script type="text/javascript">
        function resetField() {
            document.getElementById("txtEmail").value = "";
            document.getElementById("txtPassword").value = "";
        }
    </script>

</head>
<body>
    <!-- Navigation Bar-->
    <nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#sidebar-collapse"><span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span></button>
				<a class="navbar-brand" href="#"><span>Auto-Seat</span>&nbsp Arrangement System</a>
			</div>
		</div>
	</nav>


    
        <div style="height:100px">
        </div>
    <div class="container">
        <div class="row jumbotron" style="background-color:#F2F3F4  ">
            
            <p class="jumb">Welcome !</p>
            <p class="jumb1"> Auto Sitting Arrangement Portal</p>
        </div>
    </div>
      

    <form id="form1" runat="server">
        <div class="row">
            <div class="col-lg-4 col-md-4 col-sm-4 col-lg-offset-4 col-md-offset-4 col-sm-offset-4 ">

                <div class=" panel " style="border: 1px solid #5499C7">
                    <div class="panel-heading" style="margin-right: 1px; background-color: #3498DB"><b style="font-size: 22px; color: azure; font-family: 'Comic Sans MS'">Login</b></div>
                    <div class="panel-body">
                        <fieldset>
                            <div class="form-group">
                                <asp:Label runat="server" ID="lblMessage" Visible="false"></asp:Label>
                            </div>
                            <div class="form-group">
                                <asp:TextBox CssClass="form-control " ID="txtEmail" placeholder="RollNumber/UserID" runat="server" ClientIDMode="Static"  onblur="requiredField('txtEmail')"></asp:TextBox>
                                <!-- onblur="requiredField('txtEmail')"    ---->
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required" ControlToValidate="txtEmail" SetFocusOnError="true" ValidationGroup="btnLogin" CssClass="label label-danger" Font-Size="8pt" Font-Strikeout="False" ToolTip="This field is required"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="txtPassword" placeholder="Password" runat="server" TextMode="Password" ClientIDMode="Static" onblur="requiredField('txtPassword')"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required" ControlToValidate="txtPassword" SetFocusOnError="true" ValidationGroup="btnLogin" CssClass="label label-danger" Font-Size="8pt" Font-Strikeout="False" ToolTip="This field is required"></asp:RequiredFieldValidator>

                            </div>

                            <div class="col-lg-7 col-md-7 col-sm-7">

                                <asp:Button CssClass="btn btn-primary loginBtn  buttonStyle" runat="server" ID="btnLogin" Text="Login" ValidationGroup="btnLogin" OnClick="btnLogin_Click" CausesValidation="false" />



                                <a href="javascript:void(0)" class="btn btn-primary resetBtn  buttonStyle col-lg-offset-1" id="txtbtn"  onclick="resetField()">Reset</a>

                            </div>

                            <div class="form-group col-lg-5  col-md-5 ">
                                <a href="/ForgetPassword.aspx" class="forgotLink" style="text-align: right">Forget Password?</a>
                            </div>
                            <div class="col-lg-12 col-md-12 col-sm-12">
                                <p style="text-align: center; margin-top: 10px">Need an account ?&nbsp; <a href="/SignUp.aspx">Register</a></p>
                            </div>

                        </fieldset>
                    </div>
                </div>


            </div>
        </div>

       
        
    </form>
</body>
</html>
