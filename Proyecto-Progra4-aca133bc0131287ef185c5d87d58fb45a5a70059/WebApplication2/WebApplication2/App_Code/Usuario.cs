using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication2.App_Code
{
    public class Usuario
    {
       
        private int rut;
        private string nombre;
        private string mail;
        private string username;
        private string password;
        private bool privilegio;

        public Usuario ()
        {

        }

        public bool Privilegio
        {
            get { return privilegio; }
            set { privilegio = value; }
        }

        public string Password
        {
            get { return password; }
            set { password = value; }
        }

        public string Username
        {
            get { return username; }
            set { username = value; }
        }

        public string Mail
        {
            get { return mail; }
            set { mail = value; }
        }

        public string Nombre
        {
            get { return nombre; }
            set { nombre = value; }
        }

        public int Rut
        {
            get { return rut; }
            set { rut = value; }
        }


    }
}