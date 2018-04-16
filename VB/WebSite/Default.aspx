<%-- BeginRegion Page setup --%>
<%@ Page Language="vb" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="Grid_FocusedRow_UpdateTextBox_UpdateTextBoxOnFocusedRowChanged" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v7.3" Namespace="DevExpress.Web.ASPxEditors"  TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v7.3" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v7.3" Namespace="DevExpress.Web.ASPxPager" TagPrefix="dxwp" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"  Namespace="System.Web.UI" TagPrefix="asp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%-- EndRegion --%>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
	<title>FocusedRowChanged event and AJAX UpdatePanel</title>
</head>
<body>
	<form id="form1" runat="server">

	<asp:ScriptManager ID="ScriptManager" runat="server">  </asp:ScriptManager>
	<asp:UpdatePanel ID="UpdatePanel" UpdateMode="Always" runat="server">
		<ContentTemplate>
	 <dxwgv:ASPxGridView ID="grid" ClientInstanceName="grid" runat="server" DataSourceID="AccessDataSource1" KeyFieldName="OrderID" Width="100%" AutoGenerateColumns="False" EnableCallBacks="false" OnFocusedRowChanged="grid_FocusedRowChanged">
		<Columns>
			<dxwgv:GridViewDataColumn FieldName="CompanyName" VisibleIndex="0">
			</dxwgv:GridViewDataColumn>
			<dxwgv:GridViewDataColumn FieldName="City" VisibleIndex="1">
			</dxwgv:GridViewDataColumn>
			<dxwgv:GridViewDataColumn FieldName="Region" VisibleIndex="2">
			</dxwgv:GridViewDataColumn>
			<dxwgv:GridViewDataColumn FieldName="Country" VisibleIndex="3">
			</dxwgv:GridViewDataColumn>
			<dxwgv:GridViewDataColumn FieldName="Quantity" VisibleIndex="5" Name="Quantity">
			</dxwgv:GridViewDataColumn>
			<dxwgv:GridViewDataTextColumn FieldName="UnitPrice" VisibleIndex="4">
				<PropertiesTextEdit DisplayFormatString="c">
				</PropertiesTextEdit>
			</dxwgv:GridViewDataTextColumn>
		</Columns>
		<SettingsBehavior AllowFocusedRow="True" />
		<ClientSideEvents FocusedRowChanged="function(s, e) { grid.PerformCallback(); }" />
	</dxwgv:ASPxGridView>
	<br/>
	Discount: <asp:TextBox ID="txtDiscount" runat="server" Width="100" Text="10"></asp:TextBox>
	Totals : <asp:TextBox ID="txtTotals" runat="server" Enabled="false" Width="100"></asp:TextBox>
	</ContentTemplate>
	</asp:UpdatePanel>
	<%-- BeginRegion DataSource --%>
	<asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/nwind.mdb"
		SelectCommand="SELECT [Customers.CompanyName] AS CompanyName, [City], [Region], [Country], [Salesperson], [OrderID], [OrderDate], [ProductID], [ProductName], [UnitPrice], [Quantity], [Discount], [ExtendedPrice], [Freight] FROM [Invoices]">
	</asp:AccessDataSource>
	<%-- EndRegion --%>
	</form>
</body>
</html>
