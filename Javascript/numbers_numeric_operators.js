"use strict";

var pi = 3.1412;
console.log("the value of pi " + pi);

var numOfEpisodes = 22;
var costOfMilkshakes = 12.6;
var distanceToTheMoon = 384400;
var distanceToTheSun = 149_600_000;
var massOfSun = 1.989e30;
var tax = 0.8;
var discount = 0.5;
var quantity = 3;
var perSeason = 22 / 2;

console.log(typeof massOfSun);
console.log(typeof costOfMilkshakes);

var total = (costOfMilkshakes + tax - discount) * quantity;
console.log("Total Payable: $" + total);

console.log("Episodes per season: " + perSeason);

console.log(2 ** 6 + " bits");
console.log((20 % 6) + " = 20 modulus 6");

var costOfItem = 2000;
var discount = 250;
var totalCost = costOfItem - discount;
console.log("Total Cost: ", totalCost);
console.log(+false);

console.log(Number.MAX_SAFE_INTEGER);
console.log(Number.MIN_SAFE_INTEGER);

var bigIntNum = BigInt(Number.MAX_SAFE_INTEGER);
console.log(bigIntNum + 5n);

var veryLargeNum = 543_123_234_345_543_756_976n;
console.log(veryLargeNum + 1n);

var septillion = 1_000_000_000_000_000_000_000_000n;
var plusOne = septillion + 1n;
console.log("Septillion plus one is equal to", plusOne);
