table 50102 "FS Sales Line ERPG"
{
    DataClassification = ToBeClassified;
    Caption = 'S Salgs Linjer';
    fields
    {
        field(1; id; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'id';
            AutoIncrement = true;
        }
        field(2; headerid; Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = "FS Sales Header ERPG".ID;
            Caption = 'Ordre nr';
        }
        field(3; linenumber; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Linje nr';
        }
        field(4; itemnumber; Code[60])
        {
            DataClassification = ToBeClassified;
            Caption = 'Vare Nr';
        }
        field(5; description; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Beskrivelse';
        }
        field(6; itemprice; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Pris';
        }
        field(7; quantity; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Antal';
        }
        field(8; discount; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Rabat';
        }
    }

    keys
    {
        key(PK; id)
        {
            Clustered = true;
        }
    }

    var


    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}