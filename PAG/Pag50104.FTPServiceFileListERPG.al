page 50104 "FTP Service File List ERPG"
{
    ApplicationArea = all;
    PageType = List;
    SourceTable = "Ftp Service File ERPG";
    Caption = 'FTP Service File List';
    UsageCategory = Lists;
    layout
    {
        area(content)
        {
            repeater(General)
            {

                field(FileName; Rec.FileName)
                {
                    ApplicationArea = All;
                }
                field(FilePath; Rec.FilePath)
                {
                    ApplicationArea = All;
                }
                field(FtpProfileID; Rec.FtpProfileID)
                {
                    ApplicationArea = All;
                }
                field(IsUploaded; Rec.IsUploaded)
                {
                    ApplicationArea = All;
                }
                field(DateTime; Rec.DateTime)
                {
                    ApplicationArea = All;
                }
                field(FileBlob; Rec.FileBlob)
                {
                    ApplicationArea = All;
                }
                field(FileLength; Rec.FileLength)
                {
                    ApplicationArea = All;
                }
                field(IsDownloaded; Rec.IsDownloaded)
                {
                    ApplicationArea = All;
                }
                field(Direction; Rec.Direction)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(createfsFiles)
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    cod: Codeunit "FS Export";
                begin
                    cod.CreateAllFSFiles();
                end;
            }

            /*         action(testonefile)
                     {
                         ApplicationArea = All;

                         trigger OnAction()
                         var
                             cod: Codeunit "FS Export";
                             FT: Record "Ftp Service File ERPG";
                             ous: OutStream;
                             INS: InStream;

                             med: XmlPort "FS MED ERPG";
                             t: Text;
                         begin
                             Clear(ft);
                             ft.Init();
                             ft.ID := 0;

                             ft.FileBlob.CreateOutStream(OUS);
                             MED.SetDestination(OUS);
                             ft.FileName := MED.Filename;
                             ft.FilePath := '/FS';
                             t := MED.Filename;
                             MED.Export();
                             ft.Insert(true);

                             ft.FileLength := ft.FileBlob.Length;
                             ft.Modify(true);

                             ft.FileBlob.CreateInStream(INS);
                             file.DownloadFromStream(INS, '', '', '', t);

                         end;
                     }*/

            action(Downloadfile)
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    ins: InStream;
                    t: Text;
                begin

                    Rec.FileBlob.CreateInStream(ins);
                    t := Rec.FileName;
                    file.DownloadFromStream(ins, '', '', '', t);
                end;
            }
            action(SendFiles)
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    cod: Codeunit "Api Call FTP ERPG";
                begin
                    cod.SendFiles();
                end;
            }
            action(GETFiles)
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    cod: Codeunit "Api Call FTP ERPG";
                begin
                    cod.GetAllFiles();
                end;
            }

        }
    }
}
