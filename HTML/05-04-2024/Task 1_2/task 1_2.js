let mark_heigth;
let john_height;
let mark_mass;
let john_mass;
let markHigherBMI;

function BMICalculator(mark_mass,mark_heigth,john_mass,john_height)
{
    let john_bmi = (john_mass / (john_height ** 2))
    let mark_bmi = (mark_mass / (mark_heigth ** 2))

    markHigherBMI = mark_bmi > john_bmi ? true : false;

    if(markHigherBMI === true)
    {
        console.log("Mark's BMI (",mark_bmi,") is higher than John's (",john_bmi,")")
    }
    else
    {
        console.log("John's BMI (",john_bmi,") is higher than Marks(",mark_bmi,")")
    }
}

BMICalculator(78,1.69,92,1.95);
BMICalculator(95,1.88,85,1.76);