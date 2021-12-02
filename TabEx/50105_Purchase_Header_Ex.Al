tableextension 50105 "Purchase_Header Inno ERPG" extends "Purchase Header"
{
    fields
    {
        field(50100; FeeEmb; Decimal)
        {
            Caption = 'EmbAfgift';

        }

        field(50101; FeeOil; Decimal)
        {
            Caption = 'OlieAfgift';

        }

        field(50102; FeeCO2; Decimal)
        {
            Caption = 'CO2-Afgift';

        }

        field(50103; FeeDiv; Decimal)
        {
            Caption = 'Div_Afgift';

        }
    }

    var

}