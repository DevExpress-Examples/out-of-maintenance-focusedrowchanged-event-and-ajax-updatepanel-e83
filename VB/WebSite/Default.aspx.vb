Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Imports System.Configuration
Imports System.Collections
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls

Partial Public Class Grid_FocusedRow_UpdateTextBox_UpdateTextBoxOnFocusedRowChanged
	Inherits System.Web.UI.Page
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
		SetTotals()
	End Sub
	Protected Sub grid_FocusedRowChanged(ByVal sender As Object, ByVal e As EventArgs)
		'You can't change the value here because this method is called before loading the view state
		'As a result the txtTotals.Text will be replaced with the old value
	End Sub
	Private Sub SetTotals()
		Dim discount As Integer = 0
		If (Not Integer.TryParse(txtDiscount.Text, discount)) Then
		Return
		End If
		If discount < 0 OrElse discount > 100 Then
		Return
		End If
		Dim focusedIndex As Integer 'on the first load it may be -1
		If grid.FocusedRowIndex < 0 Then
			focusedIndex = 0
		Else
			focusedIndex = grid.FocusedRowIndex
		End If
		Dim values As Object() = CType(grid.GetRowValues(focusedIndex, "Quantity", "UnitPrice"), Object())
		If values(0) Is Nothing OrElse values(1) Is Nothing Then
		Return
		End If
		Dim quantity As Integer = Convert.ToInt32(values(0))
		Dim unitPrice As Decimal = Convert.ToDecimal(values(1))
		txtTotals.Text = String.Format("{0:c}", quantity * (unitPrice * (100 - discount) / 100))
	End Sub
End Class
