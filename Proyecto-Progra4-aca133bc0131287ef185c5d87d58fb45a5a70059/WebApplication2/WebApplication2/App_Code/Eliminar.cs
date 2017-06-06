using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace WebApplication2.App_Code
{
    public class Eliminar
    {
        public static bool EliminarProductoId(Producto p)
        {

            Conexion cadena = new Conexion();
            SqlConnection con = new SqlConnection(cadena.Conectar());
            con.Open();
            string consulta = "delete (*) TAB_PRODUCTO  where ID_PRO = '" + p.Id + "'";
            
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