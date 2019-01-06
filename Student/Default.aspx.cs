using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Student_Default : System.Web.UI.Page
{
    DefaultController controller = new DefaultController();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            BindData();
    }
    private void BindData()
    {
        bool flag = true;
        var cssclass = "";
        DataTable dt = controller.GetStudentPlan(Session["rollno"]?.ToString());
        TableHeaderRow tableHeader = new TableHeaderRow();
        tableHeader.CssClass = "th";
        TableHeaderCell cell1 = new TableHeaderCell();
        cell1.Text = "Date";
        cell1.CssClass = "cen";
        TableHeaderCell cell2 = new TableHeaderCell();
        cell2.Text = "Shift";
        cell2.CssClass = "cen";
        TableHeaderCell cell3 = new TableHeaderCell();
        cell3.Text = "Room";
        cell3.CssClass = "cen";
        TableHeaderCell cell4 = new TableHeaderCell();
        cell4.Text = "Seat";

        cell4.CssClass = "cen";
        tableHeader.Controls.Add(cell1);
        tableHeader.Controls.Add(cell2);
        tableHeader.Controls.Add(cell3);
        tableHeader.Controls.Add(cell4);
        tblPlanStatus.Controls.Add(tableHeader);
        foreach (DataRow dr in dt.Rows)
        {
            if (flag)
            {
                cssclass = "hei";
            }
            else
            {
                cssclass = "hei even";
            }
            HyperLink link = new HyperLink();
            TableRow tableRow = new TableRow();
            tableRow.CssClass = cssclass;
            for (int k = 0; k < 4; k++)
            {
                TableCell tc1 = new TableCell();
                tableRow.Cells.Add(tc1);
            }

            Label labeldate = new Label();
            labeldate.Text = dr["date"].ToString();
            Label labelshift = new Label();
            labelshift.Text = dr["shift"].ToString();
            Label labelseat = new Label();
            var status = dr["seat_no"].ToString();
            labelseat.Text = status;
            link.Text = dr["room_id"].ToString();
            link.NavigateUrl = $"ClassRoom.aspx?room={link.Text}&col={dr["column_index"].ToString()}&row={dr["row_index"].ToString()}";
            tableRow.Cells[0].Controls.Add(labeldate);
            tableRow.Cells[1].Controls.Add(labelshift);
            tableRow.Cells[2].Controls.Add(link);
            tableRow.Cells[3].Controls.Add(labelseat);

            tblPlanStatus.Rows.Add(tableRow);
            flag = !flag;
        }
    }
}