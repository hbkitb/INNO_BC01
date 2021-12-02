table 50104 "Ftp Profile ERPG"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; ID; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Profile Id';
        }
        field(2; ProfileName; Code[60])
        {
            DataClassification = ToBeClassified;
            Caption = 'Profile Name';

        }
        field(3; FtpType; Option)
        {
            OptionMembers = "","SFTP","FTPS","FTP";
            OptionCaption = ' ,SFTP,FTPS,FTP';
        }
        field(4; FtpUserName; Text[80])
        {
            DataClassification = ToBeClassified;
            Caption = 'Ftp Username';
        }
        field(5; FTPUserPassword; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Ftp Password';
        }
        field(6; FtpAddress; Text[250])
        {
            Caption = 'Ftp Address';
        }
        field(7; Directions; Option)
        {
            OptionMembers = " ","Download","Upload";
        }
        field(8; Path; Text[250])
        {

        }
        field(9; Port; Integer)
        {

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