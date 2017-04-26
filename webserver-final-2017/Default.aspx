<%@ Page Title="Grocery Store Simulator Business Intelligence Dashboard" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager" runat="server"></asp:ScriptManager>
    <div class="text-center">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:Timer ID="timerTransaction" runat="server" OnTick="timerTransaction_Tick" Interval="10000"></asp:Timer>
                <asp:DropDownList CssClass="form-control w-50 m-auto" ID="ddlData" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlData_SelectedIndexChanged">
                    <asp:ListItem Text="Products By Manufacturer" Value="0"></asp:ListItem>
                    <asp:ListItem Text="Transactions Per Store" Value="1"></asp:ListItem>
                    <asp:ListItem Text="Employees Per Store" Value="2"></asp:ListItem>
                </asp:DropDownList>
                <div class="input-group w-50 m-auto">
                    <asp:DropDownList CssClass="form-control" ID="ddlTop" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlTop_SelectedIndexChanged">
                        <asp:ListItem Value="1">Top 1</asp:ListItem>
                        <asp:ListItem Value="3">Top 3</asp:ListItem>
                        <asp:ListItem Selected="True" Value="5">Top 5</asp:ListItem>
                        <asp:ListItem Value="10">Top 10</asp:ListItem>
                        <asp:ListItem Value="25">Top 25</asp:ListItem>
                    </asp:DropDownList>
                    <asp:DropDownList CssClass="form-control" ID="ddlSort" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlSort_SelectedIndexChanged">
                        <asp:ListItem Value="Ascending">Ascending</asp:ListItem>
                        <asp:ListItem Value="Descending">Descending</asp:ListItem>
                    </asp:DropDownList>
                    <asp:DropDownList CssClass="form-control" ID="ddlChartType" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlChartType_SelectedIndexChanged"></asp:DropDownList>
                </div>
                <div id="dProdManu" runat="server">

                    <asp:Chart ID="cProductManufacturer" runat="server" Height="750px" Width="1000px" DataSourceID="sqlProductsManufactured">
                        <Titles>
                            <asp:Title Font="Times New Roman, 20pt, style=Bold, Italic" Name="tProductsManufactured"
                                Text="Products Manufactured By Manufacturer">
                            </asp:Title>
                        </Titles>
                        <Series>
                            <asp:Series Name="Series" ChartType="Bar" XValueMember="Manufacturer" YValueMembers="#ProductsManufactured"></asp:Series>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea">
                                <AxisX Interval="1" LabelAutoFitMaxFontSize="24"></AxisX>
                                <Area3DStyle Enable3D="True" Inclination="15" IsRightAngleAxes="False" LightStyle="Realistic" Rotation="5" />
                            </asp:ChartArea>
                        </ChartAreas>
                    </asp:Chart>
                    <asp:SqlDataSource ID="sqlProductsManufactured" runat="server" ConnectionString="<%$ ConnectionStrings:GroceryStoreSimulatorConnectionString %>" SelectCommand="SELECT tManufacturer.Manufacturer, COUNT(tProduct.ProductID) AS [#ProductsManufactured] FROM tManufacturer INNER JOIN tProduct ON tManufacturer.ManufacturerID = tProduct.ManufacturerID INNER JOIN tName ON tProduct.NameID = tName.NameID GROUP BY tManufacturer.ManufacturerID, tManufacturer.Manufacturer ORDER BY [#ProductsManufactured] DESC"></asp:SqlDataSource>
                </div>
                <div id="dTransPerStore" runat="server">
                    <asp:Chart ID="cTransactionsPerStore" runat="server" Height="750px" DataSourceID="sqlTransactionsPerStore" Width="1000px">
                        <Titles>
                            <asp:Title Font="Times New Roman, 20pt, style=Bold, Italic" Name="tTransPerStore"
                                Text="#Transactions Per Store">
                            </asp:Title>
                        </Titles>
                        <Series>
                            <asp:Series Name="Series" ChartType="Bar" XValueMember="Store" YValueMembers="#TransactionsPerStore"></asp:Series>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1">
                                <AxisX Interval="1" LabelAutoFitMaxFontSize="24"></AxisX>
                                <Area3DStyle Enable3D="True" Inclination="15" IsRightAngleAxes="False" LightStyle="Realistic" Rotation="5" />
                            </asp:ChartArea>
                        </ChartAreas>
                    </asp:Chart>
                    <asp:DropDownList CssClass="form-control w-50 m-auto" ID="ddlTransactionType" runat="server" AppendDataBoundItems="true" AutoPostBack="True" DataSourceID="sqlTransactionType" DataTextField="TransactionType" DataValueField="TransactionTypeID" OnSelectedIndexChanged="ddlTransactionType_SelectedIndexChanged">
                        <asp:ListItem Text="All Transaction Types" Value="" />

                    </asp:DropDownList>
                    <asp:DropDownList CssClass="form-control w-50 m-auto" ID="ddlStoreTransactions" AppendDataBoundItems="true" runat="server" AutoPostBack="True" DataSourceID="sqlStore" DataTextField="Store" DataValueField="StoreID" OnSelectedIndexChanged="ddlStore_SelectedIndexChanged">
                        <asp:ListItem Text="All Stores" Value="" />
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="sqlTransactionType" runat="server" CancelSelectOnNullParameter="False" ConnectionString="<%$ ConnectionStrings:GroceryStoreSimulatorConnectionString %>" SelectCommand="SELECT TransactionTypeID, TransactionType FROM tTransactionType"></asp:SqlDataSource>
                </div>
                <asp:SqlDataSource ID="sqlTransactionsPerStore" runat="server" ConnectionString="<%$ ConnectionStrings:GroceryStoreSimulatorConnectionString %>" SelectCommand="SELECT COUNT(tTransaction.TransactionID) AS [#TransactionsPerStore], tStore.Store FROM tTransaction INNER JOIN tStore ON tTransaction.StoreID = tStore.StoreID WHERE (tTransaction.TransactionTypeID = @TransactionTypeID) AND (tStore.StoreID = @StoreID) OR (tTransaction.TransactionTypeID = @TransactionTypeID) AND (@StoreID IS NULL) OR (@TransactionTypeID IS NULL) AND (tStore.StoreID = @StoreID) OR (@TransactionTypeID IS NULL) AND (@StoreID IS NULL) GROUP BY tStore.Store" CancelSelectOnNullParameter="False">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlTransactionType" Name="TransactionTypeID" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="ddlStoreTransactions" Name="StoreID" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <div id="dEmployeesAtStore" runat="server">
                    <asp:Chart ID="cEmployeesAtStore" runat="server" Height="750px" DataSourceID="sqlEmployeesPerStore" Width="1000px">
                        <Titles>
                            <asp:Title Font="Times New Roman, 20pt, style=Bold, Italic" Name="tEmployeesPerStore"
                                Text="#Employees Per Store">
                            </asp:Title>
                        </Titles>
                        <Series>
                            <asp:Series Name="Series" ChartType="Bar" XValueMember="Store" YValueMembers="#EmployeesAtStore"></asp:Series>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1">
                                <AxisX Interval="1" LabelAutoFitMaxFontSize="24"></AxisX>
                                <Area3DStyle Enable3D="True" Inclination="15" IsRightAngleAxes="False" LightStyle="Realistic" Rotation="5" />
                            </asp:ChartArea>
                        </ChartAreas>
                    </asp:Chart>
                    <asp:DropDownList CssClass="form-control w-50 m-auto" ID="ddlStore" AppendDataBoundItems="true" runat="server" AutoPostBack="True" DataSourceID="sqlStore" DataTextField="Store" DataValueField="StoreID" OnSelectedIndexChanged="ddlStore_SelectedIndexChanged">
                        <asp:ListItem Text="All Stores" Value="" />
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="sqlStore" runat="server" ConnectionString="<%$ ConnectionStrings:GroceryStoreSimulatorConnectionString %>" SelectCommand="SELECT StoreID, Store FROM tStore" CancelSelectOnNullParameter="False"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="sqlEmployeesPerStore" runat="server" ConnectionString="<%$ ConnectionStrings:GroceryStoreSimulatorConnectionString %>" SelectCommand="SELECT COUNT(tEmpl.EmplID) AS #EmployeesAtStore, tStore.Store FROM tStore INNER JOIN tEmpl ON tStore.StoreID = tEmpl.StoreID WHERE (tStore.StoreID = @StoreID) OR (@StoreID IS NULL) GROUP BY tStore.Store ORDER BY #EmployeesAtStore DESC" CancelSelectOnNullParameter="False">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddlStore" Name="StoreID" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>

            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>

