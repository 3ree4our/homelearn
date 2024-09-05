package org.threefour.homelearn.member.jwt;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.ExpiredJwtException;
import lombok.RequiredArgsConstructor;
import org.springframework.web.filter.GenericFilterBean;
import org.threefour.homelearn.member.dto.CustomUserDetails;
import org.threefour.homelearn.member.dto.RefreshToken;
import org.threefour.homelearn.member.mapper.RefreshMapper;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.function.Function;

@RequiredArgsConstructor
public class CustomLogoutFilter extends GenericFilterBean {

  private final RefreshMapper refreshMapper;
  private final JWTUtil jwtUtil;

  @Override
  public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
    doFilter((HttpServletRequest) servletRequest, (HttpServletResponse) servletResponse, filterChain);
  }

  private void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws IOException, ServletException {
    String requestURI = request.getRequestURI();
    if (!requestURI.matches("^\\/logout$")) { // 모든 요청을 가로채기 때문에 logout일 때만 해야된다.
      filterChain.doFilter(request, response);
      return;
    }

    String requestMethod = request.getMethod();
    if (!requestMethod.toUpperCase().equals("POST")) { // 대문자로..안 바꿔도 되나?
      filterChain.doFilter(request, response);
      return;
    }

    String refreshToken = "";
    Cookie[] cookies = request.getCookies();
    for (Cookie cookie : cookies) {
      if (cookie.getName().startsWith("refreshToken")) {
        refreshToken = cookie.getValue();
      }
    }

    if (refreshToken.length() == 0) {
      response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
      return;
    }

    try {
      jwtUtil.isExpired(refreshToken);
    } catch (ExpiredJwtException e) {
      response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
      return;
    }

    Function<Claims, String> getCategory = claims -> claims.get("category", String.class);
    String category = jwtUtil.getClaim(refreshToken, getCategory);
    if (!category.startsWith("refresh")) {
      response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
      return;
    }

    RefreshToken isExist = refreshMapper.existsByRefreshToken(refreshToken);
    if (isExist == null) {
      response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
      return;
    }

    refreshMapper.deleteByRefreshToken(refreshToken);

    // refresh 토큰 Cookie 값 0
    Cookie cookie = new Cookie("refreshToken", null);
    cookie.setMaxAge(0);
    cookie.setPath("/");

    response.addCookie(cookie);
    response.setStatus(HttpServletResponse.SC_OK);

  }
}