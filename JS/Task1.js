// Object for Mark
console.log("Hello");

const mark = {
    fullName: "Mark",
    mass: 78, // in kg
    height: 1.69, // in meters
    calculateBMI: function() {
      return this.mass / (this.height * this.height);
    }
  };
  
  // Object for John
  const john = {
    fullName: "John",
    mass: 92, // in kg
    height: 1.95, // in meters
    calculateBMI: function() {
      return this.mass / (this.height * this.height);
    }
  };
  
  // Calculate BMI for Mark and John
  const markBMI = mark.calculateBMI();
  const johnBMI = john.calculateBMI();
  
  
  console.log("Mark's BMI:", markBMI);
  console.log("John's BMI:", johnBMI);
  
  