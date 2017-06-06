using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication2.App_Code
{
    public class Producto
    {
        private int id;
        private string nombre;
        private string descripcion;
        private int  precio;
        private int stock;
        private string foto;
        private int idCategoria;

        public Producto ()
        {

        }

        public int Id
        {
            get { return id; }
            set { id = value; }
        }
        public int IdCategoria
        {
            get { return idCategoria; }
            set { idCategoria = value; }
        }

        public string Foto
        {
            get { return foto; }
            set { foto = value; }
        }

        public int Stock
        {
            get { return stock; }
            set { stock = value; }
        }

        public int  Precio
        {
            get { return precio; }
            set { precio = value; }
        }

        public string Descripcion
        {
            get { return descripcion; }
            set { descripcion = value; }
        }



        public string Nombre
        {
            get { return nombre; }
            set { nombre = value; }
        }

        




    }
}