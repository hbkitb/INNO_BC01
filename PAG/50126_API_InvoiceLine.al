page 50126 Api_InvoiceLine
{
    PageType = API;  //
    Caption = 'api_InvoiceLine';
    APIPublisher = 'ITB';
    APIGroup = 'ITBGroup';
    APIVersion = 'v1.0';
    EntityName = 'InvoiceLine';
    EntitySetName = 'innoInvoiceLine';
    SourceTable = "Sales Invoice Line";
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
                field(InvoiceNumber; Rec."Document No.")
                {
                    ApplicationArea = All;
                    Caption = 'FakturaNummer';

                }

                field(LineNumber; Rec."Line No.")
                {
                    ApplicationArea = All;
                    Caption = 'Linie nummer';

                }

                field(DeliveryDate; Rec."Shipment Date")
                {
                    ApplicationArea = All;
                    Caption = 'Leveringsdato';

                }

                field(ItemNo; Rec."No.")
                {
                    ApplicationArea = All;
                    Caption = 'VareNummer';

                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    Caption = 'Beskrivelse/VareNavn';

                }

                field(Qty; Rec.Quantity)
                {
                    ApplicationArea = All;
                    Caption = 'Antal';

                }

                field(SalesPrice; Rec."Unit Price")
                {
                    ApplicationArea = All;
                    Caption = 'Salgspris';

                }

                field(LineDisc; Rec."Line Discount %")
                {
                    ApplicationArea = All;
                    Caption = 'Linierabat pct';

                }

                field(LineAmount; Rec."Line Amount")
                {
                    ApplicationArea = All;
                    Caption = 'LinieBeløb';

                }


            }
        }
    }
}