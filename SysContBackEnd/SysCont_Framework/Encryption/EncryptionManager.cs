using System;
using System.Collections.Generic;
using System.Text;

namespace SysCont_Framework.Encryption
{
    public class EncryptionManager
    {
        private byte[] key;
        private byte[] iv;

        public EncryptionManager()
        {
            key = Convert.FromBase64String("MI64fJotcZV/Vrfrs7/H4/RE59qud+oi+W9nQacKXwA=");
            iv = Convert.FromBase64String("g7XYfVpyjeqqi0tHF13xJQ==");
        }

        public string Encrypt(string original)
        {
            // Encrypt the string to an array of bytes.
            byte[] encrypted = AES.EncryptStringToBytes_Aes(original, key, iv);
            return Convert.ToBase64String(encrypted);
        }

        public string Decryp(string encrypted)
        {
            // Decrypt the bytes to a string.
            byte[] encryptedContent = Convert.FromBase64String(encrypted);
            string decripted = AES.DecryptStringFromBytes_Aes(encryptedContent, key, iv);
            return decripted;
        }

    }
}
