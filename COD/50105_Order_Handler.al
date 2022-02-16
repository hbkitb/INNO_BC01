codeunit 50105 "Order Handler ERPG"
{
    TableNo = "Sales Invoice Header";
    Permissions = TableData "sales invoice line" = rm,
                  tabledata "Sales invoice header" = rm;


    trigger OnRun()
    begin
        CreateOrderTransferLines(Rec);
    end;

    var
        HideConf: Boolean;
        LineNo: Integer;
        NOS_FakDiff: Decimal;
        DKKOmregn: Decimal;
        Currency: Record "Currency Exchange Rate";
        CurrencyExRate: Decimal;
        DateT: Date;
        VarKostDKK: Decimal;

    local procedure CreateOrderTransferLines(SalesHeader: Record "Sales Invoice Header")
    var
        OrderTab: Record "Order Export ERPG";
        sa: Record "Sales & Receivables Setup";
        Lines: Record "Sales Invoice Line";
        conf: Boolean;
        ConfText: Text;
        itemI: Record Item;  //160221

        delLine: Record "Order Export ERPG";
    begin

        conf := false;
        if SalesHeader.DKEXPORT then begin



            if not HideConf then begin
                ConfText := 'Faktura nr. ' + SalesHeader."No." + ' er eksporteret vil du forsætte?';
                conf := Confirm(ConfText, conf);

                if not conf then
                    exit;
                if conf then begin


                    /*   delLine.SetRange(OrdreNummer, SalesHeader."No.");
                       if delLine.FindSet() then
                           repeat
                            //   delLine.Delete();
                             //  Commit();
                           until delLine.Next() = 0;
                         */

                end;
            end;

        end;
        sa.Get();
        if (sa.Country = 'DK') AND
            (sa.Country = '')
         then
            Error('Land ikke sat i salgs opsætningen');
        Lines.SetRange("Document No.", SalesHeader."No.");
        if not conf then
            Lines.SetRange(DKExport, false);
        if Lines.FindSet() then
            repeat
                if itemI.Get(Lines."No.") then begin  //160221
                    if itemI.Type = itemI.Type::Inventory then begin  //160221
                        OrderTab.OrdreNummer := Lines."Document No.";
                        OrderTab.LinieNummer := Lines."Line No.";
                        OrderTab.Varenummer := Lines."No.";
                        OrderTab.Lokation := Lines."Location Code";
                        OrderTab.Antal := Lines.Quantity;
                        OrderTab."Pris (stk. pris)" := Lines."Unit Price";
                        OrderTab."Rabat (procent)" := Lines."Line Discount %";
                        //OrderTab."Beløb (samlet for linien)" := Lines."Unit Price" * Lines.Quantity;
                        OrderTab."Beløb (samlet for linien)" := ((Lines."Unit Price" / 100) * (100 - OrderTab."Rabat (procent)")) * Lines.Quantity;  //301221
                        OrderTab.Tekst := Lines.Description;
                        OrderTab.Enhed := Lines."Unit of Measure";
                        OrderTab.Momskode := SalesHeader."VAT Registration No.";
                        //   OrderTab."Antal lever nu" := Lines."Qty. to Ship";
                        OrderTab."Oprettet dato" := Lines."Posting Date";
                        OrderTab.Leveringsdato := Lines."Shipment Date";
                        //OrderTab."Bekræftet dato" := Lines.
                        OrderTab.Debitorkonto := SalesHeader."Bill-to Customer No.";
                        //OrderTab.Serienummer := Lines.
                        //   OrderTab."Leveret antal" := Lines."Qty. Shipped (Base)";
                        //  OrderTab."Faktureret antal" := Lines."Qty. Invoiced (Base)";
                        //OrderTab."Leveret værdi i valuta" :=Lines
                        //OrderTab.Transaktionsnummer := Lines.ref
                        OrderTab."Kostpris samlet i  LCY" := Lines."Unit Cost (LCY)" * Lines.Quantity;
                        //OrderTab.Liniestatus := Lines;
                        //   OrderTab.Lagerstatus := 


                        OrderTab."Medarbejder / sælger initialer" := SalesHeader."Salesperson Code";
                        OrderTab."Prisenhed kode" := SalesHeader."Currency Code";
                        OrderTab.Land := sa.Country;

                        if OrderTab.Insert(true) then begin
                            Lines.DKExport := true;
                            Lines.Modify();


                        end;
                    end; //item1 160221
                end;  //item1  160221
            until Lines.Next() = 0;

        //Commit();
        CheckIfAllLinesAreExported(SalesHeader);



    end;

    local procedure CheckIfAllLinesAreExported(SalesHeader: Record "Sales Invoice Header")
    var
        Lin: Record "Sales Invoice Line";
        i: Integer;
    begin
        i := 0;
        Lin.SetRange("Document No.", SalesHeader."No.");
        if Lin.FindSet() then
            repeat
                if Lin.DKExport then
                    i := i + 1;

            until lin.Next() = 0;
        if Lin.Count = i then begin
            SalesHeader.DKEXPORT := true;
            SalesHeader.Modify(true);

        end;


    end;

    procedure ExportAllInvoices()
    var
        Header: Record "Sales Invoice Header";

    begin

        Header.SetRange(DKEXPORT, false);
        if Header.FindSet() then
            repeat
                HideConf := false;
                Run(Header);

            until Header.Next() = 0;

    end;

    procedure ExportAllSelectedInvoices(SalesList: Record "Sales Invoice Header")
    var
        Header: Record "Sales Invoice Header";

    begin

        Header := SalesList;
        HideConf := false;
        Run(Header);



    end;

    procedure CreateOrderFromExportTab(Country: Code[10]; cu: Record Customer)
    var
        se: Record "Sales & Receivables Setup";
        lines: Record "Order Export ERPG" temporary; //temporary pr. 060122
        New: Boolean;
        Header: Record "Sales Header";
        linesSort: Record "Order Export ERPG"; //060122
    begin
        NOS_FakDiff := 0;
        se.Get();
        linesSort.SetRange(Land, Country);
        linesSort.SetRange(IsCreated, false);

        lines.Reset;
        Clear(lines);
        if linesSort.FindSet() then begin
            repeat
                lines.Reset;
                lines.SetRange(Land, linessort.Land);
                lines.SetRange(IsCreated, false);
                //lines.SetRange(OrdreNummer, 'Samle');
                //lines.SetRange(OrdreNummer, linesSort.OrdreNummer);  //110122
                lines.SetRange(tradeCode, 'Samle');  //110122
                lines.SetRange(Varenummer, linesSort.Varenummer);
                if (lines.FindSet) and (linesSort.Antal >= 0) then begin //240122 and antal >= 0
                    lines.Antal := lines.Antal + linesSort.Antal;
                    lines."Beløb (samlet for linien)" := lines."Beløb (samlet for linien)" + linesSort."Beløb (samlet for linien)"; //160222 
                    lines.Modify();
                end
                else begin
                    Clear(lines);
                    lines.Init();
                    lines := linesSort;
                    //lines.OrdreNummer := 'Samle';
                    if linesSort.Antal >= 0 then   //240122 Kredit for sig pr. linie
                        lines.TradeCode := 'Samle'
                    else
                        lines.TradeCode := linesSort.OrdreNummer;  //240122 kredit lig samleK   
                    lines.Insert;
                end;


                linesSort.IsCreated := true;
                linesSort.Modify(true);
            until linesSort.Next() = 0;
        end;

        Clear(lines);
        lines.SetCurrentKey(Land, Varenummer);
        lines.SetRange(Land, Country);
        lines.SetRange(IsCreated, false);
        //110122 lines.SetRange(OrdreNummer, 'Samle');
        //lines.SetRange(Tradecode, 'Samle'); //110122  - ud igen 240122

        New := true;
        LineNo := 1000;
        if lines.FindSet() then
            repeat

                if not New then begin

                    CreateLastLines(lines, cu, Header, se);
                end;
                if New then begin
                    "Create Sales Order"(lines, cu, Header, se);
                    New := false;
                end;

                LineNo := LineNo + 1000;
                lines.IsCreated := true;
                lines.Modify(true);




            until lines.Next() = 0;
        Header.Nos_FakDif := NOS_FakDiff;
        if Header.Modify(true) then begin

            /*    CreateCostOrder(se, cu, Header, Country);
                CreatePrtvCostOrder(se, cu, Header, Country);
    */
        end;
    end;

    /* gammel udgave af ovenfor - 060122
       procedure CreateOrderFromExportTab(Country: Code[10]; cu: Record Customer)
        var
            se: Record "Sales & Receivables Setup";
            lines: Record "Order Export ERPG";
            New: Boolean;
            Header: Record "Sales Header";
        begin
            NOS_FakDiff := 0;
            se.Get();
            lines.SetRange(Land, Country);
            lines.SetRange(IsCreated, false);
            New := true;
            LineNo := 1000;
            if lines.FindSet() then
                repeat

                    if not New then begin

                        CreateLastLines(lines, cu, Header, se);
                    end;
                    if New then begin
                        "Create Sales Order"(lines, cu, Header, se);
                        New := false;
                    end;

                    LineNo := LineNo + 1000;
                    lines.IsCreated := true;
                    lines.Modify(true);




                until lines.Next() = 0;
            Header.Nos_FakDif := NOS_FakDiff;
            if Header.Modify(true) then begin


            end;
        end;
    */
    local procedure "Create Sales Order"(Line: Record "Order Export ERPG"; customer: Record Customer; VAR "Sales Header": Record "Sales Header"; se: Record "Sales & Receivables Setup")
    var
        item: Record item;
        "Sales Line": Record "Sales Line";
    begin

        "Sales Header"."No." := '';
        "Sales Header".Init();


        "Sales Header"."Document Type" := "Sales Header"."Document Type"::Order;

        "Sales Header".Validate("Sell-to Customer No.", customer."No.");
        "Sales Header".Validate("Bill-to Customer No.", customer."No.");
        "Sales Header"."Order Class" := 'NOSVE';  //HBK - 150920
        "Sales Header".Insert(true);
        if Line.Varenummer <> '' then
            "Sales Line".Type := "Sales Line".Type::Item;

        if Line.Varenummer = '' then
            "Sales Line".Type := "Sales Line".Type::" ";

        "Sales Line".Validate("Document Type", "Sales Header"."Document Type");
        "Sales Line".Validate("Document No.", "Sales Header"."No.");
        "Sales Line".Type := "Sales Line".Type::Item;
        "Sales Line".Validate(Type);

        "Sales Line".Description := Line.Tekst;
        "Sales Line".Validate("No.", Line.Varenummer);

        "Sales Line".Validate(Quantity, Line.Antal);
        //030122 "Sales Line".Validate("Line Discount %", Line."Rabat (procent)");
        "Sales Line".Validate("Line No.", LineNo);
        "Sales Line"."Line Discount %" := 0;   //0301222

        NOS_FakDiff := NOS_FakDiff + Line."Beløb (samlet for linien)";

        DateT := DT2Date(CurrentDateTime);

        if Line.Land = 'NO' then begin

            item.SetRange("No.", Line.Varenummer);
            if item.FindFirst() then
                //Currency.GetLastestExchangeRate('NOK', DateT, CurrencyExRate);
                Currency.GetLastestExchangeRate(item.CostCurrency, DateT, CurrencyExRate); //231120
            //HBK 160920 er allerede i DKK !? 
            VarKostDKK := item.CostPriceVAL * CurrencyExRate;  //231120
            if VarKostDKK = 0 then
                VarKostDKK := item.CostPriceVAL;  //060122

            //VarKostDKK := item."Unit Cost" * 1; //(Skulle være kostvaluta)
            Currency.GetLastestExchangeRate('NOK', DateT, CurrencyExRate);
            "Sales Line"."Unit Price" := round((VarKostDKK + (VarKostDKK * se.PctImpNOK / 100)), 1.00, '=');   //var 0.01 060122
            "Sales Line".Validate("Unit Price", Round(("Sales Line"."Unit Price" / CurrencyExRate), 1.00, '='));

        end;
        if Line.Land = 'SE' then begin

            item.SetRange("No.", Line.Varenummer);
            if item.FindFirst() then
                //Currency.GetLastestExchangeRate('SEK', DateT, CurrencyExRate);
                Currency.GetLastestExchangeRate(item.CostCurrency, DateT, CurrencyExRate);
            //HBK 160920 er allerede i DKK !? 
            VarKostDKK := item.CostPriceVAL * CurrencyExRate;  //231120
            if VarKostDKK = 0 then
                VarKostDKK := item.CostPriceVAL;  //060122            
            //VarKostDKK := item."Unit Cost" * 1; //(Skulle være kostvaluta fra lagerkart)
            Currency.GetLastestExchangeRate('SEK', DateT, CurrencyExRate);
            "Sales Line"."Unit Price" := Round((VarKostDKK + (VarKostDKK * se.PctImpSVE / 100)), 1.00, '=');   //var 0.01 060122
            "Sales Line".Validate("Unit Price", Round(("Sales Line"."Unit Price" / CurrencyExRate), 1.00, '='));


        end;

        "Sales Line".Insert(true);




        exit


    end;

    local procedure CreateLastLines(Line: Record "Order Export ERPG"; customer: Record Customer; VAR "Sales Header": Record "Sales Header"; se: Record "Sales & Receivables Setup")
    var
        "Sales Line": Record "Sales Line";
        item: Record item;
    begin

        "Sales Line".Validate("Document Type", "Sales Header"."Document Type");
        "Sales Line".Validate("Document No.", "Sales Header"."No.");
        if Line.Varenummer <> '' then
            "Sales Line".Type := "Sales Line".Type::Item;

        if Line.Varenummer = '' then
            "Sales Line".Type := "Sales Line".Type::" ";
        "Sales Line".Validate(Type);
        "Sales Line".Description := Line.Tekst;
        "Sales Line".Validate("No.", Line.Varenummer);
        "Sales Line".Validate("Unit Price", Line."Pris (stk. pris)");
        "Sales Line".Validate(Quantity, Line.Antal);
        //030122 "Sales Line".Validate("Line Discount %", Line."Rabat (procent)");
        "Sales Line"."Line Discount %" := 0;   //0301222
        "Sales Line".Validate("Line No.", LineNo);
        NOS_FakDiff := NOS_FakDiff + Line."Beløb (samlet for linien)";
        DateT := DT2Date(CurrentDateTime);

        if Line.Land = 'NO' then begin
            /*
            item.SetRange("No.", Line.Varenummer);
            if item.FindFirst() then
                Currency.GetLastestExchangeRate('NOK', DateT, CurrencyExRate);
            VarKostDKK := item."Unit Cost" * 1; //CurrencyExRate;
            Currency.GetLastestExchangeRate('NOK', DateT, CurrencyExRate); //160920
            "Sales Line"."Unit Price" := Round((VarKostDKK + (VarKostDKK * se.PctImpNOK / 100)), 0.01, '=');
            "Sales Line".Validate("Unit Price", Round(("Sales Line"."Unit Price" / CurrencyExRate), 0.01, '='));
            */

            //261120
            item.SetRange("No.", Line.Varenummer);
            if item.FindFirst() then
                //Currency.GetLastestExchangeRate('NOK', DateT, CurrencyExRate);
                Currency.GetLastestExchangeRate(item.CostCurrency, DateT, CurrencyExRate); //231120
            //HBK 160920 er allerede i DKK !? 
            VarKostDKK := item.CostPriceVAL * CurrencyExRate;  //231120
            if VarKostDKK = 0 then
                VarKostDKK := item.CostPriceVAL;  //060122            
            //VarKostDKK := item."Unit Cost" * 1; //(Skulle være kostvaluta)
            Currency.GetLastestExchangeRate('NOK', DateT, CurrencyExRate);
            "Sales Line"."Unit Price" := round((VarKostDKK + (VarKostDKK * se.PctImpNOK / 100)), 1.00, '=');   //var 0.01 060122
            "Sales Line".Validate("Unit Price", Round(("Sales Line"."Unit Price" / CurrencyExRate), 1.00, '='));

            //261120

        end;
        if Line.Land = 'SE' then begin
            /*
            item.SetRange("No.", Line.Varenummer);
            if item.FindFirst() then
                Currency.GetLastestExchangeRate('SEK', DateT, CurrencyExRate);
            VarKostDKK := item."Unit Cost" * 1; //CurrencyExRate;
            Currency.GetLastestExchangeRate('SEK', DateT, CurrencyExRate); //160920
            "Sales Line"."Unit Price" := Round((VarKostDKK + (VarKostDKK * se.PctImpSVE / 100)), 0.01, '=');
            "Sales Line".Validate("Unit Price", Round(("Sales Line"."Unit Price" / CurrencyExRate), 0.01, '='));
             */

            //261120
            item.SetRange("No.", Line.Varenummer);
            if item.FindFirst() then
                //Currency.GetLastestExchangeRate('SEK', DateT, CurrencyExRate);
                Currency.GetLastestExchangeRate(item.CostCurrency, DateT, CurrencyExRate);
            //HBK 160920 er allerede i DKK !? 
            VarKostDKK := item.CostPriceVAL * CurrencyExRate;  //231120
            if VarKostDKK = 0 then
                VarKostDKK := item.CostPriceVAL;  //060122            
            //VarKostDKK := item."Unit Cost" * 1; //(Skulle være kostvaluta fra lagerkart)
            Currency.GetLastestExchangeRate('SEK', DateT, CurrencyExRate);
            "Sales Line"."Unit Price" := Round((VarKostDKK + (VarKostDKK * se.PctImpSVE / 100)), 1.00, '=');   //var 0.01 060122
            "Sales Line".Validate("Unit Price", Round(("Sales Line"."Unit Price" / CurrencyExRate), 1.00, '='));
            //261120

        end;


        "Sales Line".Insert(true);

    end;

    procedure CreateAllOrders()
    var
        se: Record "Sales & Receivables Setup";
        cu: Record Customer;
    begin
        se.Get();
        if se.Country <> 'DK' then
            Error('Land ikke sat til DK i salgs opsætningen');
        if se.Country = 'DK' then begin

            cu.Get(se.SVComp);

            CreateOrderFromExportTab('SE', cu);

            Clear(cu);

            cu.Get(se.NOComp);
            CreateOrderFromExportTab('NO', cu);
        end;
        Message('Ordrer dannet');
    end;

    procedure CreateCostOrder(SalseSetup: Record "Sales & Receivables Setup"; Customer: Record Customer; sh: Record "Sales Header"; country: Text)
    var
        "Sales Header": Record "Sales Header";
        line: Record "Sales Line";
        de: Decimal;
    begin



        "Sales Header"."No." := '';
        "Sales Header".Init();

        "Sales Header"."External Document No." := sh."No.";

        "Sales Header"."Document Type" := "Sales Header"."Document Type"::Invoice;

        "Sales Header".Validate("Sell-to Customer No.", customer."No.");
        "Sales Header".Validate("Bill-to Customer No.", customer."No.");

        "Sales Header".Insert(true);
        if sh.Nos_FakDif = 0 then
            exit;
        if country = 'SE' then begin

            DateT := DT2Date(CurrentDateTime());
            Currency.GetLastestExchangeRate('SEK', DateT, CurrencyExRate);
            DKKOmregn := 1; //CurrencyExRate;

            //Faktura 1 Linje 1
            line."Document Type" := "Sales Header"."Document Type";
            //hbk line.Type := line.Type::" ";
            line.Type := line.Type::Item;  //HBK / ITB/
            line."Line No." := 1000;
            line."Document No." := "Sales Header"."No.";
            line.Validate("No.", 'OmkostS');
            line.Description := 'Til dækninger af omkostninger';
            line.validate(Quantity, -1);
            line.Validate("Unit Price", Round((sh.Nos_FakDif * (SalseSetup.SVEOmkPct / 100) / DKKOmregn), 0.01, '='));

            line."Line Amount" := -line."Unit Price";
            line.Insert(true);

            Clear(line);
            //Faktura 1 Linje 2
            line."Document Type" := "Sales Header"."Document Type";
            //line.Type := line.Type::" ";
            line.Type := line.Type::Item;
            line."Line No." := 2000;
            line."Document No." := "Sales Header"."No.";
            line.Validate("No.", 'RestFakS');
            line.Description := 'Restfakturering';
            //301221 line."Description 2" := Format(DKKOmregn);
            line.validate(Quantity, 1);
            sh.CalcFields(Amount);
            line."Unit Price" := sh.Nos_FakDif - sh.Amount; //301221
            //301221 line.Validate("Unit Price", sh.Nos_FakDif - sh.Amount);
            line.Validate("Unit Price");
            line."Line Amount" := line."Unit Price";

            line.Insert(true);
        end;

        if country = 'NO' then begin

            DateT := DT2Date(CurrentDateTime());
            Currency.GetLastestExchangeRate('NOK', DateT, CurrencyExRate);
            DKKOmregn := 1;  //301221 CurrencyExRate;
            //Faktura 1 Linje 1     
            line."Document Type" := "Sales Header"."Document Type";
            line.Type := line.Type::Item;
            line."Line No." := 1000;
            line."Document No." := "Sales Header"."No.";
            line.Validate("No.", 'OmkostN');
            line.Description := 'Til dækninger af omkostninger';
            //line."Description 2" := Format(DKKOmregn);
            //160920 sh.CalcFields("Amount Including VAT");
            //160920 sh.CalcFields(Amount);
            line.validate(Quantity, -1);
            Line.Validate("Unit Price", Round((sh.Nos_FakDif * (SalseSetup.NOKOmkPct / 100) / DKKOmregn), 0.01, '='));
            line."Line Amount" := -line."Unit Price";



            line.Insert(true);

            Clear(line);
            //Faktura 1 Linje 2
            line."Document Type" := "Sales Header"."Document Type";
            line.Type := line.Type::Item;
            line."Line No." := 2000;
            line."Document No." := "Sales Header"."No.";
            line.Validate("No.", 'RestFakN');
            line.Description := 'Restfakturering';
            line.validate(Quantity, 1);
            //301221 line.Validate("Unit Price", sh.Nos_FakDif - sh.Amount);
            sh.CalcFields(Amount);
            line."Unit Price" := sh.Nos_FakDif - sh.Amount; //301221
            line.Validate("Unit Price");  //301221
            line."Line Amount" := line."Unit Price";


            line.Insert(true);
        end;
    end;

    procedure CreatePrtvCostOrder(SalseSetup: Record "Sales & Receivables Setup"; Customer: Record Customer; sh: Record "Sales Header"; country: Text)
    var
        "Sales Header": Record "Sales Header";
        line: Record "Sales Line";
        de: Decimal;
    begin



        "Sales Header"."No." := '';
        "Sales Header".Init();

        "Sales Header"."External Document No." := sh."No.";

        "Sales Header"."Document Type" := "Sales Header"."Document Type"::"Credit Memo"; //"Sales Header"."Document Type"::Invoice;

        "Sales Header".Validate("Sell-to Customer No.", customer."No.");
        "Sales Header".Validate("Bill-to Customer No.", customer."No.");

        "Sales Header".Insert(true);
        //Faktura 2 Linje 1
        if country = 'SE' then begin

            DateT := DT2Date(CurrentDateTime());
            Currency.GetLastestExchangeRate('SEK', DateT, CurrencyExRate);
            DKKOmregn := 1;  //301221 CurrencyExRate;

            line."Document Type" := "Sales Header"."Document Type";
            line.Type := line.Type::Item;
            line."Line No." := 1000;
            line."Document No." := "Sales Header"."No.";
            line.Validate("No.", 'ProvOmkostS');
            line.Description := 'Til dækning af Prov.omkostninger fra agent';
            //line."Description 2" := Format(DKKOmregn);
            line.validate(Quantity, 1);
            //PRIS = ANTAL X PROOMK
            line.Validate("Unit Price", Round((sh.Nos_FakDif * (SalseSetup.SVEProvPct / 100) / DKKOmregn), 0.01, '='));
            line."Line Amount" := line."Unit Price";
            line.Insert(true);


        end;
        //Faktura 2 Linje 1
        if country = 'NO' then begin

            DateT := DT2Date(CurrentDateTime());
            Currency.GetLastestExchangeRate('NOK', DateT, CurrencyExRate);
            DKKOmregn := 1;  //301221 CurrencyExRate;

            line."Document Type" := "Sales Header"."Document Type";

            line.Type := line.Type::Item;
            line."Line No." := 1000;
            line."Document No." := "Sales Header"."No.";
            line.Validate("No.", 'ProvOmkostN');
            line.Description := 'Til dækning af Prov.omkostninger fra agent';
            //line."Description 2" := Format(DKKOmregn);
            line.validate(Quantity, 1);

            //PRIS = ANTAL X PROOMK
            line.Validate("Unit Price", Round((sh.Nos_FakDif * (SalseSetup.NOKProvPct / 100) / DKKOmregn), 0.01, '='));
            line."Line Amount" := line."Unit Price";
            line.Insert(true);

        end;
    end;

}