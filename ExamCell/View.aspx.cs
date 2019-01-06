using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ExamCell_View : System.Web.UI.Page
{
    System.Data.DataTable  Summary = new System.Data.DataTable();
    ExamCellController controller = new ExamCellController();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["date"] != null)
            {
                string da = Request.QueryString["date"]?.ToString();
                ListItem item = new ListItem(da, da);
                item.Selected = true;
                DropDownListDate.Items.Add(item);
                DropDownListDate.Enabled = false;
                controller.BindShift(ref DropDownListShift, DropDownListDate.SelectedValue);
            }
            else
                controller.BindExamDates(ref DropDownListDate);
        }
    }

    public void Fill()
    {

    }
    protected void GridViewSummary_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            if (e.Row.RowIndex % 4 == 0)
            {
                e.Row.Cells[0].Attributes.Add("rowspan", "4");
                e.Row.Cells[1].CssClass = "evenp";
                e.Row.Cells[0].CssClass += "evenp";
            }
            else
            {
                e.Row.Cells[0].Visible = false;
            }

        }

    }
    



    protected void View_Click(object sender, EventArgs e)
    {
        Summary = controller.SittingPlan(DropDownListDate.SelectedValue, DropDownListShift.SelectedValue);
        GridViewSummary.DataSource = Summary;
        GridViewSummary.DataBind();
    }

    protected void GridViewSummary_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("Redirect"))
        {
            if (int.TryParse(e.CommandArgument.ToString(), out int index))
            {
                var room_id = GridViewSummary.DataKeys[index].Value.ToString();
                Session["dt"] = controller.OneRoomPlan(room_id);
                ScriptManager.RegisterStartupScript(Page, GetType(), "text", $"var pop = window.open('ClassRoom.aspx?room={room_id}');", true);
            }
            else
            {
                ResponseMessage.Warning(e.CommandArgument.ToString(), this);

            }
        }
    }

    protected void DropDownListDate_SelectedIndexChanged(object sender, EventArgs e)
    {
        controller.BindShift(ref DropDownListShift, DropDownListDate.SelectedValue);
    }
}