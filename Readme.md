<!-- default badges list -->
[![](https://img.shields.io/badge/Open_in_DevExpress_Support_Center-FF7200?style=flat-square&logo=DevExpress&logoColor=white)](https://supportcenter.devexpress.com/ticket/details/E83)
[![](https://img.shields.io/badge/📖_How_to_use_DevExpress_Examples-e9f6fc?style=flat-square)](https://docs.devexpress.com/GeneralInformation/403183)
<!-- default badges end -->
<!-- default file list -->
*Files to look at*:

* [Default.aspx](./CS/WebSite/Default.aspx) (VB: [Default.aspx](./VB/WebSite/Default.aspx))
* [Default.aspx.cs](./CS/WebSite/Default.aspx.cs) (VB: [Default.aspx.vb](./VB/WebSite/Default.aspx.vb))
<!-- default file list end -->
# FocusedRowChanged event and AJAX UpdatePanel
<!-- run online -->
**[[Run Online]](https://codecentral.devexpress.com/e83/)**
<!-- run online end -->


<p>This sample shows you how to synchronize the grid's focused row with other controls using callbacks. For this purpose, the grid and other control should reside within the same UpdatePanel.<br />
      <br />
      To properly set up the grid, set the <strong>EnableCallbacks</strong> property to <strong>false</strong>. This will force the grid to perform postbacks. Additionally, use the following event handler for the client <strong>FocusedRowChanged</strong> event:<br />
      <i>FocusedRowChanged="function(s, e) { grid.PerformCallback(); }"</i><br />
      <br />
      Please make sure to perform all necessary calculations in the web page's <strong>Load</strong> event handler. You can't use the <strong>FocusedRowChanged</strong> event, because it is called before loading the view state.</p>

<br/>


