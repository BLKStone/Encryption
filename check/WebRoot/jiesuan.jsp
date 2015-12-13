<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <title>结算</title>
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
         
        var columns2 = [
                { display: '销售提出', name: 'xstc', width: 120},
                { display: '财务审核', name: 'cwsh', width: 120},
                { display: '开票', name: 'kp', width: 130, align: 'center'},
                { display: '形成收款通知', name: 'xcsktz', width: 130, align: 'center' } 
                ];
        var columns1 = [
                { display: '开票机构', name: 'kpjg', width: 130, align: 'center'},
                { display: '开票抬头', name: 'kptt', width: 120, align: 'center'},
                { display: '开票日期', name: 'kprq', width: 120, align: 'center'},
                { display: '开票金额', name: 'kpje', width: 120, align: 'center' },
                { display: '结算开票/预开票', name: 'jskpykp', width: 130, align: 'center' },
                { display: '发票号', name: 'fph', width: 140, align: 'center' } 
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
                        url: "jiesuan!jiesuanMET.action",
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
                    
                    var g = manager =  $("#maingrid4").ligerGrid({
                columns: [
                         { display: '序号', name: 'xh', width:70 }, 
                          { display: '团/个检', name: 'tgj', width: 80 }, 
                          { display: '到检机构', name: 'djjg', width: 130 }, 
                          { display: '销售员', name: 'xsy', width: 80 }, 
   
                          { display: '结算开票', columns: columns2 },
                          { display: '结算情况', columns: columns1 }                   
                         
                          ],
                 pageSize: 10, 
                 
                 checkbox: true,
                width: '100%', 
                height: '98%' ,
                 data:json,
                toolbar: listToolbar()  
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
              
                
                
                
       if (row["xstc"]==''&&row["cwsh"]==''&&row["kp"]==''&&row["xcsktz"]==''&&row["kptt"]=='')
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
                
                 if (row["xstc"]==''&&row["cwsh"]==''&&row["kp"]==''&&row["xcsktz"]==''&&row["kptt"]=='')
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
                    { display: "销售提出", name: "xstc", newline: true, type: "text", validate: { required: true} },
                    { display: "财务审核", name: "cwsh", newline: false, type: "text", validate: { required: true} },
                    { display: "开票", name: "kp", newline: true, type: "text", validate: { required: true} },
                    { display: "形成收款通知", name: "xcsktz", newline: false, type: "text", validate: { required: true} },                 
                    { display: "开票抬头", name: "kptt", newline: true, type: "text", validate: { required: true} }
                    ]
            });
            var title1;
            if (addORedit) {
                title1 = '录入';
            }
            else {
                title1 = '修改';
                common.loadForm(form, row);
            }
            $.ligerDialog.open({
                title: title1,
                target: $("#maingrid5"),
                width: 600, height: 200, isResize: false,
                buttons: [
                { text: '确定', onclick: function (item, dialog) {
                 
               
                    var xstc = $("#xstc").val();
                    var cwsh  = $("#cwsh").val();
                    var kp = $("#kp").val();
                    var xcsktz  = $("#xcsktz").val();
                    var kptt = $("#kptt").val();
               
                 var xh;
                    if (addORedit) {  
                
                      xh = row["xh"];  
                                                                   
                        $.ajax({
                            type: 'POST',
                            url: "addjiesuan!addjiesuanMET.action",
                            data: {"xh":xh,"xstc":xstc,"cwsh":cwsh,"kp":kp,"xcsktz":xcsktz,"kptt":kptt},
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
                            url: "editjiesuan!editjiesuanMET.action",
                             data: {"xh":xh,"xstc":xstc,"cwsh":cwsh,"kp":kp,"xcsktz":xcsktz,"kptt":kptt},
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