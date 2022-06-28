tableextension 50116 "Issued Reminder Header ITB" extends "Issued Reminder Header"
{
    fields
    {

    }

    //HBK / ITB - 280622
    trigger OnAfterInsert()

    var
        SellCust: Record Customer;
    begin
        SellCust.Reset;
        SellCust.SetRange("No.", Rec."Customer No.");
        if SellCust.FindSet then begin
            if Rec."Reminder Level" >= 2 then begin
                SellCust.Blocked := SellCust.Blocked::All;
                SellCust.Modify;
            end;
        end;

    end;
    //HBK / ITB - 280622


    var

}