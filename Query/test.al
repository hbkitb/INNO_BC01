query 50100 "Sales stat ERPG"
{
    QueryType = Normal;
    Caption = 'Salg stat';
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
            dataitem(ValueEntry; "Value Entry")
            {
                DataItemLink = "Item No." = item."No.";
                DataItemTableFilter = "Item Ledger Entry Type" = CONST (Sale);

                column(Posting_Date; "Posting Date") { }
                column(Invoiced_Quantity; "Invoiced Quantity")
                {
                    ReverseSign = true;

                }
                column(Cost_per_Unit; "Cost per Unit") { }
                column(Discount_Amount; "Discount Amount")
                {

                }
                column(Purchase_Amount__Actual_; "Purchase Amount (Actual)") { }
                column(Entry_No_; "Entry No.") { }
                column(Salespers__Purch__Code; "Salespers./Purch. Code") { }
                column(Sales_Amount__Actual_; "Sales Amount (Actual)") { }

                filter(Salespers; "Salespers./Purch. Code")
                {
                    Caption = 'Sælger';
                }


            }

            filter(VareNo; "No.")
            {
                Caption = 'Vare Nr.';

            }
        }
    }

    var

    trigger OnBeforeOpen()
    begin

    end;
}