<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <title>费用扣除登记</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
    <link href="Styles/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
    <script type="text/javascript" src="js/base.js"></script>
    <script type="text/javascript" src="js/ligerResizable.js"></script>
    <script type="text/javascript" src="js/ligerGrid.js" ></script> 
    <script type="text/javascript">
         
        var columns = [
                { display: '早餐费', name: 'ContactName', width: 120, align: 'left'},
                { display: '交通费', name: 'ContactName', width: 120, align: 'left'},
                { display: '住宿费', name: 'ContactName', width: 120, align: 'left'},
                { display: '合计', name: 'ContactName', width: 120, align: 'left' },
    
                ];
       
        $(function()
        {
            window['g'] = 
            $("#maingrid4").ligerGrid({
                columns: [
                          { display: '费用扣除登记', columns: columns }                    
                         
                          ],
                  pageSize: 10, checkbox: false,
              
                rownumbers:false,
                width: '100%', height: '100%' 
            });


            $("#pageloading").hide();
        });
    </script>
</head>
<body style="padding:6px; overflow:hidden;"> 
    <div id="maingrid4" style="margin:0; padding:0"></div>
 


  <div style="display:none;">
  <!-- g data total ttt -->
</div>
 
</body>
</html>