page 50109 Api_Item
{
    PageType = API;  //
    Caption = 'api_item';
    APIPublisher = 'ITB';
    APIGroup = 'ITBGroup';
    APIVersion = 'v1.0';
    EntityName = 'Item';
    EntitySetName = 'innoItem';
    SourceTable = Item;
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
                field(ItemNo; Rec."No.")
                {
                    ApplicationArea = All;
                    Caption = 'VareNummer';

                }

                field(ItemName1; Rec.ItemName1)
                {
                    ApplicationArea = All;
                    Caption = 'VareNavn2 fra C5';

                }

                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    Caption = 'Beskrivelse/Navn2';

                }

                field("Description2"; Rec."Description 2")
                {
                    ApplicationArea = All;
                    Caption = 'Beskrivelse2/Navn2';

                }

                field(UnitPrice; Rec."Unit Price")
                {
                    ApplicationArea = All;
                    Caption = 'Standard enhedspris';

                }
                field(ProductVariantId; Rec.ProductVariantId)
                {
                    ApplicationArea = All;
                    Caption = 'ProductVariantId';

                }
                field("ProductGroup"; Rec."Inventory Posting Group")
                {
                    ApplicationArea = All;
                    Caption = 'ProductGroup';

                }

                field("VendorItemNo"; Rec."Vendor Item No.")
                {
                    ApplicationArea = All;
                    Caption = 'VendorItemNo';

                }
                field(Short; Rec.Short)
                {
                    ApplicationArea = All;
                    Caption = 'Short';

                }

                field(PlacCopy; Rec.PlacCopy)
                {
                    ApplicationArea = All;
                    Caption = 'Placering';

                }

            }
        }
    }
}