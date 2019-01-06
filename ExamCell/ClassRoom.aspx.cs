using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class ExamCell_ClassRoom : System.Web.UI.Page
{
    private static System.Data.DataTable dataTable;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            DrawClass();

    }
    public void DrawClass()
    {
        DataTable data = (DataTable)Session["dt"];
        RoomView roomView = new RoomView(data);
        Panel1.Controls.Add(roomView.DrawTable());
    }
}