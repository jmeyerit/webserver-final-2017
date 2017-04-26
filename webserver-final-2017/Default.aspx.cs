using System;
using dsProductsByManufacturerTableAdapters;
using dsManufacturerTableAdapters;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.DataVisualization.Charting;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            InitializeData();
        }



        DataManipulator myDataManip = Chart1.DataManipulator;

        // Filtered points are only marked as empty.
        myDataManip.FilterSetEmptyPoints = false;

        // Filters all points where the first Y value is greater than 100. 
        // The input series is overwritten with the filtered data.    
        myDataManip.Filter(CompareMethod.MoreThan, 20, "#ProductsManufactured");

        // Filters all points where the X value is less than, or equal to, a specific date.    
        // The resulting data is stored in an output series, preserving the original data.    
        //myDataManip.Filter(CompareMethod.LessOrEqual, DateTime.Parse("1/1/2001").ToOADate(), "MySeries", "ResultSeries", "X");
    }

    private void InitializeData()
    {
        // Initialize lbManufacturer
        /* dsManufacturerTableAdapters.tManufacturerTableAdapter manufacturerTableAdapter = new dsManufacturerTableAdapters.tManufacturerTableAdapter();
         dsManufacturer.tManufacturerDataTable manufacturerDataTable = manufacturerTableAdapter.GetData();

         lbManufacturer.DataTextField = "Manufacturer";
         lbManufacturer.DataValueField = "ManufacturerID";
         lbManufacturer.DataSource = manufacturerDataTable;
         lbManufacturer.DataBind();
         lbManufacturer.SelectedIndex = 0;*/

        // Initialize 

        

    }
}