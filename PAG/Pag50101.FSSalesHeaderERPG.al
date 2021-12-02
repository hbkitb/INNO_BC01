page 50101 "FS Sales Header ERPG"
{

    PageType = List;
    SourceTable = "FS Sales Header ERPG";
    Caption = 'FS Sales Header';
    UsageCategory = Lists;
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(ID; Rec.ID)
                {
                    ApplicationArea = All;
                    StyleExpr = StyleTxt;
                }
                field(account; Rec.account)
                {
                    ApplicationArea = All;
                    StyleExpr = StyleTxt;
                }
                field(salesRep; Rec.salesRep)
                {
                    ApplicationArea = All;
                    StyleExpr = StyleTxt;
                }
                field(vatNumber; Rec.vatNumber)
                {
                    ApplicationArea = All;
                    StyleExpr = StyleTxt;
                }
                field(email; Rec.email)
                {
                    ApplicationArea = All;
                    StyleExpr = StyleTxt;
                }
                field(company; Rec.company)
                {
                    ApplicationArea = All;
                    StyleExpr = StyleTxt;
                }
                field(address1; Rec.address1)
                {
                    ApplicationArea = All;
                    StyleExpr = StyleTxt;
                }
                field(address2; Rec.address2)
                {
                    ApplicationArea = All;
                    StyleExpr = StyleTxt;
                }
                field(zip; Rec.zip)
                {
                    ApplicationArea = All;
                    StyleExpr = StyleTxt;
                }
                field(city; Rec.city)
                {
                    ApplicationArea = All;
                    StyleExpr = StyleTxt;
                }
                field(country; Rec.country)
                {
                    ApplicationArea = All;
                    StyleExpr = StyleTxt;
                }
                field(deliverCompany; Rec.deliverCompany)
                {
                    ApplicationArea = All;
                    StyleExpr = StyleTxt;
                }
                field(deliverAddress1; Rec.deliverAddress1)
                {
                    ApplicationArea = All;
                    StyleExpr = StyleTxt;
                }
                field(deliverAddress2; Rec.deliverAddress2)
                {
                    ApplicationArea = All;
                    StyleExpr = StyleTxt;
                }
                field(deliverZip; Rec.deliverZip)
                {
                    ApplicationArea = All;
                    StyleExpr = StyleTxt;
                }
                field(deliverCity; Rec.deliverCity)
                {
                    ApplicationArea = All;
                    StyleExpr = StyleTxt;
                }
                field(deliverCountry; Rec.deliverCountry)
                {
                    ApplicationArea = All;
                    StyleExpr = StyleTxt;
                }
                field(purchaser; Rec.purchaser)
                {
                    ApplicationArea = All;
                    StyleExpr = StyleTxt;
                }
                field(purchaseOrder; Rec.purchaseOrder)
                {
                    ApplicationArea = All;
                    StyleExpr = StyleTxt;
                }
                field(orderNote; Rec.orderNote)
                {
                    ApplicationArea = All;
                    StyleExpr = StyleTxt;
                }
                field(IsDebitorNew; Rec.IsDebitorNew)
                {
                    ApplicationArea = All;
                    StyleExpr = StyleTxt;
                }
                field(IsOrderCreated; Rec.IsOrderCreated)
                {
                    ApplicationArea = All;
                    StyleExpr = StyleTxt;
                }
                field(ImportDate; Rec.ImportDate)
                {
                    ApplicationArea = All;
                    StyleExpr = StyleTxt;

                }
                field(OrderNo; Rec.OrderNo)
                {
                    ApplicationArea = All;
                    StyleExpr = StyleTxt;
                }
                field(OrderDate; Rec.OrderDate)
                {
                    ApplicationArea = All;
                    StyleExpr = StyleTxt;
                }

            }
        }

    }

    actions
    {

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
            /*  action(Uploadfile)
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
              }*/
            action(CreateFSOrder)
            {
                ApplicationArea = All;
                Caption = 'Opret Ordre';
                Image = CreatePutawayPick;
                Promoted = true;
                trigger OnAction()
                var
                    cod: Codeunit "FS Export";
                begin
                    cod."Create Sales Order"(Rec);
                end;
            }
        }
        area(Navigation)
        {
            action(FsOrderlines)
            {
                Image = OrderList;
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                Caption = 'Ordre linjer';
                trigger OnAction()
                var
                    pag: Page "FS Sales Line ERPG";
                    tab: Record "FS Sales Line ERPG";
                begin

                    tab.SetRange(headerid, Rec.ID);
                    pag.SetTableView(tab);
                    pag.RunModal();
                end;
            }
        }
    }
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


    local procedure SetStyle(): Text
    var

    begin
        if Rec.IsDebitorNew = true then
            exit('Attention');
        if Rec.IsOrderCreated then
            exit('Favorable');

    end;


}


