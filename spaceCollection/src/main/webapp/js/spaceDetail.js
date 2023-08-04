const navTabs = document.getElementsByClassName("nav-item");
const navItems = document.getElementsByClassName("detail-navTab");

// navItems의 offsetTop 값에 추가할 값을 설정합니다.
const offsetValue = 60;

// 각 navTabs 요소에 클릭 이벤트를 추가합니다.
for (let i = 0; i < navTabs.length; i++) {
    navTabs[i].onclick = function () {
        const scrollTo = navItems[i].offsetTop - offsetValue;
        window.scroll({ top: scrollTo, behavior: 'smooth' });
    };
}
	
