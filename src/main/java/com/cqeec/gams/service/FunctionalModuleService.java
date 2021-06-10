package com.cqeec.gams.service;

import java.util.List;

import com.cqeec.gams.entity.FunctionalModule;
import com.cqeec.gams.service.core.BasesService;

public interface FunctionalModuleService extends BasesService<FunctionalModule> {

	List<FunctionalModule> getAllFunctionGroup();

}
