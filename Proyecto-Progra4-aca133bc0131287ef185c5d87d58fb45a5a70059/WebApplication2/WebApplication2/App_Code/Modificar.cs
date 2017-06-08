using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

namespace WebApplication2.App_Code
{
    public static class Modificar
    {
        public static bool modificarProducto(Producto p)
        {
            Conexion cadena = new Conexion();
            SqlConnection con = new SqlConnection(cadena.Conectar());
            string consulta;
            consulta = " UPDATE TAB_PRODUCTO SET NOM_PRO ='" + p.Nombre + "', DESCRIPCION_PRO ='" + p.Descripcion + "', PRECIO_PRO=" + p.Precio + ", STOCK_PRO=" + p.Stock + ", FOTO_PRO='" + p.Foto + "' WHERE ID_PRO=+" + p.Id;
            con.Open();
            SqlCommand conCadena = new SqlCommand(consulta, con);
            if (conCadena.ExecuteNonQuery() == 1)
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
        public static bool modificarUsuario(Usuario user)
        {
            Conexion cadena = new Conexion();
            SqlConnection con = new SqlConnection(cadena.Conectar());
            string consulta;
            int privilegio = user.Privilegio == true ? 1 : 0;
            consulta = " UPDATE TAB_USUARIOS SET NOMBRE_USER ='" + user.Nombre + "', EMAIL_USER ='" + user.Mail + "', USERNAME='" + user.Username + "', TIPO_USER =" + privilegio + " WHERE RUT=+" + user.Rut;
            con.Open();
            SqlCommand conCadena = new SqlCommand(consulta, con);
            if (conCadena.ExecuteNonQuery() == 1)
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
        public static bool modificarStock(int cantidad, int id)
        {
            Conexion cadena = new Conexion();
            SqlConnection con = new SqlConnection(cadena.Conectar());
            string consulta;
            consulta = " UPDATE TAB_PRODUCTO SET STOCK_PRO = STOCK_PRO - " + cantidad + " WHERE ID_PRO=+" + id;
            con.Open();
            SqlCommand conCadena = new SqlCommand(consulta, con);
            if (conCadena.ExecuteNonQuery() == 1)
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

    }
}









