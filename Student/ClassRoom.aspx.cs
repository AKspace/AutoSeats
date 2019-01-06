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
    ExamCellController controller = new ExamCellController();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            DrawClass();

    }
    public void DrawClass()
    {
        if (Request.QueryString["room"] != null)
        {
            
            DataTable data = controller.OneRoomPlan(Request.QueryString["room"]?.ToString());
            RoomView roomView = new RoomView(data);
            Panel1.Controls.Add(roomView.DrawTable(Convert.ToInt32(Request.QueryString["row"]?.ToString()), Convert.ToInt32(Request.QueryString["col"]?.ToString())));
        }
        else
        {
            ResponseMessage.Warning("Something Went wrong",this);
        }
    }
}