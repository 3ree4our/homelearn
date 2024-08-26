import {SERVER_API} from "../common/request.js";
import {getCoursesByMemberId} from "../member/member-api-request.js"

export const drawLectureList = (pagingData) => {
  let html = '';
  if (pagingData.totalElements) {
    for (let element of pagingData.elements) {
      html += ` <div class="col-xs-12 col-lg-6 col-xl-4">`;
      html += ` <div class="card" style="width: 100%;"">`;
      html += `  <img src="/resources/images/member/금발카리나.jpg" class="card-img-top" alt="...">`
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
  document.querySelector('#course-list').innerHTML = html;
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
        drawLectureList(courseData);
      } else if (paginationNum === 'PREVIOUS') {
        const previouseNum = e.target.parentElement.nextElementSibling.firstElementChild.innerText
        const courseData = await getCoursesByMemberId(Number(previouseNum) - 1);
        drawLectureList(courseData);
      } else {
        const courseData = await getCoursesByMemberId(paginationNum);
        console.log(courseData)
        drawLectureList(courseData);
      }
    })
  })
}

