using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;

/// <summary>
/// Represents branch and its details
/// </summary>
public class Branch
{
    #region Private Membars

    /// <summary>
    /// Contains the list of all students in a branch
    /// </summary>
    private List<Student> mStudents;

    /// <summary>
    /// Object of <see cref="Query"/> Class
    /// </summary>
    private Query mdbcon;

    /// <summary>
    /// Contains the total number of students
    /// </summary>
    private readonly int mTotalStudents;

    /// <summary>
    /// Keep The Record that which student will be allocate next
    /// </summary>
    private int Counter { get; set; } = -1;

    #endregion

    #region Public Properties
    /// <summary>
    /// Gets or Sets Branch ID
    /// </summary>
    public string BranchID { get; set; }

    /// <summary>
    /// Gets the total number of students
    /// </summary>
    public int TotalStudents { get { return mTotalStudents; } }

    /// <summary>
    /// Gets or Sets Branch Name
    /// </summary>
    public string BranchName { get; set; }

    /// <summary>
    /// Gets number of students in a branch
    /// </summary>
    public int Count { get { return mStudents.Count; } }

    /// <summary>
    /// Gets the no of students for those seats are allocated
    /// </summary>
    public int RollNumberCount { get { return Counter + 1; } }


    #endregion

    #region Indexer

    /// <summary>
    /// Return Student details at index i
    /// </summary>
    /// <param name="index">Index</param>
    /// <returns> <see cref="Student"/></returns>
    public Student this[int index]
    {
        get
        {
            if (index >= 0 && index < mStudents.Count)
                return mStudents.ElementAt(index);
            else
                throw new IndexOutOfRangeException("Index is Out of range");
        }
        //set
        //{
        //    if (index >= 0 )
        //    {
        //        bool isempty = string.IsNullOrEmpty(value.Name) || string.IsNullOrEmpty(value.RollNumber) || string.IsNullOrEmpty(value.EnrollmentNumber) || string.IsNullOrEmpty(value.BranchID) || string.IsNullOrEmpty(value.Semseter) || string.IsNullOrEmpty(value.YearOfAdmission);
        //        if (isempty)
        //            throw new ArgumentException("Propeties are not intialized");
        //        mStudents.Add(value);
        //    }
        //    else
        //        throw new IndexOutOfRangeException("Index is Out of range");
        //}

    }
    #endregion

    #region Constructor

    /// <summary>
    /// Default Constructor
    /// </summary>
    public Branch()
    {

    }

    /// <summary>
    /// Default Constructor
    /// </summary>
    /// <param name="branchid">BranchID to get get branch details</param>
    public Branch(string branchid)
    {
        mdbcon = new Query();
        string query = $"SELECT * FROM branch where branch_code = '{branchid}'";
        DataTable dt = mdbcon.Select(query);
        DataRow dr = dt.Rows[0];
        this.BranchID = (dr["branch_code"]).ToString();
        this.BranchName = dr["branch_name"].ToString();
        if (!int.TryParse(dr["total_students"].ToString(), out mTotalStudents))
            throw new InvalidCastException("Input string is not in correct format");
    }
    #endregion

    #region Helpers

    /// <summary>
    /// Get all Students Roll numbers
    /// </summary>
    public void GetStudents()
    {
        //var abcd = new Student { RollNumber = "asddsfa" };
        if (string.IsNullOrWhiteSpace(BranchID))
            throw new ArgumentNullException("BranchID is null , empty or containing only whitespace");
        string query = $"Select roll_number from students where branch_id = '{this.BranchID}'";
        mStudents = new List<Student>();
        mdbcon.Select(query, out SqlDataReader sdtr);
        while (sdtr.Read())
        {
            // For Review
            mStudents.Add(new Student { RollNumber = sdtr["roll_number"].ToString() });
        }
        sdtr.Close();
        mdbcon.CloseConnection();
    }

    /// <summary>
    /// Get the All Branches
    /// </summary>
    /// <returns></returns>
    public DataTable GetBranches()
    {
        Query db = new Query();
        string query = "select * from dbo.branch";
        return db.Select(query);
    }

    public string NextRollnumber()
    {
        if (Counter >= Count)
            throw new IndexOutOfRangeException("Index is out of range");
        Counter++;
        return mStudents[Counter].RollNumber;
    }
    #endregion
}
