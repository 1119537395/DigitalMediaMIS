package com.fish.system.service.impl;

import com.fish.business.dao.*;
import com.fish.statistics.dao.StatsDao;
import com.fish.system.dao.*;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @ClassName BaseService
 * @Description 业务层的基类，所有业务层接口的实现类都要继承此类
 * @Author 柚子茶
 * @Date 2020/11/25 18:54
 * @Version 1.0
 */
public class BaseService {

	@Autowired
	protected UserDao userDao;

	@Autowired
	protected MenuDao menuDao;

	@Autowired
	protected NewsDao newsDao;

	@Autowired
	protected RoleDao roleDao;

	@Autowired
	protected LabelDao labelDao;

	@Autowired
	protected MediaDao mediaDao;

	@Autowired
	protected TempDao tempDao;

	@Autowired
	protected StatsDao statsDao;

}
