page 50100 "Con Lable List"
{

    PageType = List;
    SourceTable = "Con Label Printer ERPG";
    Caption = 'Con Lable List';
    ApplicationArea = all;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(PrinterID; Rec.PrinterID)
                {
                    ApplicationArea = All;
                }
                field(Printer; Rec.Printer)
                {
                    ApplicationArea = All;
                }
                field(IsDefault; Rec.IsDefault)
                {
                    ApplicationArea = All;
                }
                field(FilePath; Rec.FilePath)
                {
                    ApplicationArea = All;
                }
                field(FileExportProfile; Rec.FileExportProfile)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

}
