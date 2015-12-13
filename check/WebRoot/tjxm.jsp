<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <title>体检项目统计分析表</title>
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
    
          var proData1 =
            [{ id: 1, text: '上海陆家嘴体检中心' },
            { id: 2, text: '上海张江体检中心' },
            { id: 3, text: '上海静安体检中心' },
            { id: 4, text: '南京体检中心' },
            { id: 5, text: '南通瑞慈体检中心' },
            { id: 6, text: '南通滨江体检中心' },
            { id: 7, text: '苏州体检中心' },
            { id: 8, text: '上海漕河泾体检中心' },
            { id: 9, text: '深圳瑞慈体检中心' },
            { id: 10, text: '合计' }
           ];
         
         
       $(function () { 
       
            //创建表单结构
            var g1;
            g1 = $("#maingrid1").ligerForm({
                inputWidth: 170, labelWidth: 90, space: 40,
                fields: [

{ display: " 统计时间", name: "Cong", newline: true, type: "date" },
{ display: "到", name: "Dao", newline: false, type: "date" },
{ display: " 统计机构", name: "jigou1", newline: true, type: "select", comboboxName: "Jigou", options: { data: proData1, isMultiSelect: false} }
]
         
            }); 
           });



            $(document).ready(function () {
                $("#bb").click(function () {
              
                
                   
                var cong = $("#Cong").val();
			    var dao = $("#Dao").val();
			    var jigou = $("#Jigou").val();
			    if(cong==''){alert("请选择开始时间!");return;};
			    if(dao==''){alert("请选择结束时间!");return;};
			    if(jigou==''){alert("请选择机构!");return;};
                    $.ajax({
                        type: 'POST',
                        url: "tjxm!tjxmMET.action",
                      data: {"cong":cong,"dao":dao,"jigou":jigou},
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
                         columns: [{ display: '项目名称', name: 'xmmc', width:200 },                          
                          { display: '到检人数', name: 'djrs', width: 150},
                           { display: '到检刊例价', name: 'djklj', width: 150},
                           { display: '到检结算价', name: 'djjsj', width: 150},
                           { display: '平均单价', name: 'pjdj', width: 150 } 
                          ],
                         pageSize: 10, 
                           width: '70%', 
                                data:json
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
