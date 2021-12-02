xmlport 50100 "FS Varer ERPG"
{
    Caption = 'FS VARER';
    Description = 'Fredes system VARER.txt';
    FieldSeparator = '|';
    Format = VariableText;
    FieldDelimiter = '';
    FileName = 'VARER.txt';
    Direction = Export;
    TextEncoding = UTF8;
    UseRequestPage = false;
    schema
    {
        textelement(NodeName1)
        {
            tableelement(NodeName2; Item)
            {
                fieldattribute(ItemNo; NodeName2."No.")
                {

                }
                fieldattribute(ItemDesc; NodeName2.Description)
                {

                }
                fieldattribute(ItemInPoGr; NodeName2."Inventory Posting Group")
                {

                }
            }
        }
    }


    var
}