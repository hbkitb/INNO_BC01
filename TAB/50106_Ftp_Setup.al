table 50106 "FtpService Setup ERPG"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; id; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'id';
        }
        field(2; "ServiceAdressForUploadeFiles"; Text[250])
        {
            DataClassification = ToBeClassified;
            Caption = 'Service upload Adress';
        }
        field(3; ServiceUploadToken; Text[250])
        {
            DataClassification = ToBeClassified;
            Caption = 'Service upload Token';
        }

        field(4; "ServiceAdressForDownloadFiles"; Text[250])
        {
            DataClassification = ToBeClassified;
            Caption = 'Service Download Adress';
        }
        field(5; ServiceDownloadToken; Text[250])
        {
            DataClassification = ToBeClassified;
            Caption = 'Service Download Token';
        }

        field(7; "ServiceAdressForDeleteFiles"; Text[250])
        {
            DataClassification = ToBeClassified;
            Caption = 'Service Delete Adress';
        }
        field(8; ServiceDeleteToken; Text[250])
        {
            DataClassification = ToBeClassified;
            Caption = 'Service Delete Token';
        }
    }

    keys
    {
        key(PK; id)
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