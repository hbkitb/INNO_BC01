page 50120 "eSalesHeader_I"
{

    PageType = List;
    SourceTable = eSalesTable_I;
    Caption = 'eSalesHeader';
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {

                field(Approve; Rec.Approve)
                {
                    ApplicationArea = All;
                    Caption = 'Godkend/Afvis';

                }
                field(eSalesNumber; Rec.eSalesNumber)
                {
                    ApplicationArea = All;
                    Caption = 'eSalesNumber';

                }

                field(CustAccount; Rec.CustAccount)
                {
                    ApplicationArea = All;
                    Caption = 'DebitorNummer/Konto';

                }

                field(Name; Rec.Name1)
                {
                    ApplicationArea = All;
                    Caption = 'Debitornavn';
                    Editable = false;

                }
                field(SalesRep; Rec.SalesRep)
                {
                    ApplicationArea = All;
                    Caption = 'Sælger';
                    Style = Favorable;   //StrongAccent;

                }

                field(CreateDate; Rec.CreateDate)
                {
                    ApplicationArea = All;
                    Caption = 'Oprettet dato';
                    Editable = false;

                }

                field(Address1; Rec.Address11)
                {
                    ApplicationArea = All;
                    Caption = 'Adresse1';
                    Editable = false;

                }

                field(Address2; Rec.Address21)
                {
                    ApplicationArea = All;
                    Caption = 'Adresse2';
                    Editable = false;

                }

                field(City; Rec.City1)
                {
                    ApplicationArea = All;
                    Caption = 'By / Adresse3';
                    Editable = false;

                }

                field(Country; Rec.Country1)
                {
                    ApplicationArea = All;
                    Caption = 'Land';

                }

                field(ZipCode; Rec.ZipCode)
                {
                    ApplicationArea = All;
                    Caption = 'PostNummer';
                    Editable = false;

                }

                field(DlvName; Rec.DlvName1)
                {
                    ApplicationArea = All;
                    Caption = 'LeveringsNavn';

                }

                field(DlvAddress1; Rec.DlvAddress11)
                {
                    ApplicationArea = All;
                    Caption = 'LeveringsAdresse1';

                }

                field(DlvAddress2; Rec.DlvAddress21)
                {
                    ApplicationArea = All;
                    Caption = 'LeveringsAdresse2';

                }

                field(DlvZipCode; Rec.DlvZipCode)
                {
                    ApplicationArea = All;
                    Caption = 'LeveringsPostNummer';

                }
                field(DlvCity; Rec.DlvCity1)
                {
                    ApplicationArea = All;
                    Caption = 'LeveringsBy';

                }

                field(DeliveryMode; Rec.DeliveryMode)
                {
                    ApplicationArea = All;
                    Caption = 'Leveringsform';

                }

                field(Payment; Rec.Payment)
                {
                    ApplicationArea = All;
                    Caption = 'Leveringsbetingelse';

                }

                field(CVRNo; Rec.CVRNo)
                {
                    ApplicationArea = All;
                    Caption = 'Debitor CVRNo';

                }

                field(PaymentId; Rec.PaymentId)
                {
                    ApplicationArea = All;
                    Caption = 'BetalingsId';

                }

                field(Freight; Rec.Freight)
                {
                    ApplicationArea = All;
                    Caption = 'Fragt';

                }

                field(Fee; Rec.Fee)
                {
                    ApplicationArea = All;
                    Caption = 'Gebyr';
                }

                field(SalesNumber; Rec.SalesNumber)
                {
                    ApplicationArea = All;
                    Caption = 'SalgsordreNr';
                    Editable = false;
                }

                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    Caption = 'Status';
                }

                field(ReferenceNumber; Rec.ReferenceNumber1)
                {
                    ApplicationArea = All;
                    Caption = 'ReferenceNummer';
                }
                field(YourRef; Rec.YourRef1)
                {
                    ApplicationArea = All;
                    Caption = 'Deres Ref';
                }
                field(OurRef; Rec.OurRef1)
                {
                    ApplicationArea = All;
                    Caption = 'Vores Ref';
                }
                field(OrderNote; Rec.OrderNote1)
                {
                    ApplicationArea = All;
                    Caption = 'OrdreNote';
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

            action(eOrdreLinier)
            {
                ApplicationArea = All;
                Caption = 'eOrdreLinier';
                Image = OrderList;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page eSalesLine_I;
                RunPageLink = eSalesNumber = FIELD(eSalesNumber);
                RunPageView = SORTING(LineNumber)
                              ORDER(Ascending);
                ShortCutKey = 'Ctrl+F7';
                ToolTip = 'Vis linier til eordren.';
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
            action(eCustomer)
            {
                ApplicationArea = All;
                Caption = 'eCustomerTable';
                Image = OrderList;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                //191020 RunObject = Page "eCustomer Card";
                //RunPageLink = eSalesNumber = FIELD(eSalesNumber);
                //RunPageView = SORTING(LineNumber)
                //              ORDER(Ascending);
                ShortCutKey = 'Shift+F7';
                ToolTip = 'Vis e Kunder.';

                //Så kommer opdat. af debitorer - 191020
                trigger OnAction()
                var
                    esalesT: Record eSalesTable_I;
                    esalesTV: Record eSalesTable_I;
                    ecust: Record Customer;
                    ecustPag: Page "eCustomer Card";

                begin
                    esalesT.Reset();
                    //esalesT.SetFilter(Status, 'Godkendt|Registreret'); //130121
                    //esalesT.SetFilter(CustAccount, CustAccount);  //130121
                    esalesT.SetFilter(eSalesNumber, eSalesNumber);
                    if esalesT.FindSet() then begin
                        repeat
                            if ecust.get(esalesT.CustAccount) then begin
                                if (ecust."No." <> CustAccount) OR
                                   (ecust.Name <> Name1) OR
                                   (ecust.Address <> Address11) OR
                                   (ecust."Address 2" <> Address21) OR
                                   (ecust."Post Code" <> ZipCode) OR
                                   (ecust.City <> City1) OR
                                   //091121  (ecust."Country/Region Code" <> Country1) OR
                                   (ecust."Phone No." <> phone) OR
                                   (ecust."E-Mail" <> eMail1) then begin

                                    Clear(ecustPag);
                                    esalesTV.SetRange(eSalesNumber, esalesT.eSalesNumber);
                                    ecustPag.SetTableView(esalesTV);
                                    ecustPag.Run();
                                    //esalesT.CustAccount := 
                                end;
                            end
                            else begin
                                //ecustPag(esalesT)
                                Clear(ecustPag);
                                esalesTV.SetRange(eSalesNumber, esalesT.eSalesNumber);
                                ecustPag.SetTableView(esalesTV);
                                ecustPag.Run();
                            end;
                        //210421 Message(esalesT.eSalesNumber);
                        //Clear(ecustPag);
                        until esalesT.Next() = 0;
                    end;

                end;

            }
            action(VisAlle)
            {
                ApplicationArea = All;
                Caption = 'Vis Alle/Aktive';
                Image = OrderList;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                //ShortCutKey = 'Ctrl+F7';
                ToolTip = 'Vis Alle/Aktive eOrdrer.';
                trigger OnAction()

                var
                    esales: Record eSalesTable_I;
                begin
                    IF ShowAll = false then begin
                        ShowAll := true;
                        Reset();
                    end
                    else begin
                        ShowAll := false;
                        //esales.SetRange(Status, Status::IOrdre, Status::Registreret);
                        esales.SetRange(Status, Status::Oprettet, Status::Registreret);
                        CurrPage.SetTableView(esales);

                    end;

                end;
            }

            action(eSalesReject)
            {
                ApplicationArea = All;
                Caption = 'Slet afvisninger';
                Image = OrderList;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                //ShortCutKey = 'Ctrl+F7';
                ToolTip = 'Slet afviste/annullerede eOrdrer';
                trigger OnAction()
                var
                    eSalesTReject: Record eSalesTable_I;
                    eSalesLReject: Record eSalesLine_I;

                begin
                    eSalesTReject.Reset();
                    eSalesTReject.SetRange(eSalesTReject.Status, eSalesTReject.Status::Afvist);
                    if eSalesTReject.FindSet() then begin
                        repeat
                            eSalesLReject.Reset();
                            eSalesLReject.SetRange(eSalesLReject.eSalesNumber, eSalesTReject.eSalesNumber);
                            if eSalesLReject.FindSet() then begin
                                repeat
                                    eSalesLReject.Delete()
                                until eSalesLReject.Next = 0;
                            end;
                            eSalesTReject.Delete();
                        until eSalesTReject.Next() = 0;
                    end;

                end;
            }
        }
    }
    trigger OnOpenPage()
    var

    begin
        SetRange(Status, status::Oprettet, Status::Registreret);
    end;

    trigger OnAfterGetCurrRecord()
    var

    begin
        StyleTxt := SetStyle();
    end;

    trigger OnAfterGetRecord()
    var

    begin
        StyleTxt := SetStyle();
    end;


    var
        StyleTxt: Text;
        ShowAll: Boolean;

    local procedure SetStyle(): Text
    var

    begin


    end;


}


