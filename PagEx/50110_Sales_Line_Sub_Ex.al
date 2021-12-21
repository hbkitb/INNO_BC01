pageextension 50110 "Sales Lines Subform ERPG" extends "Sales Order Subform"
{
    layout
    {

        addlast(Content)
        {
            field(DKExport; Rec.DKExport)
            {
                ApplicationArea = all;
            }

            field(PlacCopy; Rec.PlacCopy)
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

pageextension 50111 "Sales LinesInv Subform ERPG" extends "Sales Invoice Subform"
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