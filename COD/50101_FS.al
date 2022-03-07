codeunit 50101 "FS Export"
{
    trigger OnRun()
    begin
        // 120421 CreateAllFSFiles();

    end;

    var


    procedure ExportDebX()
    var
        emp: Record "Salesperson/Purchaser";
        cust: Record Customer;
        DEBx: XmlPort "FS DEBX ERPG";
        _DEBx: XmlPort "_DEBX ERPG";
        FT: Record "Ftp Service File ERPG";
        OUS: OutStream;
    begin

        emp.SetRange(Code);
        if emp.FindSet() then
            repeat
                cust.SetRange("Salesperson Code", emp.Code);
                if cust.FindSet() then begin
                    DEBx.Filename := 'DEB' + emp.Code + '.txt';
                    DEBx.SetTableView(cust);
                    // DEBx.Run();

                    //  _DEBx.Filename := '_DEB' + emp.Code + '.txt';
                    //  _DEBx.Run();

                    //>> FS DEBX
                    Clear(ft);
                    ft.Init();
                    ft.ID := 0;

                    ft.FileBlob.CreateOutStream(OUS);
                    DEBX.SetDestination(OUS);
                    ft.FileName := DEBX.Filename;
                    ft.FilePath := '/FS';
                    ft.Direction := ft.Direction::Export;
                    DEBX.Export();
                    ft.Insert(true);

                    ft.FileLength := ft.FileBlob.Length;
                    ft.Modify(true);
                    Commit();
                    //<< FS DEBX


                end;

            until emp.Next() = 0;


    end;

    procedure ExportPrisliste()
    var
        FT: Record "Ftp Service File ERPG";
        item: Record Item;
        //hitemprice: Record "Sales Price";
        t: text;
        tb: TextBuilder;
        tbl: TextBuilder;

        A1: Decimal;
        A2: Decimal;
        A4: Decimal;
        A6: Decimal;
        A8: Decimal;
        A12: Decimal;
        A24: Decimal;
        A48: Decimal;
        A96: Decimal;
        At1: Text;
        At2: Text;
        At4: Text;
        At6: Text;
        At8: Text;
        At12: Text;
        At24: Text;
        At48: Text;
        At96: Text;
        ins: InStream;
        ous: OutStream;
        temp: Codeunit "Temp Blob";
        f: Text;
    begin

        /*h
                item.SetRange("No.");

                if item.FindSet() then
                    repeat
                        A1 := 0;
                        A2 := 0;
                        A4 := 0;
                        A6 := 0;
                        A8 := 0;
                        A12 := 0;
                        A24 := 0;
                        A48 := 0;
                        A96 := 0;

                        itemprice.SetRange("Item No.", item."No.");
                        t := item."No." + '|' + item.Description + '|' + item.Short + '|';

                        if itemprice.FindSet() then
                            repeat
                                if (itemprice."Minimum Quantity" = 1) then begin
                                    A1 := itemprice."Unit Price";
                                    At1 := Format(itemprice."Unit Price");
                                    if A1 = 0 then
                                        at1 := '';

                                end;

                                if (itemprice."Minimum Quantity" = 2) then begin
                                    A2 := itemprice."Unit Price";
                                    At2 := Format(itemprice."Unit Price");
                                    if A2 = 0 then
                                        at2 := '';

                                end;
                                if (itemprice."Minimum Quantity" = 4) then begin
                                    A4 := itemprice."Unit Price";
                                    At4 := Format(itemprice."Unit Price");
                                    if A4 = 0 then
                                        at4 := '';

                                end;
                                if (itemprice."Minimum Quantity" = 6) then begin
                                    A6 := itemprice."Unit Price";
                                    At6 := Format(itemprice."Unit Price");
                                    if A6 = 0 then
                                        at6 := '';

                                end;
                                if (itemprice."Minimum Quantity" = 8) then begin
                                    A8 := itemprice."Unit Price";
                                    At8 := Format(itemprice."Unit Price");
                                    if A8 = 0 then
                                        at8 := '';

                                end;
                                if (itemprice."Minimum Quantity" = 12) then begin
                                    A12 := itemprice."Unit Price";
                                    At12 := Format(itemprice."Unit Price");
                                    if A12 = 0 then
                                        at12 := '';

                                end;
                                if (itemprice."Minimum Quantity" = 24) then begin
                                    A24 := itemprice."Unit Price";
                                    At24 := Format(itemprice."Unit Price");
                                    if A24 = 0 then
                                        at24 := '';

                                end;
                                if (itemprice."Minimum Quantity" = 48) then begin
                                    A48 := itemprice."Unit Price";
                                    At48 := Format(itemprice."Unit Price");
                                    if A48 = 0 then
                                        at48 := '';

                                end;
                                if (itemprice."Minimum Quantity" = 96) then begin
                                    A96 := itemprice."Unit Price";
                                    At96 := Format(itemprice."Unit Price");
                                    if A96 = 0 then
                                        at96 := '';

                                end;

                            until itemprice.Next() = 0;
                        // if (A1 =0) 

                        t := t + At1 + '|' + at2 + '|' + at4 + '|' + at6 + '|' + at8 + '|' + at12 + '|' + at24 + '|' + At48 + '|' + At96;
                        t := t + '||';
                        if item.MinPris = 0 then
                            t := t + '' + '|' + item."Item Category Code";
                        if item.MinPris > 0 then
                            t := t + Format(item.MinPris) + '|' + item."Item Category Code";
                        tb.AppendLine(t);

                    until item.Next() = 0;

                temp.CreateOutStream(ous);
                ous.WriteText(tb.ToText());
                temp.CreateInStream(ins);
                //  f := 'ss.txt';
                // DownloadFromStream(ins, '', '', '', f);

                Clear(ft);
                ft.Init();
                ft.ID := 0;

                ft.FileBlob.CreateOutStream(OUS);

                ous.WriteText(tb.ToText());
                ft.FileName := 'PRISLISTE.txt';
                ft.FilePath := '/FS';

                ft.Direction := ft.Direction::Export;
                ft.Insert(true);

                ft.FileLength := ft.FileBlob.Length;
                ft.Modify(true);
                Commit();
                h*/
    end;

    procedure _ExportInvenPrices()
    var
        FT: Record "Ftp Service File ERPG";
        item: Record Item;
        //h itemprice: Record "Sales Price";
        t: text;
        tb: TextBuilder;
        tbl: TextBuilder;

        A1: Decimal;
        A2: Decimal;
        A4: Decimal;
        A6: Decimal;
        A8: Decimal;
        A12: Decimal;
        A24: Decimal;
        A48: Decimal;
        A96: Decimal;
        At1: Decimal;
        At2: Text;
        At4: Text;
        At6: Text;
        At8: Text;
        At12: Text;
        At24: Text;
        At48: Text;
        At96: Text;
        ins: InStream;
        ous: OutStream;
        temp: Codeunit "Temp Blob";
        f: Text;
    begin

        /*h
                item.SetRange("No.");

                if item.FindSet() then
                    repeat
                        A1 := 0;
                        A2 := 0;
                        A4 := 0;
                        A6 := 0;
                        A8 := 0;
                        A12 := 0;
                        A24 := 0;
                        A48 := 0;
                        A96 := 0;
                        itemprice.SetRange("Item No.", item."No.");
                        t := item."No." + '|' + item.Description + '|' + item."Description 2" + '|' + item.Short + '|';

                        if itemprice.FindSet() then
                            repeat
                                if (itemprice."Minimum Quantity" = 1) then
                                    A1 := itemprice."Unit Price";
                                if (itemprice."Minimum Quantity" = 2) then
                                    A2 := itemprice."Unit Price";
                                if (itemprice."Minimum Quantity" = 4) then
                                    A4 := itemprice."Unit Price";
                                if (itemprice."Minimum Quantity" = 6) then
                                    A6 := itemprice."Unit Price";
                                if (itemprice."Minimum Quantity" = 8) then
                                    A8 := itemprice."Unit Price";
                                if (itemprice."Minimum Quantity" = 12) then
                                    A12 := itemprice."Unit Price";
                                if (itemprice."Minimum Quantity" = 24) then
                                    A24 := itemprice."Unit Price";
                                if (itemprice."Minimum Quantity" = 48) then
                                    A48 := itemprice."Unit Price";
                                if (itemprice."Minimum Quantity" = 96) then
                                    A96 := itemprice."Unit Price";
                            until itemprice.Next() = 0;
                        // if (A1 =0) 

                        t := t + format(A1) + '|' + format(a2) + '|' + format(a4) + '|' + format(a6) + '|' + format(a8) + '|' + format(a12) + '|' + format(a24) + '|' + format(A48) + '|' + format(A96);
                        t := t + '||' + format(item.MinPris) + '|' + item."Item Category Code";
                        tb.AppendLine(t);

                    until item.Next() = 0;

                temp.CreateOutStream(ous);
                ous.WriteText(tb.ToText());
                temp.CreateInStream(ins);

                //  DownloadFromStream(ins, '', '', '', f);


                Clear(ft);
                ft.Init();
                ft.ID := 0;

                ft.FileBlob.CreateOutStream(OUS);

                ous.WriteText(tb.ToText());
                ft.FileName := '__InvenPrices.txt';
                ft.FilePath := '/FS';
                ft.Direction := ft.Direction::Export;

                ft.Insert(true);

                ft.FileLength := ft.FileBlob.Length;
                ft.Modify(true);
                Commit();
                h */
    end;


    procedure JsonImport(JsonIn: Text)
    var
        customer: Record Customer;
        JasonArray: JsonArray;
        JasonToken: JsonToken;
        JasonObject: JsonObject;
        JasonArrayLines: JsonArray;
        JasonTokenLines: JsonToken;
        JasonObjectLines: JsonObject;
        co: Code[20];
        co2: Code[20];
        int: Integer;
        int2: Integer;
        FSHeader: Record "FS Sales Header ERPG";
        FSLine: Record "FS Sales Line ERPG";
    begin

        JasonArray.ReadFrom(JsonIn);

        for int := 0 to JasonArray.Count() - 1 do begin

            Clear(FSHeader);
            FSHeader.Init();
            FSHeader.ID := 0;

            JasonArray.Get(int, JasonToken);
            JasonObject := JasonToken.AsObject();

            JasonObject.Get('account', JasonToken);
            FSHeader.account := JasonToken.AsValue().AsCode();

            Clear(customer);
            customer.SetRange("No.", FSHeader.account);
            if not FSHeader.FindFirst() then
                FSHeader.IsDebitorNew := true;

            JasonObject.Get('phone', JasonToken);
            FSHeader.phone := JasonToken.AsValue().AsInteger();

            JasonObject.Get('salesRep', JasonToken);
            FSHeader.salesRep := JasonToken.AsValue().AsCode();

            JasonObject.Get('vatNumber', JasonToken);
            FSHeader.vatNumber := JasonToken.AsValue().AsCode();

            JasonObject.Get('email', JasonToken);
            FSHeader.email := JasonToken.AsValue().AsText();

            JasonObject.Get('company', JasonToken);
            FSHeader.company := JasonToken.AsValue().AsCode();

            JasonObject.Get('address1', JasonToken);
            FSHeader.address1 := JasonToken.AsValue().AsText();

            JasonObject.Get('address2', JasonToken);
            FSHeader.address2 := JasonToken.AsValue().AsText();

            JasonObject.Get('zip', JasonToken);
            FSHeader.zip := JasonToken.AsValue().AsCode();

            JasonObject.Get('city', JasonToken);
            FSHeader.city := JasonToken.AsValue().AsCode();

            JasonObject.Get('country', JasonToken);
            co := JasonToken.AsValue().AsCode();
            if co = 'DANMARK' then
                FSHeader.country := 'DK';
            if co = 'NORGE' then
                FSHeader.country := 'NO';
            if co = 'SVERIGE' then
                FSHeader.country := 'SE';

            JasonObject.Get('orderHead', JasonToken);
            JasonObject := JasonToken.AsObject();

            JasonObject.Get('deliverCompany', JasonToken);
            FSHeader.deliverCompany := JasonToken.AsValue().AsText();

            JasonObject.Get('deliverAddress1', JasonToken);
            FSHeader.deliverAddress1 := JasonToken.AsValue().AsText();

            JasonObject.Get('deliverAddress2', JasonToken);
            FSHeader.deliverAddress2 := JasonToken.AsValue().AsText();

            JasonObject.Get('deliverZip', JasonToken);
            FSHeader.deliverZip := JasonToken.AsValue().AsText();

            JasonObject.Get('deliverCity', JasonToken);
            FSHeader.deliverCity := JasonToken.AsValue().AsText();

            JasonObject.Get('deliverCountry', JasonToken);
            co := JasonToken.AsValue().AsCode();
            if co2 = 'DANMARK' then
                FSHeader.country := 'DK';
            if co2 = 'NORGE' then
                FSHeader.country := 'NO';
            if co2 = 'SVERIGE' then
                FSHeader.country := 'SE';
            FSHeader.deliverCountry := co2;

            JasonObject.Get('purchaser', JasonToken);
            FSHeader.purchaser := JasonToken.AsValue().AsText();

            JasonObject.Get('purchaseOrder', JasonToken);
            FSHeader.purchaseOrder := JasonToken.AsValue().AsText();

            JasonObject.Get('orderNote', JasonToken);
            FSHeader.orderNote := JasonToken.AsValue().AsText();

            JasonObject.Get('orderLines', JasonToken);
            JasonArrayLines := JasonToken.AsArray();

            FSHeader.Insert();


            for int2 := 0 to JasonArrayLines.Count() - 1 do begin

                Clear(FSLine);
                FSLine.Init();
                FSLine.ID := 0;

                JasonArrayLines.Get(int2, JasonTokenLines);
                JasonObjectLines := JasonTokenLines.AsObject();

                JasonObjectLines.Get('lineNumber', JasonTokenLines);
                FSLine.linenumber := JasonTokenLines.AsValue().AsInteger();

                JasonObjectLines.Get('itemNumber', JasonTokenLines);
                FSLine.itemnumber := JasonTokenLines.AsValue().AsCode();

                JasonObjectLines.Get('description', JasonTokenLines);
                FSLine.description := JasonTokenLines.AsValue().AsText();

                JasonObjectLines.Get('itemPrice', JasonTokenLines);
                FSLine.itemPrice := JasonTokenLines.AsValue().AsDecimal();

                JasonObjectLines.Get('quantity', JasonTokenLines);
                FSLine.quantity := JasonTokenLines.AsValue().AsInteger();

                JasonObjectLines.Get('discount', JasonTokenLines);
                FSLine.discount := JasonTokenLines.AsValue().AsDecimal();


                FSLine.headerid := FSHeader.id;
                FSLine.Insert();

            end;





        end;
    end;

    procedure MyProcedure()
    var
        ins: InStream;
        t: Text;
        te: TextEncoding;
        temp: Codeunit "Temp Blob";
    begin
        temp.CreateInStream(ins, TextEncoding::UTF8);

        File.UploadIntoStream('', '', '', t, ins);

        ins.Read(t);
        JsonImport(t);

    end;

    procedure CreateFsOrders()
    var
        "Sales H": Record "FS Sales Header ERPG";

    begin
        "Sales H".SetRange(IsOrderCreated, false);


        if "Sales H".FindSet() then
            repeat
                "Create Sales Order"("Sales H");
            until "Sales H".Next() = 0;
    end;

    procedure "Create Sales Order"(head: Record "FS Sales Header ERPG")
    var
        FSLines: Record "FS Sales Line ERPG";
        "Sales Header": Record "Sales Header";
        "Sales Line": Record "Sales Line";
        "Sales & Receivables Setup": Record "Sales & Receivables Setup";
        Customer: Record Customer;
        country: Record "Country/Region";  //110121

    begin


        Clear(Customer);
        Customer.SetRange("No.", head.account);
        if not Customer.FindFirst() then begin

            head.IsDebitorNew := true;
            head.Modify();
            exit;
            "Create New Customer"(head);
        end;



        Clear("Sales Header");
        "Sales Header"."No." := '';
        "Sales Header".Init();


        "Sales Header"."Document Type" := "Sales Header"."Document Type"::Order;

        "Sales Header".Validate("Sell-to Customer No.", head.account);
        "Sales Header".Validate("Bill-to Customer No.", head.account);

        if head.deliverCompany <> '' then begin
            "Sales Header".Validate("Ship-to Name", head.deliverCompany);
            "Sales Header"."Ship-to Address" := head.deliverAddress1;
            "Sales Header"."Ship-to Address 2" := head.deliverAddress2;
            "Sales Header".Validate("Ship-to Post Code", head.deliverZip);
            //110121
            if head.country = 'DANMARK' then
                head.country := 'DK';
            if head.country = 'NORGE' then
                head.country := 'NO';
            if head.country = 'SVERIGE' then
                head.country := 'SE';

            country.Reset;
            if not country.Get(head.country) then begin
                country.Reset;
                country.SetRange(Name);
                if country.FindSet then
                    head.country := country.Code;
                //Message(head.country);
            end;
            //110121

            "Sales Header".Validate("Ship-to Country/Region Code", head.country);

        end;
        "Sales Header".Insert(true);
        //Commit();
        Clear(FSLines);
        FSLines.SetRange(headerid, head.ID);

        if FSLines.FindSet() then
            repeat
                "Sales Line".Validate("Document Type", "Sales Header"."Document Type");
                "Sales Line".Validate("Document No.", "Sales Header"."No.");
                "Sales Line".Type := "Sales Line".Type::Item;
                "Sales Line".Validate(Type);
                "Sales Line".Description := FSLines.description;
                "Sales Line".Validate("No.", FSLines.itemnumber);
                "Sales Line".Validate("Unit Price", FSLines.itemprice);
                "Sales Line".Validate(Quantity, FSLines.quantity);
                "Sales Line".Validate("Line Discount %", FSLines.discount);
                "Sales Line".Validate("Line No.", FSLines.linenumber * 1000);

                "Sales Line".Insert(true);

            until FSLines.Next() = 0;
        head.IsOrderCreated := true;
        head.OrderNo := "Sales Header"."No.";
        head.OrderDate := DT2Date(CurrentDateTime);
        head.Modify(true);
    end;

    procedure CreateAllFSFiles();
    var
        FT: Record "Ftp Service File ERPG";
        tb: Codeunit "Temp Blob";

        OUS: OutStream;

        _Varer: XmlPort "FS Varer ERPG";
        _Inventable: XmlPort "_Inventable ERPG";
        __Inventable: XmlPort "__Inventable ERPG";
        MED: XmlPort "FS MED ERPG";
        __Employees: XmlPort "FS __Employees ERPG";
        _Employees: XmlPort "FS _Employees ERPG";
        DEBX: XmlPort "FS DEBX ERPG";
        _DEBX: XmlPort "_DEBX ERPG";
        _InvenPrices: XmlPort "_InvenPrices ERPG";
        __Customers: XmlPort "__Customers ERPG";
        _Customers: XmlPort "FS _Customers ERPG";

    begin
        //>> FS Varer
        Clear(ft);
        ft.Init();
        ft.ID := 0;

        ft.FileBlob.CreateOutStream(OUS);
        _Varer.SetDestination(OUS);

        ft.FileName := _Varer.Filename;
        ft.FilePath := '/FS';

        _Varer.Export();
        ft.Insert(true);
        ft.Direction := ft.Direction::Export;
        ft.FileLength := ft.FileBlob.Length;
        ft.Modify(true);
        Commit();
        //<< FS Varer

        //>> FS _Inventable
        Clear(ft);
        ft.Init();
        ft.ID := 0;

        ft.FileBlob.CreateOutStream(OUS);
        _Inventable.SetDestination(OUS);
        ft.FileName := _Inventable.Filename;
        ft.FilePath := '/FS';

        _Inventable.Export();
        ft.Insert(true);
        ft.Direction := ft.Direction::Export;
        ft.FileLength := ft.FileBlob.Length;
        ft.Modify(true);
        Commit();
        //<< FS _Inventable

        //>> FS __Inventable
        Clear(ft);
        ft.Init();
        ft.ID := 0;

        ft.FileBlob.CreateOutStream(OUS);
        __Inventable.SetDestination(OUS);
        ft.FileName := __Inventable.Filename;
        ft.FilePath := '/FS';

        __Inventable.Export();
        ft.Insert(true);
        ft.Direction := ft.Direction::Export;
        ft.FileLength := ft.FileBlob.Length;
        ft.Modify(true);
        Commit();
        //<< FS __Inventable

        //>> FS MED
        Clear(ft);
        ft.Init();
        ft.ID := 0;

        ft.FileBlob.CreateOutStream(OUS);
        MED.SetDestination(OUS);
        ft.FileName := MED.Filename;
        ft.FilePath := '/FS';

        MED.Export();
        ft.Insert(true);
        ft.Direction := ft.Direction::Export;
        ft.FileLength := ft.FileBlob.Length;
        ft.Modify(true);
        Commit();

        //<< FS MED

        //>> FS __Employees
        Clear(ft);
        ft.Init();
        ft.ID := 0;

        ft.FileBlob.CreateOutStream(OUS);
        __Employees.SetDestination(OUS);
        ft.FileName := __Employees.Filename;
        ft.FilePath := '/FS';

        __Employees.Export();
        ft.Insert(true);
        ft.Direction := ft.Direction::Export;
        ft.FileLength := ft.FileBlob.Length;
        ft.Modify(true);
        Commit();
        //<< FS __Employees

        //>> FS _Employees
        Clear(ft);
        ft.Init();
        ft.ID := 0;

        ft.FileBlob.CreateOutStream(OUS);
        _Employees.SetDestination(OUS);
        ft.FileName := _Employees.Filename;
        ft.FilePath := '/FS';

        _Employees.Export();
        ft.Insert(true);
        ft.Direction := ft.Direction::Export;
        ft.FileLength := ft.FileBlob.Length;
        ft.Modify(true);
        Commit();
        //<< FS _Employees


        //>> FS __Customers
        Clear(ft);
        ft.Init();
        ft.ID := 0;

        ft.FileBlob.CreateOutStream(OUS);
        __Customers.SetDestination(OUS);
        ft.FileName := __Customers.Filename;
        ft.FilePath := '/FS';

        __Customers.Export();
        ft.Insert(true);
        ft.Direction := ft.Direction::Export;
        ft.FileLength := ft.FileBlob.Length;
        ft.Modify(true);
        Commit();
        //<< FS __Customers

        //>> FS _Customers
        Clear(ft);
        ft.Init();
        ft.ID := 0;

        ft.FileBlob.CreateOutStream(OUS);
        _Customers.SetDestination(OUS);
        ft.FileName := _Customers.Filename;
        ft.FilePath := '/FS';

        _Customers.Export();
        ft.Insert(true);
        ft.Direction := ft.Direction::Export;
        ft.FileLength := ft.FileBlob.Length;
        ft.Modify(true);
        Commit();
        //<< FS _Customers

        //>> FS _InvenPrices
        Clear(ft);
        ft.Init();
        ft.ID := 0;

        ft.FileBlob.CreateOutStream(OUS);
        _InvenPrices.SetDestination(OUS);
        ft.FileName := _InvenPrices.Filename;
        ft.FilePath := '/FS';

        _InvenPrices.Export();
        ft.Insert(true);
        ft.Direction := ft.Direction::Export;
        ft.FileLength := ft.FileBlob.Length;
        ft.Modify(true);
        Commit();
        //<< FS _InvenPrices
        ExportPrisliste();
        _ExportInvenPrices();
        ExportDebX();
    end;

    procedure "Create New Customer"(head: Record "FS Sales Header ERPG")
    var
        Customer: Record Customer;
        //Temp: Record "Customer Template"; //130121 se herunder
        Temp: Record "Customer Templ.";  //130121 i stedet for ovenstående
        country: Record "Country/Region";
    begin
        Customer.Name := head.company;
        Customer.Address := head.address1;
        Customer."Address 2" := head.address2;
        Customer."Phone No." := Format(head.phone);
        Customer."E-Mail" := head.email;
        Customer."Post Code" := head.zip;

        //110121
        if head.country = 'DANMARK' then
            head.country := 'DK';
        if head.country = 'NORGE' then
            head.country := 'NO';
        if head.country = 'SVERIGE' then
            head.country := 'SE';

        country.Reset;
        //Message('før');
        if not country.Get(head.country) then begin
            //Message('efter inde');
            country.Reset;
            country.SetRange(Name);
            if country.FindSet then
                head.country := country.Code;
            //Message(head.country);
        end;
        //Message('efter ude');
        //110121

        Customer."Country/Region Code" := head.country;


    end;

    //HBK / ITB - 121020
    procedure "Create Sales_from_eSales"(head: Record eSalesTable_I)
    var
        FSLines: Record eSalesLine_I;
        "Sales Header": Record "Sales Header";
        "Sales Line": Record "Sales Line";
        "Sales & Receivables Setup": Record "Sales & Receivables Setup";
        Customer: Record Customer;
        SalesDiff: Dialog;
        BCSalesRep: Option "kunden","eOrdren";
        LagStat: Record "Lagstat ERPG";
        country: Record "Country/Region";  //110121
        ItemTable: Record Item;  //301221

    begin

        Clear(Customer);
        Customer.SetRange("No.", head.Custaccount);
        if not Customer.FindFirst() then begin

            head.IsCustomerNew := true;
            head.Modify();
            Error('Debitor: ' + head.CustAccount + ' - eordre: ' + head.eSalesNumber + ' eksisterer ikke !');
            //exit;
            //"Create New Customer"(head);  ind igen
        end
        //070322
        else begin
            Customer.CompanyId := head.CompanyId;
            Customer.Modify;
        end;
        //070322



        Clear("Sales Header");
        "Sales Header"."No." := '';
        "Sales Header".Init();


        "Sales Header"."Document Type" := "Sales Header"."Document Type"::Order;

        "Sales Header".Validate("Sell-to Customer No.", head.Custaccount);
        //"Sales Header".Validate("Bill-to Customer No.", head.Custaccount); //130122 se nedenstående linie
        "Sales Header".Validate("Bill-to Customer No.");  //130122
        "Sales Header".eSalesNumber := head.eSalesNumber;
        if Customer."Salesperson Code" <> head.SalesRep then begin
            SalesDiff.Open('Kundens sælger er forskellig fra eOrdrens sælger' + '\' +
                           'Kundens sælger er: ' + Customer."Salesperson Code" + '\' +
                           'eOrdrens sælger er: ' + head.SalesRep + '\' +
                           'Hvilken sælger ønsker du at oprette Ordren med ?', BCSalesRep);
            if BCSalesRep = BCSalesRep::eOrdren then
                "Sales Header"."Salesperson Code" := head.SalesRep
            else
                "Sales Header"."Salesperson Code" := Customer."Salesperson Code";

        end;

        if head.DlvName1 <> '' then begin
            "Sales Header".Validate("Ship-to Name", head.DlvName1);
            "Sales Header"."Ship-to Address" := head.DlvAddress11;
            "Sales Header"."Ship-to Address 2" := head.DlvAddress21;
            "Sales Header".Validate("Ship-to Post Code", head.DlvZipCode);

            //110121
            if head.Country1 = 'DANMARK' then
                head.Country1 := 'DK';
            if head.Country1 = 'NORGE' then
                head.Country1 := 'NO';
            if head.Country1 = 'SVERIGE' then
                head.Country1 := 'SE';

            country.Reset;
            //Message('før');
            if not country.Get(head.Country1) then begin
                //Message('efter inde');
                country.Reset;
                country.SetRange(Name, head.Country1);
                if country.FindSet then
                    head.Country1 := country.Code;
                //Message(head.country);
            end;
            //Message('efter efter');
            //110121

            "Sales Header".Validate("Ship-to Country/Region Code", head.Country1);

        end;
        "Sales Header"."External Document No." := head.ReferenceNumber1;
        "Sales Header"."Your Reference" := head.YourRef1;
        "Sales Header".Insert(true);
        //Commit();
        Clear(FSLines);
        FSLines.SetRange(esalesnumber, head.eSalesNumber);

        if FSLines.FindSet() then
            repeat
                "Sales Line".Validate("Document Type", "Sales Header"."Document Type");
                "Sales Line".Validate("Document No.", "Sales Header"."No.");
                "Sales Line".Type := "Sales Line".Type::Item;
                "Sales Line".Validate(Type);
                //"Sales Line".Description := 'beskr. fra varen';  //FSLines.description;
                "Sales Line".Validate("No.", FSLines.itemnumber);
                "Sales Line".Validate("Unit Price", FSLines.SalesPrice);
                "Sales Line".Validate(Quantity, FSLines.Qty);
                "Sales Line".Validate("Line Discount %", FSLines.LineDisc);
                "Sales Line".Validate("Unit Price", FSLines.SalesPrice); //301221
                "Sales Line".Validate("Line No.", FSLines.linenumber * 1000);

                if ItemTable.Get("Sales Line"."No.") then begin
                    if ItemTable.Type = ItemTable.Type::Inventory then begin
                        LagStat.Reset();
                        LagStat.SetRange(Code, "Sales Line"."No.");
                        if LagStat.FindSet() then begin
                            if "Sales Line".Quantity > LagStat.Inventory then
                                Message('Ordrenr: ' + "Sales Line"."Document No." + ' Varenummer: ' + "Sales Line"."No." + '\' +
                                        'Antal: ' + Format("Sales Line".Quantity) + '\' +
                                        'Beholdning: ' + Format(LagStat.Inventory));
                        end
                        else
                            Message('Der findes ingen lageroplysninger på dette varenummer');
                    end;
                    if "Sales Line".PlacCopy = '' then
                        "Sales Line".PlacCopy := ItemTable.PlacCopy;  //201221
                end;

                "Sales Line".Insert(true);

            until FSLines.Next() = 0;
        //head.IsOrderCreated := true;
        head.SalesNumber := "Sales Header"."No.";
        head.Status := head.Status::Iordre;

        //head.OrderDate := DT2Date(CurrentDateTime);
        head.Modify(true);
    end;
    //HBK / ITB - 121020

    //HBK / ITB - 120421 - Dan Consignor fil(Tabel + Azure Logic Apps)
    procedure "Consignor File Create"(head: Record "Sales Header")
    var

        //"Sales Line": Record "Sales Line";
        //"Sales & Receivables Setup": Record "Sales & Receivables Setup";
        //Customer: Record Customer;
        //country: Record "Country/Region";  //110121
        //ExFile: Record LA_Exchange_File;
        Vægt: Decimal;
        Colli: Integer;
        //User: Record User;
        LA_Dia: Page LA_Dialog;

    begin

        Clear(LA_Dia);
        head."Consignor Kolli" := 0;
        head."Consignor Vægt" := 0;
        // esalesTV.SetRange(eSalesNumber, esalesT.eSalesNumber);
        LA_Dia.SetTableView(head);
        //message('-1111');
        // ecustPag.Run();
        Page.Run(page::LA_Dialog, head);
        //LA_Dia.Run(head);
        //message('0');
        Colli := head."Consignor Kolli";
        "Vægt" := head."Consignor Vægt";
        //Error('SLUT');

        /* 140421
                Clear(Customer);
                Customer.SetRange("No.", head."Sell-to Customer No.");

                //"Sales Header"."Document Type" := "Sales Header"."Document Type"::Order;
                //Her dannes consignor filen
                //message('1');
                ExFile.Reset;
                ExFile.Init;
                //Message('2');
                ExFile.ExType := ExFile.ExType::Consignor;
                ExFile.Number := head."No.";
                //message('3');
                ExFile.Txt01 := head."Sell-to Customer No.";
                //Message('4');
                if head."Ship-to Address" <> '' then begin
                    ExFile.Txt02 := head."Ship-to Name";
                    ExFile.Txt03 := head."Ship-to Address";
                    ExFile.Txt04 := head."Ship-to Address 2";
                    ExFile.Txt05 := head."Ship-to Post Code";
                    ExFile.Txt06 := head."Ship-to City";
                    country.Reset;
                    if country.Get(ExFile.Txt06) then
                        ExFile.Txt07 := country."EU Country/Region Code"
                    else
                        ExFile.Txt07 := 'DK';
                end
                else begin
                    ExFile.Txt02 := head."Sell-to Customer Name";
                    ExFile.Txt03 := head."Sell-to Address";
                    ExFile.txt04 := head."Sell-to Address 2";
                    ExFile.Txt05 := head."Sell-to Post Code";
                    ExFile.Txt06 := head."Sell-to City";
                    if country.Get(ExFile.Txt06) then
                        ExFile.Txt07 := country."EU Country/Region Code"
                    else
                        ExFile.Txt07 := 'DK';
                end;
                //Message('1000');
                ExFile.Txt08 := head."Sell-to Customer No.";
                ExFile.Txt09 := head."Sell-to Contact";
                ExFile.Txt10 := head."Sell-to Phone No.";
                ExFile.Txt11 := head."Your Reference";
                ExFile.Txt12 := '11';
                ExFile.Txt13 := 'DK';
                ExFile.Txt14 := Format(Colli);
                ExFile.Txt15 := Format("Vægt");


                //        User.Reset();

                //        if User.Get(UserId) then
                //            ExFile.Txt16 := User."User Name"//
                //        else
                //            ExFile.Txt16 := 'Anni';

                //message('før');
                ExFile.ID := CreateGuid();
                Message(ExFile.Id);
                ExFile.Insert;
                //message('efter');
  140421 */


        // 250122
        if head.WINEDIDato >= (Today - 365) then
            head.Consignor := Today;
        head.WINEDIDato := Today;
        head.Modify;
        //250122 */

    end;
    //HBK / ITB - 121020   // 

}