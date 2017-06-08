<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="QuienesSomos.aspx.cs" Inherits="WebApplication2.Forms.QuienesSomos" %>
<asp:Content ID="ContentHeader" ContentPlaceHolderID="head" runat="server">
    <link href="../css/estiloQuienes.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderCuadroLogin" runat="server">
     <asp:Panel ID="PanelLogin" runat="server">


    <div id="puser">
        <div>
        <asp:Label CssClass="datosLogin" ID="Label1" runat="server" Text="Usuario :"></asp:Label>
        <asp:TextBox CssClass="datosLogin" ID="TextBoxUsuario" runat="server"></asp:TextBox> 
    </div>
    <div>
        <asp:Label CssClass="datosLogin" ID="Label2" runat="server" Text="Contraseña :"></asp:Label>
        <asp:TextBox CssClass="datosLogin" ID="TextBoxContraseña" TextMode="Password" runat="server"></asp:TextBox>
    </div>
    <div>
        <asp:Button ID="ButtonIngresar" runat="server" Text="Ingresar" OnClick="ButtonIngresar_Click" />
    </div>
  </div> 
    </asp:Panel>
    <asp:Panel ID="PanelBienvenida" Visible="false"  runat="server">
        <asp:Label ID="LabelBienvenido" CssClass="saludo" runat="server" Text=""></asp:Label>
        <asp:Button ID="ButtonLogout" runat="server" Text="Cerrar Session" OnClick="ButtonLogout_Click" />
        <asp:Panel ID="PanelAdministracion" runat="server">
    <asp:HyperLink ID="HyperLinkMantenedorProducto" CssClass="categoriasM" NavigateUrl="~/Forms/MantenedorProductos.aspx" runat="server">Mantenedor Productos</asp:HyperLink>
    <asp:HyperLink ID="HyperLinkMantenedorUsuario" CssClass="categoriasM" NavigateUrl="~/Forms/MantenedorUsuarios.aspx" runat="server">Mantenedor Usuario</asp:HyperLink>
     </asp:Panel>
    </asp:Panel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="quienes">
    <p>PcFastory es una nueva empresa dirigida al rubro del armado
    y soporte tecnico especializado en PC GAMERS, se enfoca en satisfacer
    todas las necesidades de nuestros clientes, con el fin de generar lazos,
    de confianza y servicio de calidad.
    
    MISION: PcFaStory tiene por mision ser la empresa de venta de HARDWARE
    con mejor servicio de asistencia a los clientes, desde clientes
    con pocos conocimientos tecnicos sobre las nuevas tecnologias, hasta
    clientes que manejan ya un lenguaje tecnologico, con el fin de 
    adaptarnos a todas las necesidades de los clientes.

    VISION: Crecer como empresa a tal punto de ser la mejor en cuanto
    a accebilididad para nuestros clientes, con la capacidad de proveer
    de una eficiencia destacable para hacer el servicio mucho mas expedito</p>
    
</div>
</asp:Content>
