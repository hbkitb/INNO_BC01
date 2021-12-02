page 50102 "FS Sales Line ERPG"
{

    PageType = List;
    SourceTable = "FS Sales Line ERPG";
    Caption = 'FS Sales Line ';
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(id; Rec.id)
                {
                    ApplicationArea = All;
                }
                field(linenumber; Rec.linenumber)
                {
                    ApplicationArea = All;
                }
                field(itemnumber; Rec.itemnumber)
                {
                    ApplicationArea = All;
                }
                field(description; Rec.description)
                {
                    ApplicationArea = All;
                }
                field(itemprice; Rec.itemprice)
                {
                    ApplicationArea = All;
                }
                field(quantity; Rec.quantity)
                {
                    ApplicationArea = All;
                }
                field(discount; Rec.discount)
                {
                    ApplicationArea = All;
                }
                field(headerid; Rec.headerid)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

}
