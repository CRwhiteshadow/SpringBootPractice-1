document.getElementById("file1").addEventListener("change",fileviewer);
$("input#name").focus(clear);
$("input#name").blur(check);
$("input[type='date']").focus(clear);
$("input[type='date']").blur(check);
$("input[type='time']").focus(clear);
$("input[type='time']").blur(check);
$("#btn").click(submit);

$(document).ready(function(){
	var typeid=$("select[name='typeid']").val();
	$("select[name='typeid']").on("change",function(){
		typeid=$(this).val();
		if(typeid==2){
			$(".eventproduct").removeClass("d-none");
			$(".eventcoupon").addClass("d-none");
		}
		if(typeid==3||typeid==4){
			$(".eventproduct").addClass("d-none");
			$(".eventcoupon").addClass("d-none");
		}
		if(typeid==1){
			$(".eventproduct").addClass("d-none");
			$(".eventcoupon").removeClass("d-none");
		}
	});
});

$(document).ready(function(){
	$(document).on('keydown','.pid',function(){
		var id = this.id;
		var splitid = id.split('_');
 		var index = splitid[1];
	
	$("#"+id).autocomplete({
	source:function(request,response){
		var context =window.location.pathname.split("/")[1];
		var uri="/"+context+"/product/rest/findAll";
		$.ajax({
			url:uri,
			type:"get",
			dataType:"json",
			data:{
				"query":request.term
			},
			success:function(data){
				response($.map(data,function(item){
					return{
						label:item.productid,
						value:item.productid.value,
						name:item.productname,
						price:item.productprice
					}
				}));
			}
		});
	},
	select:function(event,ui){
		$(this).val(ui.item);
		$(this).val(ui.item.value);
		var pname = ui.item.name;
		var pprice = ui.item.price;
		document.getElementById("productname_"+index).value=pname;
		document.getElementById("productprice_"+index).value=pprice;
		return false;
	}
});
	})
})


// $(function(){
// 	var context =window.location.pathname.split("/")[1];
// 	var uri="/"+context+"/product/rest/findAll";
// 	$.ajax({
// 		type:"GET",
// 		url:uri,
// 		contentType:"application/json",
// 		success:function(result){
// 			console.log(result);
// 		}
// 	});
	
// })

function fileviewer() {
	let reader = new FileReader();
	reader.addEventListener("load", function (e) {
	let fileContent = e.target.result;
	let show = document.getElementById("img1");
	show.setAttribute("src", fileContent);
	show.setAttribute("width","600px");
	})
	let file = document.getElementById("file1").files[0];
	reader.readAsDataURL(file);
}

function clear(){
	$("span#spname").empty();
}

function check(){
	let Val = $(this).val();
	if (Val == "") {
		console.log($(this).next());
		$(this).next().css("color","red").append("<b>╳不可空白</b>");
	}else{
		$(this).next().empty();
	}
}

function submit(){
	if($("input#name").val()=="" || $("#spsd").prev().val()=="" || $("#spst").prev().val()=="" || $("#sped").prev().val()=="" || $("#spet").prev().val()==""){
		alert("活動名稱、活動開始時間、活動結束時間，不可空白");				
	}else{
		$("form").submit();}
}


function dataURItoBlob(dataURI) {
    // convert base64/URLEncoded data component to raw binary data held in a string
    var byteString;
    if (dataURI.split(',')[0].indexOf('base64') >= 0)
        byteString = atob(dataURI.split(',')[1]);
    else
        byteString = unescape(dataURI.split(',')[1]);

    // separate out the mime component
    var mimeString = dataURI.split(',')[0].split(':')[1].split(';')[0];

    // write the bytes of the string to a typed array
    var ia = new Uint8Array(byteString.length);
    for (var i = 0; i < byteString.length; i++) {
        ia[i] = byteString.charCodeAt(i);
    }

    return new Blob([ia], {type:mimeString});
}