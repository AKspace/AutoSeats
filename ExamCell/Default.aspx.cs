using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class ExamCell_Default : System.Web.UI.Page
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
        DataTable dt = controller.GetSittingStatus();
        TableHeaderRow tableHeader = new TableHeaderRow();
        tableHeader.CssClass = "th";
        TableHeaderCell cell1 = new TableHeaderCell();
        cell1.Text = "Date";
        cell1.CssClass = "cen";
        TableHeaderCell cell2 = new TableHeaderCell();
        cell2.Text = "Shift";
        cell2.CssClass = "cen";
        TableHeaderCell cell3 = new TableHeaderCell();
        cell3.Text = "Status";
        cell3.CssClass = "cen";
        TableHeaderCell cell4 = new TableHeaderCell();
        cell4.Text = "Option";

        cell4.CssClass = "cen";
        tableHeader.Controls.Add(cell1);
        tableHeader.Controls.Add(cell2);
        tableHeader.Controls.Add(cell3);
        tableHeader.Controls.Add(cell4);
        tblPlanStatus.Controls.Add(tableHeader);
        foreach (DataRow dr in dt.Rows)
        {
            if(flag)
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
            labeldate.Text = dr["examdate"].ToString();
            Label labelshift = new Label();
            labelshift.Text = dr["shift"].ToString();
            Label labelstatus = new Label();
            var status = dr["status"].ToString();
            labelstatus.Text = status;
            if (status.Equals("Generated"))
            {
                link.Text = "View";
                link.NavigateUrl = $"View.aspx?date={labeldate.Text}";
                tableRow.Cells[3].Controls.Add(link);
            }
            else
            {
                link.Text = "Generate";
                link.NavigateUrl = $"Generate.aspx?date={labeldate.Text}";
                tableRow.Cells[3].Controls.Add(link);
            }
            tableRow.Cells[0].Controls.Add(labeldate);
            tableRow.Cells[1].Controls.Add(labelshift);
            tableRow.Cells[2].Controls.Add(labelstatus);

            tblPlanStatus.Rows.Add(tableRow);
            flag  = !flag;
        }
    }
}