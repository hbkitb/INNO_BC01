table 50112 "eSalesLine_I"
{
    DataClassification = ToBeClassified;
    fields
    {
        field(1; eSalesNumber; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Nummer';
        }
        field(2; LineNumber; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Linienummer';
        }
        field(3; DeliveryDate; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Leveringsdato';
        }
        field(4; ItemNumber; Code[30])  //30 igen
        {
            DataClassification = ToBeClassified;
            Caption = 'VareNummer';
            TableRelation = Item;
        }
        field(5; Qty; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Antal';
        }
        field(6; SalesPrice; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'SalgsPris';
        }
        field(7; LineDisc; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'LinieRabat';
        }
        field(8; LineAmount; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'LinieBeløb';
        }
        field(9; ID; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
            Caption = 'id';
        }

    }

    keys
    {
        key(SalLin; eSalesNumber, LineNumber)
        {
            Clustered = true;
        }

        key(PK; ID)
        {
            //    Clustered = true;
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