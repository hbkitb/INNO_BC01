tableextension 50111 "Sales Shipment Line Inno ERPG" extends "Sales Shipment Line"
{
    fields
    {
        field(50100; DKExport; Boolean)
        {
            Caption = 'DKExport';

        }

        field(50101; ShelfNo; Code[10])
        {
            Caption = 'Placering';
            trigger OnValidate()
            var
                item: Record Item;
            begin
                if type = Type::Item then begin

                end;
            end;
        }

        field(50102; PlacCopy; Text[30])
        {
            DataClassification = ToBeClassified;

            Caption = 'Placering';
        }



    }


    var

}