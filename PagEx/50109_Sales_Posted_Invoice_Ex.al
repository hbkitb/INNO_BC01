pageextension 50109 w extends "Posted Sales Invoice"
{
    layout
    {
        addlast(Content)
        {
            field(DKEXPORT; Rec.DKEXPORT)
            {
                ApplicationArea = all;
            }
        }
    }

    actions
    {

    }

    var

}