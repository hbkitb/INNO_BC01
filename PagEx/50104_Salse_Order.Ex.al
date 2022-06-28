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

            //280622 ->
            action(Freight_Add)
            {
                Caption = 'Tilføj fragtlinie';
                ApplicationArea = All;
                Promoted = true;
                Image = Export;
                ShortcutKey = 'Ctrl+F8';

                trigger OnAction()
                var

                    item: Record item;
                    "Sales Line": Record "Sales Line";
                    LineNo: Decimal;
                    Fragt: Boolean;
                begin
                    "Sales Line".Reset;
                    "Sales Line".SetRange("Document No.", Rec."No.");
                    if "Sales Line".FindSet then
                            repeat
                                if "Sales Line"."Line No." > LineNo then
                                    LineNo := "Sales Line"."Line No.";
                                if "Sales Line"."No." = 'FRAGT' then
                                    Fragt := true;
                            until "Sales Line".Next = 0;

                    if Fragt = false then begin
                        LineNo := LineNo + 10000;

                        Clear("Sales Line");
                        "Sales Line".Reset;
                        "Sales Line".Init;
                        //if Line.Varenummer <> '' then
                        "Sales Line".Validate("Document Type", Rec."Document Type");
                        "Sales Line".Validate("Document No.", Rec."No.");
                        "Sales Line".Type := "Sales Line".Type::Item;
                        "Sales Line".Validate(Type);

                        //"Sales Line".Description := Line.Tekst;
                        "Sales Line".Validate("No.", 'FRAGT');

                        "Sales Line".Validate("Line No.", LineNo);
                        "Sales Line"."Line Discount %" := 0;   //0301222        

                        "Sales Line".Validate(Quantity, 1);
                        "Sales Line".Validate("Unit Price");
                        "Sales Line".Validate("Line Amount");
                        //030122 "Sales Line".Validate("Line Discount %", Line."Rabat (procent)");


                        "Sales Line".Insert(true);
                    end;

                end;
            }
            //280622 <-

        }


    }

    var

}