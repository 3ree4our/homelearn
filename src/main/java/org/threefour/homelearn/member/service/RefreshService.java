package org.threefour.homelearn.member.service;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.threefour.homelearn.member.dto.RefreshToken;
import org.threefour.homelearn.member.mapper.RefreshMapper;

import javax.servlet.http.Cookie;
import java.sql.Timestamp;
import java.util.Date;

@Service
@RequiredArgsConstructor
@Transactional
public class RefreshService {

  private final RefreshMapper refreshMapper;

  public String getRefreshToken(Cookie[] cookies) {
    String refreshToken = "";
    if (cookies != null) {
      for (Cookie cookie : cookies) if (cookie.getName().startsWith("refresh")) refreshToken = cookie.getValue();
    }
    return refreshToken;
  }

  public int deleteRefreshToken(String refreshToken) {
    return refreshMapper.deleteByRefreshToken(refreshToken);
  }

  public void addRefreshToken(String username, String newRefreshToken, Long expiredMs) {
    Date date = new Date(System.currentTimeMillis());
    Timestamp timestamp = new Timestamp(date.getTime() + expiredMs);
    RefreshToken refreshToken = new RefreshToken();
    refreshToken.setUsername(username);
    refreshToken.setRefreshToken(newRefreshToken);
    refreshToken.setExpiration(timestamp);

    refreshMapper.insertRefresh(refreshToken);
  }

  public boolean isExist(String refreshToken) {
    RefreshToken existsed = refreshMapper.existsByRefreshToken(refreshToken);
    return existsed != null ? true : false;
  }

}
