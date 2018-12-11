<%-- 
    Document   : view
    Created on : Dec 11, 2018, 9:17:51 PM
    Author     : Kaukanoer
--%>

<%@page import="enitities.Locations"%>
<%@page import="tools.HibernateUtil"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="controller.LocationController"%>
<%@page import="controllerInterface.LocationControllerInterface"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Location Page</title>
    </head>
    <body>
        <h1 align="center">Hello Location!</h1>
        <%
            String locationId = "";
            String streetAddress = "";
            String postalCode = "";
            String city = "";
            String stateProvince = "";
            String countryId = "";
            if (session.getAttribute("isiLocation") != null) {
                Locations l = (Locations) session.getAttribute("isiLocation");
                locationId = l.getLocationId().toString();
                streetAddress= l.getStreetAddress();
                postalCode = l.getPostalCode();
                city = l.getCity();
                stateProvince = l.getStateProvince();
                countryId = l.getCountryId().getCountryId();
            }
        %>
        <form action="../addLocation" >
            <table align="center">
                <thead>
                    <tr>
                        <td>Location Id</td>
                        <td>:</td>
                        <td><input type="text" name="locationId" value="<%=locationId%>" /></td>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Street Address</td>
                        <td>:</td>
                        <td><input type="text" name="streetAddress" value="<%=streetAddress%>" /></td>
                    </tr>
                    <tr>
                        <td>Postal Code</td>
                        <td>:</td>
                        <td><input type="text" name="postalCode" value="<%=postalCode%>" /></td>
                    </tr>
                    <tr>
                        <td>City</td>
                        <td>:</td>
                        <td><input type="text" name="city" value="<%=city%>" /></td>
                    </tr>
                    <tr>
                        <td>State Province</td>
                        <td>:</td>
                        <td><input type="text" name="stateProvince" value="<%=stateProvince%>" /></td>
                    </tr>
                    <tr>
                        <td>Country Id</td>
                        <td>:</td>
                        <td><input type="text" name="countryId" value="<%=countryId%>" /></td>
                    </tr>
                    <% session.removeAttribute("isiLocation");%>
                    <tr>
                        <td colspan="3" align="center"><input type="submit" value="Save" /></td>
                    </tr>
                </tbody>
            </table>
        </form>
        <table border="1" align="center">
            <thead>
                <tr>
                    <th>No</th>
                    <th>location ID</th>
                    <th>Street Address</th>
                    <th>Postal Code</th>
                    <th>City</th>
                    <th>State Province</th>
                    <th>Country Name</th>
                    <th colspan="2">Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                    SessionFactory factory = HibernateUtil.getSessionFactory();
                    LocationControllerInterface lci = new LocationController(factory);
                    int nomor = 0;
                    for (Object elem : lci.getAll()) {
                        Locations location = (Locations) elem;
                        nomor++;

                %>
                <tr>
                    <td><%= nomor%></td>
                    <td><%= location.getLocationId()%></td>
                    <td><%= location.getStreetAddress()%></td>
                    <td><%= location.getPostalCode()%></td>
                    <td><%= location.getCity()%></td>
                    <td><%= location.getStateProvince()%></td>
                    <td><%= location.getCountryId().getCountryName()%></td>                     
                    <td><a href="../editLocation?id=<%=location.getLocationId()%>" style="text-decoration: none; color: black">Edit</a></td>                    
                    <td><a href="../deleteLocation?id=<%=location.getLocationId()%>" style="text-decoration: none; color: black">Delete</a></td>                     

                    <%       }
                    %>
                </tr>
            </tbody>
        </table>

    </body>
</html>
