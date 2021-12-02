codeunit 50106 "FTP API Send Files ERPG"
{
    trigger OnRun()

    begin
        api.SendFiles();
    end;

    var
        api: Codeunit "Api Call FTP ERPG";
}