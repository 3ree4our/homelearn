async function requestOrder(paidOrderRequest) {
    await $.ajax({
        type: "POST",
        url: "/submit-order.do",
        contentType: "application/json",
        data: paidOrderRequest,
        success: function (data) {
            location.reload();
        },
        error: function () {
            alert('요청에 실패했습니다. 다시 시도해 주세요.');
        }
    });
}
