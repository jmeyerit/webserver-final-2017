using System;
using dsProductsByManufacturerTableAdapters;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        tManufacturerTableAdapter manufacturerTableAdapter = new tManufacturerTableAdapter();
        dsProductsByManufacturer.tManufacturerDataTable manufacturerDataTable = manufacturerTableAdapter.GetData(null);

        manufacturerTableAdapter.
        ddlComputerCase.DataTextField = "ComputerCase";
        ddlComputerCase.DataValueField = "ComputerCaseID";
        ddlComputerCase.DataSource = computerCaseDataTable;
        ddlComputerCase.DataBind();
        ddlComputerCase.SelectedIndex = 0;
        GetParts(ddlComputerCase.SelectedValue);
    }
}