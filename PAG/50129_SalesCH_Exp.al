page 50129 "SalesCredLine_EXP"
{

    PageType = List;
    SourceTable = "Sales Cr.Memo Line";
    Caption = 'ITB Invoice CredLin Export';
    //ApplicationArea = All;
    //UsageCategory = Lists;
    Permissions = TableData "Sales Cr.Memo Header" = rm,
                  tabledata "Sales Cr.Memo Line" = rm;

    Editable = true;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field("Bill-to Customer No."; rec."Bill-to Customer No.")
                {
                    ApplicationArea = All;
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                }
                field("Posting Date"; rec."Posting Date")
                {
                    ApplicationArea = All;
                }
                field(DKEXPORT; Rec.DKEXPORT)
                {
                    ApplicationArea = All;
                    Editable = true;
                }

            }
        }
    }

}
