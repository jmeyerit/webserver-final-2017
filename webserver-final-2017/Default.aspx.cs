using System;
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
            // Loads all the available charts in a DropDownList
            string[] chartType = Enum.GetNames(typeof(SeriesChartType));
            ddlChartType.DataSource = chartType;
            ddlChartType.DataBind();

            // Sets selected value to the default chart type
            ddlChartType.SelectedValue = "Bar";
            FilterValues();   
        }
    }

    protected void ddlSort_SelectedIndexChanged(object sender, EventArgs e)
    {
        FilterValues();
    }

    protected void ddlTop_SelectedIndexChanged(object sender, EventArgs e)
    {
        FilterValues();
    }

    private void FilterValues()
    {
       /* cProductManufacturer.DataBind();
        cProductManufacturer.DataManipulator.FilterTopN(Convert.ToInt32(ddlTop.SelectedValue), cProductManufacturer.Series["Series"]);

        if (ddlSort.SelectedValue == "Ascending")
        {
            cProductManufacturer.Series["Series"].Sort(PointSortOrder.Ascending, "Y");
        }
        else
        {
            cProductManufacturer.Series["Series"].Sort(PointSortOrder.Descending, "Y");
        }
        cProductManufacturer.Series["Series"].ChartType = (SeriesChartType)Enum.Parse(typeof(SeriesChartType), ddlChartType.Text);
    */
    }

    protected void ddlChartType_SelectedIndexChanged(object sender, EventArgs e)
    {
        FilterValues();
    }

    protected void ddlData_SelectedIndexChanged(object sender, EventArgs e)
    {
        
    }

    protected void timerTransaction_Tick(object sender, EventArgs e)
    {
       // Chart2.Series[0].Points.AddY(5);
        //Chart2.Series[0].Points.InsertY(step, 5);
    }
}