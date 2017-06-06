using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication2.App_Code;

namespace WebApplication2.Forms
{
    public partial class Productos : System.Web.UI.Page
    {
        public static DateTime tiempo = DateTime.Now;
        private static int contador = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] != null)
            {

                Usuario user = (Usuario)Session["user"];
                LabelBienvenido.Text = "Bienvenido " + user.Username + " ";
                PanelBienvenida.Visible = true;
                PanelLogin.Visible = false;
                if (user.Privilegio == true)
                {
                    PanelAdministracion.Visible = true;
                }
                else
                {
                    PanelAdministracion.Visible = false;
                }
                   
            }
            if (Session["carrito"]!=null)
            {
                PanelComprar.Visible = true;
            }
           
     
        }
        protected void ButtonIngresar_Click(object sender, EventArgs e)
        {
            string user = TextBoxUsuario.Text;
            string contraseña = TextBoxContraseña.Text;



            if (tiempo > DateTime.Now)
            {
                this.Page.Response.Write("<script language='JavaScript'>window.alert('cuenta bloqueada por 30 segundos');</script>");
                return;
            }


            if (Buscar.BuscarUsuario(user, contraseña) == true)
            {
                Usuario usuario = Buscar.BuscarUsuarioUser(user);
                contador = 0;
                Session["user"] = usuario;
                PanelBienvenida.Visible = true;
                PanelLogin.Visible = false;

                LabelBienvenido.Text = "Bienvenido " + user + " ";
                if (usuario.Privilegio==true)
                {
                    PanelAdministracion.Visible= true;
                }
                else
                {
                    PanelAdministracion.Visible = false;
                }
            }
            else
            {

                tiempo = DateTime.Now;
                contador++;
                this.Page.Response.Write("<script language='JavaScript'>window.alert('Error en usuario o contraseña');</script>");
            }
            if (contador == 3)
            {
                contador = 0;
                tiempo = DateTime.Now.AddSeconds(30);


            }
        }

        protected void ButtonLogout_Click(object sender, EventArgs e)
        {
            PanelLogin.Visible = false;
            PanelLogin.Visible = true;
            PanelAdministracion.Visible = false;
            Session.Abandon();
        }

     


        protected void DropDownListCategoriasB_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewProductos.DataSource = Buscar.BproductoCategoria(DropDownListCategoriasB.SelectedValue);
            GridViewProductos.DataBind();
        }

        protected void GridViewProductos_SelectedIndexChanged(object sender, EventArgs e)
        {
            
            List<Producto> carrito = new List<Producto>();
            if (Session["user"]==null)
            {
                this.Page.Response.Write("<script language='JavaScript'>window.alert('debes inciar session para agregar al carro');</script>");
            }
            else
            {
                GridViewRow fila = GridViewProductos.SelectedRow;
              
               int idProducto = Convert.ToInt32( GridViewProductos.DataKeys[fila.RowIndex].Value);
               TextBox ultracast =(TextBox) GridViewProductos.SelectedRow.FindControl("TextBoxUnidades");
                int cantidad =int.Parse( ultracast.Text);


                Producto p = Buscar.BproductoId(idProducto);
                p.Stock = cantidad;
                if (Session["carrito"]==null)
                {
                    carrito.Add(p);
                    Session["carrito"] = carrito;
                }
                else
                {
                    carrito = (List<Producto>)Session["carrito"];
                    carrito.Add(p);
                    Session["carrito"] = carrito;
                }
               PanelComprar.Visible = true;

            }
        }

        protected void ButtonComprar_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Forms/Compra.aspx");
        }
    }
}