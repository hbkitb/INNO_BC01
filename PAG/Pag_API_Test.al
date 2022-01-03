page 50110 ApiPageName
{
    PageType = API;  //
    Caption = 'apiPageName';
    APIPublisher = 'ITB';
    APIGroup = 'ITBGroup';
    APIVersion = 'v1.0';
    EntityName = 'Employee';
    EntitySetName = 'Inno';
    SourceTable = Employee;
    DelayedInsert = true;
    ODataKeyFields = SystemId;
    //

    layout
    {
        area(Content)
        {
            field(Id; Rec.SystemId)
            {
                ApplicationArea = All;
                Caption = 'GUID';

            }

            repeater(Generel)
            {
                field(SalesRep; Rec."No.")  //Var MedNr - 030121
                {
                    ApplicationArea = All;
                    Caption = 'Medarb. Nummer';

                }

                field("FirstName"; Rec."First Name")
                {
                    ApplicationArea = All;
                    Caption = 'Fornavn';

                }
                field("MiddleName"; Rec."Middle Name")
                {
                    ApplicationArea = All;
                    Caption = 'MellemNavn';

                }
                field("LastName"; Rec."Last Name")
                {
                    ApplicationArea = All;
                    Caption = 'Efternavn';

                }
                field("EMail"; Rec."E-Mail")
                {
                    ApplicationArea = All;
                    Caption = 'EMail';

                }
                field("MobilePhone"; Rec."Mobile Phone No.")
                {
                    ApplicationArea = All;
                    Caption = 'MobilTelefon';

                }
                field("PhoneNo"; Rec."Phone No.")
                {
                    ApplicationArea = All;
                    Caption = 'Telefon';

                }
            }
        }
    }
}