import {SERVER_API} from "../common/request.js";
import {getCoursesByMemberId} from "../member/member-api-request.js"

export const drawchapterList = (pagingData) => {
  let html = '';
  if (pagingData.totalElements) {
    for (let element of pagingData.elements) {
      html += ` <div class="col-xs-12 col-lg-6 col-xl-4">`;
      html += ` <div class="card" style="width: 100%;"">`;
      html += `  <img src="/resources/images/과학책.jpg" class="card-img-top" alt="...">`
      html += `<div class="card-body">`;
      html += `<h5 class="card-title">${element.courseName}</h5>`;
      html += `<p>평점 </p>`;
      html += `<div>`
      html += `<a href=${SERVER_API}/courseDetail.do?course_id=${element.courseId} class="btn btn-primary">이동하기</a>`;
      html += `</div>`
      html += `</div></div></div>`;
    }
    drawPagination(pagingData);
  } else {
    html += `<div>수강중인 강의가 없습니다.</div>`
  }
  document.querySelector('#courseList').innerHTML = html;
}


export const drawPaymentHistory = (pagingData) => {
  let html = '';
  if (pagingData.totalElements) {
    for (let element of pagingData.elements) {
      html += `<div className="col-12 mb-4">`;
      html += `<div className="card">`;
      html += `<div className="card-body">`
      html += `<span>수강명</span>`;
      html += `<span>결제 금액</span>`;
      html += `<span>결제 일자</span>`;
      html += `<span>환불 상태</span>`
      html += `</div></div></div>`;
    }
    drawPagination(pagingData);
  } else {
    html += `<div>결제내역이 없습니다.</div>`
  }
  document.querySelector('#paymentsList').innerHTML = html;
}

export const drawPagination = (pagingData) => {
  let html = '';
  if (pagingData) {
    if (pagingData.previousPage) {
      html += `<li class="page-item ">`;
      html += ` <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>`;
      html += `</li>`;
    }

    for (let i = pagingData.startPage; i <= pagingData.endPage; i++) {
      html += `<li class="page-item"><a class="page-link" href="#" data-link>${i}</a></li>`;
      if (pagingData.endPage === i) break;
    }

    if (pagingData.nextPage) {
      html += `<li class="page-item">`;
      html += `<a class="page-link" href="#">Next</a>`;
      html += `</li>`;
    }
  }

  document.querySelector('ul.pagination').innerHTML = html;
  document.querySelectorAll('ul.pagination li').forEach(e => {
    e.addEventListener('click', async (e) => {
      e.preventDefault();
      const paginationNum = e.target.innerText;
      if (paginationNum === 'NEXT') {
        const previouseNum = e.target.parentElement.previousElementSibling.firstElementChild.innerText
        const courseData = await getCoursesByMemberId(Number(previouseNum) + 1);
        drawchapterList(courseData);
      } else if (paginationNum === 'PREVIOUS') {
        const previouseNum = e.target.parentElement.nextElementSibling.firstElementChild.innerText
        const courseData = await getCoursesByMemberId(Number(previouseNum) - 1);
        drawchapterList(courseData);
      } else {
        const courseData = await getCoursesByMemberId(paginationNum);
        console.log(courseData)
        drawchapterList(courseData);
      }
    })
  })
}

