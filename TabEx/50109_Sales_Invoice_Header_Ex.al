tableextension 50109 "Sales Invoice Header ERPG" extends "Sales Invoice Header"
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
    }

    var

}