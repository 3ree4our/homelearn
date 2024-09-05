package org.threefour.homelearn.file.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.*;
import org.threefour.homelearn.file.FileUtil;
import org.threefour.homelearn.file.dto.AttachFile;
import org.threefour.homelearn.file.dto.FileRequestDTO;
import org.threefour.homelearn.file.service.FileService;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.net.MalformedURLException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Collection;
import java.util.List;

@RestController
@RequestMapping("/files")
@RequiredArgsConstructor
public class FileController {

  private final FileService fileService;

  @GetMapping(value = "/{id}")
  public ResponseEntity<byte[]> getProfileImage(@PathVariable Long id) {
    AttachFile fileByMemberId = fileService.getProfileImageByMemberId(id);
    ResponseEntity<byte[]> result = null;
    try {
      HttpHeaders header = new HttpHeaders();
      File f = new File(fileByMemberId.getFilePath() + File.separator + fileByMemberId.getSaveName());
      header.add("Content-Type", Files.probeContentType(f.toPath()));
      result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(f), header, HttpStatus.OK);
    } catch (IOException e) {
      e.printStackTrace();
    }

    return result;
  }

}
