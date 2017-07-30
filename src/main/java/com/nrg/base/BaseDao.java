/**
 */
package com.nrg.base;

import java.util.List;

/**
 * DAO支持类实现
 * @author 
 * @version 
 */
public interface BaseDao<T> {
    /**
     * 获取单条数据
     * @param id
     * @return
     */
    public T get(Long id);

    /**
     * 获取单条数据
     * @param entity
     * @return
     */
    public T getByEntity(T entity);


    /**
     * 查询数据列表，如果需要分页，请设置分页对象，如：entity.setPage(new Page<T>());
     * @param entity
     * @return
     */
    public List<T> findList(T entity);

    /**
     * 查询所有数据列表
     * @param entity
     * @return
     */
    public List<T> findAllList(T entity);

    /**
     * 查询所有数据列表
     * @see public List<T> findAllList(T entity)
     * @return
     */
//	@Deprecated
    public List<T> findAllList();

    /**
     * 插入数据
     * @param entity
     * @return
     */
    public int insert(T entity);

    /**
     * 根据条件进行新增
     * @param entity
     * @return
     */
    public int insertSelective(T entity);

    /**
     * 更新数据
     * @param entity
     * @return
     */
    public int update(T entity);

    public int updateByCondition(T entity);


    /**
     * 删除数据（一般为逻辑删除，更新del_flag字段为1）
     * @param id
     * @see public int delete(T entity)
     * @return
     */
    public int delete(Long id);

    /**
     * 删除数据（一般为逻辑删除，更新del_flag字段为1）
     * @param entity
     * @return
     */
    public int deleteByEntity(T entity);

    /**
     * 根据id批量删除,软删除
     * @param ids 1,2,3,4
     */
    public void batchDelete(List<Long> ids);

    /**
     * 根据id批量删除,物理删除
     * @param ids 1,2,3,4
     */
    public void batchRemove(List<Long> ids);

    /**
     * 物理删除
     */
    public int remove(Long id);

    /**
     * 物理删除
     * add by zhoubao on 20160505
     * mapper没有按此方法生成，调用时，需要自己编写此mapper
     * 参考dict/DepartmentLeaderMapper.xml
     * @param entity
     * @return
     */
    public int removeByEntity(T entity);
}