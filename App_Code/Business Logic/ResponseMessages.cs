using System.Web.UI;

/// <summary>
/// Provides functions to show response messages 
/// </summary>
public class ResponseMessage
{
    #region Public Function
    /// <summary>
    /// Show the alert window with success message and reload the page
    /// </summary>
    /// <param name="message">message to show on </param>
    /// <param name="page">Page on which you want to show the messages</param>
    public static void Sucess(string message, Page page, bool isreloadpage)
    {
        if(isreloadpage)
        //Executes javascrcipt to show window alert
            ScriptManager.RegisterStartupScript(page.Page, page.GetType(), "text", $"window.alert('{message}'); window.location.reload();", true);
        else
            ScriptManager.RegisterStartupScript(page.Page, page.GetType(), "text", $"window.alert('{message}'); ", true);

    }

    /// <summary>
    /// Show the alert window with success message 
    /// </summary>
    /// <param name="message">message to show on </param>
    /// <param name="page">Page on which you want to show the messages</param>
    public static void Sucess(string message, Page page)
    {
            //Executes javascrcipt to show window alert
            ScriptManager.RegisterStartupScript(page.Page, page.GetType(), "text", $"window.alert('{message}');", true);
    }

        /// <summary>
        /// Show the alert window with Error message and reload the page
        /// </summary>
        /// <param name="page">Page on which you want to show the messages</param>
        public static void Error(Page page, bool isreloadpage)
    {
        if (isreloadpage)
        {
            //Executes javascrcipt to show window alert
            ScriptManager.RegisterStartupScript(page.Page, page.GetType(), "text", $"window.alert('Something Went Wrong !!!!!'); window.location.reload();", true);
        }
        else
            ScriptManager.RegisterStartupScript(page.Page, page.GetType(), "text", $"window.alert('Something Went Wrong !!!!!');", true);

    }

    /// <summary>
    /// Show the alert window with Error message
    /// </summary>
    /// <param name="page">Page on which you want to show the messages</param>
    public static void Error(Page page)
    {
        //Executes javascrcipt to show window alert
        ScriptManager.RegisterStartupScript(page.Page, page.GetType(), "text", $"window.alert('Something Went Wrong !!!!!');", true);
    }

    /// <summary>
    /// Show the alert window with warning message and keep the same page
    /// </summary>
    /// <param name="message">message to show on </param>
    /// <param name="page">Page on which you want to show the messages</param>
    public static void Warning(string message, Page page)
    {
        //Executes javascrcipt to show window alert
        ScriptManager.RegisterStartupScript(page.Page, page.GetType(), "text", $"window.alert('{message}');", true);
    }

    #endregion
}