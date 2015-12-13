<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <title>日报2</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
     <link href="Styles/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
    <script type="text/javascript" src="js/base.js"></script>
    <script type="text/javascript" src="js/ligerResizable.js"></script>
    <script type="text/javascript" src="js/ligerGrid.js" ></script> 
    <script  type="text/javascript" src="js/ligerui.min.js"></script>
    <script  type="text/javascript" src="js/common.js"></script>
    <script  type="text/javascript" src="js/json2.js" ></script>
    <script type="text/javascript">
    var rootpath = "Styles/skins/Aqua/icons/";
         
        var columns = [
                { display: '团检团付', name: 'tjtf', width: 125},
                { display: '团检个付', name: 'xj', width: 125},
                { display: '个付', name: 'ylk', width: 125},
                { display: '套餐卡个付', name: 'tckjsje', width: 125},
                { display: '销售员支付', name: 'czkskje', width: 125 } 
                ];
                
                
                
                     $(function () { 
       
 
            var g1;
            g1 = $("#maingrid1").ligerForm({
                inputWidth: 170, labelWidth: 90, space: 40,
                fields: [

{ display: " 统计时间", name: "Cong", newline: true, type: "date" },
{ display: "到", name: "Dao", newline: false, type: "date" }

]
         
            }); 
           });
           
             $(document).ready(function () {
                $("#bb").click(function () {
              
                
                   
                var cong = $("#Cong").val();
			    var dao = $("#Dao").val();
			
			    if(cong==''){alert("请选择开始时间!");return;};
			    if(dao==''){alert("请选择结束时间!");return;};
			 
                    $.ajax({
                        type: 'POST',
                        url: "ribaob!ribaobMET.action",
                      data: {"cong":cong,"dao":dao},
                       datatype: "json",
                          cache: false,


                        beforeSend: function () {
                            common.loading = true;
                            common.showLoading("数据获取中...");
                        },
                        complete: function () {
                            common.loading = false;
                            common.hideLoading();
                        },
                        success: function (json1) {
                        
                  
                
                           var json = JSON2.parse(json1);
                    
                     var manager = $("#maingrid4").ligerGrid({
                columns: [
                          { display: '序号', name: 'xh', width:80}, 
                          { display: '团/个检', name: 'tgj', width: 90}, 
                          { display: '到检机构', name: 'djjg', width: 130 }, 
                          { display: '销售员', name: 'xsy', width: 90 }, 
          
                          { display: '收费方式', columns: columns },                        
                          { display: '收费合计', name: 'sfhj', width: 130}
                          ],
                  pageSize: 10, checkbox: false,
              
                rownumbers:false,
          data:json,
                width: '100%', height: '98%' 
            }); 
                        }
            })
                    });

            });
                   
                
                
                
                
       
     
     
    </script>
</head>
<body style="padding:6px; overflow:hidden;"> 

<div id="maingrid1">
</div>
<a class="l-button"  style="width:100px; margin-left :425px;" id="bb">确定</a>
<br/>
    <div id="maingrid4" style="margin:0; padding:0"></div>
 


  <div style="display:none;">

</div>
 
</body>
</html>