using { sap.cap.productshop as my } from '../db/schema';

service productshop
{
   // @odata.draft.enabled
    entity Product as
        projection on my.Product
        actions
        {
            action orderProduct
            (
                @title : 'Stock'
                stock : Integer
            );

            action fingerprint
            (
                username : String
            );

            action createPO
            (
                name : String
            );
        };

    entity Supplier as
        projection on my.Supplier;

    function MyFunction
    (
        name : String
    )
    returns String;

    action MyAction
    (
        name : String
    )
    returns String;
}

//annotate productshop with @(requires: 'productmanager');
