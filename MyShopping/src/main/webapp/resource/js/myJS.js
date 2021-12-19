/**
 * 
 */
function deleteUser() {
	var doIt = confirm("Do you want to delete this user?");
	if (doIt) {
		alert("Accepted!");
		return true;
	} else {
		alert("Delete cancel!");
		return false;
	}
}

function deleteProduct() {
	var doIt = confirm("Do you want to delete this product?");
	if (doIt) {
		alert("Accepted!");
		return true;
	} else {
		alert("Delete cancel!");
		return false;
	}
}