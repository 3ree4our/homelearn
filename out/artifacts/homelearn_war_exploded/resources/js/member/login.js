import {getAccessToken, SERVER_API} from "../common/request.js";


const loginBtnEle = document.querySelector("#loginBtn");
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
