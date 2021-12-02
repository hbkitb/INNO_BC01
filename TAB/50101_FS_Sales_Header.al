table 50101 "FS Sales Header ERPG"
{
    DataClassification = ToBeClassified;
    Caption = 'FS salgshoved';
    fields
    {
        field(1; ID; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
            Caption = 'id';
        }
        field(2; account; Code[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Konto';
        }
        field(3; phone; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'telephone nr';
        }
        field(4; salesRep; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'sælger';
        }
        field(5; vatNumber; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Moms nr.';
        }

        field(6; email; Text[60])
        {
            DataClassification = ToBeClassified;
            Caption = 'E-mail';
        }
        field(7; company; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Firma navn';
        }
        field(8; address1; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Adresse';
        }
        field(9; address2; Text[60])
        {
            DataClassification = ToBeClassified;
            Caption = 'Adresse 2';
        }
        field(10; zip; Text[15])
        {
            DataClassification = ToBeClassified;
            Caption = 'Post nr.';
        }
        field(11; city; Text[60])
        {
            DataClassification = ToBeClassified;
            Caption = 'By';
        }
        field(12; country; Text[15])
        {
            DataClassification = ToBeClassified;
            Caption = 'Land';
        }
        field(13; deliverCompany; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Send til firma';
        }
        field(14; deliverAddress1; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Send til adresse';
        }
        field(15; deliverAddress2; Text[60])
        {
            DataClassification = ToBeClassified;
            Caption = 'Send til adresse 2';
        }
        field(16; deliverZip; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Send til Post nr.';
        }
        field(17; deliverCity; Text[60])
        {
            DataClassification = ToBeClassified;
            Caption = 'Send til by';
        }
        field(18; deliverCountry; Text[15])
        {
            DataClassification = ToBeClassified;
            Caption = 'Send til land';
        }
        field(19; purchaser; Text[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'køber';
        }
        field(20; purchaseOrder; Text[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Købs order';
        }
        field(21; orderNote; Text[250])
        {
            DataClassification = ToBeClassified;
            Caption = 'Notat';
        }
        field(22; ImportDate; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'indlæs dato';
        }
        field(23; IsOrderCreated; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'er ordre oprettet';
        }
        field(24; IsDebitorNew; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'debitor ikke oprettet';
        }
        field(25; OrderNo; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Ordre Nr';
        }
        field(26; OrderDate; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Ordre Dato';
        }




    }

    keys
    {
        key(PK; ID)
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