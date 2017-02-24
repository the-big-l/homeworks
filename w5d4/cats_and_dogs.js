function Cat () {
  this.name = 'Markov';
  this.age = 3;
}

function Dog () {
  this.name = 'Noodles';
  this.age = 4;
}

Dog.prototype.chase = function (cat) {
  console.log(`My name is ${this.name} and I'm chasing ${cat.name}! Woof!`);
};

const Markov = new Cat ();
const Noodles = new Dog ();

Noodles.chase(Markov);

Dog.prototype.chase.apply(Markov, [Noodles]);

Dog.prototype.chase.call(Markov, Noodles);

// Let's test out various ways to call Dog.prototype.chase.
//
// Start by calling chase method-style on Noodles, passing in Markov
// (don't worry - Markov escapes, it's all in fun). Note that when we
// call chase method-style, this is automatically set to Noodles.
//
// Now, let's make things a little bit crazier and use call and apply.
//
// We can use call and apply to change the identity of this. Test out
// Noodles.chase.call(Markov, Noodles). Noodles.chase just returns to us
// a regular function, and when we use call with Markov as our first
// argument, this is set to Markov! Whoa, cats chasing dogs! Apply is
// similar, but we need to pass it an array of arguments. Try using
// apply to change the context of Noodles.chase to Markov.
//
// After you finish the homework, or if you get stuck on one of the
// problems, you can view the solutions here.
