using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;


namespace WebApplication2.App_Code
{
    public static class Buscar
    {
       
        public static bool BuscarUsuario (string user, string contraseña)
        {
            Conexion cadena = new Conexion();
            SqlConnection con = new SqlConnection(cadena.Conectar());
            con.Open();
            string consulta = "select count(*) from TAB_USUARIOS where USERNAME = '" + user + "' and PASSWORD = '" + contraseña + "'";
            SqlCommand conCadena = new SqlCommand(consulta, con);

         
            if (Convert.ToInt16(conCadena.ExecuteScalar())== 1)
            {
                con.Close();
                return true;
            }
            else
            {
                con.Close();
                return false;

            }
        }

        public static Usuario BuscarUsuarioUser(string usuario)
        {
            Conexion cadena = new Conexion();
            SqlConnection con = new SqlConnection(cadena.Conectar());
            con.Open();
            string consulta = "select * from TAB_USUARIOS where USERNAME ='" +usuario +"'";
            SqlDataAdapter conCadena = new SqlDataAdapter(consulta, con);
            DataTable tabla = new DataTable();
            conCadena.Fill(tabla);

            Usuario user = new Usuario();
            foreach (DataRow row in tabla.Rows)
            {

                user.Rut = (int)row[1];
                user.Nombre = (string)row[2];
                user.Mail = (string)row[3];
                user.Username = (string)row[4];
                user.Password = (string)row[5];
                user.Privilegio = (bool)row[6];

            }
            con.Close();
            return user;
        }

        public static Producto BproductoId(int id)
        {
            Conexion cadena = new Conexion();
            SqlConnection con = new SqlConnection(cadena.Conectar());
            con.Open();
            string consulta = "select * from TAB_PRODUCTO where ID_PRO=" + id;
            SqlDataAdapter conCadena = new SqlDataAdapter(consulta, con);
            DataTable tabla = new DataTable();
            conCadena.Fill(tabla);


            Producto p = new Producto();
            foreach (DataRow row in tabla.Rows)
            {
                p.Id = (int)row[0];
                p.Nombre = (string)row[1];
                p.Descripcion = (string)row[2];
                p.Precio = (int)row[3];
                p.Stock = (int)row[4];
                p.Foto = (string)row[5];
                p.IdCategoria = (int)row[6];

            }
            con.Close();
            return p;
        }

        public static List<Producto> BproductoNombre(string nombre)
        {
            List<Producto> productos = new List<Producto>();
            Conexion cadena = new Conexion();
            SqlConnection con = new SqlConnection(cadena.Conectar());
            con.Open();
            string consulta = "select * from TAB_PRODUCTO where NOM_PRO like '%" + nombre + "%'";
            SqlDataAdapter conCadena = new SqlDataAdapter(consulta, con);
            DataTable tabla = new DataTable();
            conCadena.Fill(tabla);

            

            foreach (DataRow row in tabla.Rows)
            {
                Producto p = new Producto();
                p.Id = (int)row[0];
                p.Nombre = (string)row[1];
                p.Descripcion = (string)row[2];
                p.Precio = (int)row[3];
                p.Stock = (int)row[4];
                p.Foto = (string)row[5];
                p.IdCategoria = (int)row[6];
                productos.Add(p);
            }
            con.Close();
            return productos;
        }

        public static List<Producto> BproductoPrecio(int precio)
        {
            List<Producto> productos = new List<Producto>();
            Conexion cadena = new Conexion();
            SqlConnection con = new SqlConnection(cadena.Conectar());
            con.Open();
            string consulta = "select * from TAB_PRODUCTO where PRECIO_PRO = " + precio;
            SqlDataAdapter conCadena = new SqlDataAdapter(consulta, con);
            DataTable tabla = new DataTable();
            conCadena.Fill(tabla);
            foreach (DataRow row in tabla.Rows)
            {
                Producto p = new Producto();
                p.Id = (int)row[0];
                p.Nombre = (string)row[1];
                p.Descripcion = (string)row[2];
                p.Precio = (int)row[3];
                p.Stock = (int)row[4];
                p.Foto = (string)row[5];
                p.IdCategoria = (int)row[6];
                productos.Add(p);
            }
            con.Close();
            return productos;
         }
        public static List<Producto> BproductoCategoria(string categoria)
        {
            List<Producto> productos = new List<Producto>();
            Conexion cadena = new Conexion();
            SqlConnection con = new SqlConnection(cadena.Conectar());
            con.Open();
            string consulta = "select * from TAB_PRODUCTO where ID_CAT =  "+ categoria;
            SqlDataAdapter conCadena = new SqlDataAdapter(consulta, con);
            DataTable tabla = new DataTable();
            conCadena.Fill(tabla);

          

            foreach (DataRow row in tabla.Rows)
            {
                Producto p = new Producto();
                p.Id = (int)row[0];
                p.Nombre = (string)row[1];
                p.Descripcion = (string)row[2];
                p.Precio = (int)row[3];
                p.Stock = (int)row[4];
                p.Foto = (string)row[5];
                p.IdCategoria = (int)row[6];
                productos.Add(p);
            }
            con.Close();
            return productos;
        }

         public static Usuario BuscarUsuarioRut (int rut)
        {
            Conexion cadena = new Conexion();
            SqlConnection con = new SqlConnection(cadena.Conectar());
            con.Open();
            string consulta = "select * from TAB_USUARIOS where RUT =" + rut;
            SqlDataAdapter conCadena = new SqlDataAdapter(consulta, con);
            DataTable tabla = new DataTable();
            conCadena.Fill(tabla);

            Usuario user = new Usuario();
            foreach (DataRow row in tabla.Rows)
            {

                user.Rut= (int)row[1];
                user.Nombre = (string)row[2];
                user.Mail = (string)row[3];
                user.Username = (string)row[4];
                user.Password = (string)row[5];
                user.Privilegio = (bool)row[6];
               
            }
            con.Close();
            return user;
        }

        public static List<Categoria> buscarCategorias()
        {
            List<Categoria> categorias = new List<Categoria>();
            Conexion cadena = new Conexion();
            SqlConnection con = new SqlConnection(cadena.Conectar());
            con.Open();
            string consulta = "select * from TAB_CATEGORIA" ;
            SqlDataAdapter conCadena = new SqlDataAdapter(consulta, con);
            DataTable tabla = new DataTable();
            conCadena.Fill(tabla);


            foreach (DataRow row in tabla.Rows)
            {

                Categoria c = new Categoria();
                c.Id = (int)row[0];
                c.Nombre = (string)row[1];
                categorias.Add(c);
            }
            con.Close();
            return categorias;
        }

        public static int ultimaVenta()
        {
            Conexion cadena = new Conexion();
            SqlConnection con = new SqlConnection(cadena.Conectar());
            con.Open();
            string consulta = "SELECT TOP 1 ID_VENT FROM TAB_VENTA ORDER BY ID_VENT DESC";
            SqlDataAdapter conCadena = new SqlDataAdapter(consulta, con);
            DataTable tabla = new DataTable();
            conCadena.Fill(tabla);
            int idVenta = 0;
             foreach (DataRow row in tabla.Rows)
            {
                idVenta = (int)row[0];
              
            }
            con.Close();
            return idVenta;
         
        }

        public static int IdUsuario(int rut)
        {
            Conexion cadena = new Conexion();
            SqlConnection con = new SqlConnection(cadena.Conectar());
            con.Open();
            string consulta = "SELECT ID_USUARIO FROM TAB_USUARIOS WHERE RUT="+rut;
            SqlDataAdapter conCadena = new SqlDataAdapter(consulta, con);
            DataTable tabla = new DataTable();
            conCadena.Fill(tabla);
            int idVenta = 0;
            foreach (DataRow row in tabla.Rows)
            {
                idVenta = (int)row[0];

            }
            con.Close();
            return idVenta;

        }

       
    }
}