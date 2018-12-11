/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import java.util.List;

/**
 *
 * @author Kaukanoer
 */
public interface InterfaceDAO {
    public boolean insertOrUpdateOrDelete(Object object, boolean isDelete);
    public List<Object> getDatas(Object entity, String key);
    public Object getById(Object entity, String field, Object id);
}
