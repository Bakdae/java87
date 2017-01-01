window.fbAsyncInit = function() {
	FB.init({
		appId : '1318879354818511',
		status : false,
		cookie : false,
		xfbml : true
	});
	FB.Event.subscribe('auth.logout', function(response) {
		document.location.reload();
		location.href="/index.jsp";
});

   

	FB.getLoginStatus(function(response) {
		
		if (response.status === 'connected') {
		} else if (response.status === 'not_authorized') {
		} else {
		}
	
	});
};
(function(d) {
	var js, id = 'facebook-jssdk', ref = d.getElementsByTagName('script')[0];
	if (d.getElementById(id)) {
		return;
	}
	js = d.createElement('script');
	js.id = id;
	js.async = true;
	js.src = "//connect.facebook.net/ko_KR/all.js";
	ref.parentNode.insertBefore(js, ref);
}(document));