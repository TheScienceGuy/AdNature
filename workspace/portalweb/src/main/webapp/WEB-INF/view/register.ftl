<html lang="en" >
    <head>
        <link rel="shortcut icon" href="/style/Transparent%20Mountain.ico" />
        <title>AdNature | Sign Up</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
        <link rel="stylesheet" type="text/css" href="/style/css/signuppage.css">
        
    </head>
    <body id="body">
        
       <div class="background">
         <!-- <img src="background%20forest%20transparent.png"class="img"> -->
            <br>
            <p id="sign">SIGN UP</p>  
            <p id="othertext">And customize your search experience</p>
            <br><br><br>
        
        	<form action="saveinfo.htm" method="POST">
            <div class="signup">
                <input type="text"  name="webUser.login" placeholder="Username" id="Username" required><span class="star">&#42;</span> <br><br>
                <input type="email" name="webUser.email"		placeholder="Email" id="Email" required><span class="star">&#42;</span> <br><br>
              
                <input type="password" name="password"			placeholder="Password" id="Password" required><span class="star">&#42;</span> <br><br>
                <input type="password" name="webUser.password"	placeholder="Confirm Password" id="confirmPassword" onChange="checkPasswordMatch();" required><span class="star">&#42;</span>   
       <p id="divCheckPasswordMatch"></p>
<br><br>
                  <input type="tel"  	name="webUser.celphone"		placeholder="Phone Number" id="PhoneNum"><span class="star1">&#42;</span> <br><br>
            </div>
            <br><br>
            <button type="submit" class="button5">Sign Up</button>
            <br>
            </form>
            
        </div> 
        <script>
function checkPasswordMatch() {
    var password = $("#Password").val();
    var confirmPassword = $("#confirmPassword").val();

    if (password != confirmPassword)
        $("#divCheckPasswordMatch").html("Passwords do not match!");
    else
        $("#divCheckPasswordMatch").html("Passwords match.");
}

$(document).ready(function () {
   $("#confirmPassword").keyup(checkPasswordMatch);
});

</script>
    </body>
</html>