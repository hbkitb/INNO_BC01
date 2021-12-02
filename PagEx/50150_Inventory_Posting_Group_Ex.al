pageextension 50150 "Inven Posting Groups Inno ERPG" extends "Inventory Posting Groups"
{
    layout
    {
        addlast(Control1)
        {
            field(ToldPos; Rec.ToldPos)
            {
                ApplicationArea = all;

            }
            field(ToldPosTxt; Rec.ToldPosTxt)
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