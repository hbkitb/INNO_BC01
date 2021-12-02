page 50103 "Ftp Service Setup ERPG"
{

    PageType = List;
    SourceTable = "Ftp Profile ERPG";
    Caption = 'Ftp Service Profiles';
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(ID; Rec.ID)
                {
                    ApplicationArea = All;
                }
                field(ProfileName; Rec.ProfileName)
                {
                    ApplicationArea = All;
                }
                field(FtpType; Rec.FtpType)
                {
                    ApplicationArea = All;
                }
                field(FtpAddress; Rec.FtpAddress)
                {
                    ApplicationArea = All;
                }
                field(FtpUserName; Rec.FtpUserName)
                {
                    ApplicationArea = All;
                }
                field(FTPUserPassword; Rec.FTPUserPassword)
                {
                    ApplicationArea = All;
                }
                field(Directions; Rec.Directions)
                {
                    ApplicationArea = all;
                }
                field(Path; Rec.Path)
                {
                    ApplicationArea = all;
                }
                field(Port; Rec.Port)
                {
                    ApplicationArea = all;
                }

            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(AzureSetup)
            {
                ApplicationArea = All;
                Caption = 'Azure Setup';

                trigger OnAction()
                begin
                    page.Run(50105);
                end;
            }
        }
    }
}
