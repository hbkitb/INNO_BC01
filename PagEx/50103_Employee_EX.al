pageextension 50103 "Inno Employee Card ERPG" extends "Employee Card"
{
    layout
    {
        addlast(Administration)
        {
            field(InnoPassword; Rec.InnoPassword)
            {
                ApplicationArea = all;
            }
            field(LablePrinter; Rec.LablePrinter)
            {
                ApplicationArea = all;
            }
            field(Land_; Land_)
            {
                ApplicationArea = all;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var

}