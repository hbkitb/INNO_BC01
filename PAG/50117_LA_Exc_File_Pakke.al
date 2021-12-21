page 50117 Api_LA_Exc_File_Pakke
{
    PageType = API;  //
    Caption = 'api_LA_Exc_File_Pakke';
    APIPublisher = 'ITB';
    APIGroup = 'ITBGroup';
    APIVersion = 'v1.0';
    EntityName = 'LAExchangeFile';
    EntitySetName = 'innoLAExcFilePakke';
    SourceTable = LA_Exc_File_Pakke;
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


                field(Used; Rec.Used)
                {
                    ApplicationArea = All;
                    Caption = 'Used';

                }


            }
        }
    }
}