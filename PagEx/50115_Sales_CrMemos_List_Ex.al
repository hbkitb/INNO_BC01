pageextension 50115 "Posted Sales CR ITB" extends "Posted Sales Credit Memos"
{
    layout
    {


    }

    actions
    {
        addlast(navigation)
        {
            action(OrdreExportList)////
            {
                ApplicationArea = All;
                Caption = 'Ordre Eksport liste';
                Image = CheckList;
                trigger OnAction()
                var
                    pa: Page "Order Export ERPG";
                begin
                    pa.Run();
                end;
            }


        }

        addlast(Processing)
        {
            action(ExportInvoice)
            {
                ApplicationArea = All;
                Caption = 'Ekspoter Kreditnota';
                Image = ExportReceipt;
                trigger OnAction()
                var
                    cod: Codeunit "CreditNote Handler ITB";
                    head: Record "Sales Cr.Memo Header";
                    conf: Boolean;
                begin
                    CurrPage.SetSelectionFilter(head);


                    if head.FindSet() then
                        repeat
                            cod.ExportAllSelectedInvoices(head);
                            head.Mark(false);

                        until head.Next() = 0;
                    Message('Kreditnotaer eksporteret');
                end;
            }

            action(ExportAllInvoices)
            {
                ApplicationArea = All;
                Caption = 'Ekspoter Alle Kreditnotaer';
                Image = ExportReceipt;
                trigger OnAction()
                var
                    cod: Codeunit "CreditNote Handler ITB";
                begin

                    cod.ExportAllInvoices();
                    Message('Kreditnotaer eksporteret');
                end;
            }

        }


    }

    var

}