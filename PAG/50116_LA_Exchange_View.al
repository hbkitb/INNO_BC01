page 50116 "LA_Exchange_View"
{

    PageType = List;
    SourceTable = LA_Exchange_File;
    Caption = 'LA_Exchange_View';
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {

                field(LAID; rec.LAID)
                {
                    ApplicationArea = All;


                }
                field(Number; rec.Number)
                {
                    ApplicationArea = All;


                }

                field(Txt01; rec.Txt01)
                {
                    ApplicationArea = All;


                }

                field(Txt02; rec.Txt02)
                {
                    ApplicationArea = All;

                }
                field(ID; rec.ID)
                {
                    ApplicationArea = All;


                }

                field(Txt14; rec.Txt14)
                {
                    ApplicationArea = All;
                    Caption = 'Kolli';


                }
                field(Txt15; rec.Txt15)
                {
                    ApplicationArea = All;
                    Caption = 'Vægt';


                }
                field(Txt16; rec.Txt16)
                {
                    ApplicationArea = All;
                    Caption = 'Bruger';


                }
                field(Txt06; rec.Txt06)
                {
                    ApplicationArea = All;
                    Caption = 'Leverings By';


                }
                field(Txt07; rec.Txt07)
                {
                    ApplicationArea = All;
                    Caption = 'Leverings Land';


                }


                field(ExType; rec.ExType)
                {
                    ApplicationArea = All;

                }

            }
        }

    }

    actions
    {


        /*
                area(Processing)
                {

                    action(Showall)
                    {
                        ApplicationArea = All;
                        Image = FilterLines;
                        Caption = 'vis all / skul oprettet';
                        trigger OnAction()
                        var
                            dd: Record "FS Sales Header ERPG";
                            te: Text;
                            tab: Record "FS Sales Header ERPG";
                        begin

                            CurrPage.GetRecord(dd);
                            te := dd.GetView();

                            if te = 'VERSION(1) SORTING(id)' then begin
                                Clear(tab);
                                CurrPage.SetTableView(tab);
                            end;
                            if te <> '' then begin
                                Clear(tab);
                                tab.SetRange(IsOrderCreated, true);
                                CurrPage.SetTableView(tab);
                            end;
                        end;
                    }
                      action(Uploadfile)
                      {
                          Caption = 'Uploade ordre fil';
                          ApplicationArea = All;
                          Promoted = true;
                          PromotedCategory = Process;
                          Image = ImportDatabase;
                          trigger OnAction()
                          var
                              cod: Codeunit "FS Export";
                          begin
                              cod.MyProcedure();
                          end;
                      }
                    action(CreateFSOrder)
                    {
                        ApplicationArea = All;
                        Caption = 'Opret Ordre';
                        Image = CreatePutawayPick;
                        Promoted = true;
                        trigger OnAction()
                        var
                            cod: Codeunit "FS Export";
                            head: Record eSalesTable_I; //her
                        begin
                            //her
                            CurrPage.SetSelectionFilter(head);
                            head.SetRange(Approve, Approve::Accepter);


                            if head.FindSet() then
                                repeat
                                    cod."Create Sales_from_eSales"(head);
                                //head.Mark(false);

                                until head.Next() = 0;
                            //her
                            //cod."Create Sales_from_eSales"(Rec);
                        end;
                    }
                }
        */

        area(Navigation)
        {
            /*
            action(eOrderlines00)
            {
                Image = OrderList;
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                Caption = 'eOrdrelinjer';
                trigger OnAction()
                var
                    pag: Page eSalesLine_I;
                    tab: Record eSalesLine_I;
                begin

                    tab.SetRange(eSalesNumber, Rec.eSalesNumber);
                    pag.SetTableView(tab);
                    pag.RunModal();
                end;
            }
            */





        }
    }
    trigger OnOpenPage()
    var

    begin

    end;

    trigger OnAfterGetCurrRecord()
    var

    begin

    end;

    trigger OnAfterGetRecord()
    var

    begin

    end;


    var
        StyleTxt: Text;
        ShowAll: Boolean;

    local procedure SetStyle(): Text
    var

    begin


    end;


}


