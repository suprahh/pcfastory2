using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication2.App_Code;

namespace WebApplication2.Forms
{
    public partial class Boleta : System.Web.UI.Page
    {
       

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["user"] != null)
            {
                List<Producto> carrito = new List<Producto>();
                carrito = (List<Producto>)Session["carrito"];
                Usuario user = (Usuario)Session["user"];
                Venta v = (Venta)Session["venta"];
                
                LabelBienvenida.Text = "bienvenido " + user.Nombre;
                TextBoxBoleta.Text = "                                PcFastory S.A              \n";
                TextBoxBoleta.Text +="Casa Matriz: Oscar Bonilla 10679,\n" +
                                     "La Florida, Santiago\n" +
                                     "Giro : Copra y venta de articulos Electronico\n" +
                                     "R.U.T = 96.425.586-4\n" +
                                     "Boleta Electronica : " + 00000 + Buscar.ultimaVenta() + "\n" +
                                     "Terminar : " + 712 + "\n" +
                                     "Fecha : " + v.Fecha + "\n" +
                                     "Codigo        Articulo                  Cant       v.unit        Subtotal\n" +
                                     "------------------------------------------------------------------------------------\n";
                int total = 0;
                foreach (var item in carrito)
                {
                    string nombre = string.Format("{0,-25}", item.Nombre);
                    string stock = string.Format("{0,-10}", item.Stock);
                    string precio = string.Format("{0,-15}", item.Precio);
                    

                    TextBoxBoleta.Text += item.Id + "             " +  nombre + " " +stock + " " + precio +" "+item.Stock*item.Precio+ "\n";
                     total += item.Precio*item.Stock; 
                }
                TextBoxBoleta.Text += "Total a Pagar                                                     $     " + total+"\n";
                TextBoxBoleta.Text += "Cliente : " + user.Nombre + "  Rut :" + user.Rut;

            }
            else
            {
                Response.Redirect("~/Forms/Principal.aspx");
            }
        }
        protected void ButtonLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/Forms/Principal.aspx");
        }

       
    }
}