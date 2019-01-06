using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ExamCell_Generate : System.Web.UI.Page
{
    ExamCellController controller = new ExamCellController();
    static SittingPlan sittingPlan;
    static System.Data.DataSet dataSet;
    System.Data.DataTable  Summary = new System.Data.DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if(Request.QueryString["date"] != null)
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



    protected void DropDownListDate_SelectedIndexChanged(object sender, EventArgs e)
    {
        controller.BindShift(ref DropDownListShift, DropDownListDate.SelectedValue);
    }

    protected void Generate_Click(object sender, EventArgs e)
    {
        try
        {
            sittingPlan = new SittingPlan(DropDownListDate.SelectedValue, DropDownListShift.SelectedValue);
            Generate.Enabled = false;
            System.Threading.Thread.Sleep(1000);
            Summary = sittingPlan.GenerateSittingPlan(out dataSet);
            Label1.Text = "Sitting Plan Generated Successfully !!!";
            Generate.Enabled = true;
            Fill();
            Save.Visible = true;
        }
        catch(Exception ex)
        {
            Label1.Text = "Parameters of algorithm not appropriate for allocation!!";
        }
    }

    public void Fill()
    {
            GridViewSummary.DataSource = Summary;
            GridViewSummary.DataBind();
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

    protected void Save_Click(object sender, EventArgs e)
    {
        Query query = new Query();
        try
        {
            if (dataSet != null)
            {
                bool Res = true;
                foreach(System.Data.DataTable dt in dataSet.Tables)
                {
                    Res = Res & controller.SaveSittingPlan(dt);
                    ResponseMessage.Sucess("Roll No Updated Successfully!!!", this);
                    Response.Redirect("Default.aspx");
                }
               if(Res)
                {
                    ResponseMessage.Sucess("Roll No Updated Successfully!!!", this);
                    Response.Redirect("Default.aspx");
                }
               else
                {
                    ResponseMessage.Warning("Something Went Wrong", this);
                }
            }
        }
        catch (Exception ex)
        {
           
        }
    }

    protected void GridViewSummary_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("Redirect"))
        {
            if (int.TryParse(e.CommandArgument.ToString(), out int index))
            {
                Session["dt"] = dataSet.Tables[index/4];
                ScriptManager.RegisterStartupScript(Page, GetType(), "text", $"var pop = window.open('ClassRoom.aspx?room={GridViewSummary.DataKeys[index].Value.ToString()}');", true);
            }
            else
            {
                ResponseMessage.Warning(e.CommandArgument.ToString(), this);

            }
        }
    }
} 