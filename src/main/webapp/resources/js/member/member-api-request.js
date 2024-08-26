import {SERVER_API} from "../common/request.js";

const data = JSON.parse(localStorage.getItem('member'));
export const getCoursesByMemberId = async (cp) => {
  const result = await fetch(`${SERVER_API}/courses/${data.id}/${cp}/v1`);
  return result.json();
}

export const getPaymentsByMemberId = async (cp) => {
  const result = await fetch(`${SERVER_API}/payments/${data.id}/${cp}/v1`);
  return result.json();
}
