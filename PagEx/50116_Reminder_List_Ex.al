pageextension 50116 "ITB Reminder List" extends "Reminder List"
{
    layout
    {


    }

    actions
    {
        addlast(reporting)
        {
            action(RykkerListe)
            {
                ApplicationArea = All;
                Caption = 'Excel Liste';
                Image = OrderList;
                Promoted = true;
                PromotedCategory = Report;
                PromotedIsBig = true;
                RunObject = Page "Config. Package Card";
                RunPageLink = Code = const('RYKKER');
                //RunPageView = SORTING(LineNumber)
                //              ORDER(Ascending);
                ShortCutKey = 'Ctrl+F7';
                ToolTip = 'Slå op på rykker konfigurationspakke til Export til Excel';
            }

        }


    }

    var

}