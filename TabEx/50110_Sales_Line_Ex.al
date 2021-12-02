tableextension 50110 "Sales Line ERPG" extends "Sales Line"
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
                    if ItemExists("No.") then begin
                        item.Get("No.");
                        ShelfNo := item.PlacCopy;
                    end;
                end;
            end;
        }

    }

    var

}