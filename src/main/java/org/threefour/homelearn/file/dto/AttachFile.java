package org.threefour.homelearn.file.dto;

import lombok.*;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class AttachFile {
  private Long id;
  private Long referenceKey;
  private String originalName;
  private String saveName;
  private String filePath;
}
