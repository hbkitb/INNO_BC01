query 50101 "Value Entry ERPG"
{
    QueryType = Normal;
    Caption = 'Value Entry';
    ReadState = ReadUncommitted;

    elements
    {


        dataitem(ValueEntry; "Value Entry")
        {
            column(Posting_Date; "Posting Date") { }
            column(Invoiced_Quantity; "Invoiced Quantity")
            {
                ReverseSign = true;

            }
            column(Item_No_; "Item No.") { }

            column(Cost_per_Unit; "Cost per Unit") { }
            column(Discount_Amount; "Discount Amount"){}
            column(Purchase_Amount__Actual_; "Purchase Amount (Actual)") { }
            column(Entry_No_; "Entry No.") { }
            column(Salespers__Purch__Code; "Salespers./Purch. Code") { }
            column(Sales_Amount__Actual_; "Sales Amount (Actual)") { }
       
            filter(Salespers; "Salespers./Purch. Code")
            {
                Caption = 'Sælger';
            }


        }


    }

    var

    trigger OnBeforeOpen()
    begin

    end;
}