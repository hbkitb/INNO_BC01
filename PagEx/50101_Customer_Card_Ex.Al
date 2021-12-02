pageextension 50101 "Customer_Card_Ex ERPG" extends "Customer Card"
{
    layout
    {

        addafter(Statistics)
        {

            part(comments; "Comment Sheet List")
            {
                ApplicationArea = Basic, Suite;
                Editable = true;
                Enabled = "No." <> '';
                SubPageLink = "Table Name" = const(Customer), "No." = FIELD("No.");
                UpdatePropagation = Both;
                Caption = 'Bemærkninger';
            }

            group(Innotec)
            {


                field(PDFfaktura; Rec.PDFfaktura)
                {
                    ApplicationArea = All;
                    ToolTip = 'Skal original faktura sendes til kundens mail ?';
                }

                field(Bogholder; Rec.Bogholder)
                {
                    ApplicationArea = All;
                    ToolTip = 'Bogholder';
                }
                field(UNuse; Rec.UNuse)
                {
                    ApplicationArea = All;
                    ToolTip = 'Anvendes UN numre ifm. leverancer til denne kunde ?';
                }
                field(CompanyId; CompanyId)
                {
                    ApplicationArea = All;
                    ToolTip = 'Guiid';
                }
                field(EHF; EHF)
                {
                    ApplicationArea = All;
                    ToolTip = 'EHF - Norge';
                }


            }
        }

        addlast(factboxes)
        {
            part(commentsFB; "Comment Sheet List")
            {
                ApplicationArea = Basic, Suite;
                Editable = true;
                Enabled = "No." <> '';
                SubPageLink = "Table Name" = const(Customer), "No." = FIELD("No.");
                UpdatePropagation = Both;
                Caption = 'Bemærkninger';
            }

        }
        // Add changes to page layout here
    }

    actions
    {
        addlast(navigation)
        {

            action(VareLinier)
            {
                ApplicationArea = All;
                Caption = 'Varelinier';
                Image = Inventory;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Value Entries";
                RunPageLink = "Source No." = FIELD("No."), "Item Ledger Entry Type" = filter(1);
                RunPageView = SORTING("Item Ledger Entry Type", "Posting Date", "Item No.", "Inventory Posting Group", "Dimension Set ID")
                              ORDER(Ascending);
                ShortCutKey = 'Ctrl+F7';
                ToolTip = 'Vis alle varelinier.';
            }
            /*     action("ERP-TEST")
                 {
                     Caption = 'ERP';
                     ApplicationArea = All;

                     trigger OnAction()
                     begin
                         Message('dette er ok');
                     end;
                 }*/
        }
        // Add changes to page actions here
    }

    var

}