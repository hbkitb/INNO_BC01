page 50122 "eCustomer Card"
{
    Caption = 'eCustomer Card';
    PageType = Card;
    //PromotedActionCategories = 'New,Process,Report,New Document,Approve,Request Approval,Prices and Discounts,Navigate,Customer';
    RefreshOnActivate = true;
    SourceTable = eSalesTable_I;

    layout
    {
        area(content)
        {
            group(Customer)
            {
                Caption = 'Customer';

                field(Test; Test)   //HBK / ITB - 161020
                {
                    ApplicationArea = All;
                    Importance = Standard;
                    ToolTip = 'Konto-kan ændres ved ny';
                    //Visible = false;
                    Caption = 'Deb.Konto';

                    trigger OnValidate()
                    begin

                    end;
                }

                field("No."; eCust."No.")
                {
                    ApplicationArea = All;
                    Importance = Additional;
                    ToolTip = 'Specifies the number of the customer. The field is either filled automatically from a defined number series, or you enter the number manually because you have enabled manual number entry in the number-series setup.';
                    Visible = NoFieldVisible;
                    Editable = false;

                    trigger OnAssistEdit()
                    begin

                    end;
                }
                field(Name; eCust.Name)
                {
                    ApplicationArea = All;
                    Importance = Promoted;
                    ShowMandatory = true;
                    Editable = false;
                    ToolTip = 'Specifies the customer''s name. This name will appear on all sales documents for the customer.';

                    trigger OnValidate()
                    begin

                    end;
                }


                field("Name 2"; eCust."Name 2")
                {
                    ApplicationArea = All;
                    Importance = Additional;
                    Editable = false;
                    ToolTip = 'Specifies an additional part of the name.';
                    Visible = false;
                }
                field("Search Name"; eCust."Search Name")
                {
                    ApplicationArea = All;
                    Importance = Additional;
                    Editable = false;
                    ToolTip = 'Specifies an alternate name that you can use to search for a customer.';
                    Visible = false;
                }


                field("Salesperson Code"; eCust."Salesperson Code")
                {
                    ApplicationArea = Suite;
                    Importance = Standard;
                    Editable = false;
                    ToolTip = 'Specifies a code for the salesperson who normally handles this customer''s account.';
                }




                field(Address; eCust.Address)
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    ToolTip = 'Specifies the customer''s address. This address will appear on all sales documents for the customer.';
                }
                field("Address 2"; eCust."Address 2")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    ToolTip = 'Specifies additional address information.';
                }
                field("Country/Region Code"; eCust."Country/Region Code")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the country/region of the address.';
                    Editable = false;

                    trigger OnValidate()
                    begin
                        IsCountyVisible := FormatAddress.UseCounty(eCust."Country/Region Code");
                    end;
                }
                field(City; eCust.City)
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    ToolTip = 'Specifies the customer''s city.';
                }

                field("Post Code"; eCust."Post Code")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Promoted;
                    Editable = false;
                    ToolTip = 'Specifies the postal code.';
                }


                field("Phone No."; eCust."Phone No.")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    ToolTip = 'Specifies the customer''s telephone number.';
                }
                field("E-Mail"; eCust."E-Mail")
                {
                    ApplicationArea = Basic, Suite;
                    ExtendedDatatype = EMail;
                    Importance = Promoted;
                    Editable = false;
                    ToolTip = 'Specifies the customer''s email address.';
                }




                field("Gen. Bus. Posting Group"; eCust."Gen. Bus. Posting Group")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Promoted;
                    ShowMandatory = true;
                    Editable = false;
                    ToolTip = 'Specifies the customer''s trade type to link transactions made for this customer with the appropriate general ledger account according to the general posting setup.';
                }
                field("VAT Bus. Posting Group"; eCust."VAT Bus. Posting Group")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Additional;
                    Editable = false;
                    ToolTip = 'Specifies the customer''s VAT specification to link transactions made for this customer to.';
                }
                field("Customer Posting Group"; eCust."Customer Posting Group")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Promoted;
                    ShowMandatory = true;
                    Editable = false;
                    ToolTip = 'Specifies the customer''s market type to link business transactions to.';
                }



                field("Customer Price Group"; eCust."Customer Price Group")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Promoted;
                    Editable = false;
                    ToolTip = 'Specifies the customer price group code, which you can use to set up special sales prices in the Sales Prices window.';
                }
                field("Customer Disc. Group"; eCust."Customer Disc. Group")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Promoted;
                    Editable = false;
                    ToolTip = 'Specifies the customer discount group code, which you can use as a criterion to set up special discounts in the Sales Line Discounts window.';
                }

                field("Payment Terms Code"; eCust."Payment Terms Code")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Promoted;
                    ShowMandatory = true;
                    Editable = false;
                    ToolTip = 'Specifies a code that indicates the payment terms that you require of the customer.';
                }
                field("Payment Method Code"; eCust."Payment Method Code")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Additional;
                    Editable = false;
                    ToolTip = 'Specifies how the customer usually submits payment, such as bank transfer or check.';
                }
            }

            group(eSales)
            {
                Caption = 'eSales';

                field(eCustAccount; CustAccount)
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Standard;
                    Editable = false;
                    ToolTip = 'Debitor nummer';
                }

                field(eName; Name1)
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Standard;
                    Editable = false;
                    ToolTip = 'Debitor navn';
                }

                field(eAddress1; Address11)
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Standard;
                    Editable = false;
                    ToolTip = 'Debitor adresse1';
                }

                field(eAddress2; Address21)
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Standard;
                    Editable = false;
                    ToolTip = 'Debitor adresse2';
                }

                field(eZipCode; ZipCode)
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Standard;
                    Editable = false;
                    ToolTip = 'Debitor postnr.';
                }

                field(eCity; City1)
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Standard;
                    Editable = false;
                    ToolTip = 'Debitor By';
                }

                field(eCountry; Country1)
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Standard;
                    Editable = false;
                    ToolTip = 'Debitor Land';
                }

                field(eeMail; eMail1)
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Standard;
                    Editable = false;
                    ToolTip = 'Debitor email';
                }

                field(ephone; phone)
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Standard;
                    Editable = false;
                    ToolTip = 'Debitor telefon';
                }


            }
        }


    }

    actions
    {
        area(navigation)
        {
            group("&Customer")
            {
                Caption = '&Customer';
                Image = Customer;

                action(ShipToAddresses)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Ship-&to Addresses';
                    Image = ShipAddress;
                    Promoted = true;
                    PromotedCategory = Category8;
                    //RunObject = Page "Ship-to Address List";
                    //RunPageLink = "Customer No." = FIELD("No.");
                    ToolTip = 'View or edit alternate shipping addresses where the customer wants items delivered if different from the regular address.';
                }

            }
        }

        area(creation)
        {

            group(Diverse)
            {
                action(NewBlanketSalesOrder)
                {
                    AccessByPermission = TableData "Sales Header" = RIM;
                    ApplicationArea = Suite;
                    Caption = 'Blanket Sales Order';
                    Image = BlanketOrder;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category4;
                    //RunObject = Page "Blanket Sales Order";
                    //RunPageLink = ecust."Sell-to Customer No." = FIELD("No.");
                    //RunPageMode = Create;
                    ToolTip = 'Create a blanket sales order for the customer.';
                }
                action(NewSalesQuote)
                {
                    AccessByPermission = TableData "Sales Header" = RIM;
                    ApplicationArea = Basic, Suite;
                    Caption = 'Sales Quote';
                    Image = NewSalesQuote;
                    Promoted = true;
                    PromotedCategory = Category4;
                    //RunObject = Page "Sales Quote";
                    //RunPageLink = "Sell-to Customer No." = FIELD("No.");
                    //RunPageMode = Create;
                    ToolTip = 'Offer items or services to a customer.';
                    Visible = NOT IsOfficeAddin;
                }
                action(NewSalesInvoice)
                {
                    AccessByPermission = TableData "Sales Header" = RIM;
                    ApplicationArea = Basic, Suite;
                    Caption = 'Sales Invoice';
                    Image = NewSalesInvoice;
                    Promoted = true;
                    PromotedCategory = Category4;
                    //RunObject = Page "Sales Invoice";
                    //RunPageLink = "Sell-to Customer No." = FIELD("No.");
                    //RunPageMode = Create;
                    ToolTip = 'Create a sales invoice for the customer.';
                    Visible = NOT IsOfficeAddin;
                }
                action(NewSalesOrder)
                {
                    AccessByPermission = TableData "Sales Header" = RIM;
                    ApplicationArea = Basic, Suite;
                    Caption = 'Sales Order';
                    Image = Document;
                    Promoted = true;
                    PromotedCategory = Category4;
                    //RunObject = Page "Sales Order";
                    //RunPageLink = "Sell-to Customer No." = FIELD("No.");
                    //RunPageMode = Create;
                    ToolTip = 'Create a sales order for the customer.';
                    Visible = NOT IsOfficeAddin;
                }

                action(CustomerCreateUpdate)
                {
                    //AccessByPermission = TableData "Sales Header" = RIM;
                    ApplicationArea = Basic, Suite;
                    Caption = 'Debitor opret/ændre';
                    Image = Document;
                    Promoted = true;
                    PromotedCategory = Process;
                    //RunObject = Page "Sales Order";
                    //RunPageLink = "Sell-to Customer No." = FIELD("No.");
                    //RunPageMode = Create;
                    ToolTip = 'Opret/Ændre debitor';
                    //Visible = NOT IsOfficeAddin;

                    trigger OnAction()
                    var
                        cust: Record Customer;
                        esalesSetup: Record "Sales & Receivables Setup";
                        esalesCust: Record Customer;
                        esalh: Record eSalesTable_I;
                        Country: Record "Country/Region";

                    begin
                        if cust.get(CustAccount) then begin
                            cust.Name := Name1;
                            cust.Address := Address11;
                            cust."Address 2" := Address21;
                            cust.City := City1;
                            cust."Post Code" := ZipCode;
                            if (Country1 = 'DANMARK') OR (Country1 = '') then
                                cust."Country/Region Code" := 'DK';
                            if Country1 = 'NORGE' then
                                cust."Country/Region Code" := 'NO';
                            if Country1 = 'SVERIGE' then
                                cust."Country/Region Code" := 'SE';
                            //091121
                            country.Reset;
                            //Message('før');
                            if not country.Get(cust."Country/Region Code") then begin
                                //Message('efter inde');
                                country.Reset;
                                country.SetRange(Name, Country1);
                                if country.FindSet then
                                    cust."Country/Region Code" := country.Code;
                                //Message(head.country);
                            end;
                            //091121            


                            //if (Country1 <> 'DANMARK') and (Country1 <> 'NORGE') and (Country1 <> 'SVERIGE') and (Country1 <> '') then
                            //    cust."Country/Region Code" := Country1;
                            //250122 cust."Payment Terms Code" := Payment;
                            cust."VAT Registration No." := CVRNo;
                            cust."Phone No." := phone;
                            cust."E-Mail" := eMail1;
                            cust.Modify();
                        end
                        else begin
                            cust.Reset();
                            cust.Init();

                            esalesSetup.Get();
                            if esalesCust.get(esalesSetup.eCustStd) then
                                cust := esalesCust;

                            cust."No." := Test; //CustAccount;
                            cust.Name := Name1;
                            cust.Address := Address11;
                            cust."Address 2" := Address21;
                            cust.City := City1;
                            cust."Post Code" := ZipCode;
                            if (Country1 = 'DANMARK') OR (Country1 = '') then
                                cust."Country/Region Code" := 'DK';
                            if Country1 = 'NORGE' then
                                cust."Country/Region Code" := 'NO';
                            if Country1 = 'SVERIGE' then
                                cust."Country/Region Code" := 'SE';

                            //050122
                            if SalesRep <> '' then
                                cust."Salesperson Code" := SalesRep;
                            //050122

                            //091121
                            country.Reset;
                            //Message('før');
                            if not country.Get(cust."Country/Region Code") then begin
                                //Message('efter inde');
                                country.Reset;
                                country.SetRange(Name, Country1);
                                if country.FindSet then
                                    cust."Country/Region Code" := country.Code;
                                //Message(head.country);
                            end;
                            //091121  
                            //if (Country1 <> 'DANMARK') and (Country1 <> 'NORGE') and (Country1 <> 'SVERIGE') and (Country1 <> '') then
                            //    cust."Country/Region Code" := Country1;


                            //250122 cust."Payment Terms Code" := Payment;
                            cust."VAT Registration No." := CVRNo;
                            cust."Phone No." := phone;
                            cust."E-Mail" := eMail1;
                            cust.Insert;

                            //220421 ->//
                            //Message('før');
                            //esalh.Reset;
                            //esalh.SetRange(eSalesNumber, eSalesNumber);
                            //if esalh.FindSet then begin
                            //Message('inde');
                            //Message(cust."No.");
                            //Message(Test);
                            //esalh.CustAccount := Test;
                            //esalh.Modify;
                            CustAccount := Test;
                            CurrPage.Update;
                            //Message(esalh.CustAccount);
                            //Message(esalh.eSalesNumber);
                            //end;


                            //220421 <-
                        end;
                        Message('Debitor er opdateret/korrigeret !');
                        CurrPage.Close();
                    end;
                }


            }
        }

    }

    trigger OnAfterGetCurrRecord()
    var

    begin

        eCust.Reset();
        if eCust.get(CustAccount) then begin
            Test := CustAccount;
            /*
            //eCustAccountVar := CustAccount;
            eName := Name;
            eAddress1 := Address1;
            eAddress2 := Address2;
            eZippCode := ZipCode;
            eAddress3 := City;
            eCountry := Country;
            //email
            //ePhone := 
            //reference
         end   
         else begin
            Test := CustAccount;
            //eCustAccountVar := CustAccount;
            eName := Name;
            eAddress1 := Address1;
            eAddress2 := Address2;
            eZippCode := ZipCode;
            eAddress3 := City;
            eCountry := Country;
            //email
            //ePhone := 
            //reference
            */
        end;
        Test := CustAccount;



    end;

    trigger OnInit()
    var

    begin

    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    var
        DocumentNoVisibility: Codeunit DocumentNoVisibility;
    begin
        if GuiAllowed then
            if ecust."No." = '' then
                if DocumentNoVisibility.CustomerNoSeriesIsDefault then
                    NewMode := true;
    end;

    trigger OnOpenPage()
    var
        EnvironmentInfo: Codeunit "Environment Information";
    begin
        CRMIntegrationEnabled := CRMIntegrationManagement.IsCRMIntegrationEnabled;
        CDSIntegrationEnabled := CRMIntegrationManagement.IsCDSIntegrationEnabled;


        IsSaaS := EnvironmentInfo.IsSaaS;
    end;

    trigger OnPageBackgroundTaskCompleted(TaskId: Integer; Results: Dictionary of [Text, Text])
    var

    begin

    end;

    var
        CalendarMgmt: Codeunit "Calendar Management";
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        CRMIntegrationManagement: Codeunit "CRM Integration Management";
        CustomerMgt: Codeunit "Customer Mgt.";
        FormatAddress: Codeunit "Format Address";
        StyleTxt: Text;
        [InDataSet]
        ContactEditable: Boolean;
        [InDataSet]
        SocialListeningSetupVisible: Boolean;
        [InDataSet]
        SocialListeningVisible: Boolean;
        [InDataSet]
        ShowCharts: Boolean;
        CRMIntegrationEnabled: Boolean;
        CDSIntegrationEnabled: Boolean;
        CRMIsCoupledToRecord: Boolean;
        OpenApprovalEntriesExistCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        ShowWorkflowStatus: Boolean;
        NoFieldVisible: Boolean;
        BalanceExhausted: Boolean;
        AttentionToPaidDay: Boolean;
        IsOfficeAddin: Boolean;
        NoPostedInvoices: Integer;
        NoPostedCrMemos: Integer;
        NoOutstandingInvoices: Integer;
        NoOutstandingCrMemos: Integer;
        Totals: Decimal;
        AmountOnPostedInvoices: Decimal;
        AmountOnPostedCrMemos: Decimal;
        AmountOnOutstandingInvoices: Decimal;
        AmountOnOutstandingCrMemos: Decimal;
        AdjmtCostLCY: Decimal;
        AdjCustProfit: Decimal;
        CustProfit: Decimal;
        AdjProfitPct: Decimal;
        CustInvDiscAmountLCY: Decimal;
        CustPaymentsLCY: Decimal;
        CustSalesLCY: Decimal;
        OverduePaymentsMsg: Label 'Overdue Payments as of %1', Comment = 'Overdue Payments as of 27-02-2012';
        DaysPastDueDate: Decimal;
        PostedInvoicesMsg: Label 'Posted Invoices (%1)', Comment = 'Invoices (5)';
        CreditMemosMsg: Label 'Posted Credit Memos (%1)', Comment = 'Credit Memos (3)';
        OutstandingInvoicesMsg: Label 'Ongoing Invoices (%1)', Comment = 'Ongoing Invoices (4)';
        OutstandingCrMemosMsg: Label 'Ongoing Credit Memos (%1)', Comment = 'Ongoing Credit Memos (4)';
        ShowMapLbl: Label 'Show on Map';
        CustomerCardServiceCategoryTxt: Label 'Customer Card', Locked = true;
        PageBckGrndTaskStartedTxt: Label 'Page Background Task to calculate customer statistics for customer %1 started.', Locked = true, Comment = '%1 = Customer No.';
        PageBckGrndTaskCompletedTxt: Label 'Page Background Task to calculate customer statistics completed successfully.', Locked = true;
        ExpectedMoneyOwed: Decimal;
        TotalMoneyOwed: Decimal;
        AvgDaysToPay: Decimal;
        FoundationOnly: Boolean;
        CanCancelApprovalForRecord: Boolean;
        EnabledApprovalWorkflowsExist: Boolean;
        NewMode: Boolean;
        EventFilter: Text;
        CaptionTxt: Text;
        CanRequestApprovalForFlow: Boolean;
        CanCancelApprovalForFlow: Boolean;
        IsSaaS: Boolean;
        IsCountyVisible: Boolean;
        StatementFileNameTxt: Label 'Statement', Comment = 'Shortened form of ''Customer Statement''';
        LoadOnDemand: Boolean;
        BackgroundTaskId: Integer;

        eCust: Record Customer;
        Test: Text;
    /*
            eCustAccountVar: code[15];
            eName: Text[30];
            eAddress1: Text[30];
            eAddress2: Text[30];
            eZippCode: Text[30];
            eAddress3: Text[30];
            eCountry: Text[30];
            eeMail: Text[50];
            ePhone: Text[30];
            eYourRef: Text[30];

    */
    [TryFunction]












    local procedure ActivateFields()
    var
        OfficeManagement: Codeunit "Office Management";
    begin
        SetSocialListeningFactboxVisibility;
        ContactEditable := ecust."Primary Contact No." = '';
        IsCountyVisible := FormatAddress.UseCounty(ecust."Country/Region Code");
        ShowCharts := ecust."No." <> '';
        IsOfficeAddin := OfficeManagement.IsAvailable;
    end;

    local procedure ContactOnAfterValidate()
    begin
        ActivateFields;
    end;

    local procedure SetSocialListeningFactboxVisibility()
    var
    //171120 SocialListeningMgt: Codeunit "Social Listening Management";
    begin
        //SocialListeningMgt.GetCustFactboxVisibility(Rec, SocialListeningSetupVisible, SocialListeningVisible);
    end;





    local procedure CreateCustomerFromTemplate()
    var
        //MiniCustomerTemplate: Record "Mini Customer Template";
        Customer: Record Customer;
        VATRegNoSrvConfig: Record "VAT Reg. No. Srv Config";
        ConfigTemplateHeader: Record "Config. Template Header";
        EUVATRegistrationNoCheck: Page "EU VAT Registration No Check";
        CustomerRecRef: RecordRef;
    begin

        if NewMode then begin

            ConfigTemplateHeader.SetRange("Table ID", DATABASE::Customer);
            ConfigTemplateHeader.SetRange(Enabled, true);
            if not ConfigTemplateHeader.IsEmpty then
                CurrPage.Close;

            NewMode := false;
        end;
    end;




}

