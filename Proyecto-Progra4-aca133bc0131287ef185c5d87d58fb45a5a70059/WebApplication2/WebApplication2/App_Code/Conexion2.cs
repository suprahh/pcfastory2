using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication2.App_Code
{
    public class Conexion2
    {
        public string Conectar2()
        {
            string cadena = "Data Source=DESKTOP-L16B02J\\SQLEXPRESS;Initial Catalog=PcFastory;Integrated Security=True";
            return cadena;

        }
    }
}