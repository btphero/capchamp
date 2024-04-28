namespace sap.cap.productshop;

aspect carbonemission {
    emission: Integer;
    rating: String
}

type pricecost {
    price : Integer;
    stock : Integer;
}

entity Product : carbonemission{
    key ID       : Integer;
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
