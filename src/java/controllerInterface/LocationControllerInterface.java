/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllerInterface;

import java.util.List;

/**
 *
 * @author Kaukanoer
 */
public interface LocationControllerInterface {
    public boolean save (String locationId, String streetAddress, String postalCode, String city, String stateProvince, String countryId);
    public boolean delete (String locationId, String city);
    public Object getById (String locationId);
    public List<Object> getAll();
}
