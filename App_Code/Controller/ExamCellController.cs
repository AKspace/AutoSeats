using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;
using System.Data;

/// <summary>
/// Provides function for exxam cell operations
/// </summary>
public class ExamCellController : Data
{
    Query mQuery = new Query();
    /// <summary>
    /// Bind Exam Dates
    /// </summary>
    /// <param name="dropDownList">Dropdown list to bind</param>
    public void BindExamDates(ref DropDownList dropDownList)
    {
        Utility.FillDropDownList(GetExamDates(), "date", "date", ref dropDownList);
    }

    /// <summary>
    /// Bind Shift at specific exam date
    /// </summary>
    /// <param name="dropDownList">Dropdownlist to bind</param>
    /// <param name="date">date to get shift</param>
    public void BindShift(ref DropDownList dropDownList, string date)
    {
        Utility.FillDropDownList(GetShift(date), "shift", "shift", ref dropDownList);
    }

    /// <summary>
    /// Bind Branches
    /// </summary>
    /// <param name="dropDownList">Dropdown list to bind</param>
    public void BindBranch(ref DropDownList dropDownList)
    {
        Utility.FillDropDownList(GetBranches(), "branch_Code", "branch_name", ref dropDownList);
    }

    /// <summary>
    /// Bind Shift at specific exam date
    /// </summary>
    /// <param name="dropDownList">Dropdownlist to bind</param>
    /// <param name="branch">branch to get shift</param>
    public void BindSubjects(ref DropDownList dropDownList, string branch)
    {
        Utility.FillDropDownList(GetSubjects(branch), "subject_id", "subject_name", ref dropDownList);
    }

    public bool SaveTimeTable(DataTable dataTable)
    {
        return InsertTimeTable(dataTable);
    }

    public bool SaveSittingPlan(DataTable dataTable)
    {
        return InsertSittingPlan(dataTable);
    }

    public DataTable SittingPlan(string date, string shift)
    {
        return GetSittingPlan(date, shift);
    }

    public DataTable OneRoomPlan(string room_id)
    {
        return GetOneRoomPlan(room_id);
    }
}