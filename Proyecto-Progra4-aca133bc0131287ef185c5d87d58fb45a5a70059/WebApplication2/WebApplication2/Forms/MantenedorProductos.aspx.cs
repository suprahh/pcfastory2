using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication2.App_Code;
using System.Data;
using System.Data.SqlClient;
using System.Collections;

namespace WebApplication2.Forms
{

    public partial class MantenedorProductos : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] != null)
            {

                Usuario user = (Usuario)Session["user"];
                LabelBienvenido.Text = "Bienvenido " + user.Username + " ";
                PanelBienvenida.Visible = true;
               
                if (user.Privilegio == true)
                {
                    PanelAdministracion.Visible = true;
                }
                else
                {
                    Response.Redirect("~/Forms/Principal.aspx");
                }
            }
            else
            {
                Response.Redirect("~/Forms/Principal.aspx");
            }
        }

    

        protected void ButtonAgregarProducto_Click(object sender, EventArgs e)
        {
            PanelAgregarProducto.Visible = true;
            PanelMostrarProducto.Visible = false;
            PanelProductoDataList.Visible = false;
            PanelProductoEncontrado.Visible = false;
            BusquedaProducto.Visible = false;

        }

        protected void DropDownListInfoProducto_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownListInfoProducto.SelectedValue != "nada")
            {
                TextBoxBusquedaP.Visible = true;
                BusquedaProducto.Visible = true;
                LabelTipoPro.Text = "buscardo por " + DropDownListInfoProducto.SelectedItem.ToString() + " : ";
                if (DropDownListInfoProducto.SelectedValue == "4")
                {
                    TextBoxBusquedaP.Visible = false;
                    DropDownListCategoriasB.Visible = true; ;
                }
                else
                {
                    TextBoxBusquedaP.Visible = true ;
                    DropDownListCategoriasB.Visible = false;
                }
            }
            else
            {
              
                BusquedaProducto.Visible = false;
                PanelMostrarProducto.Visible = false;
            }

        }

        protected void ButtonBUscarProducto_Click(object sender, EventArgs e)
        {
            PanelMostrarProducto.Visible = true;
            PanelAgregarProducto.Visible = false;
        }

        protected void ButtonInsertProducto_Click(object sender, EventArgs e)
        {
            Producto p = new Producto();
            p.Nombre = TextBoxNombreProducto.Text;
            p.Descripcion = TextBoxDescripcion.Text;
            p.Precio = int.Parse(TextBoxPrecio.Text);
            p.Stock = int.Parse(TextBoxStock.Text);
            p.Foto = "~/FotoArticulos/" + FileUploadFoto.FileName;
            FileUploadFoto.SaveAs(Server.MapPath("~/FotoArticulos/" + FileUploadFoto.FileName));
            p.IdCategoria = int.Parse(DropDownListCategoria.SelectedValue);
            if (Agregar.AgregarProducto(p))
            {
                this.Page.Response.Write("<script language='JavaScript'>window.alert('se agrego correctamente');</script>");
            }
            else
            {
                this.Page.Response.Write("<script language='JavaScript'>window.alert('error al ingresar producto');</script>");
            }

        }

        protected void ButtonBuscarP_Click(object sender, EventArgs e)
        {
            buscarProductos();
        }

        protected void EdiatarProducto(object sender, GridViewEditEventArgs e)
        {
            GridViewProductosEncontrados.EditIndex = e.NewEditIndex;
            buscarProductos();

        }

        public void buscarProductos ()
        {
            List<Producto> productos = new List<Producto>();
            switch (int.Parse(DropDownListInfoProducto.SelectedValue))
            {

                case 1:
                    PanelProductoDataList.Visible = true;
                    PanelProductoEncontrado.Visible = false;
                
                    GridViewProductosEncontrados.DataSource = Buscar.BproductoNombre(TextBoxBusquedaP.Text);
                    GridViewProductosEncontrados.DataBind();
                    break;
                case 2:

                    PanelProductoDataList.Visible = false;
                    PanelProductoEncontrado.Visible = true;
                  
                    Producto p = Buscar.BproductoId(int.Parse(TextBoxBusquedaP.Text));

                    productos.Add(p);
                    DetailsViewProducto.DataSource = productos;
                    DetailsViewProducto.DataBind();
                    break;
                case 3:
                    PanelProductoDataList.Visible = true;
                    PanelProductoEncontrado.Visible = false;
          
                    GridViewProductosEncontrados.DataSource = Buscar.BproductoPrecio(int.Parse(TextBoxBusquedaP.Text));
                    GridViewProductosEncontrados.DataBind();
                    break;

                case 4:
                    PanelProductoDataList.Visible = true;
                    PanelProductoEncontrado.Visible = false;
  
                    GridViewProductosEncontrados.DataSource = Buscar.BproductoCategoria(DropDownListCategoriasB.SelectedValue);
                    GridViewProductosEncontrados.DataBind();


                    break;





                default:
                    this.Page.Response.Write("<script language='JavaScript'>window.alert('selecciona una categoria para buscar');</script>");
                    break;
            }
        }

        protected void DatoEditado(object sender, GridViewUpdatedEventArgs e)
        {
       

        }

        protected void ModificarProducto(object sender, GridViewUpdateEventArgs e)
        {
            Producto p = new Producto();
            var lista = e.NewValues;
            var id = e.NewValues[0];
            foreach (DictionaryEntry entry in e.NewValues)
            {


                p.Id = Convert.ToInt16( e.NewValues[0]);
                p.Nombre =Convert.ToString( e.NewValues[1]);
                p.Descripcion = Convert.ToString( e.NewValues[2]);
                p.Precio = Convert.ToInt32( e.NewValues[3]);
                p.Stock = Convert.ToInt32( e.NewValues[4]);
                p.Foto =Convert.ToString( e.NewValues[5]);
                if (Modificar.modificarProducto(p) == true)
                {
                    this.Page.Response.Write("<script language='JavaScript'>window.alert('se modificio con exito');</script>");
                 
                }
                else
                {
                    this.Page.Response.Write("<script language='JavaScript'>window.alert('no se modificio producto');</script>");
                  
                }
       
            }
            
           
        }

        protected void ButtonLogout_Click1(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/Forms/Principal.aspx");
        }

        protected void CancelarModificacion(object sender, GridViewCancelEditEventArgs e)
        {
            Response.Redirect("~/Forms/MantenedorProductos.aspx");
        }
    }
}