$(document).ready(
	function() {
		$.getJSON("data/100pakiety.json", function(data) {
			$.each(data,
				function(key, value) {
					$("#pkgs").prepend("<tr><th>" + value.date + "</th><th>" + value.name + "</th><th>"+value.title+"</th></tr>");
				});
		});
	});

