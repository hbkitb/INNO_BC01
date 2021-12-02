pageextension 50112 "Sales Lines ERPG" extends "Sales Lines"
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