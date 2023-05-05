package helper;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;

import javax.servlet.http.Part;

public class HandleImage {

	private static final int SALT_LENGTH = 16;

	public static String handleImageUpload(Part image, String root, String relative) {
		try {
			String ogFileName = image.getSubmittedFileName(); // uploaded file name

			if (image.getSize() > 0) {
				// get file extension
				String fileExtension = "";
				int i = ogFileName.lastIndexOf('.');
				if (i > 0) {
					fileExtension = ogFileName.substring(i + 1);
				}
				String destinationPath = root + relative + "." + fileExtension;
				// delete existing file if it exists
				File existingFile = new File(destinationPath);
				if (existingFile.exists()) {
					Files.delete(existingFile.toPath());
				}
				System.out.print("root: " + root);
				image.write(destinationPath);
				return "/img/" + relative + "." + fileExtension;
			} else {
				// file is empty
				return null;
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		// file is invalid
		return null;
	}

}
