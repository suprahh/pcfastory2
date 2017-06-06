using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication2.App_Code
{
    public class Venta
    {
        private int id;
        private DateTime fecha;
        private int total;
        
        public Venta() { }
       


        public int Total
        {
            get { return total; }
            set { total = value; }
        }

        public DateTime Fecha
        {
            get { return fecha; }
            set { fecha = value; }
        }

        public int Id
        {
            get { return id; }
            set { id = value; }
        }

    }
}