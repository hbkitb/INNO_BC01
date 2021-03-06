pageextension 50100 "Item_Card_Ex ERPG" extends "Item Card"
{
    layout
    {
        addafter(Description)
        {
            field(ItemName1; Rec.ItemName1)
            {
                ApplicationArea = All;
                ToolTip = 'Varenavn2 (Fra C5)';

            }
        }

        addafter(Inventory)
        {
            group(Innotec)
            {


                field(MinPris; Rec.MinPris)
                {

                    ApplicationArea = All;
                    ToolTip = 'Minimumspris for denne vare - valideres ifm. ordreindtastning';
                }

                field(P1; Rec.P1)
                {

                    ApplicationArea = All;
                    ToolTip = 'Påhængsvare nr. 1 - medtages ved salg af denne vare';
                }

                field(P2; Rec.P2)
                {

                    ApplicationArea = All;
                    ToolTip = 'Påhængsvare nr. 2 - medtages ved salg af denne vare';

                }
                field(StrPrKs; Rec.StrPrKs)
                {
                    ApplicationArea = All;
                    ToolTip = 'Stk. pr. kasse';

                }
                field(Short; Rec.Short)
                {
                    ApplicationArea = All;
                    ToolTip = 'Forkortelse for varenavnet';

                }
                field(PaySaldo; Rec.PaySaldo)
                {
                    ApplicationArea = All;
                    ToolTip = 'Skal denne vare indgå i saldo på provisionsberegningen';

                }
                field(NoInnoItem; Rec.NoInnoItem)
                {
                    ApplicationArea = All;
                    ToolTip = 'Markér for IKKE INNOTEC vare';

                }
                field(UnNumber; Rec.UnNumber)
                {
                    ApplicationArea = All;
                    ToolTip = 'UN nummer tilhørende varen';

                }
                field(Farlig; Farlig)
                {
                    ApplicationArea = All;
                    ToolTip = 'Farligt gods ?';

                }
                field(StkPrLag; StkPrLag)
                {
                    ApplicationArea = All;
                    ToolTip = 'Stk pr. lag på palle';

                }
                field(StkPrPal; StkPrPal)
                {
                    ApplicationArea = All;
                    ToolTip = 'Stk pr. palle';

                }
                field(PlacCopy; PlacCopy)
                {
                    ApplicationArea = All;
                    Caption = 'Placering';
                    ToolTip = 'Placering';

                }
                field(CostPriceVAL; CostPriceVAL)
                {
                    ApplicationArea = All;
                    Caption = 'KostprisVAL';
                    ToolTip = 'Kostpris i valuta';

                }
                field(CostCurrency; CostCurrency)
                {
                    ApplicationArea = All;
                    Caption = 'KostValuta';
                    ToolTip = 'Valuta for kostpris';

                }
                field(Afgift; Afgift)
                {
                    ApplicationArea = All;
                    Caption = 'MineralOlie';
                    ToolTip = 'MineralOlie';
                    DecimalPlaces = 3;

                }
                field(Afgift2; Afgift2)
                {
                    ApplicationArea = All;
                    Caption = 'SmøreOlie';
                    ToolTip = 'SmøreOlie';
                    DecimalPlaces = 3;

                }
                field(Afgift3; Afgift3)
                {
                    ApplicationArea = All;
                    Caption = 'Co2';
                    ToolTip = 'Co2';
                    DecimalPlaces = 3;

                }

            }
        }
        // Add changes to page layout here
    }

    actions
    {

        addlast(Processing)
        {
            /*    action(xmltest)
                {
                    ApplicationArea = All;

                    trigger OnAction()
                    var
                        ous: OutStream;
                        x: XmlPort "_Inventable ERPG";
                        xml: XmlDocument;
                    begin

                        Xmlport.Run(50102, false, false);
                    end;
                }*/
        }
        addlast(Reporting)
        {
            action("ERP-TEST")
            {
                Caption = 'ERP-IMP';
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Message('dette er ok');
                    //Codeunit.Run(50149);  //50149 "50149_Diverse_OP_ERPG"
                    Codeunit.Run(Codeunit::"50149_Diverse_OP_ERPG");
                end;
            }

            action("TEST-Rapport")
            {
                Caption = 'Inno-Bestillingsliste';
                ApplicationArea = All;

                trigger OnAction()
                begin
                    //Message('dette er ok');
                    Report.Run(50105);
                end;
            }
            action("Lagstat")
            {
                Caption = 'Lagstat';
                ApplicationArea = All;

                trigger OnAction()
                begin
                    //Message('dette er ok');
                    Page.Run(50106);
                end;
            }
            action("ITBordlinEXP")
            {
                Caption = 'ITB_OrdLin_EXP';
                ApplicationArea = All;

                trigger OnAction()
                begin
                    //Message('dette er ok');
                    Page.Run(50128);
                end;
            }

            action("ITBCredlinEXP")
            {
                Caption = 'ITB_CredLin_EXP';
                ApplicationArea = All;

                trigger OnAction()
                begin
                    //Message('dette er ok');
                    Page.Run(50129);
                end;
            }
            //110522
            action("Postnummer")
            {
                Caption = 'Udfyld postnumre';
                ApplicationArea = All;

                trigger OnAction()
                var
                    Post: Record "Post Code";
                    Deb: Record Customer;

                begin
                    Deb.Reset;
                    Deb.SetRange("Country/Region Code", 'NO');
                    if Deb.FindSet then
                        repeat
                            Clear(Post);
                            Post.Reset;
                            Post.SetRange(Code, Deb."Post Code");
                            Post.SetRange("Country/Region Code", Deb."Country/Region Code");
                            if Post.FindSet then begin
                                ;
                            end
                            else begin
                                Clear(Post);
                                Post.Reset;
                                Post.Init;
                                Post.Code := Deb."Post Code";
                                Post.City := Deb.City;
                                Post."Country/Region Code" := Deb."Country/Region Code";
                                Post.Insert;
                            end;


                        until Deb.Next = 0;

                end;
            }

        }

    }
    var

}