using System.Data;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
/// <summary>
/// Draw the romm structure
/// </summary>
public class RoomView
{

    private int mRow;
    private int mColumn;
    private DataTable dataTable;

    public RoomView( DataTable dt)
    {
        int.TryParse(dt.AsEnumerable().Max(row => row["row_index"].ToString()), out mRow);
        mRow += 1;
        int.TryParse(dt.AsEnumerable().Max(row => row["column_index"].ToString()), out mColumn);
        mColumn += 1;
        dataTable = CreateDatset(dt);
    }
    public Panel DrawTable()
    {
        Panel panel2 = new Panel();
        Panel panel3 = new Panel();
        panel2.CssClass = "panelstyle1";
        Table Table1 = new Table();
        Table1.CssClass = "tabstyle";
        panel3.CssClass = "panelstyle2";
        for (int i = 0; i < mRow; i++)
        {
            TableRow tbrow = new TableRow();
            tbrow.Height = 30;
            for (int j = 0; j < mColumn; j++)
            {
                TableCell cell = new TableCell();
                cell.Height = 40;
                Label label = new Label();
                label.ID = "lblid";
                cell.Controls.Add(label);
                tbrow.Cells.Add(cell);
            }
            Table1.Rows.Add(tbrow);

        }
        Label door = new Label();
        door.ID = "door";
        door.ClientIDMode = ClientIDMode.Static;
        Image image1 = new Image();
        image1.ImageUrl = "/Shared/images/up.ico";
        image1.CssClass = "imagestyle";
        panel3.Controls.Add(image1);
        Image image2 = new Image();
        image2.ImageUrl = "/Shared/images/down.ico";
        image2.CssClass = "imagestyle";
        panel3.Controls.Add(door);
        panel3.Controls.Add(image2);
        panel2.Controls.Add(panel3);
        panel2.Controls.Add(Table1);
        BindTable(Table1);
        panel3.Height = panel2.Height;
        return panel2;
    }

    public Panel DrawTable(int r, int c)
    {
        Panel panel2 = new Panel();
        Panel panel3 = new Panel();
        panel2.CssClass = "panelstyle1";
        Table Table1 = new Table();
        Table1.CssClass = "tabstyle";
        panel3.CssClass = "panelstyle2";
        for (int i = 0; i < mRow; i++)
        {
            TableRow tbrow = new TableRow();
            tbrow.Height = 30;
            for (int j = 0; j < mColumn; j++)
            {
                TableCell cell = new TableCell();
                cell.Height = 40;
                Label label = new Label();
                label.ID = "lblid";
                cell.Controls.Add(label);
                tbrow.Cells.Add(cell);
            }
            Table1.Rows.Add(tbrow);

        }
        Label door = new Label();
        door.ID = "door";
        door.ClientIDMode = ClientIDMode.Static;
        Image image1 = new Image();
        image1.ImageUrl = "/Shared/images/up.ico";
        image1.CssClass = "imagestyle";
        panel3.Controls.Add(image1);
        Image image2 = new Image();
        image2.ImageUrl = "/Shared/images/down.ico";
        image2.CssClass = "imagestyle";
        panel3.Controls.Add(door);
        panel3.Controls.Add(image2);
        panel2.Controls.Add(panel3);
        panel2.Controls.Add(Table1);
        BindTable(Table1);
        Label lb = (Label)Table1.Rows[r].Cells[c].Controls[0];
        lb.CssClass += " studentseatstyle";
        panel3.Height = panel2.Height;
        return panel2;
    }

    private void BindTable(Table Table1)
    {
        for (int i = 0; i < mRow; i++)
        {
            for (int j = 0; j < mColumn; j++)
            {
                Label label =(Label) Table1.Rows[i].Cells[j].Controls[0];
                label.Text = dataTable.Rows[i][j].ToString();
                label.CssClass = "cellStyle";
            }
        }

    }

    private DataTable CreateDatset(DataTable dt)
    {
        DataTable table = new DataTable();
        for(int j = 0; j<mColumn;j++)
        {
            table.Columns.Add();
        }
        for (int j = 0; j < mRow; j++)
        {
            DataRow dr = table.NewRow();
            table.Rows.Add();
        }
        foreach (DataRow dr in dt.Rows)
        {
            int.TryParse(dr["row_index"].ToString(), out int i);
            int.TryParse(dr["column_index"].ToString(), out int j);
            table.Rows[i][j] = dr[1].ToString();
        }
        return table;
    }

  
   
}