<%-- 
    Document   : view
    Created on : Dec 11, 2018, 9:59:59 AM
    Author     : Kaukanoer
--%>

<%@page import="enitities.Regions"%>
<%@page import="daos.GeneralDAO"%>
<%@page import="tools.HibernateUtil"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="daos.InterfaceDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>  
        <%
            String idEdit =""; String nameEdit ="";
            if (session.getAttribute("isiRegion")!=null){
                Regions r = (Regions) session.getAttribute("isiRegion");
                idEdit = r.getRegionId().toString();
                nameEdit = r.getRegionName();
            }
        %>
        <form action="../addRegion">
            <table border="0">
                <thead>
                    <tr>
                        <td>Region Id</td>
                        <td>:</td>
                        <td><input type="text" name="inputRegionId" value="<%=idEdit%>" /></td>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Regin Name</td>
                        <td>:</td>
                        <td><input type="text" name="inputRegionName" value="<%=nameEdit%>" /></td>
                    </tr>
                    <% session.removeAttribute("isiRegion");%>
                    <tr>
                        <td colspan="3"><input type="submit" value="Simpan" name="btnSimpan"/></td>                    
                    </tr>
                </tbody>
            </table>
        </form>
        <table border="1" style="border-collapse: collapse">
            <thead>
                <tr>
                    <th>Region Id</th>
                    <th>Region Name</th>
                </tr>
            </thead>            
            <tbody> 
                <%
                    SessionFactory factory = HibernateUtil.getSessionFactory();
                    InterfaceDAO idao = new GeneralDAO(factory);
                    for (Object object : idao.getDatas(new Regions(), "")) {
                        Regions region = (Regions) object;
                %>
                <tr>
                    <td><%= region.getRegionId()%></td>
                    <td><%=region.getRegionName()%></td>
                    <td><a href="../editRegion?id=<%=region.getRegionId()%>">Edit</a></td>
                    <td><a href="../deleteRegion?id=<%=region.getRegionId()%>">delete</a></td>
                    <%       }
                    %>
                </tr>
            </tbody>
        </table>
    </body>
</html>
