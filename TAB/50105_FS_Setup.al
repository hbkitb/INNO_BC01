/*table 50105 "FS Setup ERPG"
{
    DataClassification = ToBeClassified;
    Caption = 'Fredes system opsætning';

    fields
    {
        field(1; MyField; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(2; FTPProfil; Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Ftp Profile ERPG".ID;
        }

    }

    keys
    {
        key(PK; MyField)
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

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

}*/