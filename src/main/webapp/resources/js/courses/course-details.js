import {SERVER_API} from "../common/request.js";

const data = localStorage.getItem('member');
const liEle = document.querySelectorAll('.acr-body > ul > li');
const cartBtn = document.querySelector('#cartBtn');

liEle.forEach(e => {
  e.addEventListener('click', e => {
    e.preventDefault();
    const param = new URLSearchParams(location.search);
    const courseId = param.get('course_id');

    fetch(`${SERVER_API}/courses/${courseId}`)
        .then(async (result) => {
          if (result.status === 400) {
            alert('구매를 하셔야 볼 수 있습니다.')
            return;
          }

          const uri = e.target.getAttribute('href');
          open(uri, '_blank')
        });
  })
})

cartBtn.addEventListener('click', (e) => {
  e.preventDefault();
  const searchParam = new URLSearchParams(location.search);
  const param = searchParam.get('course_id');
  if (data) {
    const dataObj = JSON.parse(data);
    const form = document.querySelector("form[action='/add-cart-course.do']");
    const firstInput = form.querySelector("input[type='hidden']:nth-of-type(1)");
    const secondInput = form.querySelector("input[type='hidden']:nth-of-type(2)");

    firstInput.value = dataObj.id;
    secondInput.value = param;
    alert("읭")
    form.submit();
  } else {
    alert("로그인을 먼저 진행해주세요.")
  }
})