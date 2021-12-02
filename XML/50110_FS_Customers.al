xmlport 50110 "FS _Customers ERPG"
{
    Caption = 'FS _Customers';
    Description = 'Fredes system __Customers.txt';
    FieldSeparator = '|';
    Format = VariableText;
    FieldDelimiter = '';
    FileName = '__Customers.txt';
    Direction = Export;
    UseRequestPage = false;
    TextEncoding = UTF8;

    schema
    {
        textelement(NodeName1)
        {
            tableelement(Cust; Customer)
            {

                fieldattribute(Custno; Cust."No.")
                {

                }
                fieldattribute(CustName; Cust.Name)
                {

                }
                fieldattribute(CustAdress; Cust.Address)
                {

                }
                fieldattribute(CustAddress2; Cust."Address 2")
                {

                }
                fieldattribute(CustPostCode; Cust."Post Code")
                {

                }
                fieldattribute(CustCountry; Cust."Country/Region Code")
                {

                }
                fieldattribute(CustSalesperson; Cust."Salesperson Code")
                {

                }
                fieldattribute(CustPhone; Cust."Phone No.")
                {

                }
                fieldattribute(CustVATNo; Cust."VAT Registration No.")
                {

                }
                fieldattribute(CustVATNo; Cust."E-Mail")
                {

                }
                fieldattribute(CustVATNo; Cust.Contact)
                {

                }
                fieldattribute(CustVATNo; Cust."Bill-to Customer No.")
                {

                }

            }
        }
    }



}