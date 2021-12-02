pageextension 50114 "Email OutBox ITB" extends "Email Outbox"
{
    layout
    {
        addbefore("Date Queued")
        {
            field(SystemCreatedAt; rec.SystemCreatedAt)
            {
                ApplicationArea = all;
                Caption = 'Oprettet';
            }
        }
    }

    actions
    {

    }

    var

}