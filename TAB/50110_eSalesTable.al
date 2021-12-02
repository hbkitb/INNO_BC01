table 50110 "eSalesTable_ITB"
{
    DataClassification = ToBeClassified;
    DataPerCompany = false;
    fields
    {
        field(1; Approve; option)
        {
            OptionMembers = " ","Accepter","Export";
            DataClassification = ToBeClassified;
            Caption = 'Accepter';
        }
        field(2; eSalesNumber; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Nummer';
        }
        field(3; CustAccount; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Debitor';
        }
        field(4; Name; Code[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'Navn';
        }
        field(5; CreateDate; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Oprettet';
        }
        field(6; Address1; Code[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'Adresse1';
        }
        field(7; Address2; Code[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'Adresse2';
        }
        field(8; City; Code[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'ByNavn';
        }
        field(9; ZipCode; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Postnummer';
        }
        field(10; Country; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Land';
        }
        field(11; DlvName; Code[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'LeveringsNavn';
        }
        field(12; DlvAddress1; Code[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'LevAdresse1';
        }
        field(13; DlvAddress2; Code[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'LevAdresse2';
        }
        field(14; DlvCity; Code[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'LevBy';
        }
        field(15; DlvZipCode; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'LevPostNummer';
        }
        field(16; DeliveryMode; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Leveringsmåde';
        }
        field(17; Payment; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Betalingsbetingelse';
        }
        field(18; CVRNo; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'CVR Nummer';
        }
        field(19; PaymentId; Code[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'BetalingsId';
        }
        field(20; Freight; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Fragt';
        }
        field(21; Fee; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Gebyr';
        }

    }

    keys
    {
        key(Approve; eSalesNumber, CustAccount)
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