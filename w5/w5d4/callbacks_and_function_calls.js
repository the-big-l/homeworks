// setTimeout(() => console.log("HAMMERTIME"), 5000);

// function hammerTime(time) {
//   setTimeout(function() {
//     alert(`${time} is hammertime!`);
//   }, 5000);
// }

const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

reader.question('Would you like some tea? > ', (res1) => {
  console.log(`You replied ${res1}.`);

  reader.question('Would you like some buiscits? > ', (res2) => {
    console.log(`You replied ${res2}.`);

    const first = (res1 === 'yes')
      ? 'do'
      : 'don\'t';
    const second = (res2 === 'yes')
      ? 'do'
      : 'don\'t';

    console.log(`Finally, so you ${first} want tea and you ${second} want buiscuits.`);
    reader.close();
  });
  setTimeout(() => console.log('\nI\'m waiting on your answer about buisicts...'), 5000);

});
setTimeout(() => console.log('\nI\'m waiting on your answer for tea...'), 5000);
