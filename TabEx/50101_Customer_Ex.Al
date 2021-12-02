tableextension 50101 "CustEx ERPG" extends Customer
{
    fields
    {


        field(50101; PDFfaktura; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'PDFfaktura';

        }
        field(50102; Bogholder; Text[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'Bogholder';

        }

        field(50103; UNuse; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'UNuse';

        }
        field(50104; OrgNr; Text[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Org.Nr.';
        }
        field(50105; EHF; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'EHF faktura';

        }
        field(50106; CompanyId; Text[128])
        {
            DataClassification = ToBeClassified;
            Caption = 'CompanyId';
        }

    }

    var

}

