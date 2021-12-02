tableextension 50102 "Employee Inno ERPG" extends Employee
{
    fields
    {
        field(50100; InnoPassword; text[30])
        {
            Caption = 'InnoTec Password';
            DataClassification = ToBeClassified;

        }
        field(50101; LablePrinter; Integer)
        {
            Caption = 'Lable Printer';

            TableRelation = "Con Label Printer ERPG".PrinterID;


        }
        field(50102; Land_; text[2])
        {
            Caption = 'Int. landekode';
            DataClassification = ToBeClassified;

        }

    }

    var

}