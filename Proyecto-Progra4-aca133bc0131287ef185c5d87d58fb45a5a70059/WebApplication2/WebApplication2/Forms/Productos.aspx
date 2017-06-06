<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Productos.aspx.cs" Inherits="WebApplication2.Forms.Productos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderCuadroLogin" runat="server">
      <asp:Panel ID="PanelLogin" runat="server">


    <div id="puser">
        <div>
         
        <asp:Label ID="Label1" runat="server" Text="Usuario :"></asp:Label>
        <asp:TextBox ID="TextBoxUsuario" runat="server"></asp:TextBox> 
    </div>
    <div>
        <asp:Label ID="Label2" runat="server" Text="Contraseña :"></asp:Label>
        <asp:TextBox ID="TextBoxContraseña" runat="server"></asp:TextBox>
    </div>
    <div>
        <asp:Button ID="ButtonIngresar" runat="server" Text="Ingresar" OnClick="ButtonIngresar_Click" />
    </div>
  </div> 
    </asp:Panel>
    <asp:Panel ID="PanelBienvenida" Visible="false"  runat="server">
        <asp:Label ID="LabelBienvenido" runat="server" Text=""></asp:Label>
        <asp:Button ID="ButtonLogout" runat="server" Text="Cerrar Session" OnClick="ButtonLogout_Click" />
        <asp:Panel ID="PanelAdministracion" runat="server">
    <asp:HyperLink ID="HyperLinkMantenedorProducto" NavigateUrl="~/Forms/MantenedorProductos.aspx" runat="server">Mantenedor Productos</asp:HyperLink>
    <asp:HyperLink ID="HyperLinkMantenedorUsuario" NavigateUrl="~/Forms/MantenedorUsuarios.aspx" runat="server">Mantenedor Usuario</asp:HyperLink>
     </asp:Panel>
    </asp:Panel>
    <asp:Panel ID="PanelComprar" Visible="false" runat="server">
        <asp:Button ID="ButtonComprar" runat="server" Text="Ir al carrito" OnClick="ButtonComprar_Click" />
    </asp:Panel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
 <asp:DropDownList ID="DropDownListCategoriasB" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownListCategoriasB_SelectedIndexChanged">
                          <asp:ListItem Value="1">Tarjeta de video</asp:ListItem>
                          <asp:ListItem Value="1">Placa madre</asp:ListItem>
                          <asp:ListItem Value="3">Gabinete</asp:ListItem>
                          <asp:ListItem Value="4">Procesador</asp:ListItem>
                          <asp:ListItem Value="5">Memoria Ram</asp:ListItem>
                          <asp:ListItem Value="6">Monitor</asp:ListItem>
                          <asp:ListItem Value="7">SSD</asp:ListItem>
                          <asp:ListItem Value="8">Fuente de poder</asp:ListItem>
                          <asp:ListItem Value="9">Mouse</asp:ListItem>
                          <asp:ListItem Value="10">Disco duro</asp:ListItem>
                          <asp:ListItem Value="11">Cooler</asp:ListItem>
                      </asp:DropDownList>
      
        <asp:GridView ID="GridViewProductos" runat="server"  AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="Id" OnSelectedIndexChanged="GridViewProductos_SelectedIndexChanged" >
            <Columns>
                <asp:CommandField HeaderText="Agrega" ButtonType="Button" SelectText="Agregar al carro"  ShowSelectButton="True" />
                <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                <asp:BoundField HeaderText="Descripcion" DataField="Descripcion" />
                <asp:BoundField HeaderText="Precio" DataField="Precio" />
                <asp:TemplateField HeaderText="Unidades">
                    <ItemTemplate>
                        <asp:TextBox ID="TextBoxUnidades" Width="20px"  runat="server"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField  HeaderText="Foto">
                    <ItemTemplate>
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# Bind("Foto") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>
    </div>

</asp:Content>
