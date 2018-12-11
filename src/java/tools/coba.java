/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tools;

import controller.LocationController;
import controllerInterface.LocationControllerInterface;
import daos.GeneralDAO;
import enitities.Locations;
import java.io.IOException;
import static java.lang.System.out;
import org.hibernate.SessionFactory;

/**
 *
 * @author Kaukanoer
 */
public class coba {

    public static void main(String[] args) throws IOException {
        SessionFactory factory = HibernateUtil.getSessionFactory();
        System.out.println(factory);
        LocationControllerInterface lci = new LocationController(factory);
//        Locations l = new Locations(new Short("3300"), );
//        System.out.println(lci.delete("3300", "Balikpapan"));
        for (Object object : lci.getAll()) {
            Locations l = (Locations) object;
            System.out.println(l.getCity()+ l.getCountryId().getCountryName());
        }
    }
}
