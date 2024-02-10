var user = "John Mockery";
var designation = "Designer";
var organization = "LENOVO";
var city = "New york";
var country = "Canada";
var here = city + ", " + country;
var favQuote = "To 'single-quote' or \"double quote\"";
console.log(here);
console.log(favQuote);
//escape characters
console.log(employeeData);
var employeeData =
  "Name: " +
  user +
  "\nDesignation: " +
  designation +
  "\nOrganization: " +
  user +
  "Location: " +
  here;
// template literal
var data = `Name: ${user}
Designation: ${designation}
Organization: ${organization}
Location: ${here}`;
console.log(data);

var myQuote = "Best friends are like a mirror";
var author = "Joe Mockery";
var fullQuote = myQuote + " -- " + author;
var lengthOfString = fullQuote.length;
console.log(fullQuote);
console.log("Length of the Quote: ", lengthOfString);
