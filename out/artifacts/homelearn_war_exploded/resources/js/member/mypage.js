import {SERVER_API} from "../common/request.js";
import {getCoursesByMemberId} from "../member/member-api-request.js"

const data = JSON.parse(localStorage.getItem('member'));
const h2Ele = document.querySelector('.page-feature h2');
const spanNicknameEle = document.querySelector('.tagline');
const logoutBtnEle = document.querySelector('#logoutBtn');
const inputFileEle = document.querySelector('input[type="file"]');
const lectureRegisterListBtnEle = document.querySelector('#navbar button:first-child');
const paymentListBtnELe = document.querySelector('#navbar button:nth-child(2)');
const paymentHistoryListBtnELe = document.querySelector('#navbar button:last-child');

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

lectureRegisterListBtnEle.addEventListener('click', async () => {
  const response = await fetch(`${SERVER_API}/resources/common/jsp/nav/lecture-register-list.jsp`)
  const result = await response.text();
  const navbarList = document.querySelector('#navbarList');

  if (navbarList.hasChildNodes()) navbarList.replaceChildren();

  navbarList.innerHTML = result;


  const pagingData = await getCoursesByMemberId(1);
  console.log(pagingData)
})
lectureRegisterListBtnEle.click();


paymentListBtnELe.addEventListener('click', async () => {
  const response = await fetch(`${SERVER_API}/resources/common/jsp/nav/payment-list.jsp`)
  const result = await response.text();
  const navbarList = document.querySelector('#navbarList');

  if (navbarList.hasChildNodes()) navbarList.replaceChildren();

  navbarList.innerHTML = result;

})

paymentHistoryListBtnELe.addEventListener('click', async () => {
  const response = await fetch(`${SERVER_API}/resources/common/jsp/nav/payment-history-list.jsp`)
  const result = await response.text();
  const navbarList = document.querySelector('#navbarList');

  if (navbarList.hasChildNodes()) navbarList.replaceChildren();

  navbarList.innerHTML = result;

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



