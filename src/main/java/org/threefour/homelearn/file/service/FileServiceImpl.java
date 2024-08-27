package org.threefour.homelearn.file.service;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.threefour.homelearn.file.dto.AttachFile;
import org.threefour.homelearn.file.dto.FileRequestDTO;
import org.threefour.homelearn.file.mapper.FileMapper;

import java.util.Collections;
import java.util.List;

@Service
@RequiredArgsConstructor
public class FileServiceImpl implements FileService {

  private final FileMapper fileMapper;


  @Override
  public AttachFile getProfileImageByMemberId(Long memberId) {
    return fileMapper.getProfileImageByMemberId(memberId);
  }

  @Override
  public int addFile(AttachFile file) {
    return fileMapper.insertFile(file);
  }

  @Override
  public int removeFile(String saveName) {
    return fileMapper.deleteFile(saveName);
  }
}
