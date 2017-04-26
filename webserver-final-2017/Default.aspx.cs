/***********************************************************************************************************
* Final Project                                                                              Default.aspx.cs
* Justin Meyer
* IT3047C-001 Spring Semester
* meyer3js@mail.uc.edu
* This assignment demonstrates my ability to use data tools to create a dashboard
* This code behind file contains the logic for the various charts loaded
* Due Date: Wednesday, April 26th, 2017 by 6:00pm
* Citations: 
* 
* 
* REFERENCES:
* 
* 
* 
* ALWAYS think of the cat
* **********************************************************************************************************/

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
            try
            {
                Initialize();
                ShowChart();
                FilterValues();
            }
            catch { } // No see means no problems! ;3
            
        }
    }

    private void Initialize()
    {
        // Loads all the available charts in a DropDownList
        string[] chartType = Enum.GetNames(typeof(SeriesChartType));
        ddlChartType.DataSource = chartType;
        ddlChartType.DataBind();

        // Sets selected value to the default chart type
        ddlChartType.SelectedValue = "Bar";
    }

    protected void ddlSort_SelectedIndexChanged(object sender, EventArgs e)
    {
        FilterValues();
    }

    protected void ddlTop_SelectedIndexChanged(object sender, EventArgs e)
    {
        FilterValues();
    }

    /// <summary>
    /// This method filters the values of the charts based on their visibility. This also updates the values in the chart.
    /// </summary>
    private void FilterValues()
    {
        try
        {
            if (dProdManu.Visible == true)
            {
                // Bind Products Per Manufacturer
                cProductManufacturer.DataBind();
                cProductManufacturer.DataManipulator.FilterTopN(Convert.ToInt32(ddlTop.SelectedValue), cProductManufacturer.Series["Series"]);

                if (ddlSort.SelectedValue == "Ascending")
                {
                    cProductManufacturer.Series[0].Sort(PointSortOrder.Ascending, "Y");
                }
                else
                {
                    cProductManufacturer.Series[0].Sort(PointSortOrder.Descending, "Y");
                }
                cProductManufacturer.Series[0].ChartType = (SeriesChartType)Enum.Parse(typeof(SeriesChartType), ddlChartType.Text);
            }
            else if (dTransPerStore.Visible == true)
            {
                // Bind Transactions Per Store
                cTransactionsPerStore.DataBind();
                cTransactionsPerStore.DataManipulator.FilterTopN(Convert.ToInt32(ddlTop.SelectedValue), cTransactionsPerStore.Series["Series"]);

                if (ddlSort.SelectedValue == "Ascending")
                {
                    cTransactionsPerStore.Series[0].Sort(PointSortOrder.Ascending, "Y");
                }
                else
                {
                    cTransactionsPerStore.Series[0].Sort(PointSortOrder.Descending, "Y");
                }
                cTransactionsPerStore.Series[0].ChartType = (SeriesChartType)Enum.Parse(typeof(SeriesChartType), ddlChartType.Text);
            }
            else if (dEmployeesAtStore.Visible == true)
            {
                // Bind EmployeesAtStore
                cEmployeesAtStore.DataBind();
                cEmployeesAtStore.DataManipulator.FilterTopN(Convert.ToInt32(ddlTop.SelectedValue), cEmployeesAtStore.Series["Series"]);

                if (ddlSort.SelectedValue == "Ascending")
                {
                    cEmployeesAtStore.Series[0].Sort(PointSortOrder.Ascending, "Y");
                }
                else
                {
                    cEmployeesAtStore.Series[0].Sort(PointSortOrder.Descending, "Y");
                }
                cEmployeesAtStore.Series[0].ChartType = (SeriesChartType)Enum.Parse(typeof(SeriesChartType), ddlChartType.Text);
            }
        }
        catch { } // Nadda
          



    }

    protected void ddlChartType_SelectedIndexChanged(object sender, EventArgs e)
    {
        FilterValues();
    }

    protected void ddlData_SelectedIndexChanged(object sender, EventArgs e)
    {
        ShowChart();
    }

    /// <summary>
    /// Shows a chart based on the Selected value in the ddlData drop down list
    /// </summary>
    private void ShowChart()
    {
        switch (ddlData.SelectedValue)
        {
            case "0":
                dProdManu.Visible = true;
                dTransPerStore.Visible = false;
                dEmployeesAtStore.Visible = false;
                FilterValues();
                break;

            case "1":
                dProdManu.Visible = false;
                dTransPerStore.Visible = true;
                dEmployeesAtStore.Visible = false;
                FilterValues();
                break;
            case "2":
                dProdManu.Visible = false;
                dTransPerStore.Visible = false;
                dEmployeesAtStore.Visible = true;
                FilterValues();
                break;
        }
    }

    protected void timerTransaction_Tick(object sender, EventArgs e)
    {
        FilterValues();
    }

    protected void ddlTransactionType_SelectedIndexChanged(object sender, EventArgs e)
    {
        FilterValues();
    }

    protected void ddlStore_SelectedIndexChanged(object sender, EventArgs e)
    {
        FilterValues();
    }
}