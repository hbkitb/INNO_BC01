page 50106 Lagstat
{

    PageType = List;
    SourceTable = "Lagstat ERPG";
    Caption = 'Lager Status';
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Code; Rec.Code)
                {
                    ApplicationArea = All;
                }
                field(Inventory; Rec.Inventory)
                {
                    ApplicationArea = All;
                }
                field(InsertDate; Rec.InsertDate)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(UpdateStat)
            {
                ApplicationArea = All;
                Caption = 'Updater lager';
                ToolTip = 'Updater Lager Status';
                trigger OnAction()
                var
                    cd: Codeunit "Lagstat ERPG";
                begin
                    cd.UpdateLAGSTAT();
                end;
            }
        }
    }
}
