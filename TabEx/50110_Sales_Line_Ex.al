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

        field(50102; PlacCopy; Text[30])
        {
            DataClassification = ToBeClassified;

            Caption = 'Placering';
        }


    }

    //HBK / ITB - 170122
    trigger OnAfterInsert()

    var
        itemTable: Record Item;
        se: Record "Sales & Receivables Setup";

    begin
        se.Get();
        if (se.Country <> 'DK') or ((Rec."Sell-to Customer No." <> se.SVComp) and (Rec."Sell-to Customer No." <> se.NoComp)) then begin
            if (ItemTable.get(Rec."No.")) and (rec.Quantity <> 0) then begin

                if (ItemTable.MinPris <> 0) then begin
                    if ((Rec.Amount / Rec.Quantity) < ItemTable.MinPris) and (ItemTable.MinPris - (Rec.Amount / Rec.Quantity) >= 1) then begin
                        if (rec."Gen. Bus. Posting Group" = '1') or (Rec."Gen. Bus. Posting Group" = '2') then
                            Message('Pris er nu under den anbefalede minimumpris' + '\' +
                                    'under med: ' + Format(ItemTable.MinPris - (Rec.Amount / Rec.Quantity)) + '\' +
                                    'I alt: ' + Format((ItemTable.MinPris - (Rec.Amount / Rec.Quantity)) * Rec.Quantity) + '\' + '\' +
                                    'Kunde: ' + Rec."Sell-to Customer No." + ' Vare: ' + Rec."No.");
                    end;
                end;
            end;
        end;

    end;

    trigger OnAfterModify()

    var
        itemTable: Record Item;
        se: Record "Sales & Receivables Setup";

    begin
        se.Get();
        if (se.Country <> 'DK') or ((Rec."Sell-to Customer No." <> se.SVComp) and (Rec."Sell-to Customer No." <> se.NoComp)) then begin
            if (ItemTable.get(Rec."No.")) and (rec.Quantity <> 0) then begin

                if (ItemTable.MinPris <> 0) then begin                                   //240122
                    if ((Rec.Amount / Rec.Quantity) < ItemTable.MinPris) and (ItemTable.MinPris - (Rec.Amount / Rec.Quantity) >= 1) then begin
                        if (rec."Gen. Bus. Posting Group" = '1') or (Rec."Gen. Bus. Posting Group" = '2') then
                            Message('Pris er nu under den anbefalede minimumpris' + '\' +
                                    'under med: ' + Format(ItemTable.MinPris - (Rec.Amount / Rec.Quantity)) + '\' +
                                    'I alt: ' + Format((ItemTable.MinPris - (Rec.Amount / Rec.Quantity)) * Rec.Quantity) + '\' + '\' +
                                    'Kunde: ' + Rec."Sell-to Customer No." + ' Vare: ' + Rec."No.");
                    end;
                end;
            end;
        end;

    end;
    //HBK / ITB - 170122

    var

}