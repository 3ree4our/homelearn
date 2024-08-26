import {SERVER_API} from "../common/request.js";

const member = localStorage.getItem('member');

if (member) {
  const memberObj = JSON.parse(member);
  const searchBtnEle = document.querySelector('button[type=submit]');
  const divEle = document.querySelector('div.d-flex');
  const courseRegisterBtnEle = document.createElement('button');
  if (memberObj.roles.length > 1) {


    courseRegisterBtnEle.innerText = '강의등록'
    searchBtnEle.style.marginRight = '5px';
    divEle.appendChild(courseRegisterBtnEle);
  }

  if (courseRegisterBtnEle) {
    courseRegisterBtnEle.addEventListener('click', (e) => {
      e.preventDefault();
      location.href = `${SERVER_API}/courseForm.do`
    })
  }

}