<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="True" CodeBehind="~/Forms/MantenedorProductos.aspx.cs" Inherits="WebApplication2.Forms.MantenedorProductos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 277px;
        }
        .auto-style2 {
            margin-left: 0px;
            margin-bottom: 0px;
        }
        .auto-style3 {
            width: 241px;
            margin-left: 0px;
        }
        .auto-style4 {
            width: 241px;
        }
        
    </style>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderCuadroLogin" runat="server">
   
     <asp:Panel ID="PanelBienvenida" Visible="false"  runat="server">
        <asp:Label ID="LabelBienvenido" runat="server" Text=""></asp:Label>
        <asp:Button ID="ButtonLogout" runat="server" Text="Cerrar Session" OnClick="ButtonLogout_Click1" />
        <asp:Panel ID="PanelAdministracion" runat="server">
    <asp:HyperLink ID="HyperLinkMantenedorProducto" NavigateUrl="~/Forms/MantenedorProductos.aspx" runat="server">Mantenedor Productos</asp:HyperLink>
    <asp:HyperLink ID="HyperLinkMantenedorUsuario" NavigateUrl="~/Forms/MantenedorUsuarios.aspx" runat="server">Mantenedor Usuario</asp:HyperLink>
     </asp:Panel>
    </asp:Panel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <table style="width: 100%;">
        <tr>
            <td class="auto-style1"> <asp:Button ID="ButtonAgregarProducto" runat="server" Text="Agregar Producto" OnClick="ButtonAgregarProducto_Click" /> </td>
            <td class="auto-style3"> <asp:Button ID="ButtonBUscarProducto" runat="server" Text="Buscar Producto" OnClick="ButtonBUscarProducto_Click" /></td>
        </tr>
          <tr id="cuadroData">
              <td class="auto-style1"> <asp:Panel ID="PanelAgregarProducto" Visible="false" runat="server">
                  <asp:Label ID="Label1" runat="server" Text="Nombre : "></asp:Label>
                  <asp:TextBox ID="TextBoxNombreProducto" runat="server"></asp:TextBox><br />
                  <asp:Label ID="Label2" runat="server" Text="Descripcion : "></asp:Label>
                  <asp:TextBox ID="TextBoxDescripcion" runat="server" Height="69px" TextMode="MultiLine" Width="328px"></asp:TextBox><br />
                  <asp:Label ID="Label3" runat="server" Text="Precio : "></asp:Label>
                  <asp:TextBox ID="TextBoxPrecio" runat="server"></asp:TextBox><br />
                  <asp:Label ID="Label4" runat="server" Text="Stock : "></asp:Label>
                  <asp:TextBox ID="TextBoxStock" runat="server"></asp:TextBox><br />
                  <asp:Label ID="Label5" runat="server" Text="Foto : "></asp:Label>
                  <asp:FileUpload ID="FileUploadFoto" runat="server" /><br />
                  <asp:Label ID="Label6" runat="server" Text="Categoria : "></asp:Label>
                  <asp:DropDownList ID="DropDownListCategoria" runat="server">
                         <asp:ListItem Value="1">Tarjeta de video</asp:ListItem>
                          <asp:ListItem Value="2">Placa madre</asp:ListItem>
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
                  <br />
                  <asp:Button ID="ButtonInsertProducto" runat="server" Text="Agregar"  Width="117px" OnClick="ButtonInsertProducto_Click" /><br />
                  <asp:Label ID="LabelRespuestaAgregar" runat="server" Text=""></asp:Label>

                   </asp:Panel> 
                  </td>
              <td class="auto-style4">
                  <asp:Panel ID="PanelMostrarProducto" Visible="false" runat="server">
                      <asp:Label ID="Label7" runat="server" Text="Buscar por : "></asp:Label>
                      <asp:DropDownList ID="DropDownListInfoProducto" runat="server" OnSelectedIndexChanged="DropDownListInfoProducto_SelectedIndexChanged" AutoPostBack="True">
                          <asp:ListItem Value="0">Selecciona una Opcion</asp:ListItem>
                          <asp:ListItem Value="1">Nombre</asp:ListItem>
                          <asp:ListItem Value="2">Codigo</asp:ListItem>
                          <asp:ListItem Value="3">Precio</asp:ListItem>

                          <asp:ListItem Value="4">Categoria</asp:ListItem>

                      </asp:DropDownList>

                  </asp:Panel>
              </td>
              <td> 
                  <asp:Panel ID="BusquedaProducto" runat="server" Visible="false" CssClass="auto-style2">
                      <asp:Label ID="LabelTipoPro" runat="server" Text="Orden a dar : "></asp:Label> <asp:TextBox ID="TextBoxBusquedaP" runat="server"></asp:TextBox> <br /> <asp:DropDownList ID="DropDownListCategoriasB" runat="server" AutoPostBack="True">
                          <asp:ListItem Value="1">Tarjeta de video</asp:ListItem>
                          <asp:ListItem Value="2">Placa madre</asp:ListItem>
                          <asp:ListItem Value="3">Gabinete</asp:ListItem>
                          <asp:ListItem Value="4">Procesador</asp:ListItem>
                          <asp:ListItem Value="5">Memoria Ram</asp:ListItem>
                          <asp:ListItem Value="6">Monitor</asp:ListItem>
                          <asp:ListItem Value="7">SSD</asp:ListItem>
                          <asp:ListItem Value="8">Fuente de poder</asp:ListItem>
                          <asp:ListItem Value="9">Mouse</asp:ListItem>
                          <asp:ListItem Value="10">Disco duro</asp:ListItem>
                          <asp:ListItem Value="11">Cooler</asp:ListItem>
                      </asp:DropDownList> <br />
                      <asp:Button ID="ButtonBuscarP" runat="server" Text="Buscar" Width="211px" OnClick="ButtonBuscarP_Click" /><br />
                     
                      <asp:Panel ID="PanelProductoDataList" Visible="false" runat="server">
                          <asp:GridView ID="GridViewProductosEncontrados" runat="server" AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None" OnRowEditing="EdiatarProducto" OnRowUpdated="DatoEditado" OnRowUpdating="ModificarProducto" OnRowCancelingEdit="CancelarModificacion" >

                              <AlternatingRowStyle BackColor="PaleGoldenrod" />

                              <Columns>
                                  <asp:CommandField ButtonType="Link" EditText="modificar" ShowEditButton="true"  />
                                  <asp:TemplateField HeaderText="ID Producto">
                                      <ItemTemplate>
                                          <asp:Label ID="LabelIdProductoEncontrados" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                                      </ItemTemplate>
                                  </asp:TemplateField>
                                  <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                                  <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" />
                                  <asp:BoundField DataField="Precio" HeaderText="Precio" />
                                  <asp:BoundField DataField="Stock" HeaderText="Stock" />
                                  <asp:TemplateField HeaderText="Foto">
                                      <ItemTemplate>
                                          <asp:Image ID="Image2" runat="server" ImageUrl='<%# Bind("Foto") %>' />
                                      </ItemTemplate>
                                  </asp:TemplateField>
                                 
                                  <asp:TemplateField HeaderText="Categoria">
                                      <ItemTemplate>
                                          <asp:Label ID="Label8" runat="server" Text='<%# Bind("IdCategoria") %>'></asp:Label>
                                      </ItemTemplate>
                                  </asp:TemplateField>
                                 
                              </Columns>

                              <FooterStyle BackColor="Tan" />
                              <HeaderStyle BackColor="Tan" Font-Bold="True" />
                              <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                              <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                              <SortedAscendingCellStyle BackColor="#FAFAE7" />
                              <SortedAscendingHeaderStyle BackColor="#DAC09E" />
                              <SortedDescendingCellStyle BackColor="#E1DB9C" />
                              <SortedDescendingHeaderStyle BackColor="#C2A47B" />

                          </asp:GridView>
                      </asp:Panel>
                      <asp:Panel ID="PanelProductoEncontrado" Visible="false" runat="server">
                          <asp:DetailsView ID="DetailsViewProducto" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None"  >       
                              <AlternatingRowStyle BackColor="PaleGoldenrod" />
                              <EditRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                              <Fields>
                                  <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                                  <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" />
                                  <asp:BoundField DataField="Precio" HeaderText="Precio" />
                                  <asp:BoundField DataField="Stock" HeaderText="Stock" />
                                  <asp:TemplateField HeaderText="Foto">
                                      <ItemTemplate>
                                          <asp:Image ID="Image1" runat="server" ImageUrl='<%# Bind("Foto") %>' />
                                      </ItemTemplate>
                                  </asp:TemplateField>
                                  <asp:BoundField DataField="IdCategoria" HeaderText="Id Categoria" />
                                 
                              </Fields>
                               <FooterStyle BackColor="Tan" />
                              <HeaderStyle BackColor="Tan" Font-Bold="True" />
                              <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                               </asp:DetailsView>
                          </asp:Panel>
                 </asp:Panel>
              </td>
              </tr>
       
              </table>
</asp:Content>
