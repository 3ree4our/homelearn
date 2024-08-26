import {getBasicData, SERVER_API} from "./request.js";

await getBasicData();

const data = JSON.parse(localStorage.getItem('member'));
if (data) {
  const memberid = JSON.parse(localStorage.getItem('member')).id;
  const loginAEle = document.querySelector(".navbar--login")

  loginAEle.innerText = data.nickname;
  loginAEle.setAttribute('href', `${SERVER_API}/members/mypage/${memberid}`);
}