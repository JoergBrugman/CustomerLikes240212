codeunit 50200 "BSCL Subsriber Store"
{
    [EventSubscriber(ObjectType::Table, Database::"BSB Book", OnBeforeOnDelete, '', false, false)]
    local procedure OnBeforeOnDelete(var Rec: Record "BSB Book"; var xRec: Record "BSB Book"; var IsHandled: Boolean);
    var
        Customer: Record Customer;
        OnBeforeOnDeleteBSBBookErr: Label 'You are not allowed to delete %1 %2 because it''s liked by one or mor customer(s)';
    begin
        if IsHandled then
            exit;

        Customer.SetCurrentKey("BSB Favorite Book No.");
        Customer.SetRange("BSB Favorite Book No.", Rec."No.");
        if not Customer.IsEmpty then
            Error(OnBeforeOnDeleteBSBBookErr, Rec.TableCaption, Rec."No.");
        IsHandled := true;
    end;

}