import {getBasicData, SERVER_API} from "./request.js";

await getBasicData();

const data = localStorage.getItem('member');
const cartAEle = document.querySelector('.navbar--cart')
const loginAEle = document.querySelector(".navbar--login")

if (data) {
  const jsonData = JSON.parse(data);
  for (let item of jsonData.roles) {
    if (item.role === 'ROLE_ADMIN') {
      const ulEle = document.querySelector('.navbar-nav');
      const liEle = document.createElement('li');
      const aEle = document.createElement('a');
      aEle.setAttribute('href', '/admin/dash-board');
      aEle.innerText = "어드민";
      liEle.appendChild(aEle);
      ulEle.appendChild(liEle);

    }
  }

  loginAEle.innerText = jsonData.nickname;
  loginAEle.setAttribute('href', `${SERVER_API}/members/mypage/${jsonData.id}`);

  cartAEle.addEventListener('click', (e) => {
    e.preventDefault();
    http://localhost:8080/cart.do?studentId=3
        location.href = `${SERVER_API}/cart.do?studentId=${jsonData.id}`
  })
} else {
  cartAEle.style.display = 'none';
  loginAEle.innerText = '로그인';
  loginAEle.setAttribute('href', `${SERVER_API}/members/login`);
}

