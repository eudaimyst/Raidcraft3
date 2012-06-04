<?php
// Only run this script if the sendRequest is from our flash application
if ($_POST['sendRequest'] == "parse") {
	// Access the value of the dynamic text field variable sent from flash
	//$uname = $_POST['uname'];
	//$pword = $_POST['pword'];

		$errors = array();
		$success = "false";
		$username = trim($_POST['username']);
		$password = trim($_POST['password']);
		$errormessage = "";
	
		//Perform some validation
		//Feel free to edit / change as required
		if($username == "")
		{
			$errors[] = lang("ACCOUNT_SPECIFY_USERNAME");
			$errormessage = "no username";
			echo "var1=$username";
			echo "&var2=$success";
			echo "&var3=$errormessage";
		}
		if($password == "")
		{
			$errors[] = lang("ACCOUNT_SPECIFY_PASSWORD");
			$errormessage = "no password";
			echo "var1=$username";
			echo "&var2=$success";
			echo "&var3=$errormessage";
		}
		
		//End data validation
		if(count($errors) == 0)
		{
			//A security note here, never tell the user which credential was incorrect
			if(!usernameExists($username))
			{
				$errors[] = lang("ACCOUNT_USER_OR_PASS_INVALID");		
				$errormessage = "invalid user";				
				echo "var1=$username";
				echo "&var2=$success";
				echo "&var3=$errormessage";
			}
			else
			{
				$userdetails = fetchUserDetails($username);
			
				//See if the user's account is activation
				if($userdetails["Active"]==0)
				{
					$errors[] = lang("ACCOUNT_INACTIVE");
					$errormessage = "needs activation";	
					echo "var1=$username";
					echo "&var2=$success";
					echo "&var3=$errormessage";
				}
				else
				{
					//Hash the password and use the salt from the database to compare the password.
					$entered_pass = generateHash($password,$userdetails["Password"]);

					if($entered_pass != $userdetails["Password"])
					{
						//Again, we know the password is at fault here, but lets not give away the combination incase of someone bruteforcing
						$errors[] = lang("ACCOUNT_USER_OR_PASS_INVALID");
						$errormessage = "invalid pass";	
						echo "var1=$username";
						echo "&var2=$success";
						echo "&var3=$errormessage";
					}
					else
					{
						//Passwords match! we're good to go'
						
						//Construct a new logged in user object
						//Transfer some db data to the session object
						$loggedInUser = new loggedInUser();
						$loggedInUser->email = $userdetails["Email"];
						$loggedInUser->user_id = $userdetails["User_ID"];
						$loggedInUser->hash_pw = $userdetails["Password"];
						$loggedInUser->display_username = $userdetails["Username"];
						$loggedInUser->clean_username = $userdetails["Username_Clean"];
						$success = "true";
						//$errormessage = "invalid pass";	
						echo "var1=$username";
						echo "&var2=$success";
						echo "&var3=$errormessage";
						die();
					}
				}
			}
		}
	}
	
	
	
	
	
	
	
	
	
	// Print  two vars back to flash
	//echo "var1=$";
	//echo "&var2=$pword";
//}
?>