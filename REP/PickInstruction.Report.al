report 50101 "Pick Instruction innotec ERPG"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'REP\PickInstruction.rdlc';
    Caption = 'Pluk instruktion';
    WordLayout = 'REP\PickInstruction.docx';
    dataset
    {
        dataitem(CopyLoop; Integer)
        {
            DataItemTableView = SORTING (Number);
            column(Number; Number)
            {
            }
            column(CompanyNameText; CompNameText)
            {
            }
            column(DateText; DateTxt)
            {
            }
            dataitem("Sales Header"; "Sales Header")
            {
                DataItemTableView = SORTING ("Document Type", "No.")
                                    WHERE ("Document Type" = CONST (Order));
                RequestFilterFields = "No.";
                column(No_SalesHeader; "No.")
                {
                    IncludeCaption = true;
                }
                column(CustomerNo_SalesHeader; "Sell-to Customer No.")
                {
                    IncludeCaption = true;
                }
                column(CustomerName_SalesHeader; "Sell-to Customer Name")
                {
                    IncludeCaption = true;
                }
                dataitem("Sales Line"; "Sales Line")
                {
                    DataItemLink = "Document Type" = FIELD ("Document Type"),
                                   "Document No." = FIELD ("No.");
                    //   DataItemTableView = SORTING ("Document Type", "Document No.", "Line No.",ShelfNo)
                    DataItemTableView = SORTING ("Document Type", "Document No.", "no.")
                                        WHERE (Type = CONST (Item));


                    column(LineNo_SalesLine; "Line No.")
                    {
                    }
                    column(ItemNo_SalesLine; "No.")
                    {
                        IncludeCaption = true;
                    }
                    column(Description_SalesLine; Description)
                    {
                        IncludeCaption = true;
                    }
                    column(VariantCode_SalesLine; "Variant Code")
                    {
                        IncludeCaption = true;
                    }
                    column(LocationCode_SalesLine; "Location Code")
                    {
                        IncludeCaption = true;
                    }
                    column(BinCode_SalesLine; "Bin Code")
                    {
                        IncludeCaption = true;
                    }

                    column(ShipmentDate_SalesLine; FORMAT("Shipment Date"))
                    {
                    }
                    column(Quantity_SalesLine; Quantity)
                    {
                        IncludeCaption = true;
                    }
                    column(UnitOfMeasure_SalesLine; "Unit of Measure")
                    {
                        IncludeCaption = true;
                    }
                    column(QuantityToShip_SalesLine; "Qty. to Ship")
                    {
                        IncludeCaption = true;
                    }
                    column(QuantityShipped_SalesLine; "Quantity Shipped")
                    {
                        IncludeCaption = true;
                    }
                    column(QtyToAsm; QtyToAsm)
                    {
                    }
                    column(ShelfNo; ShelfNo)
                    {

                    }

                    dataitem("Assembly Line"; "Assembly Line")
                    {
                        DataItemTableView = SORTING ("Document Type", "Document No.", "Line No.");
                        column(No_AssemblyLine; "No.")
                        {
                            IncludeCaption = true;
                        }
                        column(Description_AssemblyLine; Description)
                        {
                            IncludeCaption = true;
                        }
                        column(VariantCode_AssemblyLine; "Variant Code")
                        {
                            IncludeCaption = true;
                        }
                        column(Quantity_AssemblyLine; Quantity)
                        {
                            IncludeCaption = true;
                        }
                        column(QuantityPer_AssemblyLine; "Quantity per")
                        {
                            IncludeCaption = true;
                        }
                        column(UnitOfMeasure_AssemblyLine; GetUOM("Unit of Measure Code"))
                        {
                        }
                        column(LocationCode_AssemblyLine; "Location Code")
                        {
                            IncludeCaption = true;
                        }
                        column(BinCode_AssemblyLine; "Bin Code")
                        {
                            IncludeCaption = true;
                        }
                        column(QuantityToConsume_AssemblyLine; "Quantity to Consume")
                        {
                            IncludeCaption = true;
                        }

                        trigger OnPreDataItem()
                        begin
                            IF NOT AsmExists THEN
                                CurrReport.BREAK;
                            SETRANGE("Document Type", AsmHeader."Document Type");
                            SETRANGE("Document No.", AsmHeader."No.");

                        end;
                    }
                    dataitem(Line; Integer)
                    {
                        DataItemTableView = SORTING (Number) ORDER(Ascending) WHERE (Number = FILTER (1 ..));

                        column(ItemNo; tempSalesLine."No.") { }
                        column(Description; tempSalesLine.Description) { }
                        column("ShelfNo_"; tempSalesLine.ShelfNo) { }
                        column("ShipmentDate"; tempSalesLine."Shipment Date") { }
                        column(Quantity; tempSalesLine.Quantity) { }
                        column(UOM; tempSalesLine."Unit of Measure") { }
                        column("Qty_to_Ship"; tempSalesLine."Qty. to Ship") { }

                        trigger OnAfterGetRecord()
                        var

                        begin
                            if Number = 1 then begin
                                if not tempSalesLine.FINDSET then
                                    CurrReport.BREAK
                            end else
                                if tempSalesLine.NEXT = 0 then
                                    CurrReport.BREAK;
                        end;
                    }
                    trigger OnPreDataItem()
                    var

                    begin




                    end;

                    trigger OnAfterGetRecord()
                    var
                        AssembleToOrderLink: Record "Assemble-to-Order Link";
                        item: Record Item;

                    begin

                        tempSalesLine.Init();
                        tempSalesLine.TransferFields("Sales Line");
                        tempSalesLine.Insert();
                        tempSalesLine.SetCurrentKey(ShelfNo, "No.");

                        /*                    AssembleToOrderLink.RESET;
                                            AssembleToOrderLink.SETCURRENTKEY(Type, "Document Type", "Document No.", "Document Line No.");
                                            AssembleToOrderLink.SETRANGE(Type, AssembleToOrderLink.Type::Sale);
                                            AssembleToOrderLink.SETRANGE("Document Type", "Document Type");
                                            AssembleToOrderLink.SETRANGE("Document No.", "Document No.");
                                            AssembleToOrderLink.SETRANGE("Document Line No.", "Line No.");
                                            AsmExists := AssembleToOrderLink.FINDFIRST;
                                            QtyToAsm := 0;
                                            IF AsmExists THEN
                                                IF AsmHeader.GET(AssembleToOrderLink."Assembly Document Type", AssembleToOrderLink."Assembly Document No.") THEN
                                                    QtyToAsm := AsmHeader."Quantity to Assemble"
                                                ELSE
                                                    AsmExists := FALSE;
                      */
                        Clear(item);

                        item.Get("Sales Line"."No.");
                        ShelfNo := item."Shelf No.";


                    end;

                    trigger OnPostDataItem()
                    var

                    begin

                    end;
                }
            }

            trigger OnPreDataItem()
            begin
                SETRANGE(Number, 1, NoOfCopies + 1);

            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field("No of Copies"; NoOfCopies)
                    {
                        ApplicationArea = Planning;
                        Caption = 'No of Copies';
                        ToolTip = 'Specifies how many copies of the document to print.';
                    }
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
        OrderPickingListCaption = 'Pick Instruction';
        PageCaption = 'Page';
        ItemNoCaption = 'Item  No.';
        OrderNoCaption = 'Order No.';
        CustomerNoCaption = 'Customer No.';
        CustomerNameCaption = 'Customer Name';
        QtyToAssembleCaption = 'Quantity to Assemble';
        QtyAssembledCaption = 'Quantity Assembled';
        ShipmentDateCaption = 'Shipment Date';
        QtyPickedCaption = 'Quantity Picked';
        UOMCaption = 'Unit of Measure';
        QtyConsumedCaption = 'Quantity Consumed';
        CopyCaption = 'Copy';
    }

    trigger OnPreReport()
    begin
        DateTxt := FORMAT(TODAY);
        CompNameText := COMPANYNAME;
    end;

    var
        AsmHeader: Record "Assembly Header";
        NoOfCopies: Integer;
        DateTxt: Text;
        CompNameText: Text;
        QtyToAsm: Decimal;
        AsmExists: Boolean;
        ShelfNo: Code[10];
        tempSalesLine: Record "Sales Line" temporary;
        LineNumber: Integer;

    local procedure GetUOM(UOMCode: Code[10]): Text
    var
        UnitOfMeasure: Record "Unit of Measure";
    begin
        IF UnitOfMeasure.GET(UOMCode) THEN
            EXIT(UnitOfMeasure.Description);
        EXIT(UOMCode);
    end;

    procedure InitializeRequest(NewNoOfCopies: Integer)
    begin
        NoOfCopies := NewNoOfCopies;
    end;
}

