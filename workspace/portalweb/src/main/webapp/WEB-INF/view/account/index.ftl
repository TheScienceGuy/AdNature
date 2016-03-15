<html>
    <head>
        <link rel="shortcut icon" href="/style/Transparent%20Mountain.ico" />
        <title>AdNature | ${(webUser.login)!}</title>
        <link rel="stylesheet" type="text/css" href="/style/css/Profile.css">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
        <link href='https://fonts.googleapis.com/css?family=Overlock' rel='stylesheet' type='text/css'>
     
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    </head>
       
    <body>
    <div class="background fixed"><img src="../style/Profilebackground.png" width=100%></div>
        <div class="Profile">
            <div class="cover">
                <div><img src="/style/Blue%20Background.png" width=100% height=270px></div>
                <div class="Logo"><img src="../style/logo.png" width=165px height=84px ></div>
            </div>
            <div class="Triangle"><img src="/style/Green%20Triangle.png" width=235 height=213/></div>
            
            <a href="/logout.htm"><button type="button" id="signout">Sign Out</button></a>
            <a href="#my6Modal" data-toggle="modal">  <div class="Skiier"><img src="/style/skiier.png" height="150" width="115"></div></a>
            <div class="name">${(webUser.login)!}</div>    
            <a href="#myModal" data-toggle="modal"> <button type="button" id="customize">Customize your <br> profile</button> </a> 
            <div id="City">${(profile.city)!}, ${(profile.province)!}</div>
            <div id="Type">Enjoys <a href="../VerifEmail.htm">activities</a> that are: <br>
            </div>
          <div id="lmh">
	          
		            <#list level as levelElem>

			            <#if levelElem =="1"><button class="btn btn-success custom" >Low Impact</button> <br><br>
			            <#elseif levelElem =="2"><button class="btn btn-success custom" >Medium Impact</button> <br><br>
			            <#elseif levelElem =="3"><button class="btn btn-success custom" >High Impact</button> <br><br>
		            </#if>
		            </#list>
				
			</div>
            <div id="Activities">Favourite activities: </div>
 			<div id="activ">
	            <#list faveActivities as faveActivity>
	                       
	            	<span class="btn btn-primary activ" >${faveActivity.name}</span><br>
	            	
	            </#list>
            </div>
            <div id="Schedule">${(webUser.login)!}'s Schedule:</div>
        </div>

<form role="form" action="saveProfile.htm" id="saveProfile" method="post">            
<!-- Modals -->
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <header class="header">Customize your Profile</header>
          <p class="paragraph">Let us get to know you, so we can find the best activity spots near you!</p>
        </div>
        <div class="modal-body">
            <div class="form-group"> 
              <input type="text" name="profile.city" class="form-control" placeholder="City" value="${(profile.city)!}">
            </div>
            <div class="form-group">
              <input type="text" name="profile.address" class="form-control"  placeholder="Postal Code" value="${(profile.address)!}">
            </div>
            <div class="form-group">
              <input type="text" name="profile.province" class="form-control"  placeholder="Province" value="${(profile.province)!}">
            </div>
            <div class="form-group">
              <input type="checkbox" name="" value=""> I want to see advertisements for equipment and tours.
              <br>
            </div>
            <a href="#my2Modal" data-toggle="modal"><button type="botton" class="btn btn-default btn-success btn-block custom-close4"> Continue</button></a>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
        </div>
      </div>
    </div>
  </div> 
</div>
     
   
<div class="modal fade" id="my2Modal" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <header class="header">Customize your Profile</header>
          <p class="paragraph">Fitness Level: (Choose all that apply)</p>
        </div>
        <div class="modal-body">
        	<div class="selections">
        		<input type="hidden" id="low" name="low" value="0"/> 
            	<button id="lowLevelButton" type="button" class="btn btn-primary btn-lg" > Low </button>
            	<p class="desc">(easy or low impact sports such as walking or swimming)</p>
            </div>
            <div class="selections">
            	<input type="hidden" id="medium" name="medium" value="0"/>
                <button id="mediumLevelButton" type="button" class="btn btn-primary btn-lg" > Medium </button>
               
                <p class="desc">(more physically intensive sports such as bicycling or running)</p>
            </div>
            <div class="selections">
            	<input type="hidden" id="high" name="high" value="0"/>
                <button id="highLevelButton"  type="button" class="btn btn-primary btn-lg" > High </button>
                <p class="desc">(extreme sports or sports that require more vigorous effort such as mountain biking or rock climbing)</p>
            </div>
            <a id="saveSportLevelLink" class="custom-close5" href="" data-toggle="modal"><button type="button" class="btn btn-default btn-success btn-block"> Continue</button></a>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
        </div>
      </div>
    </div>
  </div> 
</div>
    

<div class="modal fade" id="my3Modal" role="dialog" >
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <header class="header">Low Impact Activities</header>
          <p class="paragraph">Choose activities that you enjoy:(click all that apply)</p>
        </div>
        <div class="modal-body">
          	  <#list lowSports as lowSport>
          	  <div class="activities">
              <button type="button" class="btn btn-primary sport" >${(lowSport.name)!}</button>
              <input type="hidden" name="addSportIds"  data-sportId="${(lowSport.id)!}"/>
              </div>
              </#list>
              <div class="activities">
	              <button type="button" class="btn btn-primary" >
	              <input type="text" name="addSportNames" placeholder="other" style="color:black"></input> 
	              </button>
			  </div>
              <a id="saveSportLowLink" href="" data-toggle="modal" class="custom-close"><button type="button" class="btn btn-default btn-success btn-block"> Continue</button></a>
        	  <button id="saveSportLowButton" type="submit" class="btn btn-default btn-success btn-block"> Continue</button>
        <div class="modal-footer">
          <button type="button" class="btn btn-default btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
        </div>
      </div>
    </div>
  </div> 
</div>


<div class="modal fade" id="my4Modal" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <header class="header">Medium Impact Activities</header>
          <p class="paragraph">Choose activities that you enjoy:(click all that apply)</p>
        </div>
        <div class="modal-body">
              <#list mediumSports as mediumSport>
          	  <div class="activities">
              <button type="button" class="btn btn-primary sport" >${(mediumSport.name)!}</button>
              <input type="hidden" name="addSportIds"  data-sportId="${(mediumSport.id)!}"/>
              </div>
              </#list>
              <div class="activities">
	              <button type="button" class="btn btn-primary" > 
	              <input type="text" name="addSportNames" placeholder="other" style="color:black"></input> 
	              </button>
			  </div>
              <a id="saveSportMediumLink" href="" data-toggle="modal"class="custom-close2"><button type="button" class="btn btn-default btn-success btn-block"> Continue</button></a>
        	  <button id="saveSportMediumButton" type="submit" class="btn btn-default btn-success btn-block"> Continue</button>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
        </div>
      </div>
    </div>
  </div> 
</div>


<div class="modal fade" id="my5Modal" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <header class="header">High Impact Activities</header>
          <p class="paragraph">Choose activities that you enjoy:(click all that apply)</p>
        </div>
        <div class="modal-body">
        	  <#list highSports as highSport>
          	  <div class="activities">
              <button type="button" class="btn btn-primary sport" >${(highSport.name)!}</button>
              <input type="hidden" name="addSportIds"  data-sportId="${(highSport.id)!}"/>
              </div>
              </#list>
              <div class="activities">
	               <button type="button" class="btn btn-primary" > 
	               <input type="text" name="addSportNames" placeholder="other" style="color:black"></input> 
	               </button>
			  </div>
              <!--<a id="saveSportHighLink" href="" data-toggle="modal"><button type="button" class="btn btn-default btn-success btn-block"> Continue</button></a>-->
        	  <button id="saveSportHighButton" type="submit" class="btn btn-default btn-success btn-block custom-close3"> Continue</button> 
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
        </div>
      </div>
    </div>
  </div> 
</div>
</form>

<div class="modal fade" id="my6Modal" role="dialog">
    <div class="modal-dialog">

      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <header class="header">Change your Icon</header>
           
        </div>
        <div class="modal-body">
          <form role="form">
          	  <div class="activities">
          	  
              <img src="../style/golf.png" width=100px height=100px>
              </div>
              <div class="activities">
                 <img src="../style/snowboarder.png" width=100px height=100px>
              </div>
              <div class="activities">
              <img src="../style/camera.png" width=100px height=100px>
          	  </div>
              <div class="activities">
               <img src="../style/canoe.png" width=100px height=100px>
        	  </div>
              <div class="activities">
              <img src="../style/kayak.gif" width=100px height=100px>
    		  </div>
              <div class="activities">
               <img src="../style/swimming.png" width=100px height=100px>
			  </div>
              <div class="activities">
                 <img src="../style/bike.png" width=100px height=100px>
              </div>
              <div class="activities">
                  <img src="../style/soccerball.png" width=100px height=100px> </div>
              <div class="activities">
              <img src="../style/9c4o4oqdi.png" width=100px height=100px>
            </div>
            <div class="activities">
               <img src="../style/tent.png" width=100px height=74px>
  			</div>
            <div class="activities">
               <img src="../style/football.png" width=100px height=70px>
			</div>              
			<div class="activities">
               <img src="../style/baseball-hat-clipart-black-and-white-baseball_2_coloring_book_black_white_line_art_christmas_xmas_toy-1331px.png" width=100px height=100px>
			</div>              
			<div class="activities">
               <img src="../style/rockclimbing.jpg" width=100px height=100px>
			</div>              
			<div class="activities">
               <img src="../style/surfer.jpg" width=100px height=100px>
			</div>              
			<div class="activities">
               <img src="../style/Hockey.png" width=100px height=120px>
			</div>              
			<div class="activities">
               <img src="../style/figureskating.png" width=100px height=100px>
			</div>              
			<div class="activities">
               <img src="../style/fishingrod.svg" width=100px height=100px>
			</div>              
			<div class="activities">
               <img src="../style/hiking.png" width=100px height=100px>
			</div>    
		  
            <button type="button" class="btn btn-default btn-success btn-block"> Change Icon</button>
          </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
        </div>
      </div>
    </div>
  </div> 
</div>

<script>

	
<!--Functions for closing the modals when clicking continue button-->
$(function () {
    $(".custom-close").on('click', function() {
        $('#my3Modal').modal('hide');
    });
});
$(function () {
    $(".custom-close2").on('click', function() {
        $('#my4Modal').modal('hide');
    });
});
$(function () {
    $(".custom-close3").on('click', function() {
        $('#my5Modal').modal('hide');
    });
});
$(function () {
    $(".custom-close4").on('click', function() {
        $('#myModal').modal('hide');
    });
});
$(function () {
    $(".custom-close5").on('click', function() {
        $('#my2Modal').modal('hide');
    });
});
<!------End functions for closing modals -------->



$(document).ready(function(){
	$("#saveSportLowButton").hide();
	$("#saveSportMediumButton").hide();
	$("#saveSportLowLink").hide();
	$("#saveSportMediumLink").hide();

});

$("#lowLevelButton").on("click",function(){
	if ($("#lowLevelButton").css('background-color') != ('navy')){
		$("#lowLevelButton").css('background-color', 'navy');
		$("input[name='low']").attr("value",'1');
		$("#saveSportLevelButton").attr("low",'1');
		
	}
	else if ($("#lowLevelButton").css('background-color') == ('navy')) {
		$("#lowLevelButton").css('background-color','red');
	}

});


$("#mediumLevelButton").on("click",function(){
$(this).css('background-color','navy');
	$("input[name='medium']").attr("value",'1');
	$("#saveSportLevelButton").attr("medium",'1');
});

$("#highLevelButton").on("click",function(){
$(this).css('background-color','navy');
	$("input[name='high']").attr("value",'1');
	$("#saveSportLevelButton").attr("high",'1');
});

$(".sport").on("click",function(){
$("#sport11").attr('selectedIndex', '-1');
$(this).css('background-color','navy');
	var sportId =  $(this).next('input').attr("data-sportId");
	$(this).next().attr("value",sportId);
	
	
});

$("#saveSportLevelLink").on("click",function(){
	var low = $("input[name='low']").attr("value");
	var medium = $("input[name='medium']").attr("value");
	var high = $("input[name='high']").attr("value");
	
	if(low=="1"){
		$("#saveSportLevelLink").attr("href",'#my3Modal');
	}else if (medium=="1"){
		$("#saveSportLevelLink").attr("href",'#my4Modal');
	}else if (high=="1"){
		$("#saveSportLevelLink").attr("href",'#my5Modal');
	}else{
		$("#saveProfile").submit();
	}
	
	if(medium=="1"){
		$("#saveSportLowLink").attr("href",'#my4Modal');//medium
		$("#saveSportLowLink").show();
	}else if(high=="1"){
		$("#saveSportLowLink").attr("href",'#my5Modal');//high
		$("#saveSportLowLink").show();
	}else{
		$("#saveSportLowButton").show();
	}
	
	if(high=="1"){
		$("#saveSportMediumLink").attr("href",'#my5Modal');//high
		$("#saveSportMediumLink").show();
	}else{
		$("#saveSportMediumButton").show();
	}
	
});


</script>

</body>
</html>
    
<!--<img src="Green%20Button.png" width=100 height=50> -->
