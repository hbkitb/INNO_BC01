xmlport 50120 "Consignor export ERPG"
{
    Caption = 'Consingnor Export';
    Description = 'Consingnor Export';
    FieldSeparator = ';';
    Format = VariableText;
    FieldDelimiter = '';
    //FileName = 'VARER.txt';
    Direction = Export;
    TextEncoding = UTF8;
    UseRequestPage = false;

    schema
    {

        textelement(NodeName1)
        {

            tableelement(Header; "Sales Header")
            //tableelement(Header; sa)
            {

                fieldattribute(OrderNo; Header."No.")
                {

                }
                fieldattribute(Name; Header."Ship-to Name")
                {

                }
                fieldattribute(Address; Header."Ship-to Address")
                {

                }
                fieldattribute(Address2; Header."Ship-to Address 2")
                {

                }
                textattribute(empty)
                {
                    Occurrence = Required;
                }

                fieldattribute(PostCod; Header."Ship-to Post Code")
                {

                }
                fieldattribute(PostCod; Header."Ship-to City")
                {

                }

                textattribute(Region)
                {

                }
                fieldattribute(CustomerNo; Header."Sell-to Customer No.")
                {

                }
                fieldattribute(Contact; Header."Sell-to Contact")
                {

                }
                fieldattribute(Contact; Header."OIOUBL-Sell-to Contact Phone No.")
                {

                }
                fieldattribute(Contact1; Header."Sell-to Contact")
                {

                }
                textattribute(Contype) { }
                textattribute(Region1)
                {

                }
                textattribute(Kolli) { }
                textattribute(Weight) { }
                textattribute(User) { }
                textattribute(Identifikation) { }

                trigger OnAfterGetRecord()
                var
                    cust: Record Customer;
                    comp: Record "Company Information";
                begin
                    comp.Get();

                    //>> NO
                    if comp."Country/Region Code" = 'NO' then begin
                        Identifikation := '0';
                        Region := 'NO';
                        Region1 := 'N';
                        Contype := '36';

                    end;
                    //<<NO
                    //>>SE
                    if comp."Country/Region Code" = 'SE' then begin
                        Identifikation := '';
                        Region := 'SE';
                        Region1 := 'S';
                        Contype := '32';

                    end;
                    //<<SE 

                    //>> Customer Posting Group = 11////

                    // >> DK
                    if comp."Country/Region Code" = 'DK' then begin
                        Identifikation := '';
                        Contype := '34';
                        Region := 'DK';
                        Region1 := 'DK';

                        if Header."Customer Posting Group" = '11' then begin
                            Contype := '32';
                            Identifikation := '86286336';
                            Region := 'SE';
                            Region1 := 'S';
                        end;
                    end;
                    //<< DK

                    emp.SetRange("No.", Header."Salesperson Code");
                    if emp.FindFirst() then begin

                        if emp.LablePrinter <> 0 then begin
                            lp.SetRange(PrinterID, emp.LablePrinter);
                            User := lp.Printer;
                        end
                        else begin
                            lp.SetRange(IsDefault, true);
                            if lp.FindFirst() then
                                User := lp.Printer;
                        end;


                    end;
                    now := CurrentDateTime;
                    nowTxt := Format(now, 0, '<Day,2>-<Month,2>-<Year>-<Hours24>-<Minutes,2>-<Seconds,2>-<Second dec>');
                    nowTxt := nowTxt.Replace(',', '');
                    currXMLport.Filename := Header."No." + '_CSImp_' + nowTxt + '.ASC';
                    //currXMLport.Filename := Header."Sell-to Customer No." + '_CSImp_' + nowTxt + '.ASC';
                    //currXMLport.Filename := '123' + '_CSImp_' + nowTxt + '.ASC';


                end;

            }
        }
    }




    var
        emp: Record Employee;
        lp: Record "Con Label Printer ERPG";
        now: DateTime;
        nowTxt: Text;
        OUS: OutStream;
        INS: InStream;
        temp: Codeunit "Temp Blob";
        t: Text;
        tt: Text;
        sa: Record "Sales Header";  //hbk - 310720

    procedure ConVar(KolliVar: Integer; HeaderVar: Record "Sales Header"; WeightVar: Decimal)
    var
    begin
        Kolli := Format(KolliVar);
        Weight := Format(WeightVar);
    end;

    //hbk - 310720
    procedure SetParameters(rec: Record "Sales Header")
    var

    begin

        sa := rec;


    end;

    trigger OnInitXmlPort()
    var
    begin
        //Header.SetRange("No.", Sa."No.");
    end;
    //310720

    trigger OnPostXmlPort()
    var
        Salseorder: Record "Sales Header";
        dt: Date;
    begin
        Salseorder.SetRange("No.", Header."No.");
        if Salseorder.FindFirst() then begin

            Salseorder.Consignor := DT2Date(CurrentDateTime);
            Salseorder.Modify();
        end;

    end;
}