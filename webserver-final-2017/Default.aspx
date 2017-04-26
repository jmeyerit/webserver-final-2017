<%@ Page Title="Grocery Store Simulator Business Intelligence Dashboard" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Timer ID="timerTransaction" runat="server" OnTick="timerTransaction_Tick" Interval="10000"></asp:Timer>
            <div id="dProdManu">
                <asp:DropDownList ID="ddlTop" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlTop_SelectedIndexChanged">
                    <asp:ListItem Value="1">Top 1</asp:ListItem>
                    <asp:ListItem Value="3">Top 3</asp:ListItem>
                    <asp:ListItem Selected="True" Value="5">Top 5</asp:ListItem>
                    <asp:ListItem Value="10">Top 10</asp:ListItem>
                    <asp:ListItem Value="25">Top 25</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="ddlSort" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlSort_SelectedIndexChanged">
                    <asp:ListItem Value="Ascending">Ascending</asp:ListItem>
                    <asp:ListItem Value="Descending">Descending</asp:ListItem>
                </asp:DropDownList>
                <asp:Chart ID="cProductManufacturer" runat="server" Width="959px" DataSourceID="sqlProductsManufactured">
                    <Series>
                        <asp:Series Name="Series" ChartType="Bar" XValueMember="Manufacturer" YValueMembers="#ProductsManufactured"></asp:Series>
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="ChartArea">
                            <AxisX Interval="1" LabelAutoFitMaxFontSize="18" Title="Products Manufactured"></AxisX>
                        </asp:ChartArea>
                    </ChartAreas>
                </asp:Chart>
                <asp:SqlDataSource ID="sqlProductsManufactured" runat="server" ConnectionString="<%$ ConnectionStrings:GroceryStoreSimulatorConnectionString %>" SelectCommand="SELECT tManufacturer.Manufacturer, COUNT(tProduct.ProductID) AS [#ProductsManufactured] FROM tManufacturer INNER JOIN tProduct ON tManufacturer.ManufacturerID = tProduct.ManufacturerID INNER JOIN tName ON tProduct.NameID = tName.NameID GROUP BY tManufacturer.ManufacturerID, tManufacturer.Manufacturer ORDER BY [#ProductsManufactured] DESC"></asp:SqlDataSource>
            </div>
            <asp:Chart ID="Chart2" runat="server" DataSourceID="sqlStoreStatus" Width="959px">
                <Series>
                    <asp:Series Name="Series1" ChartType="Bar"></asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1">
                        <AxisX Interval="1" LabelAutoFitMaxFontSize="18" Title="Number of Transactions"></AxisX>
                    </asp:ChartArea>
                </ChartAreas>
            </asp:Chart>

            <asp:SqlDataSource ID="sqlStoreStatus" runat="server" ConnectionString="<%$ ConnectionStrings:GroceryStoreSimulatorConnectionString %>" SelectCommand="SELECT tStore.Store FROM tStore INNER JOIN tStoreHistory ON tStore.StoreID = tStoreHistory.StoreID GROUP BY tStoreHistory.StoreStatusID, tStore.Store HAVING (tStoreHistory.StoreStatusID = @StoreStatusID) OR (@StoreStatusID IS NULL)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlData" Name="StoreStatusID" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="sqlNumberOfTransactions" runat="server" ConnectionString="<%$ ConnectionStrings:GroceryStoreSimulatorConnectionString %>" SelectCommand="SELECT COUNT(TransactionID) AS #Transactions FROM tTransaction WHERE (TransactionTypeID = @TransactionTypeID) AND (StoreID = @StoreID OR @StoreID IS NULL)" CancelSelectOnNullParameter="False">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlTransactionType" Name="TransactionTypeID" PropertyName="SelectedValue" DefaultValue="1" />
                    <asp:ControlParameter ControlID="ddlStore" Name="StoreID" PropertyName="SelectedValue" DefaultValue="" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:DropDownList ID="ddlChartType" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlChartType_SelectedIndexChanged"></asp:DropDownList>
            <asp:DropDownList ID="ddlData" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlData_SelectedIndexChanged">
                <asp:ListItem Text="Products By Manufacturer" Value="sqlProductsManufacturedByManufacturer"></asp:ListItem>
                <asp:ListItem Text="Transaction Data" Value="sqlNumberOfTransactions"></asp:ListItem>
            </asp:DropDownList>
            <asp:DropDownList ID="ddlStore" runat="server" AutoPostBack="True" DataSourceID="sqlStore" DataTextField="Store" DataValueField="StoreID"></asp:DropDownList>

            <asp:SqlDataSource ID="sqlStore" runat="server" ConnectionString="<%$ ConnectionStrings:GroceryStoreSimulatorConnectionString %>" SelectCommand="SELECT StoreID, Store FROM tStore" CancelSelectOnNullParameter="False"></asp:SqlDataSource>
            <asp:DropDownList ID="ddlTransactionType" runat="server" AutoPostBack="True" DataSourceID="sqlTransactionType" DataTextField="TransactionType" DataValueField="TransactionTypeID"></asp:DropDownList>
            <asp:SqlDataSource ID="sqlTransactionType" runat="server" CancelSelectOnNullParameter="False" ConnectionString="<%$ ConnectionStrings:GroceryStoreSimulatorConnectionString %>" SelectCommand="SELECT TransactionTypeID, TransactionType FROM tTransactionType"></asp:SqlDataSource>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

