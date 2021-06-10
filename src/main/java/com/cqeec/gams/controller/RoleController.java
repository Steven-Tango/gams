package com.cqeec.gams.controller;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cqeec.gams.entity.Role;
import com.cqeec.gams.service.RoleService;

@Controller
@RequestMapping("/app/role/")
public class RoleController {
	@Autowired
	private RoleService roleService;

	@RequestMapping("/delete.html")
	public ModelAndView delete(String page, String size, String id) {
		ModelAndView mav = new ModelAndView("redirect:/app/role/list.html");
		int pageNumber = (page == null || "".equals(page)) ? 1 : Integer.parseInt(page);
		int pageSize = (size == null || "".equals(size)) ? 2 : Integer.parseInt(size);
		try {
			roleService.delete(id);
			mav.addObject("message", "删除数据成功！");
		} catch (Exception e) {
			e.printStackTrace();
			mav.addObject("message", "删除数据失败！");
		}
		mav.addObject("page", pageNumber);
		mav.addObject("size", pageSize);
		return mav;
	}

	@RequestMapping("/update.html")
	public ModelAndView update(String page, String size, Role role) {
		ModelAndView mav = new ModelAndView("role/edit");
		int pageNumber = (page == null || "".equals(page)) ? 1 : Integer.parseInt(page);
		int pageSize = (size == null || "".equals(size)) ? 2 : Integer.parseInt(size);
		try {
			roleService.update(role);
			mav.addObject("message", "保存数据成功！");
		} catch (Exception e) {
			e.printStackTrace();
			mav.addObject("message", "保存数据失败！");
		}
		mav.addObject("obj", role);
		mav.addObject("page", pageNumber);
		mav.addObject("size", pageSize);
		return mav;
	}

	@RequestMapping("/save.html")
	public ModelAndView save(String page, String size, Role role, RedirectAttributes ra) {
		ModelAndView mav = new ModelAndView("redirect:/app/role/add.html");
		int pageNumber = (page == null || "".equals(page)) ? 1 : Integer.parseInt(page);
		int pageSize = (size == null || "".equals(size)) ? 2 : Integer.parseInt(size);
		String id = role.getId();
		if (id == null || "".equals(id)) {
			role.setId(UUID.randomUUID().toString().toUpperCase());
		}
		try {
			roleService.insert(role);
			ra.addFlashAttribute("message", "保存数据成功！");
		} catch (Exception e) {
			e.printStackTrace();
			ra.addFlashAttribute("message", "保存数据失败！");
		}
		ra.addFlashAttribute("page", pageNumber);
		ra.addFlashAttribute("size", pageSize);
		return mav;
	}

	@RequestMapping("/list.html")
	public ModelAndView list(String page, String size, String name) {
		ModelAndView mav = new ModelAndView("role/list");
		int pageNumber, pageSize;
		pageNumber = (page == null || "".equals(page)) ? 1 : Integer.parseInt(page);
		pageSize = (size == null || "".equals(size)) ? 2 : Integer.parseInt(size);

		long total;
		Role role = new Role();
		if (name == null || "".equals(name)) {
			// 没有条件查询
			total = roleService.count();
		} else {
			// 条件查询
			role.setName("%" + name + "%");
			total = roleService.count(role);
		}
		int pages = (int) (total % pageSize == 0 ? total / pageSize : total / pageSize + 1);
		if (total == 0) {
			pageNumber = 0;
		} else {
			if (pageNumber > pages) {
				pageNumber = pages;
			}
			List<Role> list;
			if (name == null || "".equals(name)) {
				// 没有条件查询
				list = roleService.findPage(pageNumber, pageSize);
			} else {
				// 条件查询
				list = roleService.findByConditionPage(pageNumber, pageSize, role);
			}
			mav.addObject("list", list);
		}
		mav.addObject("pages", pages);
		mav.addObject("total", total);
		mav.addObject("page", pageNumber);
		mav.addObject("size", pageSize);
		mav.addObject("name", name);
		return mav;
	}

	@RequestMapping("/add.html")
	public String gotoAddPage(String page, String size, Model model) {
		int pageNumber = (page == null || "".equals(page)) ? 1 : Integer.parseInt(page);
		int pageSize = (size == null || "".equals(size)) ? 2 : Integer.parseInt(size);
		model.addAttribute("page", pageNumber);
		model.addAttribute("size", pageSize);
		return "role/add";
	}

	@RequestMapping("/edit.html")
	public String gotoEditPage(String id, String page, String size, Model model) {
		int pageNumber = (page == null || "".equals(page)) ? 1 : Integer.parseInt(page);
		int pageSize = (size == null || "".equals(size)) ? 2 : Integer.parseInt(size);
		Role role = roleService.findById(id);
		model.addAttribute("obj", role);
		model.addAttribute("page", pageNumber);
		model.addAttribute("size", pageSize);
		return "role/edit";
	}

}
