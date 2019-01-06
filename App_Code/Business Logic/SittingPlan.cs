using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Provides functionalloty generate Sitting Plan 
/// </summary>
public class SittingPlan
{
    #region Private Members
    private List<Room> mRoom;
    private List<Branch> mBranch;
    private List<Subject> mSubject;
    DataTable Summary;
    private Query mQuery;
    private string mExamDate;
    private string mShift;
    private string[] rolls;
    #endregion

    #region Public Properties
    /// <summary>
    /// No of total students
    /// </summary>
    public int TotalStudents { get; set; }

    public Room GetOneRoom(int index)
    {
        return mRoom[index];
    }

    public int RoomCount { get { return mRoom.Count; } }
    #endregion

    #region Constructor
    public SittingPlan(string date, string shift)
    {
        mExamDate = date;
        mShift = shift;
        mQuery = new Query();
    }
    #endregion

    #region Studnts Fetching
    /// <summary>
    /// Gets the time table on given Date
    /// </summary>
    private void FetchTimeTable()
    {
        string query = $"Select * from time_table where date = '{mExamDate}' and shift= {mShift}";
        mQuery.Select(query, out SqlDataReader sdtr);
        mSubject = new List<Subject>();
        while (sdtr.Read())
        {
            mSubject.Add(new Subject { SubjectID = sdtr["subject_id"].ToString() });
        }
        sdtr.Close();
        mQuery.CloseConnection();
    }

    /// <summary>
    /// Load all students appearing in Exam 
    /// </summary>
    private void LoadStudents()
    {
        mBranch = new List<Branch>();
        foreach (var sb in mSubject)
        {
            string query = $"select branch_code from subject where subject_id ='{sb.SubjectID}'";
            mQuery.Select(query, out SqlDataReader sdtr);
            sdtr.Read();
            sb.BranchCode = sdtr["branch_code"].ToString();
            mBranch.Add(new Branch(sb.BranchCode));
            sdtr.Close();
        }
        mQuery.CloseConnection();
        foreach (var br in mBranch)
        {
            br.GetStudents();
            TotalStudents += br.Count;
        }
    }

    #endregion

    #region Rooms Fetching
    /// <summary>
    /// Fetch the rooms to allocaes seats for student
    /// </summary>
    private void FetchRoom()
    {
        int totalseats = TotalStudents;
        string query = "Select * from room order by total_seats DESC";
        mQuery.Select(query, out SqlDataReader sdtr);
        mRoom = new List<Room>();

        while (totalseats > 0)
        {
            sdtr.Read();
            Room rm = new Room
            {
                AvailableSeats = (int)(sdtr["available_seats"]),
                Column = (int)sdtr["no_of_column"],
                Row = (int)sdtr["no_of_row"],
                RoomID = sdtr["room_id"].ToString()
            };
            mRoom.Add(rm);
            totalseats -= rm.AvailableSeats;
        }
    }

    #endregion

    #region Core Algorithm

    private void AllocateStudents(List<Room> rooms, List<Branch> branch, int size = 2)
    {
        int i, j;
        int newsize = branch.Count - size;
        var flag = true;
        TotalStudents = 200 - 16;
        foreach (var room in rooms)
        {
            j = 0;
            SaveStartRollNumber(branch);
            while (j < room.Column)
            {
                i = 0;
                while (i < room.Row)
                {
                    if (TotalStudents <= 0)
                        break;
                    if (flag)
                    {
                        int m = i % size;
                        room.AllocateSeat(new Seat { ColumnIndex = j, RowIndex = i, RollNumber = branch[m].NextRollnumber(), IsEmpty = false, BranchID= branch[m].BranchID });
                    }
                    else
                    {
                        int m = (i % newsize) + size;
                        room.AllocateSeat(new Seat { ColumnIndex = j, RowIndex = i, RollNumber = branch[m].NextRollnumber(), IsEmpty = false, BranchID = branch[m].BranchID });
                    }
                    i++;
                    TotalStudents--;
                }
                flag ^= true;
                j++;
            }
            AddEndRollNumber(branch, room.RoomID);
        }
    }

    public DataTable GenerateSittingPlan(out DataSet dataSet)
    {
        dataSet = new DataSet();
        FetchTimeTable();
        LoadStudents();
        FetchRoom();
        InItSummary();
        AllocateStudents(mRoom, mBranch);
        foreach(Room room in mRoom)
            dataSet.Tables.Add(ToDataTable(room));
        return Summary;
    }

    #endregion

    #region Helper Function
    /// <summary>
    /// Initialize Summary datatable
    /// </summary>
    private void InItSummary()
    {
        Summary = new DataTable();
        Summary.Columns.Add("room_id");
        Summary.Columns.Add("rollnumber");
    }

    /// <summary>
    /// Add roomid and starting roll number
    /// </summary>
    /// <param name="branches"></param>
    /// <param name="roomid"></param>
    private void SaveStartRollNumber(List<Branch> branches)
    {
        rolls = new string[branches.Count];
        for (int i = 0; i < rolls.Length; i++)
        {
            Branch br = branches[i];
            rolls[i] = br[br.RollNumberCount].RollNumber;
        }
    }

    /// <summary>
    /// Add Ending RollNumber
    /// </summary>
    /// <param name="branches"></param>
    private void AddEndRollNumber(List<Branch> branches, string roomid)
    {
        int i = 0;
        foreach (Branch br in branches)
        {
            DataRow dr = Summary.NewRow();
            dr[0] = roomid;
            dr[1] = $"{rolls[i]} to {br[br.RollNumberCount - 1].RollNumber}";
            Summary.Rows.Add(dr);
            i++;
        }
    }
    #endregion


    #region ValueConverter

    /// <summary>
    /// Converts a room to datatable
    /// </summary>
    /// <param name="room"></param>
    /// <returns></returns>
    public DataTable ToDataTable(Room room)
    {
        DataTable dataTable = new DataTable();
        dataTable.Columns.Add("room_id");
        dataTable.Columns.Add("roll_number");
        dataTable.Columns.Add("column_index");
        dataTable.Columns.Add("row_index");
        dataTable.Columns.Add("date");
        dataTable.Columns.Add("shift");
        dataTable.Columns.Add("branch_id");
        foreach(Seat st in room.Seats)
        {
            DataRow dr = dataTable.NewRow();
            dr[0] = room.RoomID;
            dr[1] = st.RollNumber;
            dr[2] = st.ColumnIndex;
            dr[3] = st.RowIndex;
            dr[4] = mExamDate;
            dr[5] = mShift;
            dr[6] = st.BranchID;
            dataTable.Rows.Add(dr);
        }
        return dataTable;
    }


    #endregion
}
