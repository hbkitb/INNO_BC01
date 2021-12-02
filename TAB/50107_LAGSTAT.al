table 50107 "Lagstat ERPG"
{
    DataClassification = ToBeClassified;
    Caption = 'Lager status';
    DataPerCompany = false;

    fields
    {
        field(1; Code; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Vare Nr.';
        }
        field(2; Inventory; Decimal)
        {
            Caption = 'Antal';


        }
        field(3; InsertDate; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Dato';
        }

    }

    keys
    {
        key(PK; Code, InsertDate)
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