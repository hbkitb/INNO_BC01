page 50114 Api_LA_Exchange_File
{
    PageType = API;  //
    Caption = 'api_LA_Exchange_File';
    APIPublisher = 'ITB';
    APIGroup = 'ITBGroup';
    APIVersion = 'v1.0';
    EntityName = 'LAExchangeFile';
    EntitySetName = 'innoLAExchangeFile';
    SourceTable = LA_Exchange_File;
    DelayedInsert = true;
    ODataKeyFields = ID; //SystemId;
    //Editable = false;//
    //

    layout
    {
        area(Content)
        {

            /*
            field(id; rec.SystemId)
            {
                ApplicationArea = All;//
                Caption = 'GUID';

            }
            */

            repeater(Generel)
            {
                field(id; Rec.ID)
                {
                    ApplicationArea = All;
                    Caption = 'GUID';

                }

                field(ExType; Rec.ExType)
                {
                    ApplicationArea = All;
                    Caption = 'ExType';

                }


                field(Number; Rec.Number)
                {
                    ApplicationArea = All;
                    Caption = 'Nummer';

                }


                field(Txt01; Rec.Txt01)
                {
                    ApplicationArea = All;
                    Caption = 'Txt01';

                }

                field(Txt02; Rec.Txt02)
                {
                    ApplicationArea = All;
                    Caption = 'Txt02';

                }

                field(Txt03; Rec.Txt03)
                {
                    ApplicationArea = All;
                    Caption = 'Txt03';

                }

                field(Txt04; Rec.Txt04)
                {
                    ApplicationArea = All;
                    Caption = 'Txt04';

                }

                field(Txt05; Rec.Txt05)
                {
                    ApplicationArea = All;
                    Caption = 'Txt05';

                }

                field(Txt06; Rec.Txt06)
                {
                    ApplicationArea = All;
                    Caption = 'Txt06';

                }

                field(Txt07; Rec.Txt07)
                {
                    ApplicationArea = All;
                    Caption = 'Txt07';

                }

                field(Txt08; Rec.Txt08)
                {
                    ApplicationArea = All;
                    Caption = 'Txt08';

                }

                field(Txt09; Rec.Txt09)
                {
                    ApplicationArea = All;
                    Caption = 'Txt09';

                }

                field(Txt10; Rec.Txt10)
                {
                    ApplicationArea = All;
                    Caption = 'Txt10';

                }

                field(Txt11; Rec.Txt11)
                {
                    ApplicationArea = All;
                    Caption = 'Txt11';

                }
                field(Txt12; Rec.Txt12)
                {
                    ApplicationArea = All;
                    Caption = 'Txt12';

                }

                field(Txt13; Rec.Txt13)
                {
                    ApplicationArea = All;
                    Caption = 'Txt13';

                }

                field(Txt14; Rec.Txt14)
                {
                    ApplicationArea = All;
                    Caption = 'Txt14';

                }

                field(Txt15; Rec.Txt15)
                {
                    ApplicationArea = All;
                    Caption = 'Txt15';

                }
                field(Txt16; Rec.Txt16)
                {
                    ApplicationArea = All;
                    Caption = 'Txt16';
                }
                field(Txt17; Rec.Txt17)
                {
                    ApplicationArea = All;
                    Caption = 'Txt17';
                }
                field(Txt18; Rec.Txt18)
                {
                    ApplicationArea = All;
                    Caption = 'Txt18';
                }
                field(Txt19; Rec.Txt19)
                {
                    ApplicationArea = All;
                    Caption = 'Txt19';
                }
                field(Txt20; Rec.Txt20)
                {
                    ApplicationArea = All;
                    Caption = 'Txt20';
                }
                field(Dec01; Rec.Dec01)
                {
                    ApplicationArea = All;
                    Caption = 'Dec01';

                }
                field(Dec02; Rec.Dec02)
                {
                    ApplicationArea = All;
                    Caption = 'Dec02';

                }
                field(Dec03; Rec.Dec03)
                {
                    ApplicationArea = All;
                    Caption = 'Dec03';

                }
                field(Dec04; Rec.Dec04)
                {
                    ApplicationArea = All;
                    Caption = 'Dec04';

                }
                field(Used; Rec.Used)
                {
                    ApplicationArea = All;
                    Caption = 'Used';

                }


            }
        }
    }
}