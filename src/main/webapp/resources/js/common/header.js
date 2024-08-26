import {getBasicData, SERVER_API} from "./request.js";

await getBasicData();

const data = JSON.parse(localStorage.getItem('member'));
console.log(data === null)
if (data) {
  const ap = document.querySelector('a[href="/admin/dash-board"]')
  if (data === null || data.roles[0].role !== 'ROLE_ADMIN') {
    console.log("응")
    ap.style.display = 'none';
  }
  const loginAEle = document.querySelector(".navbar--login")

  loginAEle.innerText = data.nickname;
  loginAEle.setAttribute('href', `${SERVER_API}/members/mypage/${data.id}`);
}