package org.threefour.homelearn.file.service;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.threefour.homelearn.file.dto.AttachFile;
import org.threefour.homelearn.file.dto.FileRequestDTO;
import org.threefour.homelearn.file.mapper.FileMapper;

import java.util.List;


public interface FileService {

  AttachFile getProfileImageByMemberId(Long memberId);

  int addFile(AttachFile file);

  int removeFile(String saveName);

}
