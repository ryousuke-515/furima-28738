function sale() {
  const price = document.getElementById("item-price")
  const fee = document.getElementById("add-tax-price")
  const profit = document.getElementById("profit")
  price.addEventListener('input', function(){
  a = price.value
  value = price.innerHTML
  commission = Math.floor(a * 0.1)
  fee.innerHTML = commission
  profit.innerHTML = a - commission
  })
}
window.addEventListener('load', sale)
