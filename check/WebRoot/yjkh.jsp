<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <title>业绩考核</title>
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
     
     
     
       $(function () { 
       
 
            var g1;
            g1 = $("#maingrid1").ligerForm({
                inputWidth: 150, labelWidth: 90, space: 40,
                fields: [


{ display: "年份", name: "year", newline: true }

]
         
            }); 
           });
           
           
           var year;
            $(document).ready(function () {
                $("#bb").click(function () {
              
                
                   
                year = $("#year").val();
			
			
			    if(year==''){alert("请填写年份!");return;};
			 
			 show();
                   
                    });

            });
                   
       function show(){
        $.ajax({
                        type: 'POST',
                        url: "yjkh!yjkhMET.action",
                      data: {"year":year},
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
                    
                    var g = manager =   $("#maingrid4").ligerGrid({
                columns: [{ display: '销售员', name: 'xsy', width:80 }, 
                          { display: '年度到检任务', name: 'nddjrw', width: 100 }, 
                          { display: '年度回款任务', name: 'ndhkrw', width: 100 }, 
                          
                          { display: '体检单位', name: 'tjdw', width: 130 }, 
                          { display: '预计到检', name: 'yjdj', width: 90 }, 
                          { display: '预计到检刊例', name: 'yjdjkl', width: 90 }, 
                          { display: '预计结算', name: 'yjjs', width: 90 },
                          { display: '已到检人数', name: 'ydjrs', width: 100 },
                          { display: '未到检人数', name: 'wdjrs', width: 100},
                          { display: '到检刊例价', name: 'djklj', width: 90},
                          { display: '到检结算价', name: 'djjsj', width: 90},
                          { display: '平均折扣', name: 'pjzk', width: 90},
                          { display: '平均单价', name: 'pjdj', width:90},
                          { display: '到检机构', name: 'djjg', width: 130},
                          { display: '已结算金额', name: 'yjsje', width: 100},
                          { display: '未结算金额', name: 'wjsje', width: 100},
                          { display: '结算机构', name: 'jsjg', width: 130},
                          { display: '到检完成进度', name: 'djwcjd', width: 100},
                          { display: '回款金额', name: 'hkje', width: 90},
                          { display: '回款完成进度', name: 'hkwcjd', width: 100}
                          ],
                  pageSize: 10, checkbox: true,
                   data:json,
                   toolbar: listToolbar(),
                  
                rownumbers:false,
                height:'99%',
                width: '100%' 
                       }); 
                        }
            })
       }
           
             
    
       
      
     function listToolbar() {

            var items = [];
            items.push({ text: '录入', click: grid_add, img: rootpath + "add.gif" });
            items.push({ text: '修改', click: grid_edit, img: rootpath + "edit.gif" });
          
            

            return { items: items };
           

    
            function grid_add() {
              var row = manager.getSelectedRow();
                if (!row) {
                    common.tip('请选择要录入的行！');
                    return;
                }
          
       if(row[""]==''&&row[""]=='')
       {
                   addORedit = true;
                showDetail(row);
                }
                else {alert("不可录入！");}
            
            }

            function grid_edit() {
                var row = manager.getSelectedRow();
                if (!row) {
                    common.tip('请选择要修改的行！');
                    return;
                }
                 if(row[""]==''&&row[""]=='')
       {
                alert("未录入，不可修改！");
                }
            else{
                  $("#maingrid5").load();
                addORedit = false;
                showDetail(row);
                }
                
                
             
            }
}

 function showDetail(row, action) {
            var form = $("#maingrid5").ligerForm({ inputWidth: 120, labelWidth: 90, space: 40,
                fields: [
//                   
                    { display: "年度到检任务", name: "nddjrw", newline: true, type: "text", validate: { required: true} },
                    { display: "年度回款任务", name: "ndhkrw", newline: true, type: "text", validate: { required: true} }
                    ]
            });
            var title1;
            if (addORedit) {
                title1 = '录入任务';
            }
            else {
                title1 = '修改任务';
                common.loadForm(form, row);
            }
            $.ligerDialog.open({
                title: title1,
                target: $("#maingrid5"),
                width: 300, height: 100, isResize: false,
                buttons: [
                { text: '确定', onclick: function (item, dialog) {
                 
               
                    var nddjrw = $("#nddjrw").val();
                    var ndhkrw  = $("#ndhkrw").val();
                 
                    if (addORedit) {  
                
                     var xsy = row["xsy"];  
                                                                   
                        $.ajax({
                            type: 'POST',
                            url: "addyjkh!addyjkhMET.action",
                            data: {"xsy":xsy,"nddjrw":nddjrw,"ndhkrw":ndhkrw,"year":year},
                            datatype: "json",


                            beforeSend: function () {
                                common.loading = true;
                                common.showLoading("正在录入...");
                            },
                            complete: function () {
                                common.loading = false;
                                common.hideLoading();
                            },


                            success: function (results) {
                                    show();
                                common.tip('录入成功！');

                            }
                        });
            
                        
                    }
            else {
              xsy = row["xsy"];
                        $.ajax({
                            type: 'POST',
                            url: "edityjkh!edityjkhMET.action",
                               data: {"xsy":xsy,"nddjrw":nddjrw,"ndhkrw":ndhkrw,"year":year},
                            datatype: "json",


                            beforeSend: function () {
                                common.loading = true;
                                common.showLoading("正在修改...");
                            },
                            complete: function () {
                                common.loading = false;
                                common.hideLoading();
                            },


                            success: function (results) {
                                 show();
                                common.tip('修改成功！');

                            }
                        });
                
                     
                    }
                    
                    dialog.hide();
                }
                }, { text: '关闭', onclick: function (item, dialog) {
                 
                    dialog.hide();
                }
                }]
            });

        }
    
    </script>
</head>
<body style="padding:6px; overflow:hidden;"> 
<div id="maingrid1">

</div>
<a class="l-button"  style="width:100px; margin-left :425px;" id="bb">确定</a>
<br/>
    <div id="maingrid4" style="margin:0; padding:0"></div>
 <div id="maingrid5" style="margin:0; padding:0"></div>


  <div style="display:none;">
  <!-- g data total ttt -->
</div>
 
</body>
</html>