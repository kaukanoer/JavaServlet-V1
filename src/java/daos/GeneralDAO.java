/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import java.util.List;
import org.hibernate.SessionFactory;

/**
 *
 * @author Kaukanoer
 */
public class GeneralDAO implements InterfaceDAO {

    private FunctionDAO fdao;

    public GeneralDAO(SessionFactory factory) {
        this.fdao = new FunctionDAO(factory);
    }

    @Override
    public boolean insertOrUpdateOrDelete(Object object, boolean isDelete) {
        return this.fdao.insertOrUpdateOrDelete(object, isDelete);
    }

    @Override
    public List<Object> getDatas(Object entity, String key) {
        return this.fdao.getDatas(entity, key);
    }

    @Override
    public Object getById(Object entity, String field, Object id) {
        return this.fdao.getById(entity, field, id);
    }
}
