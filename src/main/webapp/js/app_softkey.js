$("input")
			.focus(
					function() {
						var clientHeight = document.documentElement.clientHeight
								|| document.body.clientHeight;

						$(window)
								.on(
										'resize',
										function() {
											var nowClientHeight = document.documentElement.clientHeight
													|| document.body.clientHeight;

											if (clientHeight > nowClientHeight) {
												//键盘弹出的事件处理
												$("body").css("position",
														"fixed")
												top = $(window).scrollTop();//获取页面的scrollTop；
												$('body').css("top",
														-top + "px");//给body一个负的top值；
												$('body').addClass('add');//给body增加一个类，position:fixed; 
											} else {
												//键盘收起的事件处理
												$('body').removeClass('add');//去掉给body的类
												$(window).scrollTop(top);//设置页面滚动的高度，如果不设置，关闭弹出层时页面会回到顶部。
											}
										});
					})