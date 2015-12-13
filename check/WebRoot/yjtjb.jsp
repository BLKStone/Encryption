<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <title>业绩统计</title>
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
{ display: " 统计机构", name: "jigou", newline: true, type: "select", comboboxName: "Jigou", options: { data: proData1, isMultiSelect: false} }
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
                        url: "yjtjb!yjtjbMET.action",
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
                         columns: [
                          { display: '团检', columns: columns1 },
                          { display: '个检', columns: columns2 }
                          ],
                         pageSize: 10, 
                           width: '74%', 
                                data:json
            }); 
                        }
            })
                    });

            });
                   


           
      
        var columns1 = [
                { display: '人数', name: 'tjrs', width: 140},
                { display: '刊例价', name: 'tjklj', width: 140},
                { display: '结算价', name: 'tjjsj', width: 140 } 
                ];
         var columns2 = [
               { display: '人数', name: 'gjrs', width: 140},
                { display: '刊例价', name: 'gjklj', width: 140},
                { display: '结算价', name: 'gjjsj', width: 140 } 
                ];

                                   
       
    </script>
</head>
<body style="padding:6px; overflow:hidden;"> 
   <div id="maingrid1">

</div>
<a class="l-button"  style="width:100px; margin-left :425px;" id="bb">确定</a>
<br/>

   <div id="maingrid4" style="margin:0; padding:0"></div>
  <div style="display:none;">
  <!-- g data total ttt -->
</div>
 
</body>
</html>
