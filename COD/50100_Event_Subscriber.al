codeunit 50100 "Inno EventSubscriber ERPG"
{
    trigger OnRun()
    begin

    end;

    var

    //[EventSubscriber(ObjectType::Codeunit, Codeunit::"Company-Initialize", 'OnCompanyInitialize', '', false, false)]
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Company Triggers", 'OnCompanyopen', '', false, false)]
    local procedure UpdateInventory()
    var

        cod: Codeunit "Lagstat ERPG";
    begin
        //Message('åbne ' + CompanyName);
        cod.UpdateLAGSTAT();
    end;

    /* [EventSubscriber(ObjectType::Table, 50103, 'OnAfterInsertEvent', '', true, true)]
     local procedure GetConsignorFile(VAR Rec: Record "Ftp Service File ERPG"; RunTrigger: Boolean)
     var
         lab: Record "Con Label Printer ERPG";

     begin

         lab.SetRange(FileExportProfile, rec.FtpProfileID);
         if lab.FindFirst() then begin
             
         end;

     end;
 */

    //050121
    [EventSubscriber(ObjectType::Table, 18, 'OnBeforeInsertEvent', '', true, true)]
    local procedure SetCompanyId(VAR Rec: Record Customer; RunTrigger: Boolean)
    var
    //lab: Record Customer;

    begin
        //HBK / ITB - 1001222 iflg. Frede - rec.CompanyId := rec.SystemId;

    end;

    //230421
    [EventSubscriber(ObjectType::Table, 110, 'OnBeforeSendProfile', '', true, true)]
    local procedure SetSendingProfile(var DocumentSendingProfile: Record "Document Sending Profile"; var SalesShipmentHeader: Record "Sales Shipment Header"; var IsHandled: Boolean)
    var
        //lab: Record Customer;
        DocProfileFlg: Record "Document Sending Profile";
        Srs: Record "Sales & Receivables Setup";

    begin
        Srs.Get();
        DocProfileFlg.Reset;
        DocProfileFlg.SetRange(Code, srs.ShipProfile);  //'FLGSDL'
        if DocProfileFlg.FindSet then
            DocumentSendingProfile := DocProfileFlg;

    end;
    //230421


    [EventSubscriber(ObjectType::Table, 27, 'OnBeforeInsertEvent', '', true, true)]
    local procedure SetCompanyIdItem(VAR Rec: Record Item; RunTrigger: Boolean)
    var
    //lab: Record Customer;

    begin
        //HBK / ITB - 100122 iflg. Frede - rec.ProductVariantId := rec.SystemId;

    end;
    //050121

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterCheckSalesDoc', '', false, false)]
    local procedure GetConsignorPakkeNo(VAR SalesHeader: Record "Sales Header"; CommitIsSuppressed: Boolean; WhseShip: Boolean; WhseReceive: Boolean)
    var
        lab: Record "Con Label Printer ERPG";
        ftp: Record "Ftp Service File ERPG";
        FtpProfile: Record "Ftp Profile ERPG";
        xml: XmlPort "Consignor Import ERPG";
        ins: InStream;
        t: Text;
        cc: Codeunit "Api Call FTP ERPG";
        aa: Text;
    begin
        if SalesHeader."Package Tracking No." = '' then begin
            cc.run;
            lab.SetRange(IsDefault);

            if lab.FindFirst() then begin

                FtpProfile.SetRange(ID, Format(lab.FileExportProfile));
                if FtpProfile.FindFirst() then begin

                    ftp.SetRange(FtpProfileID, Format(lab.FileExportProfile));
                    ftp.SetRange(FilePath, FtpProfile.Path);
                    ftp.SetRange(FileName, SalesHeader."No." + '.txt');

                    if ftp.FindFirst() then begin

                        ftp.CalcFields(FileBlob);
                        ftp.FileBlob.CreateInStream(ins);
                        ins.ReadText(t);

                        aa := ConvertStr(t, ',', ',');
                        aa := SelectStr(4, aa);
                        SalesHeader."Package Tracking No." := aa;
                        SalesHeader.Modify(true);

                        cc.DeleteFile(SalesHeader."Consignor filename", FtpProfile);
                        cc.DeleteFile(SalesHeader."No." + '.txt', FtpProfile);


                    end;
                end;
            end;
        end;
    end;

    /* 130121-> se nederst - ITB_Messages
        //OnBeforePostSalesDoc
        //HBK / ITB -> Farligt gods + Evt. check priser vedr. web. mv
        [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnBeforePostSalesDoc', '', false, false)]
        local procedure CheckDanger(VAR SalesHeader: Record "Sales Header")
        var
            SalLin: Record "Sales Line";
            DangerWarning: Boolean;
            ItemTable: Record Item;
            LagStat: Record "Lagstat ERPG";
            sa: Record "Sales & Receivables Setup";  //120121
            cust: Record Customer;

        begin
            DangerWarning := false;
            SalLin.Reset();
            SalLin.SetRange("Document No.", SalesHeader."No.");
            //Message(SalesHeader."No.");

            if SalLin.FindSet() then begin
                //Message('inde');
                //Message(SalLin."Document No.");
                repeat
                    ItemTable.Reset();
                    if SalLin."Qty. to Invoice" <> 0 then begin
                        //Message(SalLin."No.");
                        if ItemTable.Get(SalLin."No.") then
                            if ItemTable.Farlig = true then
                                DangerWarning := true;

                    end;

                    LagStat.Reset();
                    LagStat.SetRange(Code, SalLin."No.");
                    if LagStat.FindSet() then begin
                        //171120 Message(Format(LagStat.Inventory));
                        if SalLin."Qty. to Invoice" > LagStat.Inventory then
                            Message('Ordrenr: ' + SalLin."Document No." + ' Varenummer: ' + SalLin."No." + '\' +
                                    'Antal: ' + Format(SalLin."Qty. to Invoice") + '\' +
                                    'Beholdning: ' + Format(LagStat.Inventory));
                    end
                    else
                        Message('Ordrenr: ' + SalLin."Document No." + ' Varenummer: ' + SalLin."No." + '\' +
                                'Der findes ingen lageroplysninger på dette varenummer');

                until SalLin.Next() = 0;
                if DangerWarning = true then
                    Message('Denne faktura indeholder FARLIGT gods !!!!');

            end;
            //171120 
            //HBK - 120121
            sa.Get();
            Message(sa.Country);
            //Error('slut fejl');
            if sa.Country = 'NO' then
                if cust.get(SalesHeader."Sell-to Customer No.") then begin
                    Message(format(cust.EHF));
                    if cust.EHF = true then
                        Message('Dette er en EHF Faktura kunde');
                end;
            //HBK - 120121            
            //Error('Det var testen !');
        end;
        //HBK / ITB <-    
        130121 se nederst ITB_Messages*/

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnBeforeFinalizePosting', '', false, false)]
    local procedure DeleteConsignorFile(VAR SalesHeader: Record "Sales Header")
    var
        lab: Record "Con Label Printer ERPG";
        ftp: Record "Ftp Service File ERPG";
        FtpProfile: Record "Ftp Profile ERPG";
        xml: XmlPort "Consignor Import ERPG";
        ins: InStream;
        t: Text;
        cc: Codeunit "Api Call FTP ERPG";
        aa: Text;

    begin


    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnBeforeFinalizePosting', '', false, false)]
    local procedure CreateInvoice(VAR SalesHeader: Record "Sales Header")
    var
        se: Record "Sales & Receivables Setup";
        ord: Codeunit "Order Handler ERPG";
        Country: Code[2];
        Cu: Record Customer;
        eSales: Record eSalesTable_I;  //HBK / ITB - 141020
    begin
        //171120 message('før');
        se.Get();

        if ((SalesHeader."Bill-to Customer No." = se.SVComp)
         or (SalesHeader."Bill-to Customer No." = se.NoComp)) AND
            (SalesHeader."Order Class" = 'NOSVE') then begin   //HBK/ITB - 150920
            //message('inde');
            if SalesHeader."Bill-to Customer No." = se.NoComp then
                Country := 'NO';
            if SalesHeader."Bill-to Customer No." = se.SVComp then
                Country := 'SE';
            if cu.get(SalesHeader."Bill-to Customer No.") then begin
                //message('så oprettes');
                ord.CreateCostOrder(se, cu, SalesHeader, Country);
                ord.CreatePrtvCostOrder(se, cu, SalesHeader, Country);
            end;

        end;
        //HBK / ITB ->
        eSales.Reset();
        eSales.SetRange(SalesNumber, SalesHeader."No.");
        if eSales.FindSet() then begin
            eSales.Status := eSales.Status::Faktureret;
            eSales.Modify();
        end;
        //HBK / ITB <-

    end;

    //HBK / ITB -> Check pris på ordrelinie page
    [EventSubscriber(ObjectType::Page, page::"Sales Order Subform", 'OnAfterQuantityOnAfterValidate', '', false, false)]
    local procedure CheckPrice(var SalesLine: Record "Sales Line")
    var

        SHeader: Record "Sales Header";
        //CustTable: Record Customer;
        ItemTable: Record Item;
        PriceSE: Decimal;
        PriceDK: Decimal;
        LagStat: Record "Lagstat ERPG";  //121120

    begin
        SHeader.RESET;
        SHeader.SetRange("No.", SalesLine."Document No.");
        if SHeader.FindSet() then begin
            if SalesLine.Quantity <> 0 then begin
                //if CustTable.get(SHeader."Bill-to Customer No.") then begin
                if ItemTable.get(SalesLine."No.") then begin
                    if SalesLine.PlacCopy = '' then
                        SalesLine.PlacCopy := ItemTable.PlacCopy;  //201221
                                                                   /* 170122
                                                                                       if (ItemTable.MinPris <> 0) then begin
                                                                                           if ((SalesLine.Amount / SalesLine.Quantity) < ItemTable.MinPris) then begin
                                                                                               Message('Pris er nu under den anbefalede minimumpris' + '\' +
                                                                                                       'under med: ' + Format(ItemTable.MinPris - (SalesLine.Amount / SalesLine.Quantity)) + '\' +
                                                                                                       'I alt: ' + Format((ItemTable.MinPris - (SalesLine.Amount / SalesLine.Quantity)) * SalesLine.Quantity));
                                                                                           end;
                                                                                       end;
                                                                   */

                    //160221
                    if ItemTable.Type = ItemTable.Type::Inventory then begin
                        LagStat.Reset();
                        LagStat.SetRange(Code, SalesLine."No.");
                        if LagStat.FindSet() then begin
                            if SalesLine.Quantity > LagStat.Inventory then
                                Message('Der er kun ' + Format(LagStat.Inventory) + ' på lager !');
                        end
                        else
                            Message('Der findes ingen lageroplysninger på dette varenummer');
                    end;
                    //160121                        
                end;

                /*
                                LagStat.Reset();
                                LagStat.SetRange(Code, SalesLine."No.");
                                if LagStat.FindSet() then begin
                                    if SalesLine.Quantity > LagStat.Inventory then
                                        Message('Der er kun ' + Format(LagStat.Inventory) + ' på lager !');
                                end
                                else
                                    Message('Der findes ingen lageroplysninger på dette varenummer');
                */

            end;
            if ItemTable.get(SalesLine."No.") then
                if SalesLine.PlacCopy = '' then
                    SalesLine.PlacCopy := ItemTable.PlacCopy;  //201221
        end;
        //Message(Format(SalesLine.Quantity));

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post Line", 'OnAfterInsertItemLedgEntry', '', false, false)]
    local procedure InsertInvenTrans(VAR ItemLedgerEntry: Record "Item Ledger Entry")
    var
        LagStat: Record "Lagstat ERPG";

    begin
        LagStat.Reset();
        LagStat.SetRange(Code, ItemLedgerEntry."Item No.");
        if LagStat.FindSet() then begin  //Hvis nordic eksisterer.
            LagStat.Inventory := LagStat.Inventory + ItemLedgerEntry.Quantity;
            LagStat.Modify();
            //171120 Message('inventransEx');
            //171120 message(format(LagStat.Inventory));
            //Error('slut');
        end
        else begin  //Hvis nordic ikke eksisterer
            LagStat.Reset();
            LagStat.Init();
            LagStat.Code := ItemLedgerEntry."Item No.";
            LagStat.Inventory := ItemLedgerEntry.Quantity;
            LagStat.InsertDate := DT2Date(CurrentDateTime);
            LagStat.Insert();
            //171120 Message('inventransEx-EJ');
            //171120 message(format(LagStat.Inventory));
            //Error('slut');
        end;
        //171120 Message('inventrans');
        //171120 message(format(ItemLedgerEntry.Quantity));
        //Error('slut');
    end;
    //HBK / ITB <-

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post (Yes/No)", 'OnBeforeConfirmSalesPost', '', false, false)]
    local procedure ITB_Messages(SalesHeader: Record "Sales Header")
    var

        SalLin: Record "Sales Line";
        DangerWarning: Boolean;
        ItemTable: Record Item;
        LagStat: Record "Lagstat ERPG";
        sa: Record "Sales & Receivables Setup";  //120121
        cust: Record Customer;
        PriceWarning: Decimal;  //180122
        CustName: Text[100];  //180122
        SalesEmp: Record "Salesperson/Purchaser"; //180122
        SalesName: Text[100]; //180122

    begin
        DangerWarning := false;
        PriceWarning := 0;  //180122
        CustName := '';  //180122
        SalLin.Reset();
        SalLin.SetRange("Document No.", SalesHeader."No.");
        //Message(SalesHeader."No.");

        if SalLin.FindSet() then begin
            //Message('inde');
            //Message(SalLin."Document No.");
            repeat
                ItemTable.Reset();
                if SalLin."Qty. to Invoice" <> 0 then begin
                    //Message(SalLin."No.");
                    if ItemTable.Get(SalLin."No.") then
                        if ItemTable.Farlig = true then
                            DangerWarning := true;

                end;

                if ItemTable.Get(SalLin."No.") then begin
                    if ItemTable.Type = ItemTable.Type::Inventory then begin
                        LagStat.Reset();
                        LagStat.SetRange(Code, SalLin."No.");
                        if LagStat.FindSet() then begin
                            //171120 Message(Format(LagStat.Inventory));
                            if SalLin."Qty. to Invoice" > LagStat.Inventory then
                                Message('Ordrenr: ' + SalLin."Document No." + ' Varenummer: ' + SalLin."No." + '\' +
                                        'Antal: ' + Format(SalLin."Qty. to Invoice") + '\' +
                                        'Beholdning: ' + Format(LagStat.Inventory));
                        end
                        else
                            Message('Ordrenr: ' + SalLin."Document No." + ' Varenummer: ' + SalLin."No." + '\' +
                                    'Der findes ingen lageroplysninger på dette varenummer');
                    end;  //item type  
                    //HBK / ITB - 180122 - Check for forskel på hele ordrern som i exit på ordlin i C5
                    if SalLin."Qty. to Invoice" <> 0 then begin
                        if (ItemTable.MinPris <> 0) then begin

                            if ((SalLin.Amount / SalLin.Quantity) < ItemTable.MinPris) then begin
                                PriceWarning := PriceWarning + ((ItemTable.MinPris - (SalLin.Amount / SalLin.Quantity)) * SalLin."Qty. to Invoice");

                                //Message('Pris er nu under den anbefalede minimumpris' + '\' +
                                //        'under med: ' + Format(ItemTable.MinPris - (Rec.Amount / Rec.Quantity)) + '\' +
                                //        'I alt: ' + Format((ItemTable.MinPris - (Rec.Amount / Rec.Quantity)) * Rec.Quantity));
                            end;

                        end;
                    end;
                    //HBK / ITB - check forskel - 180122        
                end;  //item.get

            until SalLin.Next() = 0;
            if DangerWarning = true then
                Message('Denne faktura indeholder FARLIGT gods !!!!');

            //HBK / ITB - 180122 - PriceWarning   
            if PriceWarning <> 0 then begin
                if cust.get(SalesHeader."Bill-to Customer No.") then
                    CustName := cust.Name;
                if SalesEmp.Get(SalesHeader."Salesperson Code") then
                    SalesName := SalesEmp.Name;


                Message('Denne ordres samlede pris er under minimum med:' + '\' +
                        'Kr: ' + Format(PriceWarning) + '\' + '\' +
                        'Kunde: ' + CustName + '\' +
                        'Sælger: ' + SalesName);

                PriceWarning := 0;
            end;
            //HBK / ITB - 180122 - PriceWarning 

        end;
        //171120 
        //HBK - 120121
        sa.Get();
        //130121 Message(sa.Country);
        //Error('slut fejl');
        if sa.Country = 'NO' then
            if cust.get(SalesHeader."Sell-to Customer No.") then begin
                //230221 Message(format(cust.EHF));
                if cust.EHF = true then
                    Message('Dette er en EHF Faktura kunde');
            end;
        //HBK - 120121            
        //Error('Det var testen !');
        //fra den anden

        //130121 Message('123456');
    end;

    //170122
    [EventSubscriber(ObjectType::Table, 17, 'OnAfterCopyGLEntryFromGenJnlLine', '', true, true)]
    local procedure DescriptionGLEntry(VAR GLEntry: Record "G/L Entry"; var GenJournalLine: record "Gen. Journal Line")
    var
    //lab: Record Customer;

    begin
        if GLEntry."Document Type" = GLEntry."Document Type"::Invoice then
            GLEntry.Description := 'Fa: ' + GLEntry."Document No." + ' D: ' + GLEntry."Source No.";
        if GLEntry."Document Type" = GLEntry."Document Type"::"Credit Memo" then
            GLEntry.Description := 'Kn: ' + GLEntry."Document No." + ' D: ' + GLEntry."Source No.";

    end;


}

