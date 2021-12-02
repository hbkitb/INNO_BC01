query 50102 "Items ERPG"
{
    QueryType = Normal;
    Caption = 'Items';
    ReadState = ReadUncommitted;

    elements
    {

        dataitem(Item; Item)
        {

            column(No_; "No.")
            {

            }

            column(Description; Description)
            {

            }
            column(Unit_Cost; "Unit Cost") { }



        }
    }

    var

    trigger OnBeforeOpen()
    begin

    end;
}