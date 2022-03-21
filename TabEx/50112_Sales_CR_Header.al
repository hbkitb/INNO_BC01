tableextension 50112 "Salse CR header Inno ITB" extends "Sales Cr.Memo Header"
{
    fields
    {
        field(50100; DKEXPORT; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Kreditnota eksporteret';

        }

        field(50101; Consignor; Date)
        {
            Caption = 'Consignor ekporteret';

        }

        /*
        field(50101; eSalesNumber; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Nummer';
            ObsoleteState = Pending;
            ObsoleteReason = 'Changed datatype';
        }
        */

    }

    var

}