pageextension 50105 SalesReceive_Setup_INNO_ERPG extends "Sales & Receivables Setup"
{
    layout
    {
        addafter("OIOUBL-Group")
        {
            group("INNOTEC - ALLE")
            {
                field(NordicDate; Rec.NordicDate)
                {

                    ApplicationArea = All;
                    Editable = FALSE;

                    ToolTip = 'Seneste dato for export fra DK. Må IKKE ændres';
                }

                field(Country; Rec.Country)
                {

                    ApplicationArea = All;

                    ToolTip = 'Angiv landekode som styrer import/eksport DAN,SVE,NOR';
                }

                field(eCustStd; Rec.eCustStd)
                {
                    ApplicationArea = All;
                    ToolTip = 'Standard debitor ved eordrer';
                }

                field(ShipProfile; Rec.ShipProfile)
                {

                    ApplicationArea = All;

                    ToolTip = 'Standard afsendelsesprofil på følgesedler';

                }


            }

            group("INNOTEC - DANMARK")
            {
                field(PctImpNOK; Rec.PctImpNOK)
                {

                    ApplicationArea = All;

                    ToolTip = 'Procentsats for Norsk import';
                }

                field(PctImpSVE; Rec.PctImpSVE)
                {

                    ApplicationArea = All;

                    ToolTip = 'Procentsats for Svensk import';
                }

                /*  field(NOKImp; NOKImp)
                  {

                      ApplicationArea = All;

                      ToolTip = 'Norsk import sti';
                  }*/

                /*    field(SVEImp; SVEImp)
                     {

                         ApplicationArea = All;

                         ToolTip = 'Svensk import sti';
                     }*/

                field(SVEOmkPct; Rec.SVEOmkPct)
                {

                    ApplicationArea = All;

                    ToolTip = 'Omkostning procent kredit SVE';
                }

                field(SVEProvPct; Rec.SVEProvPct)
                {

                    ApplicationArea = All;

                    ToolTip = 'Provision procent kredit SVE';
                }

                field(NOKOmkPct; Rec.NOKOmkPct)
                {

                    ApplicationArea = All;

                    ToolTip = 'Omkostning procent kredit NOK';
                }

                field(NOKProvPct; Rec.NOKProvPct)
                {

                    ApplicationArea = All;

                    ToolTip = 'Provision procent kredit NOK';

                }



            }
            group("INNOTEC - NORGE")
            {
                /*    field(NOKExp; NOKExp)
                    {

                        ApplicationArea = All;

                        ToolTip = 'Norsk export sti';
                    }*/
                field(NoComp; Rec.NoComp)
                {
                    ApplicationArea = All;
                }
            }

            group("INNOTEC - SVERIGE")
            {
                /*   field(SVEExp; SVEExp)
                   {

                       ApplicationArea = All;

                       ToolTip = 'Svensk export sti';
                   }*/
                field(SVComp; Rec.SVComp)
                {
                    ApplicationArea = All;
                }

            }
        }
        // Add changes to page layout here
    }


    actions
    {
        // Add changes to page actions here
    }

    var

}