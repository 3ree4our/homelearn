import {SERVER_API, getBasicData} from "../common/request.js";
import {getCoursesByMemberId, getPaymentsByMemberId} from "../member/member-api-request.js"
import {drawchapterList, drawPagination, drawPaymentHistory} from "./draw.js";

await getBasicData();

const data = JSON.parse(localStorage.getItem('member'));
const accessToken = localStorage.getItem('access_token');

const h2Ele = document.querySelector('.page-feature h2');
const spanNicknameEle = document.querySelector('.tagline');
const logoutBtnEle = document.querySelector('#logoutBtn');
const inputFileEle = document.querySelector('input[type="file"]');
const courseRegisterListAEle = document.querySelector('#mypageNav a:first-child');
const paymentListAELe = document.querySelector('#mypageNav a:nth-child(2)');
const paymentHistoryListAELe = document.querySelector('#mypageNav a:last-child');

if (data === null || accessToken === null) location.href = `${SERVER_API}/members/login`

if (data) {
  const emailInputEle = document.querySelector('#email');
  const createdAtInputEle = document.querySelector('#createdAt');
  const nicknameInputEle = document.querySelector('#nickname');
  const passwordInputEle = document.querySelector('#password');
  const imgEle = document.querySelector('img#profileImage');
  const filePath = data?.attachFile?.filePath;
  const saveName = data?.attachFile?.saveName;

  h2Ele.innerHTML = data.nickname;
  spanNicknameEle.innerHTML = `${data.nickname}님 마이페이지`

  emailInputEle.value = `${data.email}`
  createdAtInputEle.value = `${data.createdAt}`.split(" ")[0] || undefined
  nicknameInputEle.value = `${data.nickname}`
  passwordInputEle.value = `${data.password}`

  if (filePath && saveName) {
    fetch(`${SERVER_API}/files/${data.id}`, {
      method: 'POST',
      body  : JSON.stringify({
        filePath,
        saveName
      })
    })
        .then(async result => {
          const blob = await result.blob();
          const url = URL.createObjectURL(blob);
          imgEle.setAttribute('src', url);
        })
  }
}

courseRegisterListAEle.addEventListener('click', async (e) => {
  e.preventDefault();
  const listData = await fetch(`${SERVER_API}/resources/common/jsp/nav/course-register-list.jsp`)
  const listResult = await listData.text();
  const pagingData = await getCoursesByMemberId(1);
  const navbarList = document.querySelector('#navbarList');
  let html = '';

  if (navbarList.hasChildNodes()) navbarList.replaceChildren();
  navbarList.innerHTML = listResult;

  drawchapterList(pagingData);
  drawPagination(pagingData)
})
courseRegisterListAEle.click();


paymentListAELe.addEventListener('click', async (e) => {
  e.preventDefault();
  const response = await fetch(`${SERVER_API}/resources/common/jsp/nav/payment-list.jsp`)
  const result = await response.text();
  const pagingData = await getPaymentsByMemberId(1);
  const navbarList = document.querySelector('#navbarList');

  if (navbarList.hasChildNodes()) navbarList.replaceChildren();

  navbarList.innerHTML = result;

  drawPaymentHistory(pagingData);
  drawPagination(pagingData)
})

paymentHistoryListAELe.addEventListener('click', async (e) => {
  //http://localhost:8080/cart.do?studentId=3
  alert("으아")
  e.preventDefault();
  location.href = `${SERVER_API}/cart.do?studentId=${data.id}`
})

logoutBtnEle.addEventListener('click', () => {
  fetch(`${SERVER_API}/members/logout`)
      .then(res => {
        console.log(res)
        if (res.status === 200) {
          localStorage.removeItem('access_token')
          localStorage.removeItem('member')

          location.href = SERVER_API
        }
      })
      .catch(err => alert("err" + err))
})

inputFileEle.addEventListener('change', (e) => {
  const file = e.target.files[0];
  const reader = new FileReader();

  reader.readAsDataURL(file);
  reader.onloadend = () => {
    const profileImageEle = document.querySelector("#profileImage");
    profileImageEle.src = reader.result;
  };
})
