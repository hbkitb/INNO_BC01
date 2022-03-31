page 50128 "SalesInvoiceLine_EXP"
{

    PageType = List;
    SourceTable = "Sales Invoice Line";
    Caption = 'ITB Invoice OrdLin Export';
    //ApplicationArea = All;
    //UsageCategory = Lists;
    Permissions = TableData "sales invoice line" = rm,
                  tabledata "Sales invoice header" = rm;

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
