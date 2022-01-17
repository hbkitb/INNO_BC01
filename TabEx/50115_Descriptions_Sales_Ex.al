/*
tableextension 50115 "GL_Entry_Desc" extends "G/L Entry"
{
        fields
    {



    }

    //HBK / ITB - 170122
    trigger OnAfterInsert()

    var

    begin
        if ("Document Type" = "Document Type"::"Credit Memo") then begin
            Rec.Description := 'Kn: ' + Rec."Document No." + ' D: ' + Rec."Source No.";
            Rec.Modify;
        end;

        if ("Document Type" = "Document Type"::Invoice) then begin
            Rec.Description := 'Fa: ' + Rec."Document No." + ' D: ' + Rec."Source No.";
            Rec.Modify;
        end;

    end;

    //HBK / ITB - 170122

    var

}
*/


tableextension 50115 "CustLed_Desc" extends "Cust. Ledger Entry"
{
    fields
    {



    }

    //HBK / ITB - 170122
    trigger OnAfterInsert()

    var

    begin
        if ("Document Type" = "Document Type"::"Credit Memo") then begin
            Rec.Description := 'Kn: ' + Rec."Document No." + ' D: ' + Rec."Customer No.";
            Rec.Modify;
        end;

        if ("Document Type" = "Document Type"::Invoice) then begin
            Rec.Description := 'Fa: ' + Rec."Document No." + ' D: ' + Rec."Customer No.";
            Rec.Modify;
        end;

    end;

    //HBK / ITB - 170122

    var

}


