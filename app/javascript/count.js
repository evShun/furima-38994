function post (){
  const count = document.getElementById("item-price");
  count.addEventListener("keyup", () => {
    const add_tag = Math.floor(count.value * 0.1)
    const benefit = Math.floor(count.value * 0.9)
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = add_tag
    const TaxDom = document.getElementById("profit");
    TaxDom.innerHTML = benefit
  });
};
 
window.addEventListener('load', post);