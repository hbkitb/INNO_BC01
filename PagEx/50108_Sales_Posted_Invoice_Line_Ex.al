pageextension 50108 "Posted Sales Inv Lines ERPG" extends "Posted Sales Invoice Lines"
{
    layout
    {
        addlast(Content)
        {
            field(DKExport; Rec.DKExport)
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