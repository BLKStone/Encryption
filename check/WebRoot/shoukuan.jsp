<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <title>开票</title>
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
         
        var columns1 = [
                { display: '期初数06', name: 'qcssix', width: 120},
                { display: '本期结算增加数', name: 'bqjszjs', width: 120},
                { display: '本期开票算数', name: 'bqkpss', width: 120},
                { display: '期末06', name: 'qmsix', width: 120 },
                { display: '期初数05', name: 'qcsfive', width: 120 },
                { display: '本期开票数', name: 'bqkpsfive', width: 120 },
                { display: '本期回款数', name: 'bqhksfive', width: 120 },
                { display: '期末05', name: 'qmfive', width: 120 },
                { display: '期末总额', name: 'qmze', width: 120 } 
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
           var cong; var dao;
             $(document).ready(function () {
                $("#bb").click(function () {
              
                
                   
                 cong = $("#Cong").val();
			    dao = $("#Dao").val();
			
			    if(cong==''){alert("请选择开始时间!");return;};
			    if(dao==''){alert("请选择结束时间!");return;};
			 show();
                    
                    });

            });
                   
                
             function show(){
             $.ajax({
                        type: 'POST',
                        url: "shoukuan!shoukuanMET.action",
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
                    
                     var g = manager = $("#maingrid4").ligerGrid({
                columns: [
                          { display: '序号', name: 'xh', width:70 }, 
                          { display: '团/个检', name: 'tgj', width: 80 }, 
                          { display: '到检机构', name: 'djjg', width: 130 }, 
                          { display: '销售员', name: 'xsy', width: 80 }, 
          
                          { display: '应收款', columns: columns1 }                    
                         
                          ],
                  pageSize: 10, checkbox: true,
              data:json,
               toolbar: listToolbar(),
                rownumbers:false,
                width: '100%', height: '99%'      
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
        if (row["qcssix"]==''&&row["qcsfive"]=='')
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
                
                  if (row["qcssix"]==''&&row["qcsfive"]=='')
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
                    { display: "期初数06", name: "qcssix", newline: true, type: "text", validate: { required: true} },
                    { display: "期初数05", name: "qcsfive", newline: true, type: "text", validate: { required: true} }
                    ]
            });
            var title1;
            if (addORedit) {
                title1 = '录入期初数';
            }
            else {
                title1 = '修改期初数';
                common.loadForm(form, row);
            }
            $.ligerDialog.open({
                title: title1,
                target: $("#maingrid5"),
                width: 300, height: 100, isResize: false,
                buttons: [
                { text: '确定', onclick: function (item, dialog) {
                 
               
                    var qcssix = $("#qcssix").val();
                    var qcsfive  = $("#qcsfive").val();
                 
                    if (addORedit) {  
                
                     var xh = row["xh"];  
                                                                   
                        $.ajax({
                            type: 'POST',
                            url: "addshoukuan!addshoukuanMET.action",
                            data: {"xh":xh,"qcssix":qcssix,"qcsfive":qcsfive},
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
              xh = row["xh"];
                        $.ajax({
                            type: 'POST',
                            url: "editshoukuan!editshoukuanMET.action",
                           data: {"xh":xh,"qcssix":qcssix,"qcsfive":qcsfive},
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
