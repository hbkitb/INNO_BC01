report 50105 "Inven_Reorder_List"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'REP/50105_Inven_Reorder_List.rdl';
    ApplicationArea = Basic, Suite;
    Caption = 'Inventory - Reorder - List';
    UsageCategory = ReportsAndAnalysis;

    dataset
    {
        dataitem(Item; Item)
        {
            DataItemTableView = WHERE(Type = CONST(Inventory));
            RequestFilterFields = "No.", "Search Description", "Assembly BOM", "Inventory Posting Group", "Shelf No.", "Statistics Group";
            column(CompanyName; COMPANYPROPERTY.DisplayName)
            {
            }
            column(ItemFilter; ItemFilter)
            {
            }
            column(No_Item; "No.")
            {
                IncludeCaption = true;
            }
            column(Description_Item; Description)
            {
                IncludeCaption = true;
                //Caption = 'Varenavn';
            }
            column(AssemblyBOM_Item; Format("Assembly BOM"))
            {
            }
            column(BaseUnitofMeasure_Item; "Base Unit of Measure")
            {
                IncludeCaption = true;
            }
            column(InventoryPostingGrp_Item; "Inventory Posting Group")
            {
                IncludeCaption = true;
                //Caption = 'Grp';
            }
            column(ShelfNo_Item; "Shelf No.")
            {
                IncludeCaption = true;
            }
            column(VendorItemNo_Item; "Vendor Item No.")
            {
                IncludeCaption = true;
            }
            column(LeadTimeCalculation_Item; "Lead Time Calculation")
            {
                IncludeCaption = true;
            }
            column(ReorderPoint_Item; "Reorder Point")
            {
                IncludeCaption = true;
            }
            column(AlternativeItemNo_Item; "Alternative Item No.")
            {
                IncludeCaption = true;
            }
            column(Blocked_Item; Format(Blocked))
            {
            }
            column(InventoryListCaption; InventoryListCaptionLbl)
            {
            }
            column(CurrReportPageNoCaption; CurrReportPageNoCaptionLbl)
            {
            }
            column(ItemAssemblyBOMCaption; ItemAssemblyBOMCaptionLbl)
            {
            }
            column(ItemBlockedCaption; ItemBlockedCaptionLbl)
            {
            }
            //HBK / itb
            column(ThisYear; ThisYear)
            {
                //Caption = 'P.dette år antal';
            }
            column(LastYear; LastYear)
            {
                //Caption = 'P.sidste år antal';
            }
            column(Safety_Stock_Quantity; "Safety Stock Quantity")
            {
                //Caption = 'Minimum';
            }
            column(Advarsel; Advarsel)
            {

            }

            column(StrPrKs; StrPrKs)
            {
                //Caption = 'Stk pr. kasse';
            }

            column(StkPrLag; StkPrLag)
            {
                //Caption = 'Stk pr. Lag';
            }

            column(StkPrPal; StkPrPal)
            {
                //Caption = 'Stk pr. Pal';
            }

            column(Inventory; Inventory)
            {
                //Caption = 'Beholdning';
            }
            column(SalesThisMonth; SalesThisMonth)
            {
                //Caption = 'Denne måned antal';
            }

            column(gns; gns)
            {
                //Caption = 'Gns. pr. måned';
            }
            column(FromDate; FromDate)
            {
                //Caption = 'Fra dato';
            }
            column(ToDate; ToDate)
            {
                //Caption = 'Til dato';
            }
            column(KredStreg; KredStreg)
            {
                //Caption = 'Leverandør';
            }
            column(Factor; Factor)
            {
                //Caption = 'Faktor';
            }
            column(Postmed; Postmed)
            {
                //Caption = 'Skal posten med i rapporten';
            }

            trigger OnAfterGetRecord()
            var

            begin
                //Først kommer indev. år - Dato afgrænsning 
                if item.Inventory <= item."Safety Stock Quantity" then
                    Advarsel := '*****'
                else
                    Advarsel := '';
                if FromDate = 0D then
                    FromDate := Today;
                if ToDate = 0D then
                    ToDate := Today;
                if ToDate < FromDate then
                    ToDate := FromDate;
                ThisYear := 0;
                SalesStat.Reset();
                SalesStat.SetRange("Item No.", "No.");
                SalesStat.SetRange("Posting Date", FromDate, ToDate);
                SalesStat.SetRange("Item Ledger Entry Type", SalesStat."Item Ledger Entry Type"::Sale);  //1=salg
                if SalesStat.FindSet() then
                    repeat
                        ThisYear := ThisYear + SalesStat."Invoiced Quantity";
                    until SalesStat.Next() = 0;

                From_ := CalcDate('-1Å', FromDate);
                To_ := CalcDate('-1Å', ToDate);
                LastYear := 0;
                SalesStat.Reset();
                SalesStat.SetRange("Item No.", "No.");
                SalesStat.SetRange("Posting Date", From_, To_);
                SalesStat.SetRange("Item Ledger Entry Type", SalesStat."Item Ledger Entry Type"::Sale);  //1=salg
                if SalesStat.FindSet() then
                    repeat
                        LastYear := LastYear + SalesStat."Invoiced Quantity";
                    until SalesStat.Next() = 0;

                if ThisMonth = 0D then
                    ThisMonth := Today;
                From_ := CalcDate('-1M', ThisMonth);
                From_ := CalcDate('LM', From_) + 1;
                To_ := CalcDate('LM', ThisMonth);
                //Message(Format(From_));
                //Message(format(To_));
                SalesThisMonth := 0;
                SalesStat.Reset();
                SalesStat.SetRange("Item No.", "No.");
                SalesStat.SetRange("Posting Date", From_, To_);
                SalesStat.SetRange("Item Ledger Entry Type", SalesStat."Item Ledger Entry Type"::Sale);  //1=salg
                if SalesStat.FindSet() then
                    repeat
                        SalesThisMonth := SalesThisMonth + SalesStat."Invoiced Quantity";
                    until SalesStat.Next() = 0;

                gns := 0;
                if Factor <> 0 then
                    gns := (ThisYear / Factor)
                else
                    gns := 0;

                Postmed := true;
                if ((Skip0 = true) and (ThisYear = 0) and (LastYear = 0) and (SalesThisMonth = 0)) then
                    Postmed := false;
                if ((InnoItem = true) and (NoInnoItem = true)) then
                    Postmed := false;
            end;
        }
    }

    requestpage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(FromDate; FromDate)
                    {
                        ApplicationArea = All;
                        Caption = 'Fradato';
                        //ToolTip = 'Specifies if you want to only include items that are set up as SKUs. This adds SKU-related fields, such as the Location Code, Variant Code, and Qty. in Transit fields, to the report.';
                    }
                    field(ToDate; ToDate)
                    {
                        ApplicationArea = All;
                        Caption = 'Tildato';
                        //TableRelation = Vendor;
                        //ToolTip = 'Specifies a filter for the vendor or vendors that you want to view items for.';
                    }
                    field(Factor; Factor)
                    {
                        ApplicationArea = All;
                        Caption = 'Faktor';
                        //Enabled = TransferFromCodeEnable;
                        //TableRelation = Location WHERE("Use As In-Transit" = CONST(false));
                        ToolTip = 'Indtast faktor for beregning af gennemsnit pr. måned.';
                    }
                    field(KredStreg; KredStreg)
                    {
                        ApplicationArea = All;
                        Caption = 'Leverandør';
                        TableRelation = Vendor;
                        ToolTip = 'Vælg leverandør.';
                    }
                    field(ThisMonth; ThisMonth)
                    {
                        ApplicationArea = All;
                        Caption = 'Denne måned';
                        //TableRelation = Vendor;
                        ToolTip = 'Angiv dato som er udgangspunkt for denne måned.';
                    }
                    field(Skip0; Skip0)
                    {
                        ApplicationArea = All;
                        Caption = 'Skip 0';
                        //TableRelation = Vendor;
                        ToolTip = 'Varer uden statistik udelades.';
                    }
                    field(InnoItem; InnoItem)
                    {
                        ApplicationArea = All;
                        Caption = 'Udelad ej inno';
                        //TableRelation = Vendor;
                        ToolTip = 'IKKE Inno varer udelades';
                    }
                }
            }
        }

        actions
        {
        }


    }

    labels
    {
    }

    trigger OnPreReport()
    begin
        ItemFilter := Item.GetFilters;
    end;

    var
        ItemFilter: Text;
        InventoryListCaptionLbl: Label 'Inventory - List';
        CurrReportPageNoCaptionLbl: Label 'Page';
        ItemAssemblyBOMCaptionLbl: Label 'BOM';
        ItemBlockedCaptionLbl: Label 'Blocked';
        //HBK / ITB - 021120 ->
        FromDate: Date; //Fra dato
        ToDate: Date; //Til dato
        From_: Date;
        To_: Date;
        Factor: Decimal; //Faktor for beregning af gns. pr. måned
        ThisMonth: Date; //Dato fra måned som er udgangspunkt
        Skip0: Boolean; //Varer uden statistik udelades
        InnoItem: Boolean;  //Udelad ikke inno varer


        ThisYear: Decimal;
        LastYear: Decimal;
        SalesQtyMonth: Decimal;
        SalesAmtMonth: Decimal;
        SalesThisMonth: Decimal;


        COGSMth: Decimal;
        KredStreg: Text[20];
        VareStreg: Text[20];
        S: Integer;
        Advarsel: Text[20];

        SalesStat: Record "Value Entry";
        gns: Decimal;
        Postmed: Boolean;

    //HBK / ITB - 021120 <-
}

