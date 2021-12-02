report 50100 "Consignor File Export ERPG"
{
    UsageCategory = Administration;
    ApplicationArea = All;
    ProcessingOnly = true;
    Caption = 'Ekspoter consignor fil';
    dataset
    {

        dataitem(Header; "Sales Header")
        {
            DataItemTableView = SORTING("No.") ORDER(Ascending);
            MaxIteration = 1;

            column(Kolli; Kolli)
            {
                //hbk Caption = 'Kolli';
            }
            column(Weight; Weight)
            {
                //hbk Caption = 'Vægt';
            }

            trigger OnPostDataItem()
            var
            begin
            end;

            trigger OnPreDataItem()
            var
            begin
                Header.SetRange("No.", Sheader."No.");
            end;

            trigger OnAfterGetRecord()
            var
                x: XmlPort "Consignor export ERPG";
                xd: XmlDocument;
                us: OutStream;
                OUS: OutStream;
                INS: InStream;
                temp: Codeunit "Temp Blob";
                t: Text;
                tt: Text;
                FileList: Record "Ftp Service File ERPG";
                FileProfile: Record "Ftp Profile ERPG";
                Con: Record "Con Label Printer ERPG";
            begin

                Con.SetRange(IsDefault);
                if con.FindFirst() then begin

                    Con.TestField(FileExportProfile);
                    Con.TestField(IsDefault);

                    x.SetTableView(Header);
                    x.ConVar(Kolli, Header, Weight);
                    temp.CreateOutStream(us);

                    x.SetDestination(us);
                    x.Export();
                    //  x.Run();
                    t := x.Filename();
                    temp.CreateInStream(INS);
                    INS.ReadText(tt);

                    //>> ftp send file

                    FileList.FtpProfileID := Format(Con.FileExportProfile);
                    FileList.FileName := t;
                    FileList.FilePath := Con.FilePath;
                    FileList.Direction := FileList.Direction::Export;
                    // FileList.DateTime := CurrentDateTime;
                    FileList.FileLength := temp.Length;
                    FileList.FileBlob.CreateOutStream(OUS);
                    OUS.WriteText(tt);
                    if not FileList.Insert(true) then
                        FileList.Modify(true);


                    //<< ftp send file
                    Header."Consignor filename" := FileList.FileName;
                    Header.Consignor := DT2Date(CurrentDateTime);
                    Header."Consignor Kolli" := Kolli;
                    Header.Modify(true);

                end;
            end;
        }

    }

    requestpage
    {

        layout
        {
            area(Content)
            {

                field(Kolli; Kolli)
                {
                    ApplicationArea = All;
                    Caption = 'Kolli';
                }
                field(Weight; Weight)
                {
                    ApplicationArea = All;
                    Caption = 'Vægt';

                }
                field(no; Header."No.")
                {
                    ApplicationArea = All;
                    Caption = 'Nummer';

                }
            }


        }
        trigger OnOpenPage()
        var

        begin

        end;

    }


    var
        Sheader: Record "Sales Header";
        OrderLines: Record "Sales Line";
        Weight: Decimal;
        Kolli: Decimal;
        i: Integer;

        KolliError: Label 'Kolli skal være et helt tal';

    trigger OnPreReport()
    var

    begin

    end;

    procedure SetParameters(rec: Record "Sales Header")
    var

    begin
        OrderLines.SetRange("Document No.", rec."No.");
        Weight := 0;
        if OrderLines.FindSet() then
            repeat

                Weight := Weight + (OrderLines.Quantity * OrderLines."Gross Weight");

            until OrderLines.Next() = 0;

        Kolli := Weight / 30;
        if rec."Shipment Method Code" = 'POST' then
            Kolli := Weight / 31;


        Kolli := Round(Kolli, 1, '>');
        Sheader := rec;


    end;
}

