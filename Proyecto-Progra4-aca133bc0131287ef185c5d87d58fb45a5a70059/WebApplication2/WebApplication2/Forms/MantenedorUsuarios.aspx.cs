using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication2.App_Code;


namespace WebApplication2
{
    public partial class MantenedorUsuarios : System.Web.UI.Page
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

        protected void ButtonLogout_Click(object sender, EventArgs e)
        {
       
            Session.Abandon();
        }

        protected void ButtonAgregarUsuario_Click(object sender, EventArgs e)
        {
            Usuario user = new Usuario();
            user.Rut = int.Parse(TextBoxRut.Text);
            user.Nombre = TextBoxNombre.Text;
            user.Mail = TextBoxMail.Text;
            user.Username = TextBoxUser.Text;
            user.Password = TextBoxContraseña.Text;
            user.Privilegio = false;
            if (Agregar.AgregarUsuario(user))
            {
                this.Page.Response.Write("<script language='JavaScript'>window.alert('se agrego correctamente');</script>");
            }
            else this.Page.Response.Write("<script language='JavaScript'>window.alert('error al ingresar producto');</script>");

        }

        protected void ButtonBuscar_Click(object sender, EventArgs e)
        {
            PanelBuscarUsuario.Visible = true;
            PanelAgregarusuario.Visible = false;
        }

      

       

        protected void ButtonAgregar_Click(object sender, EventArgs e)
        {
            PanelAgregarusuario.Visible = true;
            PanelBuscarUsuario.Visible = false;
        }

        protected void ButtonBuscarUsuario_Click1(object sender, EventArgs e)
        {
         Usuario user =    Buscar.BuscarUsuarioRut(Convert.ToInt32(TextBoxRutb.Text));
            List<Usuario> listaUser = new List<Usuario>();
            listaUser.Add(user);
            DetailsViewUsuario.DataSource = listaUser;
            DetailsViewUsuario.DataBind();

        }

        protected void EditarUsuario(object sender, EventArgs e)
        {
           
          
            
        }

        protected void ModificarUsuario(object sender, DetailsViewUpdatedEventArgs e)
        {
           
        }

        protected void ModificaUsario(object sender, DetailsViewUpdateEventArgs e)
        {
            Usuario user = new Usuario();
            foreach (DictionaryEntry entry in e.NewValues)
            {


                user.Rut = Convert.ToInt32(e.NewValues[0]);
                user.Nombre = Convert.ToString(e.NewValues[1]);
                user.Mail = Convert.ToString(e.NewValues[2]);
                user.Username = Convert.ToString(e.NewValues[3]);
                user.Privilegio = Convert.ToBoolean(e.NewValues[4]);
                if (Modificar.modificarUsuario(user) == true)
                {
                    this.Page.Response.Write("<script language='JavaScript'>window.alert('se modificio con exito');</script>");
                    return;
                }
                else
                {
                    this.Page.Response.Write("<script language='JavaScript'>window.alert('no se modificio el  usuario');</script>");
                    Response.Redirect("~/Forms/MantenedorUsuarios.aspx");
                }

            }
        }

        protected void Cancelar(object sender, DetailsViewModeEventArgs e)
        {
            Response.Redirect("~/Forms/MantenedorUsuarios.aspx");
        }
    }
}