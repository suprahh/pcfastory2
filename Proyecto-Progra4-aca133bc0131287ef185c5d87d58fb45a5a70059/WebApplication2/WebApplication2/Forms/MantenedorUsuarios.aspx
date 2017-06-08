<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="MantenedorUsuarios.aspx.cs" Inherits="WebApplication2.MantenedorUsuarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderCuadroLogin" runat="server">
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
    <div class="labelregistro">
    <div>
         <asp:Button ID="ButtonAgregar"  runat="server" Text="Agregar Usuario" OnClick="ButtonAgregar_Click" />
     </div>
    
    <div>
         <asp:Panel Visible="false" ID="PanelAgregarusuario" runat="server">
        <div>  
            <asp:Label ID="Label1" runat="server" Text="Rut : "></asp:Label>
            <asp:TextBox ID="TextBoxRut" runat="server"></asp:TextBox>
        </div>
        <div>  
            <asp:Label ID="Label2" runat="server" Text="Nombre :"></asp:Label>
            <asp:TextBox ID="TextBoxNombre" runat="server"></asp:TextBox>
        </div>
        <div>  
            <asp:Label ID="Label3" runat="server" Text="Email"></asp:Label>
            <asp:TextBox ID="TextBoxMail" runat="server"></asp:TextBox>
        </div>
        <div>  
            <asp:Label ID="Label4" runat="server" Text="Usuario :"></asp:Label>
            <asp:TextBox ID="TextBoxUser" runat="server"></asp:TextBox>
        </div>
        <div>
            <asp:Label ID="Label5" runat="server" Text="Contraseña :"></asp:Label>
            <asp:TextBox ID="TextBoxContraseña" TextMode="Password" runat="server"></asp:TextBox>
        </div>
        <div>
            <asp:Button ID="ButtonAgregarUsuario" runat="server" Text="Agregar" OnClick="ButtonAgregarUsuario_Click" />
        </div>
      </asp:Panel>
    </div>
  </div>  
    <div>
        <div>
            <asp:Button ID="ButtonBuscar" runat="server" Text="Buscar Usuario" OnClick="ButtonBuscar_Click" />
        </div>
        <div class="labelregistro">
            <asp:Panel ID="PanelBuscarUsuario" Visible="false" runat="server">
               
                 <div>
                     <asp:Label ID="Label6" runat="server" Text="Ingrese RUT a buscar : "></asp:Label>
                     <asp:TextBox ID="TextBoxRutb"  runat="server"></asp:TextBox>

                </div>
                
                <div>
                    <asp:Button ID="ButtonBuscarUsuario" runat="server" Text="Buscar" OnClick="ButtonBuscarUsuario_Click1" />
                </div>
            </asp:Panel>
        </div>
        <div>
         <asp:Panel ID="PanelBusqueda" runat="server">
            <asp:DetailsView ID="DetailsViewUsuario" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" DefaultMode="Edit" OnItemUpdated="ModificarUsuario" OnItemUpdating="ModificaUsario" OnModeChanged="EditarUsuario" OnModeChanging="Cancelar">
                <AlternatingRowStyle BackColor="#F7F7F7" />
                <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                <Fields>
                    <asp:TemplateField HeaderText="Rut">
                        <ItemTemplate>
                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("Rut") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                    <asp:BoundField HeaderText="Email" DataField="Mail" />
                    <asp:BoundField HeaderText="Nombre de Usuario" DataField="Username" />
                    <asp:CheckBoxField HeaderText="Privilegio" DataField="Privilegio" />
                    <asp:CommandField ButtonType="Link" EditText="modificar" ShowEditButton="true"  />
                </Fields>
                <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
            </asp:DetailsView>
             </asp:Panel>
        </div>
    </div>
</asp:Content>
