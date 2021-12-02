pageextension 50107 "Posted Sales Invoices ERPG" extends "Posted Sales Invoices"
{
    layout
    {


    }

    actions
    {
        addlast(navigation)
        {
            action(OrdreExportList)
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
                Caption = 'Ekspoter faktura';
                Image = ExportReceipt;
                trigger OnAction()
                var
                    cod: Codeunit "Order Handler ERPG";
                    head: Record "Sales Invoice Header";
                    conf: Boolean;
                begin
                    CurrPage.SetSelectionFilter(head);


                    if head.FindSet() then
                        repeat
                            cod.ExportAllSelectedInvoices(head);
                            head.Mark(false);

                        until head.Next() = 0;
                    Message('Ordrer eksporteret');
                end;
            }

            action(ExportAllInvoices)
            {
                ApplicationArea = All;
                Caption = 'Ekspoter Alle faktura';
                Image = ExportReceipt;
                trigger OnAction()
                var
                    cod: Codeunit "Order Handler ERPG";
                begin

                    cod.ExportAllInvoices();
                    Message('Ordrer eksporteret');
                end;
            }

            action(testtoldpos)
            {
                ApplicationArea = All;
                Caption = 'testtoldpos';
                Image = ExportReceipt;
                trigger OnAction()
                var
                    cod: Report "Told Pos ERPG";
                begin

                    cod.SetTableView(Rec);
                    cod.RunModal();
                end;
            }
        }


    }

    var

}