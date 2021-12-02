codeunit 50104 "Lagstat ERPG"
{
    trigger OnRun()
    begin

    end;

    var

    procedure UpdateLAGSTAT()
    var
        LAG: Record "Lagstat ERPG";
        item: Record Item;
        setup: Record "Sales & Receivables Setup";
        i: Integer;
        dia: Dialog;
        inv: Integer;
        CurrRec: Integer;
    begin

        setup.Get();
        //081021 if setup.Country <> 'DK' then
        //081021    Message('Dette regnskab kan ikke køre Updater Lager');
        if setup.Country = 'DK' then begin
            if setup.NordicDate < DT2Date(CurrentDateTime) then begin
                //dia.Open('Updater Lager Status @1@@@@@@@@@@');

                item.SetRange("No.");
                item.SetRange(Type, item.Type::Inventory); //160221
                i := item.Count;
                LAG.DeleteAll(true);
                if item.FindSet() then
                    repeat
                        /*
                                                CurrRec += 1;
                                                IF i <= 100 THEN
                                                    dia.UPDATE(1, (CurrRec / i * 10000) DIV 1)
                                                ELSE
                                                    IF CurrRec MOD (i DIV 100) = 0 THEN
                                                        dia.UPDATE(1, (CurrRec / i * 10000) DIV 1);

                        */
                        LAG.Code := item."No.";
                        item.CalcFields(Inventory);

                        LAG.Inventory := item.Inventory;
                        LAG.InsertDate := DT2Date(CurrentDateTime);

                        lag.Insert(true);


                    until item.Next() = 0;
                setup.NordicDate := DT2Date(CurrentDateTime);
                setup.Modify(true);
                //dia.Close;
                Message('Lager status opdateret');
            end;
        end;

    end;
}