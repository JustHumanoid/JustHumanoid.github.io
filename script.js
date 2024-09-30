// Scroll to the shop section
function shopNow() {
    document.getElementById('shop').scrollIntoView({ behavior: 'smooth' });
}

// Open modal with product details
function openModal(product, price) {
    document.getElementById('productModal').style.display = 'flex';
    document.getElementById('modalTitle').innerText = product;
    document.getElementById('modalPrice').innerText = "$" + price + ".00";
    document.getElementById('addToCartBtn').setAttribute('data-product', product);
}

// Close modal
function closeModal() {
    document.getElementById('productModal').style.display = 'none';
}

// Add product to cart
function addToCart() {
    const product = document.getElementById('addToCartBtn').getAttribute('data-product');
    alert(product + ' has been added to your cart!');
    closeModal();
}
