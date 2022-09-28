//Module 1
//Topic: Functional programming fundamentals

//Base

// This is the data store
type UserMap = {[userId: number]: User}
// This is the functional layer
type convertUserMapToArray: (userMap: UserMap) => User[];
// This is the presentation layer.
type Component = ({ users: User[] }) => JSX.Element

//Mutation
// Mutates the given array
function pop(arr) {
  return arr.splice(0, 1);
}

const arr = [1,2,3,4];
pop(arr);
console.log(arr); // [2, 3, 4]; 


//declarative code example

function getFileMapById(files) {
  return lodash.keyBy(files, 'id');
}

//Functional concepts

//Separation(Do one thing at a time, and do it well) 
//Composition(Write functions whose outputs will naturally work as inputs to many other functions)

function sortFilesByName(files) {
  return lodash.sortBy(files, 'name');
}

function getPdfFiles(files) {
  return lodash.filter(files, {extension: PDF});
}

function getFileNames(files) {
  return lodash.map(files, 'name');
}


//Combine Separation and composition
const getSortedPDFFileNames = lodash.flow(
  getPdfFiles,
  getFileNames,
  lodash.sortBy
);

// Alternative
const getSortedPdfFileNames = (files) => (
  lodash.sortBy(
    getFileNames(
      getPdfFiles(files)
    )
  )
);

//More concepts
//Inmutability(Mutation hides change)

//Memoization(storing the results of expensive function calls and returning the cached result when the same inputs occur again)

function killSibling(wizard) {
  return {
    ...wizard,
    numSiblings: wizard.numSiblings - 1,
  };
}
const killSiblingMemoized = lodash.memoize(killSibling);
const ron = { name: "Ron Weasley", siblings: 6 };
const ronAfterFredDies = killSiblingMemoized(ron);
ron === ronAfterFredDies // false, he's a different person now.

const ronAfterFredDiesAgain = killSiblingMemoized(ron);
ronAfterFredDies === ronAfterFredDiesAgain // true

//Higher Order Functions
// *takes one or more functions as arguments(i.e.,procedural parameters),
// *returns a function as its result.

const killSiblingMemoized = lodash.memoize(killSibling);

const getSortedPDFFileNames = lodash.flow(
  getPdfFiles,
  getFileNames,
  lodash.sortBy
);

//Currying(A function that takes multiple arguments (or a tuple of arguments)
function sum(a, b, c) {
  return a + b + c;
}
const curriedSum = lodash.curry(sum);

curriedSum(1,2,3) // 6

const addFive = curriedSum(2,3);
addFive(7) // 12
addFive(8) // 13

const addOne = curriedSum(1)
addOne(2,3) // 6
const addThree = addOne(2);
addThree(3) // 6;
addThree(4) // 7;


//Partial Application(refers to the process of fixing a number of arguments to a function, producing another function of smaller arity)
// Note arity: number of arguments a function takes

function learnSpell(spell, wizard) {
  return {
    ...wizard,
    spells: [
      ...wizard.spells,
      spell
    ],
  };
}

const learnExpelliarmus = lodash.partial(learnSpell, "Expelliarmus");
const learnExpectoPatronum = lodash.partial(learnSpell, "Expecto Patronum!");

let harry = {name: "Harry Potter", spells: []};
harry = learnExpelliarmus(harry);
// {name: "Harry Potter", spells: ["Expelliarmus"]}
harry = learnExpectoPatronum(harry);
// {name: "Harry Potter", spells: ["Expelliarmus", "Expecto Patronum"]}


