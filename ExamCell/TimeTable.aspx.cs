using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ExamCell_TimeTable : System.Web.UI.Page
{
    ExamCellController controller = new ExamCellController();
    static string date = "";
    private static System.Data.DataTable timetable = new System.Data.DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            InitCalender();
            controller.BindBranch(ref DropDownListBranch);
            InitTable();
        }
        txtExamDate.Text = date;
    }


    private void InitCalender()
    {
        CalendarExtender1.StartDate = System.DateTime.Today;
        CalendarExtender1.SelectedDate = System.DateTime.Today;
    }

    protected void DropDownListSubject_SelectedIndexChanged(object sender, EventArgs e)
    {
    }

    protected void DropDownListBranch_SelectedIndexChanged(object sender, EventArgs e)
    {
        date = txtExamDate.Text;
        controller.BindSubjects(ref DropDownListSubject, DropDownListBranch.SelectedValue);


    }
    
    private void InitTable()
    {
        timetable = new System.Data.DataTable();
        timetable.Columns.Add("Date");
        timetable.Columns.Add("Shift");
        timetable.Columns.Add("Subject_id");
        timetable.Columns.Add("subject_name");
    }

    protected void ButtonAdd_Click(object sender, EventArgs e)
    {
        if (timetable.Columns.Count > 0)
        {
            System.Data.DataRow dr = timetable.NewRow();
            dr[0] = txtExamDate.Text;
            dr[1] = txtShift.Value;
            dr[2] = DropDownListSubject.SelectedItem.Text;
            dr[3] = DropDownListSubject.SelectedValue;
            timetable.Rows.Add(dr);
            FillGridView();
            Save.Visible = true;
        }
    }

    private void FillGridView()
    {
        GridViewTimeTable.DataSource = timetable;
        GridViewTimeTable.DataBind();
    }

    protected void Save_Click(object sender, EventArgs e)
    {
        if (controller.SaveTimeTable(timetable))
            ResponseMessage.Warning("Updated Successfully", this);
    }
}