page 50127 Api_CrMemoLine
{
    PageType = API;  //
    Caption = 'api_CrMemoLine';
    APIPublisher = 'ITB';
    APIGroup = 'ITBGroup';
    APIVersion = 'v1.0';
    EntityName = 'CrMemoLine';
    EntitySetName = 'innoCrMemoLine';
    SourceTable = "Sales Cr.Memo Line";
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
                field(CrMemoNumber; Rec."Document No.")
                {
                    ApplicationArea = All;
                    Caption = 'KreditNotaNummer';

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