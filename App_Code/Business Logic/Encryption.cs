using System;
using System.Text;
using System.IO;
using System.Security.Cryptography;

public class Encryption
{
    #region Private Members
    private string mEncryptionKey;
    private string mEncryptionIV;
    #endregion

    #region Constructor
    /// <summary>
    /// Default Constructor
    /// </summary>
    /// <param name="email"></param>
    /// <param name="userid"></param>
    public Encryption(string email, string userid)
    {
        //Generate Key
        mEncryptionKey = GenerateKey(email, userid);

        //Generate IV
        mEncryptionIV = GenerateIV(email,userid);
    }
    #endregion

    #region Private Function
    /// <summary>
    /// Generate a key for encryption using two string
    /// </summary>
    /// <param name="string1">Email of the user</param>
    /// <param name="string2">userid </param>
    /// <returns></returns>
    private string GenerateKey(string string1,string string2)
    {
        string key = "";

        //Generate first 16 character of key
        key += string2.Substring(0, 16);

        
        if (string1.Length >= 16)
            //Generate next 16 character if possible 
            key += string1.Substring(0, 16);
        else
            //Append email in the key
            key += string1;

        //Generate remaining character of the key
        key += string2.Substring(16, 43 - key.Length);

        key = key.Replace('@', '+');
        key = key.Replace('.', '+');
        key = key.Replace('-', '/');
        key = key.Insert(key.Length, "=");
        return key;
    }

    /// <summary>
    /// Generate a IV for encryption
    /// </summary>
    /// <param name="string1"> Email of the user</param>
    /// <param name="string2">userid</param>
    /// <returns></returns>
    private string GenerateIV(string string1, string string2)
    {
        string key = "";

        //Generate first 8 character of IV
        key += string2.Substring(0, 8);


        if (string1.Length >= 8)
            //Generate next 16 character if possible 
            key += string1.Substring(0, 8);
        else
            //Append email in the IV
            key += string1;

        //Generate remaining character of the IV
        key += string2.Substring(8, 22 - key.Length);

        //Replace character to make string in Base64
        key = key.Replace('@', '+');
        key = key.Replace('.', '+');
        key = key.Replace('-', '/');
        key = key.Insert(key.Length, "==");
        return key;
    }

    #endregion

    #region Public Functions
    /// <summary>
    /// Encrypt text
    /// </summary>
    /// <param name="plainText">Text to encrypt</param>
    /// <param name="encKey">Encryption key</param>
    /// <param name="encIv">Encryption IV</param>
    /// <returns></returns>
    public string EncryptText(string plainText)
    {
        RijndaelManaged obRjm = new RijndaelManaged();
        byte [] encryptedText = null;
        byte[] myKey = null;
        byte[] myIv = null;
        byte[] myText = null;

        try
        {
            //Gets Key
            myKey = Convert.FromBase64String(mEncryptionKey);

            //Gets IV
            myIv = Convert.FromBase64String(mEncryptionIV);

            //Encode text
            myText = Encoding.ASCII.GetBytes(plainText);
            ICryptoTransform obIct = obRjm.CreateEncryptor(myKey, myIv);
            MemoryStream obMes = new MemoryStream();
            CryptoStream obCrs = new CryptoStream(obMes, obIct, CryptoStreamMode.Write);
            obCrs.Write(myText, 0, myText.Length);
            obCrs.FlushFinalBlock();
            encryptedText = obMes.ToArray();
            obMes.Close();
            obMes.Close();
            return Convert.ToBase64String(encryptedText);
        }
        catch (Exception ex)
        {
            Utility.LogEntry(ex);
            throw ex;
        }
    }
    #endregion
}
