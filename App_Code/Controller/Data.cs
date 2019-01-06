using System.Data;

/// <summary>
/// Provides query function for [time_table] db table
/// </summary>
public abstract class  Data
{
    Query mQuery = new Query();

    #region  Table TimeTable
    #region Select
    /// <summary>
    /// Get Exam Dates
    /// </summary>
    /// <returns><see cref="DataTable"/></returns>
    protected DataTable GetExamDates()
    {
        string query = $"SELECT DISTINCT CONVERT(varchar, date, 23) as date from time_table";
        return mQuery.Select(query);
    }

    /// <summary>
    /// Get shift details in specific exam dae
    /// </summary>
    /// <param name="date">date of exam</param>
    /// <returns><see cref="DataTable"/></returns>
    protected DataTable GetShift(string date)
    {
        string query = $"SELECT DISTINCT shift from time_table WHERE date ='{date}'";
        return mQuery.Select(query);
    }

    #endregion

    #region Insert

    /// <summary>
    /// Insert Time table
    /// </summary>
    /// <param name="table">Datable containing timetable</param>
    /// <returns></returns>
    protected bool InsertTimeTable(DataTable table)
    {
        return mQuery.ExecuteStoredProcedure(table, "InsertTimeTable", "@TimeTabType");
    }
    #endregion
    #endregion


    #region Table Branch
    #region Select
    /// <summary>
    /// Gets branch details
    /// </summary>
    /// <returns> <see cref="DataTable"/></returns>
    protected DataTable GetBranches()
        {
            string query = $"SELECT branch_code, LTrim(branch_name) as branch_name from branch";
            return mQuery.Select(query);
        }
    #endregion

    #endregion


    #region Table Subject
        #region Select
        /// <summary>
        /// GEts subjects for specific branch
        /// </summary>
        /// <param name="branch_code"></param>
        /// <returns></returns>
        protected DataTable GetSubjects(string branch_code)
        {
            string query = $"Select subject_id, LTRIM(subject_name) as subject_name from subject where branch_code='{branch_code}'";
            return mQuery.Select(query);
        }
    #endregion
    #endregion

    #region Table SittingPlan
        #region Insert
        /// <summary>
        /// Insert the sitting plan in database
        /// </summary>
        /// <param name="table"></param>
        /// <returns></returns>
        protected bool InsertSittingPlan(DataTable table)
        {
            return mQuery.ExecuteStoredProcedure(table, "InsertSittingPlan", "@SitPlanType");
        }
    #endregion

    #region Select
    protected DataTable GetSittingPlan(string date, string shift)
    {
        string query = $"select room_id, (MIN(roll_number)+ ' TO '+ MAX(roll_number))as rollnumber " +
            $"from [sitting plan] where [date]='{date}' and [shift]={shift}  group by branch_id , room_id ";
        return mQuery.Select(query);
    }

    protected DataTable GetOneRoomPlan(string room_id)
    {
        string query = $"select * from [sitting plan] where room_id='{room_id}'";
        return mQuery.Select(query);
    }

    #endregion
    #endregion


}