pageextension 50113 "Activities_Cue_ITB" extends "O365 Activities"
{
    layout
    {
        //addlast("Ongoing Sales")
        addafter("Ongoing Sales Quotes")
        {
            field("Ongoing e-Orders"; Rec."Ongoing e-Orders")
            {
                //ApplicationArea = all;
                ApplicationArea = Basic, Suite;
                Caption = 'eOrdrer';
                DrillDownPageID = eSalesHeader_I;
                ToolTip = 'eOrdrer med status oprettet og godkendt';
            }
        }

        addafter("Ongoing Sales Invoices")
        {
            field("Ongoing Sales Credit Memos"; Rec."Ongoing Sales Credit Memos")
            {
                //ApplicationArea = all;
                ApplicationArea = Basic, Suite;
                Caption = 'Kreditnotaer';
                DrillDownPageID = "Sales Credit Memos";
                ToolTip = 'Kreditnotaer som ikke er bogført';
            }
        }
    }

    actions
    {

    }

    var

}