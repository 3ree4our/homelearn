import {getBasicData, SERVER_API} from "./request.js";

await getBasicData();

const data = JSON.parse(localStorage.getItem('member'));
const courseAEle = document.querySelector('.navbar--course')
const cartAEle = document.querySelector('.navbar--cart')
const loginAEle = document.querySelector(".navbar--login")
const ap = document.querySelector('a[href="/admin/dash-board"]')

if (data === null || data.roles[0].role !== 'ROLE_ADMIN') {
  ap.style.display = 'none';
} else {
  ap.style.display = 'none';
}
if (data) {
  loginAEle.innerText = data.nickname;
  loginAEle.setAttribute('href', `${SERVER_API}/members/mypage/${data.id}`);

  cartAEle.addEventListener('click', (e) => {
    e.preventDefault();
    http://localhost:8080/cart.do?studentId=3
        location.href = `${SERVER_API}/cart.do?studentId=${data.id}`
  })
} else {
  cartAEle.style.display = 'none';
  loginAEle.innerText = '로그인';
  loginAEle.setAttribute('href', `${SERVER_API}/members/login`);
}

