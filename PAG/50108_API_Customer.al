page 50108 Api_Customer
{
    PageType = API;  //
    Caption = 'api_Customer';
    APIPublisher = 'ITB';
    APIGroup = 'ITBGroup';
    APIVersion = 'v1.0';
    EntityName = 'Customer';
    EntitySetName = 'innoCust';
    SourceTable = Customer;
    DelayedInsert = true;
    ODataKeyFields = SystemId;
    Editable = false;
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
                field("Account"; Rec."No.")
                {
                    ApplicationArea = All;
                    Caption = 'Debitor KontoNummer';

                }

                field("Name"; Rec.Name)
                {
                    ApplicationArea = All;
                    Caption = 'Debitornavn';

                }

                field("Address1"; Rec.Address)
                {
                    ApplicationArea = All;
                    Caption = 'Adresse1';

                }

                field("Address2"; Rec."Address 2")
                {
                    ApplicationArea = All;
                    Caption = 'Adresse2';

                }

                field("ZipCode"; Rec."Post Code")
                {
                    ApplicationArea = All;
                    Caption = 'Postnummer';

                }

                field(City; Rec.City)
                {
                    ApplicationArea = All;
                    Caption = 'By';

                }

                field(Attention; Rec.Contact)
                {
                    ApplicationArea = All;
                    Caption = 'Attention';

                }

                field("EMail"; Rec."E-Mail")
                {
                    ApplicationArea = All;
                    Caption = 'email';

                }

                field("Phone"; Rec."Phone No.")
                {
                    ApplicationArea = All;
                    Caption = 'Telefon';

                }

                field("Fax"; Rec."Fax No.")
                {
                    ApplicationArea = All;
                    Caption = 'Fax/mobil';

                }

                field("SalesRep"; Rec."Salesperson Code")
                {
                    ApplicationArea = All;
                    Caption = 'Sælgerkode';

                }
                field(CompanyId; Rec.CompanyId)
                {
                    ApplicationArea = All;
                    Caption = 'CompanyId';

                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = All;
                    Caption = 'Blocked';

                }
                field("VatNumber"; Rec."VAT Registration No.")
                {
                    ApplicationArea = All;
                    Caption = 'CVR';

                }
                field("Mobile"; Rec."Mobile Phone No.")
                {
                    ApplicationArea = All;
                    Caption = 'Mobilnr';

                }
                field(LastDateModified; Rec."Last Date Modified")
                {
                    ApplicationArea = All;
                    Caption = 'Last Date Modified';

                }
                field(Country; "Country/Region Code")
                {
                    ApplicationArea = All;
                    Caption = 'Country';

                }
            }
        }
    }
}