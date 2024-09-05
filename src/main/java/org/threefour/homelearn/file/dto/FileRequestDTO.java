package org.threefour.homelearn.file.dto;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class FileRequestDTO {
  private String filePath;
  private String saveName;
}
