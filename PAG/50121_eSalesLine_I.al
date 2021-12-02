page 50121 "eSalesLine_I"
{

    PageType = List;
    SourceTable = eSalesLine_I;
    Caption = 'eSalesLine';
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {

            repeater(Generel)
            {
                field(eSalesNumber; Rec.eSalesNumber)
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

                field(ItemNumber; Rec.ItemNumber)
                {
                    ApplicationArea = All;
                    Caption = 'VareNummer';

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
