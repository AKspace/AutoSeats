using System.Collections.Generic;
using System.Data;

/// <summary>
/// Stores information of a room
/// </summary>
public class Room
{
    private List<Seat> mSeats;
    public string RoomID { get; set; }
    public int TotalSeats { get; set; }
    public int Column { get; set; }
    public int Row { get; set; }
    public int AvailableSeats { get; set; }
    public string RoomBlock { get; set; }

    public Seat this[int index]
    {
        get
        {
            if (mSeats == null || index < 0)
                throw new System.ArgumentNullException("");
            return mSeats[index];
        }
    }

    public List<Seat> Seats
    {
        get { return mSeats; }
    }
    public void AllocateSeat(Seat st)
    {
        if (mSeats == null)
            mSeats = new List<Seat>();
        mSeats.Add(st);
    }
}

