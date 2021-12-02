table 50109 "ToldPos ERPG"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; ID; code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(2; Code; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(3; ToldPos; Code[10])
        {
            DataClassification = ToBeClassified;

        }
        field(4; Description; Text[250])
        {
            DataClassification = ToBeClassified;

        }
        field(5; Quantity; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(6; Amount; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(7; Country; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(8; "Net Weight"; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(9; "Weight"; Decimal)
        {
            DataClassification = ToBeClassified;

        }

    }

    keys
    {
        key(PK; id, Code)
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