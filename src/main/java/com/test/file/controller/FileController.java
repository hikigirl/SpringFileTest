package com.test.file.controller;

import java.io.File;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class FileController {
	@GetMapping("/ex01.do")
	public String ex01() {
		return "ex01";
	}
	
	@PostMapping("/ex01ok.do")
	public String ex01ok(Model model, String txt, 
			MultipartFile attach, HttpServletRequest req) {
		//System.out.println(txt);
		System.out.println(attach.getName()); //태그의 name 속성값
		System.out.println(attach.getOriginalFilename()); //업로드한 파일명
		System.out.println(attach.getContentType()); //MIME 타입
		System.out.println(attach.getSize()); //크기(Byte)
		System.out.println(attach.isEmpty()); //업로드 유무
		
		//업로드한 파일은 어디로 갔는가...
		// - 임시 폴더에 있는 업로드 파일 -> 이동 -> 보관 폴더(files)
		
		String path = req.getServletContext().getRealPath("/resources/files");
		
		System.out.println(path);
		
		try {
//			String filename = getUniqueFileName(path, attach.getOriginalFilename());
//			String filename = getUniqueFileName2(attach.getOriginalFilename());
			String filename = getUniqueFileName3(attach.getOriginalFilename());
			File file = new File(path + "\\" + filename);
			attach.transferTo(file); //이동시켜줌
			
			model.addAttribute("txt", txt);
			model.addAttribute("filename", filename);
			model.addAttribute("filetype", attach.getContentType());
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "ex01ok";
	}

	private String getUniqueFileName3(String filename) {
		// UUID
		UUID uuid = UUID.randomUUID();
		System.out.println(uuid);
		return uuid+ "_" + filename;
	}

	private String getUniqueFileName2(String filename) {
		// 중복검사없이 유일한 파일명을 만들기
		return System.nanoTime() + "_" + filename;
	}

	private String getUniqueFileName(String path, String filename) {
		// files 폴더에 같은 이름의 파일이 있는지 확인 -> 중복된 이름이 있으면 이름 변경
		int n = 1;
		
		File file = null;
		String tempName = "";
		while (true) {
			
			file = new File(path + "\\" + filename); //test.txt
			
			if(file.exists()) {
				int lastIndex = filename.lastIndexOf(".");
				String fileNameWithoutExtension = filename.substring(0, lastIndex); //test
				if (tempName =="") {
					tempName = fileNameWithoutExtension;
				}
				String extension = filename.substring(lastIndex); //.txt
				
				filename = tempName + "_" + n + extension;
				n++;
				
			} else {
				return file.getName();
			}	
		}
	}
}
