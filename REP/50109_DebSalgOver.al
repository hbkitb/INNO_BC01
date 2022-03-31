report 50109 "Customer - Sales Inno"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'layouts/50108_DebSalgOver.rdl';  //'./CustomerSalesList.rdlc';
    ApplicationArea = Basic, Suite;
    Caption = 'Debitor Salg Inno';
    PreviewMode = PrintLayout;
    UsageCategory = ReportsAndAnalysis;
    //DataAccessIntent = ReadOnly;//

    dataset
    {
        dataitem(Customer; Customer)
        {
            RequestFilterFields = "No.", "Date Filter";
            column(COMPANYNAME; COMPANYPROPERTY.DisplayName)
            {
            }
            column(MinAmtLCY; MinAmtLCY)
            {
                AutoFormatType = 1;
            }
            column(TABLECAPTION__________CustFilter; TableCaption + ': ' + CustFilter)
            {
            }
            column(Customer__No__; "No.")
            {
            }
            column(Customer_Name; Name)
            {
            }
            column(Customer__VAT_Registration_No__; "VAT Registration No.")
            {
            }
            column(AmtSalesLCY; AmtSalesLCY)
            {
                AutoFormatType = 1;
            }
            column(CustAddr_2_; CustAddr[2])
            {
            }
            column(CustAddr_3_; CustAddr[3])
            {
            }
            column(CustAddr_4_; CustAddr[4])
            {
            }
            column(CustAddr_5_; CustAddr[5])
            {
            }
            column(CustAddr_6_; CustAddr[6])
            {
            }
            column(CustAddr_7_; CustAddr[7])
            {
            }
            column(CustAddr_8_; CustAddr[8])
            {
            }
            column(HideAddress; HideAddress)
            {
            }
            column(Customer___Sales_ListCaption; Customer___Sales_ListCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(MinAmtLCYCaption; MinAmtLCYCaptionLbl)
            {
            }
            column(Customer__No__Caption; FieldCaption("No."))
            {
            }
            column(Customer_NameCaption; FieldCaption(Name))
            {
            }
            column(Customer__VAT_Registration_No__Caption; FieldCaption("VAT Registration No."))
            {
            }
            column(AmtSalesLCYCaption; AmtSalesLCYCaptionLbl)
            {
            }
            column(Total_Reported_Amount_of_Sales__LCY_Caption; Total_Reported_Amount_of_Sales__LCY_CaptionLbl)
            {
            }
            //HBK / ITB - 230322
            column(Salesperson_Code; "Salesperson Code")
            {
            }

            column(SalesRepLbl; SalesRepLbl)
            {
            }
            column(Address; Address)
            {
            }
            column(Post_Code; "Post Code")
            {
            }
            column(City; City)
            {
            }
            //HBK / ITB - 230322                        

            trigger OnAfterGetRecord()
            var
                FormatAddr: Codeunit "Format Address";
            begin
                AmtSalesLCY := CalculateAmtOfSaleLCY;
                if AmtSalesLCY < MinAmtLCY then
                    CurrReport.Skip();

                //HBK / ITB - 230322 if not HideAddress then
                FormatAddr.Customer(CustAddr, Customer);
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
                    Caption = 'Indstillinger';
                    field(MinAmtLCY; MinAmtLCY)
                    {
                        ApplicationArea = Basic, Suite;
                        AutoFormatType = 1;
                        //Caption = 'Amounts (LCY) Greater Than';
                        Caption = 'Beløb større end';
                        ToolTip = 'Rapporten medtager kun debitorer med beløb over det angivne';
                        //ToolTip = 'Specifies an amount so that the report will only include those customers to which you have sold more than this amount within the specified dates.';
                    }
                    /* HBK / ITB - 230322
                    field(HideAddress; HideAddress)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Hide Address Detail';
                        ToolTip = 'Specifies that you do not want the report to show address details for each customer.';
                    }
                    230322 */
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
    var
        FormatDocument: Codeunit "Format Document";
    begin
        CustFilter := FormatDocument.GetRecordFiltersWithCaptions(Customer);
        SalesRepLbl := 'Sælger';  //HBK / ITB - 230322
        HideAddress := true;  //HBK / ITB - 230322
    end;

    var
        MinAmtLCY: Decimal;
        HideAddress: Boolean;
        AmtSalesLCY: Decimal;
        CustAddr: array[8] of Text[100];
        CustFilter: Text;
        Customer___Sales_ListCaptionLbl: Label 'Debitor - Salgsliste - INNO';
        CurrReport_PAGENOCaptionLbl: Label 'Side';
        MinAmtLCYCaptionLbl: Label 'Beløb (RV) større end ';
        AmtSalesLCYCaptionLbl: Label 'Samlet salgsbeløb (RV)';
        Total_Reported_Amount_of_Sales__LCY_CaptionLbl: Label 'Samlet rapporteret salgsbeløb (RV)';

        SalesRepLbl: Text[10];

    local procedure CalculateAmtOfSaleLCY(): Decimal
    var
        CustLedgEntry: Record "Cust. Ledger Entry";
        Amt: Decimal;
        i: Integer;
    begin
        with CustLedgEntry do begin
            SetCurrentKey("Document Type", "Customer No.", "Posting Date");
            SetRange("Customer No.", Customer."No.");
            SetFilter("Posting Date", Customer.GetFilter("Date Filter"));
            for i := 1 to 2 do begin
                case i of
                    1:
                        SetRange("Document Type", "Document Type"::Invoice);
                    2:
                        SetRange("Document Type", "Document Type"::"Credit Memo");
                end;
                CalcSums("Sales (LCY)");
                Amt := Amt + "Sales (LCY)";
            end;
            exit(Amt);
        end;
    end;

    procedure InitializeRequest(MinimumAmtLCY: Decimal; HideAddressDetails: Boolean)
    begin
        MinAmtLCY := MinimumAmtLCY;
        HideAddress := HideAddressDetails;
    end;
}

