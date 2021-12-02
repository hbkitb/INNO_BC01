codeunit 50102 "Api Call FTP ERPG"
{
    trigger OnRun()

    begin
        GetAllFiles();
    end;

    var

    procedure sendFileToFTP(JSON: Text; var HttpCode: Integer): Text;
    var
        gcontent: HttpContent;
        gHttpClient: HttpClient;
        gheaders: HttpHeaders;
        greqMsg: HttpRequestMessage;
        gResponseMsg: HttpResponseMessage;
        ltext: Text;
        lheaders: HttpHeaders;
        JasonToken: JsonToken;
        JasonObject: JsonObject;
        ContentTxt: Text;
        Path: Text;
        int: Integer;

        setup: Record "FtpService Setup ERPG";
    begin
        if JSON = '' then
            exit;
        setup.Get();
        setup.TestField(ServiceAdressForUploadeFiles);
        setup.TestField(ServiceUploadToken);

        Path := setup.ServiceAdressForUploadeFiles + '?code=' + setup.ServiceUploadToken;

        gcontent.Clear();
        ltext := StrSubstNo(JSON);

        gcontent.WriteFrom(ltext);
        greqMsg.SetRequestUri(Path);

        gheaders.Clear();
        lheaders.Clear();

        gcontent.GetHeaders(lheaders);
        lheaders.Remove('Content-Type');
        lheaders.Add('Content-Type', 'application/json');
        gcontent.GetHeaders(lheaders);

        greqMsg.GetHeaders(gheaders);
        gheaders.Add('accept', 'application/Json');
        greqMsg.Content(gcontent);

        greqMsg.GetHeaders(gheaders);
        greqMsg.Method := 'POST';
        if not gHttpClient.Send(greqMsg, gResponseMsg) then
            //  Error('API Authorization token request failed');
            gResponseMsg.Content().ReadAs(ContentTxt);
        // JasonObject.ReadFrom(ContentTxt);
        HttpCode := gResponseMsg.HttpStatusCode;
        exit(ContentTxt);
    end;

    local procedure CreateFtpJson(Ftpfile: Record "Ftp Service File ERPG"; FtpProfile: Record "Ftp Profile ERPG"): text;
    var
        t: text;
        filetxt: Text;

        ins: InStream;
        int: Integer;

        bConvert: Codeunit "Base64Convert Inno ERPG";
    begin
        Ftpfile.TestField(FileName);
        Ftpfile.TestField(FilePath);
        //  Ftpfile.TestField(FileBlob);
        FtpProfile.TestField(FtpType);
        FtpProfile.TestField(FtpUserName);
        FtpProfile.TestField(FTPUserPassword);
        FtpProfile.TestField(FtpAddress);
        FtpProfile.TestField(Port);

        Ftpfile.CalcFields(FileBlob);
        Ftpfile.FileBlob.CreateInStream(ins);
        int := ins.Read(filetxt, Ftpfile.FileBlob.Length);

        filetxt := bConvert.TextToBase64String(filetxt);
        if filetxt = '' then
            Error('File null - ' + Format(int));
        if filetxt <> '' then
            t := '{' +
                    '"filename":"' + Ftpfile.FileName + '",' +
                    '"filepath":"' + Ftpfile.FilePath + '",' +
                    '"filebase64":"' + filetxt + '",' +
                    '"type":"' + Format(FtpProfile.FtpType) + '",' +
                    '"username":"' + FtpProfile.FtpUserName + '",' +
                    '"password":"' + FtpProfile.FTPUserPassword + '",' +
                    '"host":"' + FtpProfile.FtpAddress + '",' +
                    '"length":"' + Format(int) + '",' +
                     '"port":"' + Format(FtpProfile.Port) + '"' +
                    '}';

        exit(t);

    end;

    procedure SendFiles()
    var
        FProfile: Record "Ftp Profile ERPG";
        FList: Record "Ftp Service File ERPG";
        Json: Text;
        Respons: Text;
        HttpCode: Integer;
    begin
        FList.SetRange(Direction, FList.Direction::Export);
        FList.SetRange(IsUploaded, false);
        FList.SetRange(IsDownloaded, false);
        if FList.FindSet() then
            repeat
                Clear(FProfile);

                FProfile.SetRange(ID, FList.FtpProfileID);
                if FProfile.FindFirst() then begin
                    Json := CreateFtpJson(FList, FProfile);

                    Respons := sendFileToFTP(Json, HttpCode);
                    if HttpCode = 200 then begin
                        FList.IsUploaded := true;
                        FList.Modify(true);
                        Commit();
                    end;
                end;

            until FList.Next() = 0;
    end;

    procedure SendFile(VAR rec: Record "Ftp Service File ERPG")
    var
        FProfile: Record "Ftp Profile ERPG";
        Json: Text;
        Respons: Text;
        HttpCode: Integer;
    begin
        if (not rec.IsUploaded)
        and (not rec.IsDownloaded)
        and (rec.Direction = rec.Direction::Export)
        and (rec.FilePath <> '')

        then begin


            FProfile.SetRange(ID, rec.FtpProfileID);
            if FProfile.FindFirst() then begin
                Json := CreateFtpJson(rec, FProfile);

                Respons := sendFileToFTP(Json, HttpCode);
                if HttpCode = 200 then begin
                    rec.IsUploaded := true;
                    rec.Modify(true);

                end;
            end;
        end;
    end;

    local procedure GetFilesFromFtp(JSON: Text; var HttpCode: Integer): Text;
    var
        gcontent: HttpContent;
        gHttpClient: HttpClient;
        gheaders: HttpHeaders;
        greqMsg: HttpRequestMessage;
        gResponseMsg: HttpResponseMessage;
        ltext: Text;
        lheaders: HttpHeaders;
        JasonToken: JsonToken;
        JasonObject: JsonObject;
        ContentTxt: Text;
        Path: Text;
        int: Integer;

        setup: Record "FtpService Setup ERPG";
    begin
        if JSON = '' then
            exit;
        setup.Get();
        setup.TestField(ServiceAdressForDownloadFiles);
        setup.TestField(ServiceDownloadToken);

        Path := setup.ServiceAdressForDownloadFiles + '?code=' + setup.ServiceDownloadToken;

        gcontent.Clear();
        ltext := StrSubstNo(JSON);

        gcontent.WriteFrom(ltext);
        greqMsg.SetRequestUri(Path);

        gheaders.Clear();
        lheaders.Clear();

        gcontent.GetHeaders(lheaders);
        lheaders.Remove('Content-Type');
        lheaders.Add('Content-Type', 'application/json');
        gcontent.GetHeaders(lheaders);

        greqMsg.GetHeaders(gheaders);
        //   gheaders.Add('accept', 'application/Json');
        greqMsg.Content(gcontent);

        greqMsg.GetHeaders(gheaders);
        greqMsg.Method := 'POST';
        if not gHttpClient.Send(greqMsg, gResponseMsg) then
            exit;
        gResponseMsg.Content().ReadAs(ContentTxt);

        // JasonObject.ReadFrom(ContentTxt);
        HttpCode := gResponseMsg.HttpStatusCode;
        exit(ContentTxt);
    end;

    local procedure ImportFiles(FtpProfile: Record "Ftp Profile ERPG")
    var
        JsonIn: Text;
        JsonOUT: Text;
        Base64: Text;
        bConvert: Codeunit "Base64Convert Inno ERPG";
        HttpCode: Integer;
        JasonToken: JsonToken;
        JasonObject: JsonObject;
        JasonArray: JsonArray;
        int: Integer;
        FTPFile: Record "Ftp Service File ERPG";
        OUS: OutStream;
    begin
        FtpProfile.TestField(FtpAddress);
        FtpProfile.TestField(FtpUserName);
        FtpProfile.TestField(FTPUserPassword);
        FtpProfile.TestField(Path);


        JsonOUT := '{' +
            '"filepath":"' + FtpProfile.Path + '",' +
            '"type":"' + Format(FtpProfile.FtpType) + '",' +
            '"username":"' + FtpProfile.FtpUserName + '",' +
            '"password":"' + FtpProfile.FTPUserPassword + '",' +
            '"host":"' + FtpProfile.FtpAddress + '",' +
             '"port":"' + Format(FtpProfile.Port) + '"' +
            '}';

        JsonIn := GetFilesFromFtp(JsonOUT, HttpCode);
        //  JsonIn := sendFileToFTP(JsonOUT, HttpCode);

        if not JasonObject.ReadFrom(JsonIn) then
            exit;
        JasonObject.Get('files', JasonToken);
        JasonArray := JasonToken.AsArray();

        for int := 0 to JasonArray.Count() - 1 do begin

            JasonArray.Get(int, JasonToken);
            JasonObject := JasonToken.AsObject();

            Clear(FTPFile);
            FTPFile.ID := 0;
            FTPFile.Init();

            JasonObject.Get('name', JasonToken);
            FTPFile.FileName := JasonToken.AsValue().AsText();

            JasonObject.Get('path', JasonToken);
            FTPFile.FilePath := JasonToken.AsValue().AsText();

            JasonObject.Get('base64', JasonToken);
            Base64 := JasonToken.AsValue().AsText();
            FTPFile.FileBlob.CreateOutStream(OUS);

            bConvert.FromBase64StringToStream(Base64, OUS);
            FTPFile.FileLength := FTPFile.FileBlob.Length;

            FTPFile.FtpProfileID := FtpProfile.ID;

            FTPFile.Direction := FTPFile.Direction::Import;

            if FTPFile.FileBlob.Length > 0 then
                FTPFile.IsDownloaded := true;

            if not FTPFile.Insert(true) then
                FTPFile.Modify(true);
            Commit();
        end;
    end;

    procedure GetAllFiles()
    var
        FtpProfile: Record "Ftp Profile ERPG";
        FtpService: Record "Ftp Service File ERPG";
    begin
        FtpProfile.SetRange(Directions, FtpProfile.Directions::Download);

        if FtpProfile.FindSet() then
            repeat

                ImportFiles(FtpProfile);
            until FtpProfile.Next() = 0;



    end;

    procedure DeleteFile(FileName: Text; FtpProfile: Record "Ftp Profile ERPG")
    var
        JsonOUT: Text;
        gcontent: HttpContent;
        gHttpClient: HttpClient;
        gheaders: HttpHeaders;
        greqMsg: HttpRequestMessage;
        gResponseMsg: HttpResponseMessage;
        ltext: Text;
        lheaders: HttpHeaders;
        JasonToken: JsonToken;
        JasonObject: JsonObject;
        ContentTxt: Text;
        Path: Text;
        int: Integer;
        ftpFiles: Record "Ftp Service File ERPG";
        setup: Record "FtpService Setup ERPG";
    begin


        /*
                ftpFiles.SetRange(FtpProfileID, FtpProfile.ID);
                ftpFiles.SetRange(FileName, FileName);
        */ // mak if statement


        JsonOUT := '{' +
        '"filename":"' + FileName + '",' +
        '"filepath":"' + FtpProfile.Path + '",' +
        '"type":"' + Format(FtpProfile.FtpType) + '",' +
        '"username":"' + FtpProfile.FtpUserName + '",' +
        '"password":"' + FtpProfile.FTPUserPassword + '",' +
        '"host":"' + FtpProfile.FtpAddress + '",' +
        '"port":"' + Format(FtpProfile.Port) + '"' +
        '}';


        if JsonOUT = '' then
            exit;
        setup.Get();
        setup.TestField(ServiceAdressForDeleteFiles);
        setup.TestField(ServiceDeleteToken);

        Path := setup.ServiceAdressForUploadeFiles + '?code=' + setup.ServiceUploadToken;

        gcontent.Clear();
        ltext := StrSubstNo(JsonOUT);

        gcontent.WriteFrom(ltext);
        greqMsg.SetRequestUri(Path);

        gheaders.Clear();
        lheaders.Clear();

        gcontent.GetHeaders(lheaders);
        lheaders.Remove('Content-Type');
        lheaders.Add('Content-Type', 'application/json');
        gcontent.GetHeaders(lheaders);

        greqMsg.GetHeaders(gheaders);
        gheaders.Add('accept', 'application/Json');
        greqMsg.Content(gcontent);

        greqMsg.GetHeaders(gheaders);
        greqMsg.Method := 'POST';
        if not gHttpClient.Send(greqMsg, gResponseMsg) then
            //  Error('API Authorization token request failed');
            gResponseMsg.Content().ReadAs(ContentTxt);
        // JasonObject.ReadFrom(ContentTxt);
        /*   HttpCode := gResponseMsg.HttpStatusCode;
           exit(ContentTxt);*/


    end;
}