import {SERVER_API} from "../common/request.js";

const data = JSON.parse(localStorage.getItem('member'));
export const getCoursesByMemberId = async (cp) => {
  const result = await fetch(`${SERVER_API}/courses/${data.id}/${cp}/v1`);
  console.log('강의 목록이 될 것' + result.json());
}
