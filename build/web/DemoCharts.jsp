<%-- 
    Document   : DemoCharts
    Created on : Apr 10, 2022, 7:20:52 PM
    Author     : Sagar Timalsina
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
        <script type="text/javascript" src="http://www.gstatic.com/charts/loader.js"></script>
        <script>
            $(document).ready(function(){
                $.ajax({
                    url:"ChartController",
                    dataType:"JSON",
                    success:function(result){
                        google.charts.load('current',{'packages':['corechart']});
                        google.charts.setOnLoadCallback(function(){
                            drawChart(result);
                        });
                    }
            
            
                });
             function drawChart(result){
                var data=new google.visualization.DataTable();
                data.addColumn('string','Name');
                data.addColumn('number','Quantity');
                var dataArray=[];
                $.each(result,function(i,obj){
                   dataArray.push([obj.name,obj.quantity]); 
                });
                data.addRows(dataArray);
                 var piechart_options={
                     title:"Pie chart",
                     width:400,
                     height:300
                 };
                 var piechart=new google.visualization.PieChart(
                    document.getElementById('piechart_div'));
                    piechart.draw(data,piechart_options);
                                 
                 
             }   
    
            });
            
            
            
        </script>
        
        
    </head>
    <body>
        <table class="columns">
            <tr>
                <td><div id="piechart_div" style="border: 1px solid #ccc"></div></td>
                <td><div id="barchart_div" style="border: 1px solid #ccc"></div></td>
                
            </tr>
        </table>
    </body>
</html>
