window.addEventListener("load", sele);

function sele(){
  const itemPrice = document.getElementById("item-price")
  itemPrice.addEventListener("input", (e) => {
    const price = document.getElementById("item-price").value;
    const fee = price * 0.1;
    const revenue = price - fee;

    const resultForm1 = document.getElementById("add-tax-price");
     resultForm1.innerHTML = fee;
    const resultForm2 = document.getElementById("profit");
      resultForm2.innerHTML = revenue;
  });
}
