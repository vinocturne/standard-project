package org.standard.project.common;

import java.io.File;

public class DeleteUtil {
	public static void deleteImg(String path) {
		String imgPath = path;
		File deleteFile = new File(imgPath);
		if(deleteFile.exists()) {
			//지울 파일이 존재하는 경우 삭제
			deleteFile.delete();
			System.out.println(imgPath + " 파일 삭제 완료");
		}else {
			System.out.println("파일 삭제 실패");
		}
	}
}