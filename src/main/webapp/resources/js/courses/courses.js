const member = localStorage.getItem('member');

if (member) {
  const memberObj = JSON.parse(member);
  if (memberObj.roles.length > 1) {
    const searchBtnEle = document.querySelector('button[type=submit]');
    const divEle = document.querySelector('div.d-flex');
    const courseRegisterBtnEle = document.createElement('button');


    courseRegisterBtnEle.innerText = '강의등록'
    searchBtnEle.style.marginRight = '5px';
    divEle.appendChild(courseRegisterBtnEle);
  }
}