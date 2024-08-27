package org.threefour.homelearn.member.controller;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.ExpiredJwtException;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.threefour.homelearn.member.dto.RefreshToken;
import org.threefour.homelearn.member.jwt.JWTUtil;
import org.threefour.homelearn.member.mapper.RefreshMapper;
import org.threefour.homelearn.member.service.RefreshService;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.function.Function;

@RestController
@RequiredArgsConstructor
public class RefreshTokenController {

  private final RefreshService refreshService;
  private final JWTUtil jwtUtil;

  @PostMapping("/refresh")
  public ResponseEntity<?> reissue(HttpServletRequest request, HttpServletResponse response) {
    Cookie[] cookies = request.getCookies();
    String refreshToken = refreshService.getRefreshToken(cookies);

    if (refreshToken.length() == 0) return new ResponseEntity<>("refresh token null", HttpStatus.BAD_REQUEST);

    try {
      jwtUtil.isExpired(refreshToken);
    } catch (ExpiredJwtException e) {
      return new ResponseEntity<>("refresh token expired", HttpStatus.BAD_REQUEST);
    }

    Function<Claims, String> getCategory = claims -> claims.get("category", String.class);
    String category = jwtUtil.getClaim(refreshToken, getCategory);

    if (!category.startsWith("refresh")) return new ResponseEntity<>("refresh token invalid", HttpStatus.BAD_REQUEST);

    boolean exist = refreshService.isExist(refreshToken);
    if (!exist) return new ResponseEntity<>("refresh token not exist", HttpStatus.BAD_REQUEST);

    // 새로운 토큰 발급
    Map<String, Object> accessTokenMap = new HashMap<>();
    Map<String, Object> refreshTokenMap = new HashMap<>();

    String username = jwtUtil.getUsername(refreshToken);

    Function<Claims, String> getId = claims -> claims.get("id", String.class);
    String id = jwtUtil.getClaim(refreshToken, getId);

    Function<Claims, List<String>> getRole = claims -> claims.get("roles", List.class);
    List<String> roles = jwtUtil.getClaim(refreshToken, getRole);

    accessTokenMap.put("category", "access");
    accessTokenMap.put("id", id);
    accessTokenMap.put("username", username);
    accessTokenMap.put("roles", roles);

    refreshTokenMap.put("category", "refresh");
    refreshTokenMap.put("id", id);
    refreshTokenMap.put("username", username);
    refreshTokenMap.put("roles", roles);

    String newAccessToken = jwtUtil.createToken(accessTokenMap, username, 1000 * 60 * 10L);
    String newRefreshToken = jwtUtil.createToken(refreshTokenMap, username, 1000 * 60 * 60 * 24L);

    int result = refreshService.deleteRefreshToken(refreshToken);
    if (result > 0) refreshService.addRefreshToken(username, newRefreshToken, 1000 * 60 * 60 * 24L);
    System.out.println("뉴 리프레시 생명주기: " + System.currentTimeMillis() + 1000 * 60 * 60 * 24L);
    System.out.println("뉴 리프레시 쿠키: " + 24 * 60 * 60);

    response.addCookie(createCookie("accessToken", newAccessToken));
    response.addCookie(createCookie("refreshToken", newRefreshToken));

    return new ResponseEntity<>(HttpStatus.OK);
  }

  private Cookie createCookie(String key, String value) {
    Cookie cookie = new Cookie(key, value);
    cookie.setMaxAge(24 * 60 * 60); // 생명주기는 토큰을 만들 때 동일하게,
    cookie.setHttpOnly(true);
    cookie.setPath("/");
    return cookie;
  }
}
