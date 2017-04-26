<%@ Page Title="Grocery Store Simulator Business Intelligence Dashboard" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Chart ID="Chart1" runat="server" DataSourceID="dsProductsByManufacturer" Height="533px" Width="970px" Palette="SeaGreen">
                <Series>
                    <asp:Series Name="ProductsManufactured" XValueMember="Manufacturer" YValueMembers="#ProductsManufactured" Legend="legProductsManufactured" ChartType="Bar"></asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1">
                        <AxisX Interval="1" LabelAutoFitMinFontSize="10" MaximumAutoSize="90" LabelAutoFitMaxFontSize="20">
                            <LabelStyle Interval="1" />
                            <ScaleView Size="10" />
                        </AxisX>
                        <Area3DStyle Enable3D="True" LightStyle="Realistic" PointDepth="50" WallWidth="5" />
                    </asp:ChartArea>
                </ChartAreas>
                <Legends>
                    <asp:Legend AutoFitMinFontSize="5" Name="legProductsManufactured">
                    </asp:Legend>
                </Legends>
            </asp:Chart>
            <asp:ObjectDataSource ID="dsProductsByManufacturer" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="dsProductsByManufacturerTableAdapters.tManufacturerTableAdapter" UpdateMethod="Update">
                <DeleteParameters>
                    <asp:Parameter Name="Original_ProductID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Manufacturer" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:Parameter DefaultValue="" Name="Manufacturer" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Status" Type="String" />
                    <asp:Parameter Name="p1" Type="String" />
                    <asp:Parameter Name="p4" Type="String" />
                    <asp:Parameter Name="ManufacturerID" Type="Int32" />
                    <asp:Parameter Name="BrandID" Type="Int32" />
                    <asp:Parameter Name="InitialPricePerSellableUnit" Type="Decimal" />
                    <asp:Parameter Name="NameID" Type="Int32" />
                    <asp:Parameter Name="Description" Type="String" />
                    <asp:Parameter Name="ContainerID" Type="Int32" />
                    <asp:Parameter Name="Size" Type="Double" />
                    <asp:Parameter Name="Size_UOMID" Type="Int32" />
                    <asp:Parameter Name="I_Size" Type="Double" />
                    <asp:Parameter Name="I_UOMID" Type="Int32" />
                    <asp:Parameter Name="Parent" Type="String" />
                    <asp:Parameter Name="Count" Type="String" />
                    <asp:Parameter Name="p7" Type="String" />
                    <asp:Parameter Name="Country" Type="String" />
                    <asp:Parameter Name="p10" Type="String" />
                    <asp:Parameter Name="Serving_Size" Type="Double" />
                    <asp:Parameter Name="Serving_Size_UOMID" Type="Int32" />
                    <asp:Parameter Name="I_Serving_Size" Type="Double" />
                    <asp:Parameter Name="p13" Type="String" />
                    <asp:Parameter Name="p16" Type="Int32" />
                    <asp:Parameter Name="Pieces" Type="String" />
                    <asp:Parameter Name="Servings_Per_Container" Type="Double" />
                    <asp:Parameter Name="Calories" Type="Double" />
                    <asp:Parameter Name="Fat_Calories" Type="String" />
                    <asp:Parameter Name="Total_Fat_G" Type="Double" />
                    <asp:Parameter Name="Dvp_Total_Fat" Type="Double" />
                    <asp:Parameter Name="Saturated_Fat_G" Type="String" />
                    <asp:Parameter Name="Dvp_Saturated_Fat" Type="String" />
                    <asp:Parameter Name="Trans_Fat_G" Type="String" />
                    <asp:Parameter Name="Dvp_Trans_Fat" Type="String" />
                    <asp:Parameter Name="Polyunsaturated_Fat_G" Type="String" />
                    <asp:Parameter Name="Monounsaturated_Fat_G" Type="String" />
                    <asp:Parameter Name="Cholesterol_MG" Type="String" />
                    <asp:Parameter Name="Dvp_Cholesterol" Type="String" />
                    <asp:Parameter Name="Sodium_MG" Type="Double" />
                    <asp:Parameter Name="Dvp_Sodium" Type="Double" />
                    <asp:Parameter Name="Potassium_MG" Type="String" />
                    <asp:Parameter Name="Dvp_Potassium" Type="String" />
                    <asp:Parameter Name="Carbohydrates_G" Type="Double" />
                    <asp:Parameter Name="Dvp_Carbohydrates" Type="Double" />
                    <asp:Parameter Name="Fiber_G" Type="String" />
                    <asp:Parameter Name="Dvp_Dietary_Fiber" Type="String" />
                    <asp:Parameter Name="Sugars_G" Type="Double" />
                    <asp:Parameter Name="Dvp_Sugar" Type="String" />
                    <asp:Parameter Name="Other_Carbohydrates_G" Type="String" />
                    <asp:Parameter Name="Sugar_Alcohols_G" Type="String" />
                    <asp:Parameter Name="Protein_G" Type="Double" />
                    <asp:Parameter Name="Dvp_Protein" Type="String" />
                    <asp:Parameter Name="Net_Carbs_G" Type="Double" />
                    <asp:Parameter Name="Ingredients" Type="String" />
                    <asp:Parameter Name="Warnings" Type="String" />
                    <asp:Parameter Name="Allergy_Information" Type="String" />
                    <asp:Parameter Name="Dvp_Vitamin_A" Type="String" />
                    <asp:Parameter Name="Dvp_Vitamin_C" Type="String" />
                    <asp:Parameter Name="Dvp_Calcium" Type="Double" />
                    <asp:Parameter Name="Dvp_Iron" Type="String" />
                    <asp:Parameter Name="Dvp_Vitamin_D" Type="Double" />
                    <asp:Parameter Name="Dvp_Vitamin_E" Type="String" />
                    <asp:Parameter Name="Dvp_Vitamin_K" Type="String" />
                    <asp:Parameter Name="Dvp_Thiamin" Type="String" />
                    <asp:Parameter Name="Dvp_Riboflavin" Type="String" />
                    <asp:Parameter Name="Dvp_Niacin" Type="String" />
                    <asp:Parameter Name="Dvp_Vitamin_B1" Type="String" />
                    <asp:Parameter Name="Dvp_Vitamin_B2" Type="Double" />
                    <asp:Parameter Name="Dvp_Vitamin_B6" Type="String" />
                    <asp:Parameter Name="Dvp_Folic_Acid" Type="Double" />
                    <asp:Parameter Name="Dvp_Vitamin_B12" Type="String" />
                    <asp:Parameter Name="Dvp_Biotin" Type="String" />
                    <asp:Parameter Name="DVP_Pantothenic_Acid" Type="String" />
                    <asp:Parameter Name="Dvp_Phosphorus" Type="Double" />
                    <asp:Parameter Name="Dvp_Iodine" Type="Double" />
                    <asp:Parameter Name="Dvp_Magnesium" Type="String" />
                    <asp:Parameter Name="Dvp_Zinc" Type="String" />
                    <asp:Parameter Name="Dvp_Selenium" Type="String" />
                    <asp:Parameter Name="Dvp_Copper" Type="String" />
                    <asp:Parameter Name="Dvp_Manganese" Type="String" />
                    <asp:Parameter Name="Dvp_Chromium" Type="String" />
                    <asp:Parameter Name="Dvp_Molybdenum" Type="String" />
                    <asp:Parameter Name="Dvp_Vitamin_B3" Type="String" />
                    <asp:Parameter Name="Dvp_Vitamin_B5" Type="String" />
                    <asp:Parameter Name="Dvp_Folate" Type="String" />
                    <asp:Parameter Name="Soluble_Fiber" Type="String" />
                    <asp:Parameter Name="Insoluble_Fiber" Type="String" />
                    <asp:Parameter Name="Phosphate" Type="String" />
                    <asp:Parameter Name="Chloride" Type="String" />
                    <asp:Parameter Name="Caffeine_Mg" Type="Double" />
                    <asp:Parameter Name="Silica" Type="String" />
                    <asp:Parameter Name="pH" Type="String" />
                    <asp:Parameter Name="Bicarbonates" Type="String" />
                    <asp:Parameter Name="Total_Dissolved_Solids" Type="String" />
                    <asp:Parameter Name="Omega_3" Type="String" />
                    <asp:Parameter Name="Oleic_Acid" Type="String" />
                    <asp:Parameter Name="ProductImage" Type="Object" />
                    <asp:Parameter Name="Original_ProductID" Type="Int32" />
                </UpdateParameters>
            </asp:ObjectDataSource>
            <asp:ListBox ID="lbManufacturer" runat="server" SelectionMode="Multiple" AutoPostBack="True" DataSourceID="dsManufacturer" DataTextField="Manufacturer" DataValueField="ManufacturerID"></asp:ListBox>
            <asp:ObjectDataSource ID="dsManufacturer" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="dsManufacturerTableAdapters.tManufacturerTableAdapter" UpdateMethod="Update">
                <DeleteParameters>
                    <asp:Parameter Name="Original_ManufacturerID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Manufacturer" Type="String" />
                    <asp:Parameter Name="Code" Type="String" />
                    <asp:Parameter Name="IsSupplier" Type="Boolean" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Manufacturer" Type="String" />
                    <asp:Parameter Name="Code" Type="String" />
                    <asp:Parameter Name="IsSupplier" Type="Boolean" />
                    <asp:Parameter Name="Original_ManufacturerID" Type="Int32" />
                </UpdateParameters>
            </asp:ObjectDataSource>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

