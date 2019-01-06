using System;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Query functions to interact with database
/// </summary>
public class Query : ConnectionUtility
{
    #region Private Members

    /// <summary>
    /// Stores the sql command
    /// </summary>
    private SqlCommand mSqlCommand;

    /// <summary>
    /// Controls the transaction to database
    /// </summary>
    private SqlTransaction mSqlTransaction;
    #endregion

    #region Query Function

    /// <summary>
    /// Insert record in database table
    /// </summary>
    /// <param name="insertQuery"> Query string to insert</param>
    /// <returns><see cref="bool"/>Status of insert query</returns>
    public bool Insert(string insertQuery)
    {
        try
        {
            //Create new Sql Commend
            mSqlCommand = new SqlCommand
            {
                //Set Connection Properties to sqlcommand
                Connection = OpenConnection(),
                //Sqt command text Property
                CommandText = insertQuery
            };

            if (mSqlCommand.ExecuteNonQuery() >= 1)
                return true;
        }
        catch (SqlException Ex)
        {
            //Writes the error details in error log
            Utility.LogEntry(Ex.Message.ToString());
            throw Ex;
        }
        finally
        {
            //Close the existing connection
            CloseConnection();
            mSqlCommand.Dispose();
        }
        return false;
    }

    /// <summary>
    /// Excutes multiple insert or update query
    /// </summary>
    /// <param name="insertquery">Arrary of quries</param>
    /// <returns></returns>
    public bool Insert(string [] insertquery)
    {
        //Array of sql commands
        SqlCommand [] sqlCommands = new SqlCommand[insertquery.Length];

        //Sql transaction
        SqlConnection sqlConnection = OpenConnection();

        //Open conection to databasae
        sqlConnection = OpenConnection();

        //Set the transaction to connection
        mSqlTransaction = sqlConnection.BeginTransaction();
        for(int i =0; i <sqlCommands.Length; i++)
        {
            //Intialize array elements
            sqlCommands[i] = new SqlCommand
            {
                Connection = sqlConnection,
                CommandText = insertquery[i],
                Transaction = mSqlTransaction,
            };
        }
        try
        {
            bool res = true;
            //Executes all queries
            foreach (SqlCommand sq in sqlCommands)
                 res  = res & (sq.ExecuteNonQuery() >=1);

            //Commit the transaction
            mSqlTransaction.Commit();
            return res; ;
        }
        catch(ArgumentNullException ex1)
        {
            //Rollback all changes
            mSqlTransaction.Rollback();

            //Creates all
            Utility.LogEntry(ex1);
            throw ex1;
        }
        catch (Exception ex)
        {
            //Rollback changes
            mSqlTransaction.Rollback();

            //Creates log entry
            Utility.LogEntry(ex);
            throw ex;
        }
        finally
        {
            CloseConnection();
            mSqlTransaction.Dispose();
        }
    }

    /// <summary>
    /// Update record in database table
    /// </summary>
    /// <param name="updateQuery">Query to update the record</param>
    /// <returns>return true or false indicating successfully updated or not</returns>
    public bool Update(string updateQuery)
    {
        //Create new Sql Commend
        mSqlCommand = new SqlCommand
        {

            //Set Connection Properties to sqlcommand
            Connection = OpenConnection(),

            //Sqt command text Property
            CommandText = updateQuery
        };

        try
        {
            //If no of affected row grater than 0
            if (mSqlCommand.ExecuteNonQuery() >= 1)
                return true;
        }
        catch (Exception ex)
        {
            ////Writes the error details in error logS
            Utility.LogEntry(ex.Message.ToString());
            throw ex;
        }
        finally
        {
            mSqlCommand.Dispose();
            CloseConnection();
        }
        return false;
    }

    /// <summary>
    /// Delete record from database
    /// </summary>
    /// <param name="deleteQuery"> Query string to execute</param>
    /// <returns>s</returns>
    public bool Delete(string deleteQuery)
    {
        try
        {
            //Create new Sql Commend
            mSqlCommand = new SqlCommand
            {
                //Set Connection Properties to sqlcommand
                Connection = OpenConnection(),
                //Sqt command text Property
                CommandText = deleteQuery
            };

            if (mSqlCommand.ExecuteNonQuery() >= 1)
                return true;
        }
        catch (Exception ex)
        {
            //Writes the error details in error log
            Utility.LogEntry(ex.Message.ToString());
            throw ex;
        }
        finally
        {
            //Close the existing connection
            CloseConnection();
            mSqlCommand.Dispose();
        }
        return false;
    }

    /// <summary>
    /// Check existance of record in database table
    /// </summary>
    /// <param name="tableName"> name of the table</param>
    /// <param name="filterString">condition to check existance</param>
    /// <returns></returns>
    public bool CheckExistance(string tableName, string filterString)
    {
        string selectQuery = $"Select * From {tableName} Where { filterString}";
        //Create new Sql Commend
        mSqlCommand = new SqlCommand
        {
            //Set Connection Properties to sqlcommand
            Connection = OpenConnection(),
            //Sqt command text Property
            CommandText = selectQuery
        };

        //Create new sql datareader
        SqlDataReader sqldatareader = mSqlCommand.ExecuteReader();
        try
        {
            // check existance of user
            if (sqldatareader.Read())
                return true;
        }
        catch (Exception ex)
        {
            ////Writes the error details in error logS
            Utility.LogEntry(ex.Message.ToString());
            throw ex;
        }
        finally
        {
            sqldatareader.Close();
            mSqlCommand.Dispose();
            CloseConnection();
        }
        return false;
    }
    public string GetSingleValue(string selectQuery)
    {
        mSqlCommand = new SqlCommand
        {
            //Set Connection Properties to sqlcommand
            Connection = OpenConnection(),

            //Sqt command text Property
            CommandText = selectQuery
        };

        //Create new sql datareader
        SqlDataReader sqldatareader = mSqlCommand.ExecuteReader();
        try
        {
            //Reads the value if data exists
            if (sqldatareader.Read())
            {
                return sqldatareader[0].ToString();
            }
        }
        catch (Exception ex)
        {
            //Writes the error details in error log
            Utility.LogEntry(ex.Message.ToString());
            throw ex;
        }
        finally
        {
            sqldatareader.Close();
            mSqlCommand.Dispose();
            CloseConnection();
        }
        return null;
    }
    /// <summary>
    /// Fetch only one column value from a table 
    /// </summary>
    /// <param name="columnName">Column name which values will fetch</param>
    /// <param name="tableName">Name of table</param>
    /// <param name="filterString">Condition to select which tupple values should select</param>
    /// <returns></returns>
    public string GetSingleValue(string columnName, string tableName, string filterString)
    {
        string selectQuery = "Select " + columnName + " From " + tableName + " Where " + filterString;
        //Create new Sql Commend
        mSqlCommand = new SqlCommand
        {
            //Set Connection Properties to sqlcommand
            Connection = OpenConnection(),

            //Sqt command text Property
            CommandText = selectQuery
        };

        //Create new sql datareader
        SqlDataReader sqldatareader = mSqlCommand.ExecuteReader();
        try
        {
            //Reads the value if data exists
            if (sqldatareader.Read())
            {
                return sqldatareader[0].ToString();
            }
        }
        catch (Exception ex)
        {
            //Writes the error details in error log
            Utility.LogEntry(ex.Message.ToString());
            throw ex;
        }
        finally
        {
            sqldatareader.Close();
            mSqlCommand.Dispose();
            CloseConnection();
        }
        return null;
    }

    /// <summary>
    /// Execute the select query and rturn <see cref="DataTable"/>
    /// </summary>
    /// <param name="querystring"> Select query to execute</param>
    /// <returns> Returns Datatable</returns>
    public DataTable Select(string querystring)
    {
        SqlDataReader sdtr;

        //DataTable
        DataTable dt = new DataTable();
        mSqlCommand = new SqlCommand
        {
            CommandText = querystring,
            CommandType = CommandType.Text
        };
        try
        {
            mSqlCommand.Connection = OpenConnection();
            sdtr = mSqlCommand.ExecuteReader();
            dt.Load(sdtr);
            CloseConnection();
            return dt;
        }
        catch (SqlException Ex)
        {
            //Writes the error details in error log
            throw Ex;
        }
    }

    /// <summary>
    /// Execute Select query 
    /// </summary>
    /// <param name="querystring"> Select query to execute</param>
    /// <param name="sdtr"> out patarameter</param>
    public void Select(string querystring, out SqlDataReader sdtr)
    {
        DataTable dt = new DataTable();
        mSqlCommand = new SqlCommand
        {
            CommandText = querystring,
            CommandType = CommandType.Text
        };
        try
        {
            mSqlCommand.Connection = OpenConnection();
            sdtr = mSqlCommand.ExecuteReader();
        }
        catch (SqlException Ex)
        {
            //Writes the error details in error log
            throw Ex;
        }
    }

    public bool ExecuteStoredProcedure(DataTable table, string commandtext, string parameter)
    {
        try
        {
            mSqlCommand = new SqlCommand
            {
                CommandText = commandtext,
                Connection = OpenConnection(),
                CommandType = CommandType.StoredProcedure
            };
            mSqlCommand.Parameters.Add(new SqlParameter(parameter, SqlDbType.Structured));
            mSqlCommand.Parameters[parameter].Value = table;
            if (mSqlCommand.ExecuteNonQuery() > 0)
                return true;
        }
        catch(Exception ex)
        {
            Utility.LogEntry(ex);
            throw ex;
        }
        finally
        {
            CloseConnection();
        }
        return false;
    }
    #endregion

    #region Helper Function
    /// <summary>
    /// Close The any existing Connection
    /// </summary>
    public void CloseConnetion()
    {
        //Call the base class function
        base.CloseConnection();
    }
    #endregion
}