<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Compra.aspx.cs" Inherits="WebApplication2.Forms.Compra" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderCuadroLogin" runat="server">
    <asp:Panel ID="PanelBienvenida" Visible="false"  runat="server">
        <asp:Label ID="LabelBienvenido" runat="server" Text=""></asp:Label>
        <asp:Button ID="ButtonLogout" runat="server" Text="Cerrar Session" OnClick="ButtonLogout_Click" />
        <asp:Panel ID="PanelAdministracion" runat="server">
    <asp:HyperLink ID="HyperLinkMantenedorProducto" NavigateUrl="~/Forms/MantenedorProductos.aspx" runat="server">Mantenedor Productos</asp:HyperLink>
    <asp:HyperLink ID="HyperLinkMantenedorUsuario" NavigateUrl="~/Forms/MantenedorUsuarios.aspx" runat="server">Mantenedor Usuario</asp:HyperLink>
     </asp:Panel>
    </asp:Panel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="GridViewCarrito" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridViewCarrito_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ButtonType="Button" SelectText="Cambiar cantidad"  ShowSelectButton="True" />
            <asp:CommandField ButtonType="Button" ShowDeleteButton="True" />
            <asp:TemplateField HeaderText="Id">
                <ItemTemplate>
                    <asp:Label ID="LabelId" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
            <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" />
            <asp:BoundField DataField="Precio" HeaderText="Precio" />
            <asp:TemplateField HeaderText="Cantidad">
                <ItemTemplate>
                    <asp:TextBox ID="TextBoxCantidad" Width="25px" runat="server" Text='<%# Bind("Stock") %>'></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Foto">
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Bind("Foto") %>' />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
    <asp:Label ID="LabelTotal" BackColor="#0066ff" ForeColor="White" runat="server" Text="Total a pagar : "></asp:Label>
    <asp:Button ID="ButtonPagar"  runat="server" Text="Pagar" OnClick="ButtonPagar_Click" />
</asp:Content>
