const modal = document.getElementById("modal")
const signupBtn = document.getElementById("signupBtn")
const findPasswordBtn = document.querySelector('#findPasswordBtn');
const findPasswordModal = document.getElementById("findPasswordModal")
const closeBtn = modal.querySelector(".close-area")

function modalOn2() {
  findPasswordModal.style.display = "flex"
}

function isModalOn2() {
  return findPasswordModal.style.display === "flex"
}

function modalOff2() {
  findPasswordModal.style.display = "none"
  document.querySelector('#findPasswordModal input').value = '';
}

findPasswordBtn.addEventListener("click", e => {
  e.preventDefault();
  modalOn2();
})

closeBtn.addEventListener("click", e => {
  modalOff2();
})

findPasswordModal.addEventListener("click", e => {
  const evTarget = e.target;
  if (evTarget.classList.contains("modal-overlay")) {
    modalOff2();
  }
})

window.addEventListener("keyup", e => {
  if (isModalOn2() && e.key === "Escape") {
    modalOff2()
  }
})

// =======================================

function modalOn() {
  modal.style.display = "flex"
}

function isModalOn() {
  return modal.style.display === "flex"
}

function modalOff() {
  modal.style.display = "none"
  document.querySelector('#modal input').value = '';
}

signupBtn.addEventListener("click", e => {
  modalOn();
})

closeBtn.addEventListener("click", e => {
  modalOff();
})

modal.addEventListener("click", e => {
  const evTarget = e.target;
  if (evTarget.classList.contains("modal-overlay")) {
    modalOff();
  }
})

window.addEventListener("keyup", e => {
  if (isModalOn() && e.key === "Escape") {
    modalOff()
  }
})