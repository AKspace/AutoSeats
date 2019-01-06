using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

/// <summary>
/// Provides Functionality to connect to databse 
/// </summary>
 public class ConnectionUtility
{
    #region Private Members

    /// <summary>
    /// Connection string to connect to Database
    /// </summary>
    private static readonly string mConnectionString = ConfigurationManager.ConnectionStrings["conn"].ConnectionString.ToString();


    /// <summary>
    /// Stores Connection Details
    /// </summary>
    private SqlConnection mSqlConnection;

    #endregion

    #region Protected Property

    /// <summary>
    /// Gets connection string for
    /// </summary>
    protected string ConnectionString
    {
        get { return mConnectionString; }
    }


    #endregion

    #region Public Property
    /// <summary>
    /// Gets connection status is open or close
    /// </summary>
    public bool IsOpen
    {
        get
        {
            // return true if  connection state is open
            if (mSqlConnection != null && mSqlConnection.State == ConnectionState.Open)
                return true;
            return false;
        }
    }
    #endregion

    #region Helper Function
    /// <summary>
    /// Open a connection to databse and return sqlconnection having an open connection
    /// </summary>
    /// <returns><see cref="SqlConnection"/></returns>
    public SqlConnection OpenConnection()
    {
        //return existing connection if connection is already open
        if (IsOpen)
            return mSqlConnection;

        //Open a Connection for database
        mSqlConnection = new SqlConnection();
        try
        {
            // Try to connect to server Database
            mSqlConnection.ConnectionString = ConnectionString;
            mSqlConnection.Open();
            return mSqlConnection;
        }
        catch (SqlException ex)
        {
            Utility.LogEntry(ex);
            throw ex;
        }
        catch(Exception ex)
        {
            Utility.LogEntry(ex);
            throw ex;
        }
    }

    public void CloseConnection()
    {
        if (IsOpen)
            mSqlConnection.Close();
    }
    #endregion
}