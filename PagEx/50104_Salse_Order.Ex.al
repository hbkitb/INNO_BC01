pageextension 50104 "Sales Order inno ERPG" extends "Sales Order"
{
    layout
    {
        addlast(Content)
        {
            field(Consignor; Rec.Consignor)
            {
                ApplicationArea = all;
                ToolTip = 'Dato for Consignor dannelse';
                //Editable = false;
            }
        }

        addafter("Invoice Details")
        {

            part(comments; "Comment Sheet List")
            {
                ApplicationArea = Basic, Suite;
                Editable = true;
                Enabled = "No." <> '';
                SubPageLink = "Table Name" = const(Customer), "No." = FIELD("Sell-to Customer No.");
                UpdatePropagation = Both;
                Caption = 'Bemærkninger';
            }

            group(Innotec)
            {
                field(PakkeNo; Rec.PakkeNo)
                {
                    ApplicationArea = All;
                    ToolTip = 'Pakkenummer som returneres fra Consignor. - Anvendes til Track and Trace';
                    Editable = false;
                }

                field(Nos_FakDif; Rec.Nos_FakDif)
                {
                    ApplicationArea = All;
                    ToolTip = 'Opbevaring af NO/SV faktura diff. beløb';
                    Editable = false;

                }

            }


        }
        //220121
        addlast(factboxes)
        {
            part(commentsFB; "Comment Sheet List")
            {
                ApplicationArea = Basic, Suite;
                Editable = true;
                Enabled = "No." <> '';
                SubPageLink = "Table Name" = const(Customer), "No." = FIELD("Sell-to Customer No.");
                UpdatePropagation = Both;
                Caption = 'Bemærkninger';
            }

        }
    }

    actions
    {
        addlast(processing)
        {
            action(ConsignorLabel)
            {
                Caption = 'Consignor eksport';
                ApplicationArea = All;
                Promoted = true;
                Image = Export;
                trigger OnAction()
                var

                    ans: Boolean;
                    //ous: OutStream;//
                    //   x: XmlPort "Consignor export ERPG";
                    //xml: XmlDocument;
                    x: Codeunit "FS Export";
                begin                                      //250122 - HBK
                    if (Format(Rec.Consignor) <> '') and (Format(Rec.Consignor) <> '0') then begin
                        //ans := Dialog.Confirm('Denne ordre er eksponeret til consignor vil du forsætte?', true);
                        //if not ans then
                        //    exit;
                    end;

                    x."Consignor File Create"(Rec);

                end;
            }

        }


    }

    var

}