page 50112 Api_eSalesHeader
{
    PageType = API;  //
    Caption = 'api_eSalesHeader';
    APIPublisher = 'ITB';
    APIGroup = 'ITBGroup';
    APIVersion = 'v1.0';
    EntityName = 'eSalesHeader';
    EntitySetName = 'innoESalesHeader';
    SourceTable = eSalesTable_I;
    DelayedInsert = true;
    ODataKeyFields = SystemId;
    //Editable = false;
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
                field(ESalesNumber; Rec.eSalesNumber)
                {
                    ApplicationArea = All;
                    Caption = 'eSalesNumber';

                }

                field(Account; Rec.CustAccount)
                {
                    ApplicationArea = All;
                    Caption = 'DebitorNummer/Konto';

                }

                field(Name; Rec.Name1)
                {
                    ApplicationArea = All;
                    Caption = 'Debitornavn';

                }

                field(CreateDate; Rec.CreateDate)
                {
                    ApplicationArea = All;
                    Caption = 'Oprettet dato';

                }

                field(Address1; Rec.Address11)
                {
                    ApplicationArea = All;
                    Caption = 'Adresse1';

                }

                field(Address2; Rec.Address21)
                {
                    ApplicationArea = All;
                    Caption = 'Adresse2';

                }

                field(City; Rec.City1)
                {
                    ApplicationArea = All;
                    Caption = 'By / Adresse3';

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
                /*
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

                               field(CvrNo; Rec.CVRNo)
                               {
                                   ApplicationArea = All;
                                   Caption = 'Debitor CVRNo';

                               }
                               */

                field(PaymentId; Rec.PaymentId)
                {
                    ApplicationArea = All;
                    Caption = 'BetalingsId';

                }

                /*
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
                                */

                field(Phone; Rec.phone)
                {
                    ApplicationArea = All;
                    Caption = 'Telefon';

                }

                field(EMail; Rec.eMail1)
                {
                    ApplicationArea = All;
                    Caption = 'eMail';

                }
                field(SalesRep; Rec.SalesRep)
                {
                    ApplicationArea = All;
                    Caption = 'Sælger';
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
                field(VatNumber; Rec.CVRNo)
                {
                    ApplicationArea = All;
                    Caption = 'CVR';

                }

            }
        }
    }
}