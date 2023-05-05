package helper;

import java.io.IOException;

import javax.servlet.http.Part;

public class HandleImage {

	private static final int SALT_LENGTH = 16;

	public static String HandleImageUpload(Part image, String root, String relative) {
		try {
			String ogFileName = image.getSubmittedFileName(); // uploaded file name

			// get file extenction
			String fileExtension = "";
			System.out.println(ogFileName);
			int i = ogFileName.lastIndexOf('.');
			System.out.println(i);
			if (i > 0) {
				fileExtension = ogFileName.substring(i + 1);
			}
			String destinationPath = root + relative + "." + fileExtension;
			System.out.print("root: " + root);
			image.write(destinationPath);
			return "/img/" + relative + "." + fileExtension;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}
