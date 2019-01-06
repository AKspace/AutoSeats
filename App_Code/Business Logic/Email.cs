using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Mail;

/// <summary>
/// A class to send email
/// </summary>
public class Email
{
    #region Private Members
    /// <summary>
    /// Email Address from which message send
    /// </summary>
    private string mFromMailAddress = "swcsfilm@gmail.com";

    /// <summary>
    ///  Mail Message details
    /// </summary>
    private MailMessage mMailMessage;
    #endregion

    #region Public Properties
    /// <summary>
    /// Sets the From email eddress
    /// </summary>
    public string From
    {
        set { mFromMailAddress = value; }
    }

    /// <summary>
    /// Sets the Mail message body type as html
    /// </summary>
    public bool IsBodyHTML { private get; set; } = false;

    /// <summary>
    /// Sets the Subject of email
    /// </summary>
    public string Subject { private get; set; }

    /// <summary>
    /// Sets the Message Body
    /// </summary>
    public string Body { private get; set; }

    #endregion

    #region Public Functions

    /// <summary>
    /// Send Mail to a recepient
    /// </summary>
    /// <param name="tomailaddress">Mail address of recepient</param>
    public void SendMail(string tomailaddress)
    {
        try
        {
            //Object of Mail Message
            mMailMessage = new MailMessage
            {

                //Set sender Email address
                From = new MailAddress(mFromMailAddress)
            };

            //Set recepient mail address
            mMailMessage.To.Add(new MailAddress(tomailaddress));

            //Set subject of mail
            mMailMessage.Subject = Subject;

            //Set mail body
            mMailMessage.Body = Body;

            //Set mail body type
            mMailMessage.IsBodyHtml = this.IsBodyHTML;

            //Remote SMTP server 
            SmtpClient smtp = new SmtpClient
            {
                //Enables ssl security
                EnableSsl = true,

                //Set host address
                Host = "smtp.gmail.com",

                //Set host port
                Port = 587,

                //Set credential to connect with host
                Credentials = new System.Net.NetworkCredential("swcsfilm@gmail.com", "@sih2018")

            };

            //Sends Message
            smtp.Send(mMailMessage);

            //Dispose the Mail Address Object
            mMailMessage.Dispose();
        }
        catch (Exception ex)
        {
            //Log Entry
            Utility.LogEntry(ex.Message.ToString());
            throw ex;
        }
    }

    /// <summary>
    /// Send Mail to multiple recepient
    /// </summary>
    /// <param name="tomailaddress">Mail address of recepient</param>
    public void SendMail(string[] tomailaddress)
    {
        try
        {
            //Object of Mail Message
            mMailMessage = new MailMessage
            {

                //Set sender Email address
                From = new MailAddress(mFromMailAddress)
            };

            //Set recepient mail address
            mMailMessage.To.Add(GenerateMailAdressesCollection(tomailaddress));

            //Set subject of mail
            mMailMessage.Subject = Subject;

            //Set mail body
            mMailMessage.Body = Body;

            //Set meassage body type
            mMailMessage.IsBodyHtml = this.IsBodyHTML;

            //Remote SMTP server 
            SmtpClient smtp = new SmtpClient
            {

                //Set host address
                Host = "smtp.gmail.com",

                //Set host port
                Port = 587,

                //Set credential to connect with host
                Credentials = new System.Net.NetworkCredential("nakultripathi14@gmail.com", "Nakul@1234"),

                //Enables ssl security
                EnableSsl = true
            };

            //Sends Message
            smtp.Send(mMailMessage);

            //Dispose the Mail Address Object
            mMailMessage.Dispose();
        }
        catch (Exception ex)
        {
            //Log Entry
            Utility.LogEntry(ex.Message.ToString());
            throw ex;
        }

    }



    #endregion

    #region Helper Function
    /// <summary>
    /// Generates A Mail collection from string array
    /// </summary>
    /// <param name="mailaddresses"></param>
    /// <returns></returns>
    private string GenerateMailAdressesCollection(string [] mailaddresses)
    {
        string res = "";
        foreach (string item in mailaddresses)
        {
            res += item + ",";
        }
        return res.Remove(res.Length-1);
    }
    #endregion
}