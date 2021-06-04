package com.cqeec.gams.service;

/*
 * 功能模块服务
 * */
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cqeec.gams.dao.FunctionalModuleMapper;
import com.cqeec.gams.entity.FunctionalModule;

@Service
public class FunctionalModuleServiceImpl implements FunctionalModuleService {
	@Autowired
	private FunctionalModuleMapper functionalModuleMapper;

	@Override
	public long count() {
		return functionalModuleMapper.count();
	}

	@Override
	public List<FunctionalModule> findAll() {
		return functionalModuleMapper.findAll();
	}

	@Override
	public FunctionalModule findById(String id) {
		return functionalModuleMapper.findById(id);
	}

	@Override
	public List<FunctionalModule> findPage(int pageNumber, int pageSize) {
		return functionalModuleMapper.findPage(pageNumber, pageSize);
	}

	@Override
	public void insert(FunctionalModule entity) {
		functionalModuleMapper.insert(entity);
	}

	@Override
	public void update(FunctionalModule entity) {
		functionalModuleMapper.update(entity);
	}

	@Override
	public void delete(String id) {
		functionalModuleMapper.delete(id);
	}

}
