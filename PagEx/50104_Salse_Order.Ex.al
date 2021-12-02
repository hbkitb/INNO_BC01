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


    }

    var

}