codeunit 50107 "FTP API Get Files ERPG"
{
    trigger OnRun()

    begin
        api.SendFiles();
    end;

    var
        api: Codeunit "Api Call FTP ERPG";
}