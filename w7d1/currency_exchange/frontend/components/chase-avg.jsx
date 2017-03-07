import React from 'react';

const ChaseAvg = ({rates, length}) => {
  // const defaultAvg = {rates: {none: 0}, length: 0};
  // const {rates, length} = Object.assign(defaultAvg, props);

  let chaseAvgNumber = 0;
  for (let n in rates) {
    chaseAvgNumber += rates[n];
  }

  return (
  <div>Chase's Average: {chaseAvgNumber / length}</div>
  );
}

export default ChaseAvg;
