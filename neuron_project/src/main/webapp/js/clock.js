const clock = document.querySelector('.h1-clock');
const dateClock = document.querySelector('.h1-dateClock')

function getTime(){
    const time = new Date();
	const year = time.getFullYear();
	const month = time.getMonth();
	const clockDate = time.getDate();
	const day = time.getDay();
	const week = ['일','월','화','수','목','금','토'];
    const hour = time.getHours();
    const minutes = time.getMinutes();
    const seconds = time.getSeconds(); 
    clock.innerHTML = `${hour<10 ? `0${hour}`:hour}:${minutes<10 ? `0${minutes}`:minutes}:${seconds<10 ? `0${seconds}`:seconds}`;
	dateClock.innerHTML =`${year}년 ${month+1}월 ${clockDate}일 ${week[day]}요일`;
}


function init(){
    setInterval(getTime, 1000);
}

init();