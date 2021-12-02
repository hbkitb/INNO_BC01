tableextension 50113 "Activities Cue ITB" extends "Activities Cue"

{
    fields
    {

        field(50000; "Ongoing e-Orders"; Integer)
        {
            CalcFormula = Count(esalestable_I WHERE(Status = FILTER(Oprettet | Godkendt | Registreret)));
            Caption = 'oprettede/Godk eordrer';
            FieldClass = FlowField;
        }

        field(50001; "Ongoing Sales Credit Memos"; Integer)
        {
            CalcFormula = Count("Sales Header" WHERE("Document Type" = FILTER("Credit Memo")));
            Caption = 'Ongoing Sales Credit Memos';
            FieldClass = FlowField;
        }


    }

    var

}