package com.fish.system.controller;

import com.fish.business.service.*;
import com.fish.statistics.service.StatsService;
import com.fish.system.service.*;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @ClassName BaseController
 * @Description 控制器的基类，所有的控制器类都要继承该类
 * @Author 柚子茶
 * @Date 2020/11/26 10:22
 * @Version 1.0
 */
public class BaseController {

	@Autowired
	protected UserService userService;

	@Autowired
	protected MenuService menuService;

	@Autowired
	protected NewsService newsService;

	@Autowired
	protected RoleService roleService;

	@Autowired
	protected LabelService labelService;

	@Autowired
	protected MediaService mediaService;

	@Autowired
	protected TempService tempService;

	@Autowired
	protected StatsService statsService;


}
