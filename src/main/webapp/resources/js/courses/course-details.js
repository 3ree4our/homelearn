import {SERVER_API} from "../common/request.js";

const liEle = document.querySelectorAll('.acr-body > ul > li');

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
