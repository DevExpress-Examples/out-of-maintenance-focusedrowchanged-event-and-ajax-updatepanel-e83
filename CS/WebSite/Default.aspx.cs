using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class Grid_FocusedRow_UpdateTextBox_UpdateTextBoxOnFocusedRowChanged : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e) {
        SetTotals();
    }
    protected void grid_FocusedRowChanged(object sender, EventArgs e) {
        //You can't change the value here because this method is called before loading the view state
        //As a result the txtTotals.Text will be replaced with the old value
    }
    void SetTotals() {
        int discount = 0;
        if(!int.TryParse(txtDiscount.Text, out discount)) return;
        if(discount < 0 || discount > 100) return;
        int focusedIndex = grid.FocusedRowIndex < 0 ? 0 : grid.FocusedRowIndex; //on the first load it may be -1
        object[] values = (object[])grid.GetRowValues(focusedIndex, "Quantity", "UnitPrice");
        if(values[0] == null || values[1] == null) return;
        int quantity = Convert.ToInt32(values[0]);
        decimal unitPrice = Convert.ToDecimal(values[1]);
        txtTotals.Text = string.Format("{0:c}", quantity * (unitPrice * (100 - discount) / 100));
    }
}
