package org.threefour.homelearn.file;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.threefour.homelearn.file.dto.AttachFile;

import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.UUID;

@Component
public class FileUtil {
  private String filePath;
  private SimpleDateFormat sdf;

  public FileUtil() {
    sdf = new SimpleDateFormat("yyyy-MM-dd");
    filePath = "C:" + File.separator + "files" + File.separator + sdf.format(System.currentTimeMillis());
  }

  public AttachFile fileSave(MultipartFile multipartFile, Long referenceKey) {
    File f = new File(filePath);
    if (!f.exists()) f.mkdirs();

    if (multipartFile.isEmpty()) return null;

    String originalName = multipartFile.getOriginalFilename();
    String saveFileName = UUID.randomUUID().toString().substring(0, 8) + "_" + originalName;

    AttachFile build = null;
    try {
      multipartFile.transferTo(new File(f.getAbsolutePath() + File.separator + saveFileName));
      build = AttachFile.builder()
              .referenceKey(referenceKey)
              .originalName(originalName)
              .saveName(saveFileName)
              .filePath(f.getAbsolutePath())
              .build();
    } catch (IOException e) {
      e.printStackTrace();
    }

    return build;
  }

}
