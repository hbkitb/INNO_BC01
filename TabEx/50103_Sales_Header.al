tableextension 50103 "Salse header Inno ERPG" extends "Sales Header"
{
    fields
    {
        field(50100; DKEXPORT; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Faktura eksporteret';

        }
        field(50101; Consignor; Date)
        {
            Caption = 'Consignor ekporteret';

        }

        field(50102; WINEDIDato; Date)
        {
            Caption = 'WINEDIDato';

        }

        field(50103; PakkeNo; Text[20])
        {
            Caption = 'Pakkenummer';

        }

        field(50104; Nos_FakDif; Decimal)
        {
            Caption = 'Nos_FakDif';

        }

        field(50105; "Consignor filename"; Text[100])
        {
            Caption = 'Consignor file name';

        }
        field(50106; "Consignor Kolli"; Integer)
        {
            Caption = 'Consignor kolli antal';

        }

        field(50107; "eSalesNumber"; Text[20])
        {
            Caption = 'eOrdreNr';

        }

        field(50108; "Consignor Vægt"; Decimal)
        {
            Caption = 'Consignor Vægt';

        }
    }

    //HBK / ITB - 130122
    trigger OnAfterInsert()

    var
        SellCust: Record Customer;
    begin
        SellCust.Reset;
        SellCust.SetRange("No.", "Sell-to Customer No.");
        if SellCust.FindSet then begin
            if SellCust."Salesperson Code" <> '' then begin
                Rec."Salesperson Code" := SellCust."Salesperson Code";
                Rec.Modify;
            end;
        end;

    end;
    //HBK / ITB - 130122


    var

}