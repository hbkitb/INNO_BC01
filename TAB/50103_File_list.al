table 50103 "Ftp Service File ERPG"
{
    DataClassification = ToBeClassified;
    Caption = 'Ftp Service Files';
    fields
    {
        field(1; ID; Integer)
        {
            AutoIncrement = true;  //
            Caption = 'File ID';

        }
        field(2; FileName; Text[80])
        {
            DataClassification = ToBeClassified;
            Caption = 'File Name';
        }
        field(3; FilePath; Text[250])
        {
            DataClassification = ToBeClassified;
            Caption = 'FilePath';
        }
        field(4; FtpProfileID; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Profile ID';
        }
        field(5; DateTime; DateTime)
        {
            DataClassification = ToBeClassified;
            Caption = 'Date Time';
        }
        field(6; IsUploaded; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Is uploaded';
        }
        field(7; FileBlob; Blob)
        {
            Caption = 'File blob';
        }
        field(8; FileLength; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'File Length';
        }
        field(9; Direction; Option)
        {

            OptionMembers = " ","Import",Export;
        }
        field(10; IsDownloaded; Boolean)
        {
            DataClassification = ToBeClassified;

        }
    }

    keys
    {
        key(PK; FileName, DateTime, FilePath)
        {
            Clustered = true;
        }
    }

    var
        Service: Record "Ftp Service File ERPG";

    trigger OnInsert()
    begin
        Rec.DateTime := CurrentDateTime;

        Service.SetRange(FileName, Rec.FileName);
        Service.SetRange(FilePath, Rec.FilePath);
        Service.SetRange(FtpProfileID, Rec.FtpProfileID);
        Service.SetRange(Direction, rec.Direction);
        Service.SetFilter(DateTime, '<=%1', Rec.DateTime);
        if Service.FindSet() then
            repeat

                Service.Delete(true);

            until Service.Next() = 0;

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