

/// <summary>
/// Repesent a student and its all details
/// </summary>
public class Student
{
    #region Public Properties
    /// <summary>
    /// Gets or Sets Student Enrollment Number
    /// </summary>
    public string EnrollmentNumber { get; set; }

    /// <summary>
    /// Gets or Sets Student Roll Number
    /// </summary>
    public string RollNumber { get; set; }

    /// <summary>
    /// Gets or Sets Student Name
    /// </summary>
    public string Name { get; set; }

    /// <summary>
    /// Gets or Sets Student Year of admission
    /// </summary>
    public string YearOfAdmission { get; set; }

    /// <summary>
    /// Gets or Sets Student Semester
    /// </summary>
    public string Semseter { get; set; }

    /// <summary>
    /// Gets or Sets Student BranchID
    /// </summary>
    public string BranchID { get; set; }

    public string Other1 { get; set; }
    public string Other2 { get; set; }
    #endregion

    #region Constructor 
    /// <summary>
    /// Default Constructor
    /// </summary>
    public Student()
    {

    }

    /// <summary>
    /// Constructor
    /// </summary>
    /// <param name="student"> <see cref="Student"/> type Parameter to intialize Class</param>
    public Student(Student student)
    {
        BranchID = student.BranchID;
        EnrollmentNumber = student.EnrollmentNumber;
        RollNumber = student.RollNumber;
        Semseter = student.Semseter;
        YearOfAdmission = student.YearOfAdmission;
        Name = student.Name;
    }
    #endregion
}

