<?php
	/*
		UserCake
		http://usercake.com
		
		Developed by: Adam Davis
	*/
	require_once("../models/config.php");
	
	//Prevent the user visiting the logged in page if he/she is already logged in
	//if(isUserLoggedIn()) { header("Location: account.php"); die(); }
?>
<?php
// Only run this script if the sendRequest is from our flash application
if ($_POST['sendRequest'] == "parse")
{
  // Access the value of the dynamic text field variable sent from flash
  
  $errors = array();
  $success = "false";
  $email = trim($_POST["email"]);
  $username = trim($_POST["username"]);
  $password = trim($_POST["password"]);
  $confirm_pass = trim($_POST["confirm_pass"]);
  $flasherrors = "none";

  
  if(minMaxRange(5,25,$username))
  {
	$errors[] = lang("ACCOUNT_USER_CHAR_LIMIT",array(5,25));
	$flasherrors = lang("ACCOUNT_USER_CHAR_LIMIT");
  }
  if(minMaxRange(5,50,$password) && minMaxRange(5,50,$confirm_pass))
  {
	$errors[] = lang("ACCOUNT_PASS_CHAR_LIMIT",array(8,50));
	$flasherrors = lang("ACCOUNT_PASS_CHAR_LIMIT");
  }
  else if($password != $confirm_pass)
  {
	$errors[] = lang("ACCOUNT_PASS_MISMATCH");
	$flasherrors = lang("ACCOUNT_PASS_MISMATCH");
  }
  if(!isValidEmail($email))
  {
	$errors[] = lang("ACCOUNT_INVALID_EMAIL");
	$flasherrors = lang("ACCOUNT_INVALID_EMAIL");
  }
  //End data validation
  if(count($errors) == 0)
  {	
	//Construct a user object
	$user = new User($username,$password,$email);
	$success = "true";
	
	//Checking this flag tells us whether there were any errors such as possible data duplication occured
	if(!$user->status)
	{
	  if($user->username_taken)
		  {
			  $errors[] = lang("ACCOUNT_USERNAME_IN_USE",array($username));
			  $flasherrors = "Username taken"; 
		  }
	  if($user->email_taken)
		  {
			  $errors[] = lang("ACCOUNT_EMAIL_IN_USE",array($email));
			  $flasherrors = "E-mail address in use/should not see this no e-mail checking";
		  }
	}
	else
	{
	  //Attempt to add the user to the database, carry out finishing  tasks like emailing the user (if required)
	  if(!$user->userCakeAddUser())
	  {
		  if($user->mail_failure)
		  {
			  $errors[] = lang("MAIL_ERROR");
			  $flasherrors = lang("MAIL_ERROR");
		  }
		  if($user->sql_failure)
		  {
			  $errors[] = lang("SQL_ERROR");
			  $flasherrors = lang("SQL_ERROR");
		  }
	  }
	}
  }
  echo "var1=".$success."&var2=".$flasherrors;
}
?>