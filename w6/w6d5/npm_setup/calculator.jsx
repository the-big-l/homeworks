import React from 'react';

class Calculator extends React.Component {
  constructor() {
    super();
    this.state = { num1: "", num2: "", result: 0 };
    this.setNum1 = this.setNum1.bind(this);
    this.setNum2 = this.setNum2.bind(this);
    this.sum = this.sum.bind(this);
    this.diff = this.diff.bind(this);
    this.product = this.product.bind(this);
    this.quotient = this.quotient.bind(this);
  }

  setNum1(e) {
    const num1 = e.target.value ? parseInt(e.target.value) : "";
    this.setState({ num1 });
  }

  setNum2(e) {
    const num2 = e.target.value ? parseInt(e.target.value) : "";
    this.setState({ num2 });
  }

  sum(e) {
    e.preventDefault();
    const result = this.state.num1 + this.state.num2;
    this.setState({ result });
  }

  diff(e) {
    e.preventDefault();
    const result = this.state.num1 - this.state.num2;
    this.setState({ result });
  }

  product(e) {
    e.preventDefault();
    const result = this.state.num1 * this.state.num2;
    this.setState({ result });
  }

  quotient(e) {
    e.preventDefault();
    const result = this.state.num1 / this.state.num2;
    this.setState({ result });
  }

  render() {
    const {num1, num2, result} = this.state
    return (
      <div>
        <input type="text" value={num1} onChange={this.setNum1} />
        <ul>
          <li><button onClick={this.sum}>+</button></li>
          <li><button onClick={this.diff}>-</button></li>
          <li><button onClick={this.product}>*</button></li>
          <li><button onClick={this.quotient}>/</button></li>
        </ul>
        <input type="text" value={num2} onChange={this.setNum2} />
        <p>---------------------------</p>
        <h1>{result}</h1>
      </div>
    );
  }
}

export default Calculator;
