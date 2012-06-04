<?php
// Only run this script if the sendRequest is from our flash application
if ($_POST['sendRequest'] == "parse") {
	// Access the value of the dynamic text field variable sent from flash
	$uname = $_POST['uname'];
	$pword = $_POST['pword'];
	// Print  two vars back to flash, you can also use "echo" in place of print
	print "var1=$uname is from server";
	print "&var2=$pword";
}
?>