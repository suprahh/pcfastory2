using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication2.App_Code;

namespace WebApplication2.Forms
{
    public partial class Compra : System.Web.UI.Page
    {
        public static int contador = 0;
        protected void Page_Load(object sender, EventArgs e)
        { 
            if(!IsPostBack)
            {
                if (contador==0)
                {
                    if (Session["user"] != null)
                    {
                        Usuario user = (Usuario)Session["user"];
                        LabelBienvenido.Text = "bienvenido " + user.Nombre;
                    }
                    else
                    {
                        Response.Redirect("~/Forms/Principal.aspx");
                    }
                    if (Session["carrito"] != null)
                    {
                        List<Producto> carrito = new List<Producto>();
                        carrito = (List<Producto>)Session["carrito"];
                        GridViewCarrito.DataSource = carrito;
                        GridViewCarrito.DataBind();
                        LabelTotal.Text += totalizar(carrito);

                    }
                    contador++;
                }
            }
           
           
            
        }

        protected void ButtonLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/Forms/Principal.aspx");
            PanelAdministracion.Visible = false;
        }

        public int totalizar(List<Producto> productos)
        {
            int total = 0;
            foreach (var item in productos)
            {
                total += item.Precio * item.Stock;
            }
            return total;
        }

        protected void ButtonPagar_Click(object sender, EventArgs e)
        {
            Venta v = new Venta();
            List<Producto> carrito = new List<Producto>();
            carrito = (List<Producto>)Session["carrito"];
            v.Total = totalizar(carrito);
            v.Fecha = DateTime.Now;
            Session["venta"] = v;
            if (Agregar.AgregarVenta(v)==false)
            {
                this.Page.Response.Write("<script language='JavaScript'>window.alert('error al procesar la venta');</script>");
            }
           
            Usuario user = (Usuario)Session["user"];
            int idVenta = Buscar.ultimaVenta();
            int idUsuario = Buscar.IdUsuario(user.Rut);
            foreach (var item in carrito)
            {
                if (!Agregar.AgregarDetalle(idVenta, idUsuario,item.Id))
                {
                    this.Page.Response.Write("<script language='JavaScript'>window.alert('error al procesar la venta');</script>");
                }
            }
            Response.Redirect("~/Forms/Boleta.aspx");
        }

        protected void GridViewCarrito_SelectedIndexChanged(object sender, EventArgs e)
        {
            Label ultracast1 = (Label)GridViewCarrito.SelectedRow.FindControl("LabelId");
            int idProducto = int.Parse(ultracast1.Text);
            TextBox ultracast = (TextBox)GridViewCarrito.SelectedRow.FindControl("TextBoxCantidad");
            int cantidad = int.Parse(ultracast.Text);
            List<Producto> carrito = new List<Producto>();
            carrito = (List<Producto>)Session["carrito"];
            foreach (var item in carrito)
            {
                if (item.Id == idProducto)
                {
                    item.Stock = cantidad;
                }
            }

            GridViewCarrito.DataSource = carrito;
            GridViewCarrito.DataBind();
            LabelTotal.Text = totalizar(carrito).ToString();

        }

        protected void Eliminar(object sender, GridViewDeleteEventArgs e)
        {
            int indice = e.RowIndex;
            List<Producto> carrito = new List<Producto>();
            carrito = (List<Producto>)Session["carrito"];
            int contador = 0;
            foreach (var item in carrito)
            {
               
                if (contador==indice)
                {
                    carrito.Remove(item);
                    break;

                }
                contador++;

            }
           
            GridViewCarrito.DataSource = carrito;
            GridViewCarrito.DataBind();
            LabelTotal.Text = totalizar(carrito).ToString();
        }
    }
}