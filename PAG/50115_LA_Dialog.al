page 50115 "LA_Dialog"
{
    Caption = 'Consignor';
    PageType = StandardDialog;
    SourceTable = "Sales Header";
    //SourceTableTemporary = true;
    //ObsoleteState = Pending;
    //ObsoleteReason = 'This functionality has been replaced by the Email module.';
    //ObsoleteTag = '17.2';

    layout
    {
        area(content)
        {
            field("No."; "No.")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Ordrenummer';
                Editable = false;

            }
            field("Sell-to Customer No."; "Sell-to Customer No.")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Kundenummer';
                Editable = false;

            }
            field(Kolli; "Consignor Kolli")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Kolli';

            }
            field(vægt; "Consignor Vægt")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Vægt';

            }

        }


    }

    trigger OnClosePage()

    var
        "Sales Line": Record "Sales Line";
        "Sales & Receivables Setup": Record "Sales & Receivables Setup";
        srs: Record "Sales & Receivables Setup";
        Customer: Record Customer;
        country: Record "Country/Region";  //110121
        ExFile: Record LA_Exchange_File;
        //ExFileTest: Record LA_Exchange_File;  // 250122
        Vægt: Decimal;
        Colli: Integer;
        User: Record User;
        LA_Dia: Page LA_Dialog;
        ans: Boolean;
    begin
        //250122 er label udskrevet
        //ExFileTest.Reset;
        //ExFileTest.SetRange(Number,"No.");
        //if ExFileTest.FindSet then
        //    ;
        ans := true;
        if (Consignor > (Today - 365)) and ("Consignor Kolli" <> 0) then begin
            ans := Dialog.Confirm('Denne ordre er eksponeret til consignor vil du forsætte?', true);
        end;


        if ("Consignor Kolli" <> 0) and (ans = true) then begin  //250122

            //Evt. indsæt beregning af kolli og vægt
            //250122 Message(Format("Consignor Kolli"));
            srs.Get();  //040122
            Clear(Customer);
            Customer.SetRange("No.", "Sell-to Customer No.");
            Customer.FindSet;

            //"Sales Header"."Document Type" := "Sales Header"."Document Type"::Order;
            //Her dannes consignor filen
            //message('1');
            ExFile.Reset;
            ExFile.Init;
            //Message('2');
            ExFile.ExType := ExFile.ExType::Consignor;
            ExFile.Number := "No.";
            //message('3');
            ExFile.Txt01 := "Sell-to Customer No.";
            //Message('4');
            if "Ship-to Address" <> '' then begin
                ExFile.Txt02 := "Ship-to Name";
                ExFile.Txt03 := "Ship-to Address";
                ExFile.Txt04 := "Ship-to Address 2";
                ExFile.Txt05 := "Ship-to Post Code";
                ExFile.Txt06 := "Ship-to City";
                country.Reset;
                if country.Get("Ship-to Country/Region Code") then
                    ExFile.Txt07 := country."EU Country/Region Code"
                else begin
                    if srs.Country = 'DK' then
                        ExFile.Txt07 := 'DK';
                    if srs.Country = 'NO' then
                        ExFile.Txt07 := 'NO';
                    if srs.Country = 'SE' then
                        ExFile.Txt07 := 'SE';
                end;
            end
            else begin
                ExFile.Txt02 := "Sell-to Customer Name";
                ExFile.Txt03 := "Sell-to Address";
                ExFile.txt04 := "Sell-to Address 2";
                ExFile.Txt05 := "Sell-to Post Code";
                ExFile.Txt06 := "Sell-to City";
                if country.Get("Sell-to Country/Region Code") then
                    ExFile.Txt07 := country."EU Country/Region Code"
                else begin
                    //ExFile.Txt07 := 'DK';
                    if srs.Country = 'DK' then
                        ExFile.Txt07 := 'DK';
                    if srs.Country = 'NO' then
                        ExFile.Txt07 := 'NO';
                    if srs.Country = 'SE' then
                        ExFile.Txt07 := 'SE';
                end;
            end;
            //Message('1000');
            ExFile.Txt08 := "Sell-to Customer No.";
            ExFile.Txt09 := "Sell-to Contact";
            ExFile.Txt10 := "Sell-to Phone No.";
            //ExFile.Txt11 := "Your Reference";
            ExFile.Txt11 := "Sell-to Contact No."; //060121
                                                   //if Customer."Gen. Bus. Posting Group" = '11' then begin
            if srs.Country = 'SE' then begin
                ExFile.Txt12 := '32';
                ExFile.Txt13 := 'S';
            end;
            if srs.Country = 'DK' then begin
                ExFile.Txt12 := '34';
                ExFile.Txt13 := 'DK';
            end;
            if srs.Country = 'NO' then begin
                ExFile.Txt12 := '36';
                ExFile.Txt13 := 'N';
            end;


            ExFile.Txt14 := Format("Consignor Kolli");
            ExFile.Txt15 := Format("Consignor Vægt");


            //User.Reset;

            //if User.Get(UserId) then
            //ExFile.Txt16 := User."User Name"
            //else
            //ExFile.Txt16 := 'Anni';
            IF (UserId = 'ANNI') then
                ExFile.Txt16 := 'Anni'; //UserId

            IF (UserId = 'BUKET') then
                ExFile.Txt16 := 'Buket'; //UserId

            //HBK - ITB - 100122
            IF (UserId = 'CLF') then
                ExFile.Txt16 := 'Flemming'; //UserId
                                            //100122    
                                            //HBK / ITB - 100122
            if (UserId <> 'ANNI') and (UserId <> 'BUKET') and (UserId <> 'CLF') then
                ExFile.Txt16 := 'Anni';

            if Customer."Gen. Bus. Posting Group" = '11' then
                ExFile.Txt17 := '86286336'
            else
                ExFile.Txt17 := '';   //kun sverige ->'86286336';

            //message('før');
            ExFile.ID := CreateGuid();
            //140421  Message(ExFile.Id);


            //ind igen 250122        ExFile.Insert;  //******************
            //250122 message('efter');

            WINEDIDato := Today;
            //head.Modify;
        end; //consignor colli <> 0
    end;

    trigger OnAfterGetRecord()

    var
        "Sales Line": Record "Sales Line";
        Vægt: Decimal;
        Colli: Integer;
        Item: Record Item;


    begin
        "Vægt" := 0;
        Colli := 0;
        "Sales Line".Reset;
        "Sales Line".SetRange("Document No.", "No.");
        "Sales Line".SetRange("Document Type", "Document Type");
        if "Sales Line".FindSet then
            repeat
                Item.Reset;
                if Item.Get("Sales Line"."No.") then
                    "Vægt" := "Vægt" + (Item."Net Weight" * "Sales Line".Quantity);
            until "Sales Line".Next = 0;
        "Vægt" := Round("Vægt", 1, '>');
        if "Shipment Method Code" = 'POST' then
            Colli := Round(("Vægt" / 31), 1, '>')
        else
            Colli := Round(("Vægt" / 30), 1, '>');

        "Consignor Kolli" := Colli;
        "Consignor Vægt" := "Vægt";

    end;
}

