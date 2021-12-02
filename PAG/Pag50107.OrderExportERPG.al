page 50107 "Order Export ERPG"
{

    PageType = List;
    SourceTable = "Order Export ERPG";
    Caption = 'Order Export';
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(OrdreNummer; Rec.OrdreNummer)
                {
                    ApplicationArea = All;
                }
                field(LinieNummer; Rec.LinieNummer)
                {
                    ApplicationArea = All;
                }
                field(Varenummer; Rec.Varenummer)
                {
                    ApplicationArea = All;
                }
                field(Lokation; Rec.Lokation)
                {
                    ApplicationArea = All;
                }
                field(Antal; Rec.Antal)
                {
                    ApplicationArea = All;
                }
                field("Pris (stk. pris)"; Rec."Pris (stk. pris)")
                {
                    ApplicationArea = All;
                }
                field("Rabat (procent)"; Rec."Rabat (procent)")
                {
                    ApplicationArea = All;
                }
                field("Beløb (samlet for linien)"; Rec."Beløb (samlet for linien)")
                {
                    ApplicationArea = All;
                }
                field(Tekst; Rec.Tekst)
                {
                    ApplicationArea = All;
                }
                field(Enhed; Rec.Enhed)
                {
                    ApplicationArea = All;
                }
                field(Momskode; Rec.Momskode)
                {
                    ApplicationArea = All;
                }
                field("Antal lever nu"; Rec."Antal lever nu")
                {
                    ApplicationArea = All;
                }
                field("Oprettet dato"; Rec."Oprettet dato")
                {
                    ApplicationArea = All;
                }
                field(Leveringsdato; Rec.Leveringsdato)
                {
                    ApplicationArea = All;
                }
                field("Bekræftet dato"; Rec."Bekræftet dato")
                {
                    ApplicationArea = All;
                }
                field(Debitorkonto; Rec.Debitorkonto)
                {
                    ApplicationArea = All;
                }
                field(Serienummer; Rec.Serienummer)
                {
                    ApplicationArea = All;
                }
                field("Leveret antal"; Rec."Leveret antal")
                {
                    ApplicationArea = All;
                }
                field("Faktureret antal"; Rec."Faktureret antal")
                {
                    ApplicationArea = All;
                }
                field("Leveret værdi i valuta"; Rec."Leveret værdi i valuta")
                {
                    ApplicationArea = All;
                }
                field(Transaktionsnummer; Rec.Transaktionsnummer)
                {
                    ApplicationArea = All;
                }
                field("(et nul)"; Rec."(et nul)")
                {
                    ApplicationArea = All;
                }
                field(Liniestatus; Rec.Liniestatus)
                {
                    ApplicationArea = All;
                }
                field(Lagerstatus; Rec.Lagerstatus)
                {
                    ApplicationArea = All;
                }
                field("Medarbejder / sælger initialer"; Rec."Medarbejder / sælger initialer")
                {
                    ApplicationArea = All;
                }
                field(KitRefId; Rec.KitRefId)
                {
                    ApplicationArea = All;
                }
                field(OrigNumberRef; Rec.OrigNumberRef)
                {
                    ApplicationArea = All;
                }
                field(Antal2; Rec.Antal2)
                {
                    ApplicationArea = All;
                }
                field("blank tekstfelt"; Rec."blank tekstfelt")
                {
                    ApplicationArea = All;
                }
                field(IgnoreListCode; Rec.IgnoreListCode)
                {
                    ApplicationArea = All;
                }
                field("Kostpris samlet i  LCY"; Rec."Kostpris samlet i  LCY")
                {
                    ApplicationArea = All;
                }
                field(Land; Rec.Land)
                {
                    ApplicationArea = All;
                }
                field("Prisenhed kode"; Rec."Prisenhed kode")
                {
                    ApplicationArea = All;
                }
                field(TradeCode; Rec.TradeCode)
                {
                    ApplicationArea = All;
                }

                field(IsCreated; Rec.IsCreated)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

}
