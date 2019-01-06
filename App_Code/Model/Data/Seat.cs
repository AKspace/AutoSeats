using System.Data;
/// <summary>
/// Represents a seat
/// </summary>
public class Seat
{
    public int RowIndex { get; set; }
    public int ColumnIndex { get; set; }
    public bool IsEmpty { get; set; } = true;
    public string RollNumber { get; set; }
    public string BranchID { get; set; }

}
