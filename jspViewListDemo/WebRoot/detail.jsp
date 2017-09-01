<%@page import="entity.Item"%>
<%@page import="dao.ItemDAO"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'detail.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	 <style type="text/css">
	   div{
	      float:left;
	      margin-left: 30px;
	      margin-right:30px;
	      margin-top: 5px;
	      margin-bottom: 5px;
	   }
	   div dd{
	      margin:0px;
	      font-size:10pt;
	   }
	   div dd.dd_name
	   {
	      color:blue;
	   }
	   div dd.dd_city
	   {
	      color:#000;
	   }
	</style>
  </head>
  
  <body>
    <h1>商品详情</h1>
    <hr>
    <center>
      <table width="750" height="60" cellpadding="0" cellspacing="0" border="0">
        <tr>
         <%
         	ItemDAO itemdao = new ItemDAO();
        	int id = Integer.parseInt(request.getParameter("id"));
        	
        	Item item = itemdao.getItemById(id);
         %>
          <td width="70%" valign="top">
             <table>
               <tr>
                 <td rowspan="4"><img src="images/<%=item.getPicture() %>" width="200" height="160"/></td>
               </tr>
               <tr>
                 <td><B><%=item.getName() %></B></td> 
               </tr>
               <tr>
                 <td>产地：<%=item.getCity() %> </td>
               </tr>
               <tr>
                 <td>价格：￥<%=item.getPrice() %> </td>
               </tr> 
             </table>
          </td>
        <%
        	String list = "";
        	Cookie cookies[] = request.getCookies();
        	for(Cookie c : cookies){
        		if(c.getName().equals("ListViewCookie")){
        			list = c.getValue();
        		}
        	}
        	
        	list+=request.getParameter("id")+",";
        	String arr[] = list.split(",");
        	if(arr !=null && arr.length>0){
        		if(arr.length>1000){
        			list = "";
        		}
        	}
        	Cookie cookie = new Cookie("ListViewCookie",list);
        	response.addCookie(cookie);
        	
        %>
         
          <!-- 浏览过的商品 -->
          <td width="30%" bgcolor="#EEE" align="center">
             <br>
             <b>您浏览过的商品</b><br>
            
            <%
            	ArrayList<Item> itemList = itemdao.getViewList(list);
            	if(itemList != null){
            		for(int i=0; i<itemList.size();i++){
            		Item item2 = itemList.get(i);
            %>
            
             <div>
             <dl>
               <dt>
                 <a href="detail.jsp?id=<%=item2.getId() %> "><img src="images/<%=item2.getPicture() %> " width="120" height="90" border="1"/></a>
               </dt>
               <dd class="dd_name"><%=item2.getName() %> </dd> 
               <dd class="dd_city">产地:<%=item2.getCity() %> &nbsp;&nbsp;价格:￥<%=item2.getPrice() %>  </dd> 
             </dl>
             </div>
           
           <%}}
            	%>
           
          </td>
        </tr>
      </table>
    </center>
  </body>
</html>
