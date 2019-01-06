using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class _Default : System.Web.UI.Page
{
    DefaultController controller = new DefaultController();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        if (controller.Authenticate(txtEmail.Text, txtPassword.Text))
        {
            Session["rollno"] = txtEmail.Text;
            Response.Redirect("/Student/Default.aspx");
        }
        else if(controller.AuthenticateExamCell(txtEmail.Text,txtPassword.Text))
        {
            Session["rollno"] = txtEmail.Text;
            Response.Redirect("/ExamCell/Default.aspx");

        }
        else
            lblMessage.Text = "Incorrect Roll number And Password";
    }


}