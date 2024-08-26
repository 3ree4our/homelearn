const inputFileEle = document.querySelector('input[type="file"]');
const formEle = document.querySelector('form');

const emailEle = document.querySelector('input[name="email"]');

const passwordEle = document.querySelector('#password');
const passwordEle2 = document.querySelector('#password2');
const passwordFailureMessageEle = document.querySelector('.password-failure-message');

const passwordMismatchMessageEle = document.querySelector('.password-mismatch-message');
// 유효성 검증 함수
const provePassword = str => /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/.test(str);
const isMatch = (password1, password2) => password1 === password2;
let provePasswordState1 = false;
let provePasswordState2 = false;


emailEle.addEventListener('keydown', (e) => {
  e.preventDefault();
});

passwordEle.addEventListener('keyup', () => {
  if (passwordEle.value.length !== 0) {

    if (provePassword(passwordEle.value)) {// 8글자 이상, 영문, 숫자, 특수문자 사용
      passwordFailureMessageEle.classList.add('hide');
      provePasswordState1 = true;
    } else {
      passwordFailureMessageEle.classList.remove('hide');
      provePasswordState1 = false;
    }

  } else {
    passwordFailureMessageEle.classList.add('hide');
    provePasswordState1 = true;
  }
});

passwordEle2.addEventListener('keyup', () => {
  if (passwordEle2.value.length !== 0) {

    if (isMatch(passwordEle.value, passwordEle2.value)) {
      passwordMismatchMessageEle.classList.add('hide');
      provePasswordState2 = true
    } else {
      passwordMismatchMessageEle.classList.remove('hide');
      if (!provePasswordState1) {
        provePasswordState2 = true;
      } else {
        provePasswordState2 = false;
      }
    }

  } else {
    passwordFailureMessageEle.classList.add('hide');
    provePasswordState2 = true
  }
});

formEle.addEventListener('submit', (e) => {
  e.preventDefault();
  if (!provePasswordState1 || !provePasswordState2) {
    alert('비밀번호가 일치하지 않습니다.');
    return;
  }

  formEle.submit();
})

inputFileEle.addEventListener('change', (e) => {
  const file = e.target.files[0];
  const reader = new FileReader();

  reader.readAsDataURL(file);
  reader.onloadend = () => {
    const profileImageEle = document.querySelector("div.vector-img > img");
    profileImageEle.src = reader.result;
  };
})
