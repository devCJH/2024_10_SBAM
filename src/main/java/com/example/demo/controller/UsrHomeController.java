package com.example.demo.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.dto.CartInMenuId;
import com.example.demo.dto.FileDto;
import com.example.demo.dto.MenuId;
import com.example.demo.service.FileService;
import com.example.demo.util.Util;

@Controller
public class UsrHomeController {
	
	@Value("${custom.apiTest1.key}")
	private String apiTest1Key;
	
	private FileService fileService;
	
	public UsrHomeController(FileService fileService) {
		this.fileService = fileService;
	}
	
	@GetMapping("/usr/home/main")
	public String showMain(Model model) {
		
		List<MenuId> menuIds = new ArrayList<>();
		menuIds.add(new MenuId(1));
		menuIds.add(new MenuId(2));
		menuIds.add(new MenuId(3));
		menuIds.add(new MenuId(4));
		menuIds.add(new MenuId(5));
		
		List<CartInMenuId> cartInMenuIds = new ArrayList<>();
		cartInMenuIds.add(new CartInMenuId(2));
		cartInMenuIds.add(new CartInMenuId(4));
		
		model.addAttribute("menuIds", menuIds);
		model.addAttribute("cartInMenuIds", cartInMenuIds);
		
		return "usr/home/main";
	}
	
	@GetMapping("/")
	public String showRoot() {
		return "redirect:/usr/home/main";
	}
	
	@GetMapping("/usr/home/popUp")
	public String popUp() {
		return "usr/home/popUp";
	}
	
	@GetMapping("/usr/home/apiTest1")
	public String apiTest1(Model model) {
		model.addAttribute("apiTest1Key", apiTest1Key);
		return "usr/home/apiTest1";
	}
	
	@GetMapping("/usr/home/apiTest2")
	public String apiTest2() {
		return "usr/home/apiTest2";
	}
	
	@PostMapping("/usr/home/upload")
	@ResponseBody
	public String upload(MultipartFile file) {
		if (file.isEmpty()) {
			return Util.jsReturn("파일이 선택되지 않았습니다", null);
		}
		
		try {
			fileService.saveFile(file);
		} catch (IOException e) {
			e.printStackTrace();
			return Util.jsReturn("파일을 업로드 하는데 문제가 발생했습니다", null);
		}
		
		return Util.jsReturn("파일 업로드 성공", "/");
	}
	
	@GetMapping("/usr/home/view")
	public String view(Model model) {
		
		List<FileDto> files = fileService.getFiles();
		
		model.addAttribute("files", files);
		
		return "usr/home/view";
	}
	
	@GetMapping("/usr/home/file/{fileId}")
	@ResponseBody
	public Resource fileLoad(Model model, @PathVariable("fileId") int id) throws IOException {
		
		FileDto fileDto = fileService.getFileById(id);
		
		return new UrlResource("file:" + fileDto.getSavedPath());
	}
	
	@GetMapping("/usr/home/checkboxSubmit")
	@ResponseBody
	public String checkboxSubmit(@RequestParam(name = "ids", required = false) List<Integer> ids) {
		
		if (ids == null) {
			return Util.jsReturn("체크박스 미선택", "/");
		}
		
		for (int id : ids) {
			System.out.println("id : " + id);
		}
		
		return Util.jsReturn("전송된 체크박스 값 확인", "/");
	}
	
}
