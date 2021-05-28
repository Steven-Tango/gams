package com.cqeec.gams.test.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.cqeec.dao.RoleMapper;
import com.cqeec.gams.entity.Role;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class TestRoleMapper {
	@Autowired
	private RoleMapper roleMapper;

	@Test
	public void testCount() {
		System.out.println("总的记录数"+roleMapper.count());
	}
	
	public void testFindAll() {
		List<Role> list = roleMapper.findAll();
		System.out.println("------------");
		for(Role r:list) {
			System.out.println(r.getId()+"\t"+r.getName());
		}
		System.out.println("----------");
	}

}
