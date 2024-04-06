let tip;
let bill;
let total;

function totalBill(bill)
{
    tip = (bill >= 50 && bill <= 300) ? (bill * 0.15) : (bill * 0.20);
    total = bill + tip
    console.log("The bill was ",bill,", the tip was ",tip,", and the total value ",total)
}

totalBill(275)
totalBill(40)
totalBill(430)


