package org.standard.project;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class FileDownloadController {
	private static String CURR_IMAGE_REPO_PATH = "c:\\spring\\image_repo";

	@RequestMapping("/download")
	public void download(@RequestParam("imageFileName") String imageFileName,
			                 HttpServletResponse response)throws Exception {
		OutputStream out = response.getOutputStream();
		String downFile = CURR_IMAGE_REPO_PATH + "\\" + imageFileName;
		File file = new File(downFile);

		response.setHeader("Cache-Control", "no-cache");
		response.addHeader("Content-disposition", "attachment; fileName=" + imageFileName);
		FileInputStream in = new FileInputStream(file);
		byte[] buffer = new byte[1024 * 8];
		while (true) {
			int count = in.read(buffer); // ���ۿ� �о���� ���ڰ���
			if (count == -1) // ������ �������� �����ߴ��� üũ
				break;
			out.write(buffer, 0, count);
		}
		in.close();
		out.close();
	}

}
