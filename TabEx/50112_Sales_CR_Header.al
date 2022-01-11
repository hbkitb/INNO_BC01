tableextension 50112 "Salse CR header Inno ITB" extends "Sales Cr.Memo Header"
{
    fields
    {
        field(50100; DKEXPORT; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Kreditnota eksporteret';

        }

    }

    var

}