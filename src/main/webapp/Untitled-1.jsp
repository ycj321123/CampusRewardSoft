<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>文件上传</title>
    <style type="text/css">
        #images{min-height:7em;max-height:21em;text-align:left;overflow-y:auto}
        #images img{
            width: 7em;
            height: 7em;
            margin:0.5em;
        }
        .inputFiles{display:none;}
    </style>
</head>
<body>
<div class="content" >
    <div id="images"></div>
    <form id="uploadForm" enctype="multipart/form-data" method="post"  target="saveTo">
        <div class="inputFiles"></div>
    </form> 
    <div class="btn_submit">
        <button  type="button" class="btn btn-success btn_upImg" onClick="addinputFile()">选择图片</button> 
        <button  id="save"  type="button" class="btn btn-success" onClick="uploadFile()">提交</button>
    </div> 
</div>
<iframe name="saveTo" style="display: none"></iframe>
<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="js/toUpload.js"></script>
</body>
</html>
<script type="text/javascript" >
//选择图片，马上预览 
 
    function xmTanUploadImg(obj) { 
 

        var fl=obj.files.length;
  
        for(var i=0;i<fl;i++){  
 
           var file=obj.files[i];  

            var reader = new FileReader();  

 
           //读取文件过程方法  
 
           reader.onload = function (e) { 
 
                var imgstr='<img  src="'+e.target.result+'"/>';  
 
               var oimgbox=$("#images");  

                oimgbox.append(imgstr);  


            }  

 
           reader.readAsDataURL(file);   
 
       }  

 
   }  
    
// 提交 
  
  function uploadFile() {
  
      //看最后一个file类型的input是否有文件，没有则移除
  
      if($("input[type='file']:last").prop('files')){
  
          if($(":file").prop('files').length==0){
  
              $("input[type='file']:last").remove();
   
             if($("input[type='file']").length==0){
    
                alert("请选择图片");
    
            }
       
     }

     
       var form = new FormData($("#uploadForm")[0]);
   
         $.ajax({
  
              type:"post",
    
            url:url,//根据自己项目的需要写请求地址
   
             data:form,
     
           processData:false,
     
           contentType:false,
      
          success:function(msg){
        
            console.log(msg);
        
        },
            
    error:function(e){
   
                 console.log(e.responseText);
  
              }
      
      })
    
    }else{
   
         alert("请选择图片");
   
         }
    } 
 
//新增
type="file"
function addinputFile(){
 
   //检查最后一个type="file"有没有选择图片，没有则去使用，不再建新的
 
   var lastObj=$("input[type='file']:last");
  
  if(lastObj.prop('files')){
  
      if(lastObj.prop('files').length==0){
  
          lastObj.click();
        }else{
 
           $(".inputFiles").append("<input type='file' name='fileAttach'  multiple='multiple' accept='image/*' onChange='xmTanUploadImg(this);' />");
 
           $("input[type='file']:last").click();
  
            }
    }else{
 
       //第一个
  
      $(".inputFiles").append("<input type='file' name='fileAttach'  multiple='multiple' accept='image/*' onChange='xmTanUploadImg(this);' />");
 
       $("input[type='file']:last").click();
   
     }
}
</script>
