import {getBasicData, SERVER_API} from "./request.js";

await getBasicData();

const data = JSON.parse(localStorage.getItem('member'));
if (data) {
  const loginAEle = document.querySelector(".navbar--login")

  loginAEle.innerText = data.nickname;
  loginAEle.setAttribute('href', `${SERVER_API}/members/mypage/${data.id}`);
}