xmlport 50101 "__Inventable ERPG"
{
    Caption = 'FS __Inventable';
    Description = 'Fredes system __Inventable.txt';
    FieldSeparator = '|';
    Format = VariableText;
    FieldDelimiter = '';
    FileName = '__Inventable.txt';
    Direction = Export;
    TextEncoding = UTF8;
    schema
    {
        textelement(NodeName1)
        {
            tableelement(Item; Item)
            {
                fieldattribute(ItemNo; Item."No.")
                {

                }
                fieldattribute(ItemDesc; Item.Description)
                {

                }
                fieldattribute(ItemDesc1; Item.ItemName1)
                {

                }
                fieldattribute(ItemDesc; Item.Short)
                {

                }
                fieldattribute(ItemInPoGr; Item."Inventory Posting Group")
                {

                }
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