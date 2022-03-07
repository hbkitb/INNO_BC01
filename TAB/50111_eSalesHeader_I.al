table 50111 "eSalesTable_I"
{
    DataClassification = ToBeClassified;
    fields
    {
        field(1; Approve; option)
        {
            OptionMembers = " ","Accepter","Afvis";
            DataClassification = ToBeClassified;
            Caption = 'Accepter';

            trigger OnValidate()
            var

            begin
                if Approve = Approve::Accepter then
                    Status := status::Registreret;
                if Approve = Approve::Afvis then
                    Status := Status::Afvist;
            End;
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

        field(4; Name; Code[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'SLETTET_Navn';
        }

        field(5; CreateDate; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Oprettet';
        }
        field(6; Address1; Code[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'SLETTET_Adresse1';
        }
        field(7; Address2; Code[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'SLETTET_Adresse2';
        }
        field(8; City; Code[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'SLETTET_ByNavn';
        }
        field(9; ZipCode; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Postnummer';
        }
        field(10; Country; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'SLETTET_Land';
        }
        field(11; DlvName; Code[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'SLETTET_LeveringsNavn';
        }
        field(12; DlvAddress1; Code[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'SLETTET_LevAdresse1';
        }
        field(13; DlvAddress2; Code[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'SLETTET_LevAdresse2';
        }
        field(14; DlvCity; Code[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'SLETTET_LevBy';
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

        field(22; ID; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
            Caption = 'id';
        }

        field(23; SalesNumber; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Salgsordrenummer';
        }

        field(24; IsCustomerNew; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Ny debitor';
        }

        field(25; Status; option)
        {
            OptionMembers = "Oprettet","Godkendt","Registreret","Afvist","IOrdre","Faktureret";
            DataClassification = ToBeClassified;
            Caption = 'Status';
        }

        field(26; phone; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Telefon';
        }

        field(27; eMail; Code[80])
        {
            DataClassification = ToBeClassified;
            Caption = 'SLETTET_eMail';
        }

        field(28; SalesRep; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'SLETTET_Sælger';
        }
        field(29; ReferenceNumber; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'SLETTET_Referencenummer';
        }
        field(30; YourRef; Code[35])
        {
            DataClassification = ToBeClassified;
            Caption = 'SLETTET_Deres Ref';
        }
        field(31; OurRef; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'SLETTET_Vores Ref';
        }
        field(32; OrderNote; Code[255])
        {
            DataClassification = ToBeClassified;
            Caption = 'SLETTET_Ordre Note';
        }
        field(33; SalesRep_OLD; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'SLETTET_Sælger';
        }
        //200121 - Her kommer de nye felter
        field(34; Name1; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Navn';
        }

        field(35; Address11; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Adresse1';
        }
        field(36; Address21; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Adresse2';
        }
        field(37; City1; Text[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'ByNavn';
        }

        field(38; Country1; Text[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Land';
        }
        field(39; DlvName1; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'LeveringsNavn';
        }
        field(40; DlvAddress11; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'LevAdresse1';
        }
        field(41; DlvAddress21; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'LevAdresse2';
        }
        field(42; DlvCity1; Text[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'LevBy';
        }


        field(43; eMail1; Text[80])
        {
            DataClassification = ToBeClassified;
            Caption = 'eMail';
        }

        field(44; ReferenceNumber1; Text[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Referencenummer';
        }
        field(45; YourRef1; Text[35])
        {
            DataClassification = ToBeClassified;
            Caption = 'Deres Ref';
        }
        field(46; OurRef1; Text[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Vores Ref';
        }
        field(47; OrderNote1; Text[255])
        {
            DataClassification = ToBeClassified;
            Caption = 'Ordre Note';
        }
        //herover er de nye felter - 200121
        field(48; CompanyId; Text[128])
        {
            DataClassification = ToBeClassified;
            Caption = 'CompanyId';
        }


    }

    keys
    {
        //key(PK; eSalesNumber)
        //{
        //    Clustered = true;
        //}
        key(Approve; eSalesNumber, CustAccount)
        {
            Clustered = true;
        }

        key(PK; ID)
        {
            //    Clustered = true;//
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