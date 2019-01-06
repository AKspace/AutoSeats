using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Provdiees Interaction for Default page of Exam cell
/// </summary>
public class DefaultController
{
    Query mQuery = new Query();
   public DataTable GetSittingStatus()
    {
        string query = $"select top 4 b.examdate, b.shift ,(case when b.status = 'true' then 'Generated' else 'Pending' end) as" +
            $" status from sittingplanstatus b  where examdate >= GETDATE() order by b.examdate ASC";
        return mQuery.Select(query);
    }

    public DataTable GetStudentPlan(string rollno)
    {
        string query = $"SELECT DISTINCT room_id, roll_number,((((select max(row_index) from [sitting plan]) + 1)*column_index) + row_index + 1)  " +
            $"as seat_no,column_index, row_index ,[date], [shift] FROM [sitting plan] WHERE roll_number = '{rollno}'";
        return mQuery.Select(query);
    }

    public bool Authenticate(string rollnumber, string password)
    {
        string query = $"SELECT COUNT(*) as result FROM students WHERE roll_number = '{rollnumber}' and other1='{password}';";
        DataTable dt = mQuery.Select(query);
        if(dt.Rows.Count > 0)
        {
            if (dt.Rows[0]["result"].ToString().Equals("1"))
                return true;
        }
        return false;
    }

    public bool AuthenticateExamCell(string rollnumber, string password)
    {
        string query = $"SELECT COUNT(*) as result FROM userdata WHERE userid = '{rollnumber}' and password='{password}';";
        DataTable dt = mQuery.Select(query);
        if (dt.Rows.Count > 0)
        {
            if (dt.Rows[0]["result"].ToString().Equals("1"))
                return true;
        }
        return false;
    }
}