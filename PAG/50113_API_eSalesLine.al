page 50113 Api_eSalesLine
{
    PageType = API;  //
    Caption = 'api_eSalesLine';
    APIPublisher = 'ITB';
    APIGroup = 'ITBGroup';
    APIVersion = 'v1.0';
    EntityName = 'eSalesLine';
    EntitySetName = 'innoESalesLine';
    SourceTable = eSalesLine_I;
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
                field(ESalesNumber; Rec.eSalesNumber)
                {
                    ApplicationArea = All;
                    Caption = 'eSalesNumber';

                }

                field(LineNumber; Rec.LineNumber)
                {
                    ApplicationArea = All;
                    Caption = 'Linie nummer';

                }

                field(DeliveryDate; Rec.DeliveryDate)
                {
                    ApplicationArea = All;
                    Caption = 'Leveringsdato';

                }

                field(ItemNo; Rec.ItemNumber)
                {
                    ApplicationArea = All;
                    Caption = 'VareNavn';

                }

                field(Qty; Rec.Qty)
                {
                    ApplicationArea = All;
                    Caption = 'Antal';

                }

                field(SalesPrice; Rec.SalesPrice)
                {
                    ApplicationArea = All;
                    Caption = 'Salgspris';

                }

                field(LineDisc; Rec.LineDisc)
                {
                    ApplicationArea = All;
                    Caption = 'Linierabat pct';

                }

                field(LineAmount; Rec.LineAmount)
                {
                    ApplicationArea = All;
                    Caption = 'LinieBeløb';

                }


            }
        }
    }
}