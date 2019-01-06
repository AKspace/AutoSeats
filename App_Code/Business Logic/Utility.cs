using System;
using System.Data;
using System.Web.UI.WebControls;
using System.IO;
using System.Data.SqlClient;
using System.Web.UI;
using System.Configuration;

/// <summary>
/// Provides function for UI controls
/// </summary>
public class Utility
{
       #region Public Functions
    public static string GetApplicationId()
    {
        return "FS" + System.DateTime.Today.Day.ToString() + System.DateTime.Now.Hour.ToString() + System.DateTime.Now.Minute.ToString() + System.DateTime.Now.Ticks.ToString().Substring(0, 2);
    }
    /// <summary>
    /// Fill the Drop Down List
    /// </summary>
    /// <param name="dataTable">Consist the data to bind with dropdown list</param>
    /// <param name="columnToShow">Column which value appear </param>
    /// <param name="columnToBind">Column Which values bind</param>
    /// <param name="dropdownlist">Dropdown list to bind with data </param>
    public static void FillDropDownList(DataTable dataTable, string columnToShow, string columnToBind,  ref DropDownList dropdownlist)
    {
        // Set dataview for table
        DataView dtView = dataTable.DefaultView;

        //Set datatable as dropdownlist satasource 
        dropdownlist.DataSource = dtView;

        //set dropdownlist text field
        dropdownlist.DataTextField = columnToShow;

        //set dropdownlist value field
        dropdownlist.DataValueField = columnToBind;

        //Bind values with dropdownlist
        dropdownlist.DataBind();

        //Insert an dropdownlist item at index 0
        dropdownlist.Items.Insert(0, new ListItem("Select"));
        dropdownlist.SelectedIndex = 0;
    }

    /// <summary>
    /// Fill the Drop Down List
    /// </summary>
    /// <param name="dataTable">Consist the data to bind with dropdown list</param>
    /// <param name="columnname">Column name to bind values</param>
    /// <param name="dropdownlist">Dropdown list to bind with data </param>
    public static void FillDropDownList(DataTable dataTable, string columnname, ref DropDownList dropdownlist)
    {
        // Set dataview for table
        DataView dtView = dataTable.DefaultView;

        //Set datatable as dropdownlist satasource 
        dropdownlist.DataSource = dtView;

        //set dropdownlist text field
        dropdownlist.DataTextField = columnname;

        //set dropdownlist value field
        dropdownlist.DataValueField = columnname;

        //Bind values with dropdownlist
        dropdownlist.DataBind();

        //Insert an dropdownlist item at index 0
        dropdownlist.Items.Insert(0, new ListItem("Select"));
        dropdownlist.SelectedIndex = 0;
    }

    public static void FillDropDownList(string selectQuery, DropDownList objDdl, string columnToShow, string columnToBound)
    {
        ConnectionUtility cu1 = new ConnectionUtility();
            SqlConnection sCon = cu1.OpenConnection();
        SqlDataAdapter sDta = new SqlDataAdapter
        {
            SelectCommand = new SqlCommand()
        };
        sDta.SelectCommand.Connection = sCon;
            sDta.SelectCommand.CommandType = CommandType.Text;
            sDta.SelectCommand.CommandText = selectQuery;
            sDta.SelectCommand.ExecuteNonQuery();
            DataSet dtSet = new DataSet();
            sDta.Fill(dtSet, "cTable");
            DataView dtView = dtSet.Tables["cTable"].DefaultView;
            objDdl.DataSource = dtView;
            objDdl.DataTextField = columnToShow;
            objDdl.DataValueField = columnToBound;
            objDdl.DataBind();
            objDdl.Items.Insert(0, new ListItem("Select"));
            objDdl.SelectedIndex = 0;
        sCon.Close();
    }

    /// <summary>
    /// Show the Message in a label
    /// </summary>
    /// <param name="msgType"><see cref="MessageType"/></param>
    /// <param name="msgText">Meassage to show</param>
    /// <param name="lblMessage">label in which message will display</param>http://localhost:56901/App_Code/Base/Utility.cs
    public static void ShowMessage(MessageType msgType, string msgText, ref Label lblMessage)
    {
        switch (msgType)
        {
            //If Meassage type is Success
            case MessageType.Success:
                lblMessage.CssClass = "messagesuccess";
                break;

            //If Meassage type is Warning
            case MessageType.Warning:
                lblMessage.CssClass = "messagewarning";
                break;

            //If Meassage type is Information
            case MessageType.Information:
                lblMessage.CssClass = "messageinformation";
                break;

            //If Meassage type is Error
            case MessageType.Error:
                lblMessage.CssClass = "messageerror";
                break;

             //Default Case;
            default:
                lblMessage.CssClass = "messageerror";
                break;
        }
        //set visibilty true for label
        lblMessage.Visible = true;

        // set the text of lebel
        lblMessage.Text = msgText;
    }
    static public void DisplayRecordGridView(ref GridView gdv)
    {
        try
        {
            DataTable dt= new DataTable();
            for(int i=0;i<4;i++)
            dt.Rows.Add();
            gdv.DataSource = dt;

          
        }
        catch(Exception ex)
        {
            Utility.LogEntry(ex);
        }

    }
    #endregion

    #region Static Functions

    /// <summary>
    /// Generate a Globally Unique key 
    /// </summary>
    /// <returns></returns>
    public static string NewID()
    {
        //returns new ID
        return Guid.NewGuid().ToString();
    }

    /// <summary>
    /// Record a error log
    /// </summary>
    /// <param name="errorlogs">Error Message</param>
    public static void LogEntry(string errorlogs)
    {
        try
        {
            //Path o the file
            string filePath = $"~/ErrorLogs/{System.DateTime.Today.ToString("dd-MM-yy")}.txt";

            //Create new file if file is not exist
            if (!File.Exists(System.Web.HttpContext.Current.Server.MapPath(filePath)))
            {
                File.Create(System.Web.HttpContext.Current.Server.MapPath(filePath)).Close();
            }

            using (StreamWriter sW = File.AppendText(System.Web.HttpContext.Current.Server.MapPath(filePath)))
            {
                //Writes log in file
                sW.WriteLine("\n\nLog Entry : ");
                sW.WriteLine("{0}", DateTime.Now.ToString(System.Globalization.CultureInfo.InvariantCulture));
                string errText = "Error in: " + System.Web.HttpContext.Current.Request.Url.ToString() + ". Error Message: " + errorlogs;
                sW.WriteLine(errText);
                sW.WriteLine("****************************************************************************");
                //clear stream writer
                sW.Flush();

                //Close streamwriter
                sW.Close();
            }
        }
        catch (Exception ex)
        {
            LogEntry(ex.Message.ToString());
            throw ex;
        }
    }

    /// <summary>
    /// Record a error log
    /// </summary>
    /// <param name="error">Exception of Error</param>
    public static void LogEntry(Exception error)
    {
        string errorlog = error.Message.ToString();
        try
        {
            //Path o the file
            string filePath = $"~/ErrorLogs/{System.DateTime.Today.ToString("dd-MM-yy")}.txt";

            //Create new file if file is not exist
            if (!File.Exists(System.Web.HttpContext.Current.Server.MapPath(filePath)))
            {
                File.Create(System.Web.HttpContext.Current.Server.MapPath(filePath)).Close();
            }

            using (StreamWriter sW = File.AppendText(System.Web.HttpContext.Current.Server.MapPath(filePath)))
            {
                //Writes log in file
                sW.WriteLine("\n\nLog Entry : ");
                sW.WriteLine("{0}", DateTime.Now.ToString(System.Globalization.CultureInfo.InvariantCulture));
                string errText = "Error in: " + System.Web.HttpContext.Current.Request.Url.ToString() + ". Error Message: " + errorlog;
                sW.WriteLine(errText);
                sW.WriteLine("****************************************************************************");
                //clear stream writer
                sW.Flush();

                //Close streamwriter
                sW.Close();
            }
        }
        catch (Exception ex)
        {
            LogEntry(ex.Message.ToString());
            throw ex;
        }
    }


    public static void FillGridView(ref GridView gridView, System.Data.DataTable dataTable)
    {

        gridView.DataSource = dataTable;
        gridView.DataBind();
    }
    


    #endregion

    #region Public Properties
    /// <summary>
    /// Gets today date in dd/MM/yyyy format
    /// </summary>
    public static string CurrentDate
    {
        get { return System.DateTime.Today.ToString("MM/dd/yyyy"); }
        
    }

    //Gets current time
    public static string CurrentTime
    {
        get { return System.DateTime.Now.ToLongTimeString(); } 
    }

    //Gets Current date and time both
    public static string CurrentDateTime
    {
        get { return System.DateTime.Today.ToString("MM/dd/yyyy") + " " + System.DateTime.Now.ToLongTimeString(); }    
    }

    #endregion 

}