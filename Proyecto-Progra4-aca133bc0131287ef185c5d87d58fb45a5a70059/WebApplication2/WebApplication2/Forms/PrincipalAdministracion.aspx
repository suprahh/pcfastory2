<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="PrincipalAdministracion.aspx.cs" Inherits="WebApplication2.Forms.PrincipalAdministracion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderCuadroLogin" runat="server">
  
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:HyperLink ID="HyperLinkAdProductos" NavigateUrl="~/Forms/MantenedorProductos.aspx" runat="server">Administracion de productos</asp:HyperLink>
    </div>
    <div>
        <asp:HyperLink ID="HyperLinkAdusuario" NavigateUrl="~/Forms/MantenedorUsuarios.aspx" runat="server">Administracion de Usuarios</asp:HyperLink>
    </div>
</asp:Content>
