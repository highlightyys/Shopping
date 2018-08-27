package com.neuedu.utils;

import java.io.File;
import java.io.IOException;
import java.util.Random;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;


public class UploadUtils {
	/**
	 * 获取文件真实名称
	 * 由于浏览器的不同获取的名称可能为:c12312231abd:/upload/1.jpg或者1.jpg 
	 * 最终获取的为  1.jpg .jpg
	 * @param name 上传上来的文件名称
	 * @return	真实名称
	 */
	public static String getRealName(String name){
		//获取最后一个"/"
		int index = name.lastIndexOf("\\");
		return name.substring(index+1);
	}
	
	
	/**
	 * 获取随机名称
	 * @param realName 真实名称
	 * @return uuid 随机名称
	 */
	public static String getUUIDName(String realName){
		//realname  可能是  1.jpg   也可能是  1
		//获取后缀名
		int index = realName.lastIndexOf(".");
		if(index==-1){
			return UUID.randomUUID().toString().replace("-", "").toUpperCase();
		}else{
			return UUID.randomUUID().toString().replace("-", "").toUpperCase()+realName.substring(index);
		}
	}
	
	
	/**
	 * 获取文件目录,可以获取256个随机目录
	 * @return 随机目录
	 *
	 *
	 */
	public static String getDir(){
		String s="0123456789ABCDEF";
		Random r = new Random();
		return "/"+s.charAt(r.nextInt(16))+"/"+s.charAt(r.nextInt(16));
	}
	
	public static String fileUpload(String basePath,HttpServletRequest request,MultipartFile multipartFile ) {
		String uuidName = getUUIDName(multipartFile.getOriginalFilename());
		
		String realBasepath = request.getRealPath(basePath);
		
		String dir = getDir();
		
		File filedir = new File(realBasepath + dir);
		if(!filedir.exists()) {
			filedir.mkdirs();
		}
		
		File file = new File(filedir,uuidName);
		
		try {
			multipartFile.transferTo(file);
		} catch (IllegalStateException | IOException e) {			
			e.printStackTrace();
		}
		return basePath + dir + "/" + uuidName;
	
	}
	
	
	public static void main(String[] args) {
		//String s="G:\\day17-基础加强\\resource\\1.jpg";
		String s="1";
		String realName = getRealName(s);
		System.out.println(realName);
		
		String uuidName = getUUIDName(realName);
		System.out.println(uuidName);
		
		String dir = getDir();
		System.out.println(dir);
	}
}
