<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Boleta.aspx.cs" Inherits="WebApplication2.Forms.Boleta" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderCuadroLogin" runat="server">
    <asp:Label CssClass="saludo" ID="LabelBienvenida" runat="server" Text="Label"></asp:Label>
     <asp:Button ID="ButtonLogout" runat="server" Text="Cerrar session" OnClick="ButtonLogout_Click" />
    <asp:Panel ID="PanelAdministracion" runat="server">
    <asp:HyperLink ID="HyperLinkMantenedorProducto" NavigateUrl="~/Forms/MantenedorProductos.aspx" runat="server">Mantenedor Productos</asp:HyperLink>
    <asp:HyperLink ID="HyperLinkMantenedorUsuario" NavigateUrl="~/Forms/MantenedorUsuarios.aspx" runat="server">Mantenedor Usuario</asp:HyperLink>
     </asp:Panel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:TextBox ID="TextBoxBoleta" TextMode="MultiLine"  runat="server" Height="301px" Width="785px"></asp:TextBox>
</asp:Content>
