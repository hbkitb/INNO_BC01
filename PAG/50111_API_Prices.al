page 50111 Api_Prices
{
    PageType = API;  //
    Caption = 'api_prices';
    APIPublisher = 'ITB';
    APIGroup = 'ITBGroup';
    APIVersion = 'v1.0';
    EntityName = 'Prices';
    EntitySetName = 'innoPrices';
    SourceTable = "Sales Price";
    DelayedInsert = true;
    ODataKeyFields = SystemId;
    Editable = false;
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
                field("PriceListCode"; Rec."Sales Code")
                {
                    ApplicationArea = All;
                    Caption = 'PrislisteKode';

                }


                field(AmountType; rec."Sales Type")
                {
                    ApplicationArea = All;
                    Caption = 'Type: kunde/debitorprisgruppe/Alle';

                }


                field(AssetNo; Rec."Item No.")
                {
                    ApplicationArea = All;
                    Caption = 'VareNr';

                }

                field(CurrencyCode; Rec."Currency Code")
                {
                    ApplicationArea = All;
                    Caption = 'Valutakode';

                }

                field(StartingDate; Rec."Starting Date")
                {
                    ApplicationArea = All;
                    Caption = 'Startdato';

                }

                field(EndingDate; Rec."Ending Date")
                {
                    ApplicationArea = All;
                    Caption = 'Slutdato';

                }

                field(MinimumQuantity; Rec."Minimum Quantity")
                {
                    ApplicationArea = All;
                    Caption = 'Min. antal';

                }

                field(UnitPrice; Rec."Unit Price")
                {
                    ApplicationArea = All;
                    Caption = 'Enhedspris';

                }

            }
        }
    }
}

/*
page 50111 Api_Prices
{
    PageType = API;  //
    Caption = 'api_prices';
    APIPublisher = 'ITB';
    APIGroup = 'ITBGroup';
    APIVersion = 'v1.0';
    EntityName = 'Prices';
    EntitySetName = 'innoPrices';
    SourceTable = "Price List Line";
    DelayedInsert = true;
    ODataKeyFields = SystemId;
    Editable = false;
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
                field("PriceListCode"; Rec."Price List Code")
                {
                    ApplicationArea = All;
                    Caption = 'PrislisteKode';

                }

                field(LineNumber; Rec."Line No.")
                {
                    ApplicationArea = All; //
                    Caption = 'LinieNr';

                }

                field(AmountType; Rec."Amount Type")
                {
                    ApplicationArea = All;
                    Caption = 'Type: alle,Pris,Kost,Rabat';

                }

                field(SourceType; Rec."Source Type")
                {
                    ApplicationArea = All;
                    Caption = 'DebKreType:alle,alle cu,cust,cu.pr.gr,cu.disc.gr,alle vend,vend,';

                }

                field(SourceNo; Rec."Source No.")
                {
                    ApplicationArea = All;
                    Caption = 'Deb/kre-nr/grp';

                }

                field(AssetType; Rec."Asset Type")
                {
                    ApplicationArea = All;
                    Caption = 'alle,Vare/res,grp';

                }

                field(AssetNo; Rec."Asset No.")
                {
                    ApplicationArea = All;
                    Caption = 'Vare/Res-nr/grp';

                }

                field(CurrencyCode; Rec."Currency Code")
                {
                    ApplicationArea = All;
                    Caption = 'Valutakode';

                }

                field(StartingDate; Rec."Starting Date")
                {
                    ApplicationArea = All;
                    Caption = 'Startdato';

                }

                field(EndingDate; Rec."Ending Date")
                {
                    ApplicationArea = All;
                    Caption = 'Slutdato';

                }

                field(MinimumQuantity; Rec."Minimum Quantity")
                {
                    ApplicationArea = All;
                    Caption = 'Min. antal';

                }

                field(UnitPrice; Rec."Unit Price")
                {
                    ApplicationArea = All;
                    Caption = 'Enhedspris';

                }

                field(LineDisc; Rec."Line Discount %")
                {
                    ApplicationArea = All;
                    Caption = 'LinieRabat';

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
*/
