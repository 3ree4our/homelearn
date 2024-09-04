package org.threefour.homelearn.member.mapper;

import org.springframework.transaction.annotation.Transactional;
import org.threefour.homelearn.member.dto.RefreshToken;

public interface RefreshMapper {
  RefreshToken existsByRefreshToken(String refreshToken);

  int deleteByRefreshToken(String refreshToken);

  void insertRefresh(RefreshToken refreshToken);
}
