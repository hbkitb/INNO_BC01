page 50124 Api_InvoiceHeader
{
    PageType = API;  //
    Caption = 'api_InvoiceHeader';
    APIPublisher = 'ITB';
    APIGroup = 'ITBGroup';
    APIVersion = 'v1.0';
    EntityName = 'InvoiceHeader';
    EntitySetName = 'innoInvoiceHeader';
    SourceTable = "Sales Invoice Header";
    DelayedInsert = true;
    ODataKeyFields = SystemId;
    //Editable = false;
    //

    layout
    {
        area(Content)
        {
            field(Id; Rec.SystemId)
            {
                ApplicationArea = All;
                Caption = 'GUID';

            }

            repeater(Generel)
            {
                field(InvoiceNumber; Rec."No.")
                {
                    ApplicationArea = All;
                    Caption = 'FakturaNummer';

                }

                field(InvoiceAccount; Rec."Bill-to Customer No.")
                {
                    ApplicationArea = All;
                    Caption = 'DebitorNummer/Konto';

                }

                field(InvoiceAccountName; Rec."Bill-to Name")
                {
                    ApplicationArea = All;
                    Caption = 'Debitornavn';

                }

                field(Address1; Rec."Bill-to Address")
                {
                    ApplicationArea = All;
                    Caption = 'Adresse1';

                }

                field(Address2; Rec."Bill-to Address 2")
                {
                    ApplicationArea = All;
                    Caption = 'Adresse2';

                }

                field(City; Rec."Bill-to City")
                {
                    ApplicationArea = All;
                    Caption = 'By';

                }

                field(Country; Rec."Bill-to Country/Region Code")
                {
                    ApplicationArea = All;
                    Caption = 'Land';

                }

                field(ZipCode; Rec."Bill-to Post Code")
                {
                    ApplicationArea = All;
                    Caption = 'PostNummer';

                }

                field(DlvName; Rec."Ship-to Name")
                {
                    ApplicationArea = All;
                    Caption = 'LeveringsNavn';

                }

                field(DlvAddress1; Rec."Ship-to Address")
                {
                    ApplicationArea = All;
                    Caption = 'LeveringsAdresse1';

                }

                field(DlvAddress2; Rec."Ship-to Address 2")
                {
                    ApplicationArea = All;
                    Caption = 'LeveringsAdresse2';

                }

                field(DlvZipCode; Rec."Ship-to Post Code")
                {
                    ApplicationArea = All;
                    Caption = 'LeveringsPostNummer';

                }
                field(DlvCity; Rec."Ship-to City")
                {
                    ApplicationArea = All;
                    Caption = 'LeveringsBy';

                }
                field(SellToAccount; Rec."Sell-to Customer No.")
                {
                    ApplicationArea = All;
                    Caption = 'DebitorNummer/Konto';

                }
                /*
                               field(DeliveryMode; Rec.DeliveryMode)
                               {
                                   ApplicationArea = All;
                                   Caption = 'Leveringsform';

                               }


                               field(Payment; Rec.Payment)
                               {
                                   ApplicationArea = All;
                                   Caption = 'Leveringsbetingelse';

                               }

                               field(CvrNo; Rec.CVRNo)
                               {
                                   ApplicationArea = All;
                                   Caption = 'Debitor CVRNo';

                               }
                               */


                /*
                                field(Freight; Rec.Freight)
                                {
                                    ApplicationArea = All;
                                    Caption = 'Fragt';

                                }

                                field(Fee; Rec.Fee)
                                {
                                    ApplicationArea = All;
                                    Caption = 'Gebyr';

                                }
                                */

                field(Phone; Rec."Sell-to Phone No.")
                {
                    ApplicationArea = All;
                    Caption = 'Telefon';

                }

                field(EMail; Rec."Sell-to E-Mail")
                {
                    ApplicationArea = All;
                    Caption = 'eMail';

                }
                field(SalesRep; Rec."Salesperson Code")
                {
                    ApplicationArea = All;
                    Caption = 'Sælger';
                }
                field(ReferenceNumber; Rec."External Document No.")
                {
                    ApplicationArea = All;
                    Caption = 'ReferenceNummer';
                }
                field(YourRef; Rec."Your Reference")
                {
                    ApplicationArea = All;
                    Caption = 'Deres Ref';
                }
                field(OurRef; Rec."Salesperson Code")
                {
                    ApplicationArea = All;
                    Caption = 'Vores Ref';
                }
                field(OrderNo; Rec."Order No.")
                {
                    ApplicationArea = All;
                    Caption = 'OrdreNummer';
                }
                field(VatNumber; Rec."VAT Registration No.")
                {
                    ApplicationArea = All;
                    Caption = 'CVR';

                }
                field(PackageTrackingNo; Rec."Package Tracking No.")
                {
                    ApplicationArea = All;
                    Caption = 'PakkeNummer/Consignor';

                }
                field(OrderAmount; Rec.Amount)
                {
                    ApplicationArea = All;
                    Caption = 'Total ex. moms';

                }

            }
        }
    }
}