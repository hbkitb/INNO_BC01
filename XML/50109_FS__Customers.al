xmlport 50109 "__Customers ERPG"
{
    Caption = 'FS __Customers';
    Description = 'Fredes system _Customers.txt';
    FieldSeparator = '|';
    Format = VariableText;
    FieldDelimiter = '';
    FileName = '_Customers.txt';
    Direction = Export;

    TextEncoding = UTF8;
    schema
    {
        textelement(NodeName1)
        {
            MinOccurs = Once;
            textattribute(DateTime1)
            {
                Occurrence = Required;

            }


        }

    }


    trigger OnInitXmlPort()
    var

    begin
        DateTime1 := DateFormat();
    end;

    local procedure DateFormat(): Text
    var
        textdate: Text;
        d: Date;
        dt: DateTime;
    begin
        dt := CurrentDateTime;
        textdate := Format(dt, 0, '<Year4>-<Month,2>-<Day,2> <Hours24>:<Minutes,2>:<Seconds,2>');
        exit(textdate);
    end;

}