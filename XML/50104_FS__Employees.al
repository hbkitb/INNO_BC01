xmlport 50104 "FS __Employees ERPG"
{
    Caption = 'FS __Employees';
    Description = 'Fredes system __Employees.txt';
    FieldSeparator = '|';
    Format = VariableText;
    FieldDelimiter = '';
    FileName = '__Employees.txt';
    Direction = Export;
    TextEncoding = UTF8;
    schema
    {
        textelement(NodeName1)
        {
            tableelement(Emp; Employee)
            {
                fieldattribute(EmpNp; Emp."No.")
                {

                }
                textattribute(fullname)
                {

                }
                fieldattribute(EmpEmail; Emp."E-Mail")
                {

                }
                fieldattribute(Empco; Emp."Country/Region Code")
                {

                }
                fieldattribute(Empco; Emp.InnoPassword)
                {

                }
                trigger OnAfterGetRecord()
                var

                begin
                    fullname := Emp.FullName();
                end;
            }

        }

    }

    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {

                }
            }
        }



    }


}