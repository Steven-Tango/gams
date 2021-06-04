package com.cqeec.gams.test.mapper;

import java.util.List;
import java.util.UUID;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.cqeec.gams.entity.Role;
import com.cqeec.gams.service.RoleService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class TestRoleService {

	@Autowired
	private RoleService roleservice;

	@Test
	public void testCount() {
		System.out.println("总的记录数");
	}

	@Test
	public void testFindAll() {
		List<Role> list = roleservice.findAll();
		System.out.println("------------");
		for (Role r : list) {
			System.out.println(r.getId() + "\t" + r.getName());
		}
		System.out.println("----------");
	}

	@Test
	public void testinsert() {
		Role entity = new Role();
		entity.setId(UUID.randomUUID().toString());
		entity.setName("as");
		roleservice.insert(entity);
	}

}
