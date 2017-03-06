const initialState = {
  baseCurrency: "Please select",
  rates: {none: 0}
};

const reducer = (state = initialState, action) => {
  switch(action.type) {
    case 'SWITCH_CURRENCY':
      return {
        baseCurrency: action.baseCurrency,
        rates: action.rates
      };
    default:
      return state;
  }
};

export default reducer;
