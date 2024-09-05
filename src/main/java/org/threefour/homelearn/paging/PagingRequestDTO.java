package org.threefour.homelearn.paging;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class PagingRequestDTO {
  private int cp, es, ps;
}
