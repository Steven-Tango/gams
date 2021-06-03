INSERT INTO `account` VALUES ('9a798606-c27d-11eb-8213-6c4b909d2624', '张三', 'ZS', '123', '');

INSERT INTO `functionalmodule` VALUES ('258b3ef4-c270-11eb-8213-6c4b909d2624', '1', null, '系统管理', null);
INSERT INTO `functionalmodule` VALUES ('6f45c1d2-c270-11eb-8213-6c4b909d2624', '2', '258b3ef4-c270-11eb-8213-6c4b909d2624', '用户管理', 'app/user/list.html');
INSERT INTO `functionalmodule` VALUES ('6f53b6c6-c270-11eb-8213-6c4b909d2624', '2', '258b3ef4-c270-11eb-8213-6c4b909d2624', '添加用户', 'app/user/add.html');
INSERT INTO `functionalmodule` VALUES ('6f576fd6-c270-11eb-8213-6c4b909d2624', '2', '258b3ef4-c270-11eb-8213-6c4b909d2624', '角色管理', 'app/role/list.html');
INSERT INTO `functionalmodule` VALUES ('6f5b07f5-c270-11eb-8213-6c4b909d2624', '2', '258b3ef4-c270-11eb-8213-6c4b909d2624', '添加角色', 'app/role/add.html');

INSERT INTO `role` VALUES ('1', '新生');
INSERT INTO `role` VALUES ('78d4d1ce-5510-48ce-b120-da4bf619be21', '系统管理员');
INSERT INTO `role` VALUES ('ece313e5-56e8-48bf-bb64-3f3eac32c8b3', '教师');

