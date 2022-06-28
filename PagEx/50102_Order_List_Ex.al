pageextension 50102 "Inno Sales Order List ERPG" extends "Sales Order List"
{
    layout
    {

    }

    actions
    {
        addlast(Processing)
        {
            action(Consignor)
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

            action(LA_Exchange)
            {
                ApplicationArea = All;
                Caption = 'Se Exchange';
                trigger OnAction()
                var
                    LAEX: Page LA_Exchange_View;
                begin
                    laex.Run;

                    //ex.SetTableView(Rec);
                    //ex.SetParameters(Rec);
                    //ex.Run();
                end;
            }

            //280421
            action(Test_Pakke_Link)
            {
                Caption = 'Sæt pakke link';
                ApplicationArea = All;
                Promoted = true;
                Image = Export;
                trigger OnAction()
                var
                    faktura: Record "Sales Invoice Header";

                begin
                    if Format(Rec."Package Tracking No.") <> '' then begin
                        faktura.Reset;
                        faktura.SetRange("No.", "External Document No.");
                        if faktura.FindSet then begin
                            faktura."Package Tracking No." := "Package Tracking No.";
                            faktura.Modify;
                        end;

                    end;



                end;
            }

            //280421
            action(ConsingnorImport)
            {
                ApplicationArea = All;
                Caption = 'Importer Consingnor fil';
                trigger OnAction()
                var
                    ex: XmlPort "Consignor Import ERPG";
                begin
                    ex.SetTableView(Rec);
                    ex.SetParameters(Rec);
                    ex.Run();
                end;
            }
            action(CreateAllOrders)
            {
                ApplicationArea = All;
                Caption = 'Importere alle order';
                trigger OnAction()
                var
                    co: Codeunit "Order Handler ERPG";
                begin
                    co.CreateAllOrders();
                end;


            }

            action(ConsingnorEx_Test)
            {
                ApplicationArea = All;
                Caption = 'Export Consingnor Test';
                trigger OnAction()  //
                var
                    ST: Record "Sales Header";
                //ex: XmlPort "Consignor export ERPG";
                begin

                    //ex.SetTableView(Rec);
                    //ex.SetParameters(Rec);
                    //ex.Run();
                    ST := Rec;
                    ST.SetRecFilter();
                    Xmlport.Run(Xmlport::"Consignor export ERPG", false, false, ST);
                end;
            }

            action(eOrdrer)
            {

                ApplicationArea = All;
                Caption = 'eOrdrer';
                Image = CheckList;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page eSalesHeader_I;
                //RunPageLink = eSalesNumber = FIELD(eSalesNumber);
                RunPageView = SORTING(eSalesNumber)
                              ORDER(Ascending);
                ShortCutKey = 'Ctrl+F7';
                ToolTip = 'Vis Alle eOrdrer.';
                //Image = CheckList;
                //ApplicationArea = All;
                //Caption = 'eOrdrer';
                //trigger OnAction()
                //var
                //    pa: Page eSalesHeader_I;
                //begin
                //    pa.Run();
                //end;
            }

            //280622 ->
            action(Freight_Add)
            {
                Caption = 'Tilføj fragtlinie';
                ApplicationArea = All;
                Promoted = true;
                Image = Export;
                ShortcutKey = 'Ctrl+F7';

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

            /* "Consignor export ERPG" 
            
                 action(xmltest)
                   {
                       ApplicationArea = All;

                       trigger OnAction()
                       var
                           cod: Codeunit "FS Export";
                       begin
                           cod.ExportPrisliste();
                       end;
                   }*/
        }
    }

    var

}