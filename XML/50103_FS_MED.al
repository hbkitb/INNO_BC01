xmlport 50103 "FS MED ERPG"
{
    Caption = 'FS MED';
    Description = 'Fredes system MED.txt';
    FieldSeparator = '|';
    Format = VariableText;
    FieldDelimiter = '';
    FileName = 'MED.txt';
    Direction = Export;
    TextEncoding = UTF8;
    UseRequestPage = false;
    schema
    {
        textelement(NodeName1)
        {
            tableelement(Emp; Employee)
            {
                fieldattribute(EmpNp; Emp."No.")
                {
                    AutoCalcField = true;
                }
                textattribute(fullname)
                {

                }
                fieldattribute(EmpEmail; Emp."E-Mail")
                {
                    AutoCalcField = true;

                }
                fieldattribute(Empco; Emp."Country/Region Code")
                {
                    AutoCalcField = true;

                }
                fieldattribute(Empco; Emp.InnoPassword)
                {
                    AutoCalcField = true;


                }
                trigger OnAfterGetRecord()
                var

                begin
                    fullname := Emp.FullName();
                end;
            }


        }

    }



}