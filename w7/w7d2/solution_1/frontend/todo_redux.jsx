import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';

import Root from './components/root';


const addLoggingToDispatch = store => next => action => {
  const newDispatch = store.dispatch;
  console.log(store.getState());
  console.log(action);
  let returnValue = newDispatch(action);
  console.log(store.getState());
  return returnValue;
}

const applyMiddlwares = (store, ...middlewares) => {
  let dispatch = store.dispatch;

  middlewares.forEach(middleware => {
    dispatch = middleware(store)(dispatch);
  });

  return Object.assign({}, store, { dispatch });
}

document.addEventListener('DOMContentLoaded', () => {
  const preloadedState = localStorage.state ?
    JSON.parse(localStorage.state) : {};
  const store = configureStore(preloadedState);
  const newStore = applyMiddlwares(store, addLoggingToDispatch);

  const root = document.getElementById('content');
  ReactDOM.render(<Root store={newStore} />, root);
});
