<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<title>Hotels in ${ city }</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	<link rel="stylesheet" href="/style.css" />
</head>
<body>
	<div class=container>
		<h2>Hotels in ${ city }</h2>
		<table>
			<tr>
				<th>Name</th>
				<th>Price Per Night</th>
				<th></th>
				<th></th>
			</tr>
			<c:forEach items="${ hotelList }" var="hotel">
				<tr>
					<td>${ hotel.name }</td>
					<td>${ hotel.pricePerNight }</td>
					<td><div class="voting_wrapper"><div class="arrow-up" id="up${ hotel.id }" value="${ hotel.votes }"></div><div class="arrow-down" id="down${ hotel.id }" value="${ hotel.votes }"></div></div></td>
					<td><div class="vote_count" id="${ hotel.id }">0</div></td>
				</tr>
			</c:forEach>
		</table>
		
		<a href="/">Search again?</a>
	</div>
	<script>
		// retrive votes for each content
		$.each( $('.voting_count'), function(){
		
		//retrive unique id from this voting_wrapper element
		var unique_id = $(this).attr("id");
		
		//prepare post content
		post_data = {'unique_id':unique_id, 'vote':'fetch'};
		
		//send our data to "vote_process.php" using jQuery $.post()
		$.post('vote_process.php', post_data,  function(response) {
		
				//retrive votes from server, replace each vote count text
				$('#'+unique_id+' .vote_count').text(response.vote_up);
			},'json');
		});
		
		$(".voting_wrapper").click(function (e) {
			
			//get class name (down_button / up_button) of clicked element
			var clicked_button = $(this).children().attr('class');
			
			//get unique ID from voted parent element
			var unique_id 	= $(this).parent().attr("id"); 
			
			if(clicked_button==='down') //user disliked the content
			{
				//prepare post content
				post_data = {'unique_id':unique_id, 'vote':'down'};
				
				//send our data to "vote_process.php" using jQuery $.post()
				$.post('vote_process.php', post_data, function(data) {
					
					//replace vote down count text with new values
					$('#'+unique_id+' .vote_count').text(data);
					
				}).fail(function(err) { 
				
				//alert user about the HTTP server error
				alert(err.statusText); 
				});
			}
			else if(clicked_button==='up') //user liked the content
			{
				//prepare post content
				post_data = {'unique_id':unique_id, 'vote':'up'};
				
				//send our data to "vote_process.php" using jQuery $.post()
				$.post('vote_process.php', post_data, function(data) {
				
					//replace vote up count text with new values
					$('#'+unique_id+' .vote_count').text(data);
					
				}).fail(function(err) { 
				
				//alert user about the HTTP server error
				alert(err.statusText); 
				});
			}
			
		});
	</script>
	<script>
		var up = document.getElementById("up");
		var down = document.getElementById("down");
		
		up.onClick = function(upVote);
		down.onClick = function(downVote);
		
		function upVote() {
			up.value += 1;
		}
		
		function downVote() {
			down.value -= 1;
		}
		
	</script>
</body>
</html>