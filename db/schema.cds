namespace sap.cap.productshop;
using { cuid, managed, temporal } from '@sap/cds/common';

aspect carbonemission {
    emission: Integer;
    rating: String
}

type pricecost {
    price : Integer;
    stock : Integer;
}

entity Product : cuid,carbonemission, managed{
        name     : String;
        category : String;
        cost     : pricecost;
}

entity Supplier {
    key ID    : String;
        name  : String(100);
        city  : String(100);
        phone : String(100);
}
