package org.threefour.homelearn.file.mapper;

import org.threefour.homelearn.file.dto.AttachFile;
import org.threefour.homelearn.file.dto.FileRequestDTO;

import java.util.List;

public interface FileMapper {
  AttachFile getProfileImageByMemberId(Long memberId);

  int insertFile(AttachFile file);

  int deleteFile(String saveName);
}
