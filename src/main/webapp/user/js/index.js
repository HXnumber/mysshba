$(function(){
	if(loginUserId=='' || loginUserId == undefined)
	{
		// 弹出登录提示
		$.notify({message: '请先登录!'}, {placement: {from: "bottom",align: "right"},type: 'danger',delay: 2000});
		// 弹出登录框
		$('#loginModal').modal('show');
	}
});