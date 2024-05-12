const cds = require('@sap/cds');
const res = require('express/lib/response');

module.exports = cds.service.impl(async function(srv) {

    const { Product } = srv.entities;
    let originalstock;
    let ID;

    srv.on('MyFunction', async(req) => {
        let result = `Super Cool ${req.data.name}`
        return result
    })

    srv.on('MyAction', async(req) => {
        let result = `Super Cool ${req.data.name}`
        return result
    })


    srv.before('orderProduct', async(req) => {
        console.log(req.data);
        console.log(req.params);
        ID = req.params[0];
       
        const result =  await SELECT `stock` .from(Product).where({ID:req.params[0]})

        originalstock = result[0].stock

        console.log("<<original stockt ",originalstock)
        if (originalstock > 500 ) {
            return req.error({
                code: '400',
                message: `Stock should not be greater than 500`
            })
        }

    })

    srv.on('orderProduct', async(req) => {
       let updatestock = req.data.stock + originalstock
       console.log("<<updated stock ",updatestock)

       const result = await UPDATE(Product).with({stock:updatestock}).where({ID:ID})

       console.log("<<updated query result ",result)

       return req.notify(`Order Placed! Updated stock is now ${updatestock}`)



    })











})