table 50100 "Con Label Printer ERPG"
{
    Caption = 'Consigner label printer';
    DataClassification = ToBeClassified;
    TableType = Normal;
    fields
    {
        field(1; PrinterID; Integer)
        {
            Caption = 'Printer ID';
            DataClassification = ToBeClassified;

            AutoIncrement = true;
        }
        field(2; Printer; Text[60])
        {
            Caption = 'Printer';
            DataClassification = ToBeClassified;

            trigger OnValidate()
            var

            begin

            end;
        }
        field(3; IsDefault; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Er standart';
        }
        field(4; FilePath; Text[250])
        {
            DataClassification = ToBeClassified;

        }
        field(5; FileExportProfile; Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Ftp Profile ERPG".ID;
        }
    }

    keys
    {
        key(PK; PrinterID)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; PrinterID, Printer) { }
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