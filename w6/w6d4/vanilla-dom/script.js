document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });



  // adding SF places as list items

  const addPlace = (e) => {

  }

  const restaurantList = document.querySelectorAll("ul#restaurants");

  const listSubmitButton = document.querySelector(".favorite-submit");
  listSubmitButton.addEventListener("click", addPlace);


  // adding new photos

  // --- your code here!



});
