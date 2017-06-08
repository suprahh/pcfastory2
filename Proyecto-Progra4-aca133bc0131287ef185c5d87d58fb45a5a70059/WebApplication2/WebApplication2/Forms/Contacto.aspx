<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Contacto.aspx.cs" Inherits="WebApplication2.Forms.Contacto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
        <asp:Label CssClass="saludo" ID="LabelBienvenido" runat="server" Text=""></asp:Label>
        <asp:Button ID="ButtonLogout" runat="server" Text="Cerrar Session" OnClick="ButtonLogout_Click" />
        <asp:Panel ID="PanelAdministracion" runat="server">
    <asp:HyperLink ID="HyperLinkMantenedorProducto" CssClass="categoriasM" NavigateUrl="~/Forms/MantenedorProductos.aspx" runat="server">Mantenedor Productos</asp:HyperLink>
    <asp:HyperLink ID="HyperLinkMantenedorUsuario" CssClass="categoriasM" NavigateUrl="~/Forms/MantenedorUsuarios.aspx" runat="server">Mantenedor Usuario</asp:HyperLink>
     </asp:Panel>
    </asp:Panel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="quienes">
    <p>ubicacion: La Florida #10679</p>
    <p>Telefono: +56 8562-4785-15</p>
    <p>Email: PcFastory.ss@faStory.cl</p>
    <p>¡¡¡ Te Esperamos !!!</p>
    
</div>
</asp:Content>
