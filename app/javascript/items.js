// 1 イベントを記述
// →window load
// function profit(){
//   const price = document.getElementById("item-price");
//   console.log(price)
// }
// 2 I'dを取得して定数に代入

// 3 金額を入力したときのイベント

// ４計算式
// →表示させる
function sale() {
  const price = document.getElementById("item-price")
  const fee = document.getElementById("add-tax-price")
  const profit = document.getElementById("profit")
  console.log(price)
  price.addEventListener('input', function(){
  a = price.value
  console.log(a)
  value = price.innerHTML
  commission = Math.floor(a * 0.1)
  fee.innerHTML = commission
  profit.innerHTML = a - commission
  console.log(value)
  })
}
window.addEventListener('load', sale)
// window.addEventListener("load", profit);