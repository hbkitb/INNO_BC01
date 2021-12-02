xmlport 50107 "_DEBX ERPG"
{
    Caption = 'FS _DEB';
    Description = 'Fredes system _DEBX.txt';
    FieldSeparator = '|';
    Format = VariableText;
    FieldDelimiter = '';
    FileName = '_DEBX.txt';
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