window.onload=function(){
	var user=document.getElementById("top-bar").getElementsByClassName("user");
	for(i=0;i<user.length;i++){
		user[i].onmouseover=function(){
			var contain=this.getElementsByTagName("ul")[0].getElementsByTagName("li");
			this.getElementsByTagName("ul")[0].style.display="block";
			this.getElementsByTagName("ul")[0].style.width="120px";
			this.getElementsByTagName("ul")[0].style.position="absolute";
			for(var i=0;i<contain.length;i++){
				contain[i].onmouseover=function(){
					this.style.background="#4682B4";
				}
				contain[i].onmouseout=function(){
					this.style.background="white";
				}
			}
		}
		user[i].onmouseout=function(){
			this.getElementsByTagName("ul")[0].style.display="none";
		}
	}
}