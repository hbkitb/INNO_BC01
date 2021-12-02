page 50105 "FtpService Setup ERPG"
{

    PageType = Card;
    SourceTable = "FtpService Setup ERPG";
    Caption = 'Azure Service Setup';
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group(General)
            {
                field(ServiceAdress; Rec.ServiceAdressForUploadeFiles)
                {
                    ApplicationArea = All;
                }
                field(ServiceToken; Rec.ServiceUploadToken)
                {
                    ApplicationArea = All;
                }
                field(ServiceAdressForDownloadFiles; Rec.ServiceAdressForDownloadFiles)
                {
                    ApplicationArea = All;
                }
                field(ServiceDownloadToken; Rec.ServiceDownloadToken)
                {
                    ApplicationArea = All;
                }
                field(ServiceAdressForDeleteFiles; Rec.ServiceAdressForDeleteFiles)
                {
                    ApplicationArea = All;
                }
                field(ServiceDeleteToken; Rec.ServiceDeleteToken)
                {
                    ApplicationArea = All;
                }


            }
        }
    }

}
