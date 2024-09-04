import {getAccessToken, SERVER_API} from "../common/request.js";

const loginBtnEle = document.querySelector("#loginBtn");
const emailCheckBtn = document.querySelector('.content-input button');
const findPasswordBtn = document.querySelector('#findPasswordModal button');
const data = localStorage.getItem('member');

loginBtnEle.addEventListener('click', async (e) => {
  e.preventDefault();
  const username = document.querySelector('input[name="username"]').value;
  const password = document.querySelector('input[name="password"]').value;

  fetch(`${SERVER_API}/members/login-proc`, {
    method : "POST",
    headers: {
      'Content-Type': 'application/json'
    },
    body   : JSON.stringify({
      username,
      password
    })
  })
      .then(async (res) => {
        if (res.status === 500) {
          alert("회원가입이 되어있지 않습니다.")
          return;
        }

        if (res.status === 401) {
          alert("비밀번호가 틀렸습니다.")
          return;
        }

        const accessTokenData = await getAccessToken();
        localStorage.setItem("access_token", accessTokenData);
        location.href = "/"
      })
})

findPasswordBtn.addEventListener('click', (e) => {
  e.preventDefault()
  const email = document.querySelector('#findPasswordModal input').value;
  const formData = new FormData();

  const divEle = document.createElement('div');
  divEle.innerText = '잠시만 기다려주세요.';
  divEle.style.color = 'blue';
  document.querySelector('#findPasswordModal .content').appendChild(divEle);

  formData.append('email', email)
  fetch(`${SERVER_API}/password`, {
    method: "POST",
    body  : formData
  }).then(async response => {
    if (response.status === 200) {
      divEle.innerText = '비밀번호가 전송되었습니다.'
      divEle.style.color = 'red';
      document.querySelector('.content').replaceChild(divEle);
    }
  })
})

emailCheckBtn.addEventListener('click', async (e) => {
  e.preventDefault();
  const emailInputEle = document.querySelector('.content-input input');
  if (!emailInputEle.value.trim().length) {
    alert("email을 입력해주세요.");
    return;
  }

  const divEle = document.createElement('div');
  divEle.innerText = '잠시만 기다려주세요.';
  divEle.style.color = 'blue';
  document.querySelector('.content').appendChild(divEle);

  const email = emailInputEle.value;
  const formData = new FormData();
  formData.append('email', email);
  fetch(`${SERVER_API}/email`, {
    method: "POST",
    body  : formData
  })
      .then(async response => {
        if (response.status === 200) {
          divEle.innerText = '이메일이 전송되었습니다.'
          divEle.style.color = 'red';
          document.querySelector('.content').replaceChild(divEle);
        }
      })
})