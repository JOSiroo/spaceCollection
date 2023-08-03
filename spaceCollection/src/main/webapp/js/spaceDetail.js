
const navTabs = document.getElementsByClassName("nav-item")
const navItems = document.getElementsByClassName("detail-navTab")

const firstTop = navItems[0].offsetTop
const secondTop = navItems[1].offsetTop
const thirdTop = navItems[2].offsetTop
const fourthTop = navItems[3].offsetTop
const fifthTop = navItems[4].offsetTop
const sixthTop = navItems[5].offsetTop
	
	
	
navTabs[0].onclick = function(){
	window.scroll({top:firstTop, behavior: 'smooth'})
	
}
navTabs[1].onclick = function(){
	window.scroll({top:secondTop, behavior: 'smooth'})
}
navTabs[2].onclick = function(){
	window.scroll({top:thirdTop, behavior: 'smooth'})
}
navTabs[3].onclick = function(){
	window.scroll({top:fourthTop, behavior: 'smooth'})
}
navTabs[4].onclick = function(){
	window.scroll({top:fifthTop, behavior: 'smooth'})
}
navTabs[5].onclick = function(){
	window.scroll({top:sixthTop, behavior: 'smooth'})
}

