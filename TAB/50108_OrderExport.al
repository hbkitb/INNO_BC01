table 50108 "Order Export ERPG"
{
    DataClassification = ToBeClassified;
    DataPerCompany = false;
    fields
    {
        field(1; OrdreNummer; Code[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Ordre nr';
        }
        field(2; LinieNummer; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Linje nr';
        }
        field(3; Varenummer; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Vare nr';
        }
        field(4; Lokation; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Lokation';
        }
        field(5; "Antal"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Antal';
        }
        field(6; "Pris (stk. pris)"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'pris (stk.)';
        }
        field(7; "Rabat (procent)"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Rabat';
        }
        field(8; "Beløb (samlet for linien)"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Linje beløb';
        }
        field(9; Tekst; Text[250])
        {
            DataClassification = ToBeClassified;
            Caption = 'Beskrivelse';
        }
        field(10; Enhed; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Enhed';
        }
        field(11; Momskode; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Momskode';
        }
        field(12; "Antal lever nu"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Antal lever nu';
        }
        field(13; "Oprettet dato"; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Oprettet dato';
        }
        field(14; Leveringsdato; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Leverings dato';
        }
        field(15; "Bekræftet dato"; Code[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Bekræftet dato';
        }
        field(16; Debitorkonto; Code[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Debitor konto';
        }
        field(17; Serienummer; Code[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Serienummer';
        }
        field(18; "Leveret antal"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Leveret antal';
        }
        field(19; "Faktureret antal"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Faktureret antal';
        }
        field(20; "Leveret værdi i valuta"; Code[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Leveret værdi i valuta';
        }
        field(21; Transaktionsnummer; Code[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Transaktionsnummer';
        }
        field(22; "Kostpris samlet i  LCY"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Samlet kostpris LCY';
        }
        field(23; "(et nul)"; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = '';
        }
        field(24; "blank tekstfelt"; Text[250])
        {
            DataClassification = ToBeClassified;
            Caption = '';
        }
        field(25; "Liniestatus"; Code[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Linje status';
        }
        field(26; Lagerstatus; Code[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Lagerstatus';
        }
        field(27; "Medarbejder / sælger initialer"; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Sælger kode';
        }
        field(28; KitRefId; Code[50])
        {
            DataClassification = ToBeClassified;

        }
        field(29; OrigNumberRef; Code[50])
        {
            DataClassification = ToBeClassified;

        }
        field(30; TradeCode; Code[50])
        {
            DataClassification = ToBeClassified;

        }
        field(31; "Antal2"; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(32; IgnoreListCode; Code[50])
        {
            DataClassification = ToBeClassified;

        }
        field(33; "Prisenhed kode"; Code[50])
        {
            DataClassification = ToBeClassified;

        }
        field(34; Land; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Country/Region".Code;
            Caption = 'Eksport land';
        }
        field(35; IsCreated; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Ordre oprettet';
        }
    }

    keys
    {
        key(PK; OrdreNummer, Debitorkonto, LinieNummer, Land, Varenummer) //varenummer 100122
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