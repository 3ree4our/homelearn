import {SERVER_API, getBasicData} from "../common/request.js";
import {getCoursesByMemberId, getPaymentsByMemberId} from "../member/member-api-request.js"
import {drawchapterList, drawPagination, drawPaymentHistory} from "./draw.js";

await getBasicData();

const data = localStorage.getItem('member');
const accessToken = localStorage.getItem('access_token');

const h2Ele = document.querySelector('.page-feature h2');
const logoutBtnEle = document.querySelector('#logoutBtn');
const inputFileEle = document.querySelector('input[type="file"]');
const courseRegisterListAEle = document.querySelector('#mypageNav a:first-child');
const paymentListAELe = document.querySelector('#mypageNav a:nth-child(2)');
const paymentHistoryListAELe = document.querySelector('#mypageNav a:last-child');

const outUlDiv = document.querySelector('div.col-md-4.col-sm-6:first-child > div ul')
const courseDiv = document.querySelector('div.col-md-4.col-sm-6:nth-child(2) > div ul')

if (data === null || accessToken === null) location.href = `${SERVER_API}/members/login`

if (data) {
  const jsonData = JSON.parse(data);
  const emailInputEle = document.querySelector('#email');
  const createdAtInputEle = document.querySelector('#createdAt');
  const nicknameInputEle = document.querySelector('#nickname');
  const passwordInputEle = document.querySelector('#password');
  const imgEle = document.querySelector('img#profileImage');
  const filePath = jsonData?.attachFile?.filePath;
  const saveName = jsonData?.attachFile?.saveName;
  const logoutAEle = outUlDiv.firstElementChild.firstElementChild;
  const outAEle = outUlDiv.lastElementChild.lastElementChild;

  logoutBtnEle.style.display = 'none';

  logoutAEle.innerText = '로그아웃';
  outAEle.innerText = '회원탈퇴'
  h2Ele.innerHTML = jsonData.nickname;

  emailInputEle.value = `${jsonData.email}`
  createdAtInputEle.value = `${jsonData.createdAt}`.split(" ")[0] || undefined
  nicknameInputEle.value = `${jsonData.nickname}`
  passwordInputEle.value = `${jsonData.password}`

  logoutAEle.addEventListener('click', (e) => {
    e.preventDefault();
    logoutBtnEle.click();
  })

  outAEle.addEventListener('click', (e) => {
    e.preventDefault();
    const userConfirmed = confirm("계속하시겠습니까?");
    if (userConfirmed) {
      fetch(`${SERVER_API}/members/${jsonData.id}`, {
        method: 'delete'
      })
          .then(result => {
            if (result.status === 200) {
              localStorage.removeItem('member')
              localStorage.removeItem('access_token')
              alert('이용해 주셔서 감사합니다.')
              location.href = '/';
            }
          })
    } else {
      alert("계속 이용해주셔서 감사합니다.")
    }

  })

  courseDiv.firstElementChild.firstElementChild.innerText = '등록한 강좌'

  if (filePath && saveName) {
    fetch(`${SERVER_API}/files/${jsonData.id}`, {
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
  e.preventDefault();
  location.href = `${SERVER_API}/cart.do?studentId=${data.id}`
})

logoutBtnEle.addEventListener('click', () => {
  fetch(`${SERVER_API}/members/logout`)
      .then(res => {
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
