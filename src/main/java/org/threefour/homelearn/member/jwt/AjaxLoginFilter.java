package org.threefour.homelearn.member.jwt;

import com.nimbusds.jose.shaded.gson.Gson;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.web.authentication.AbstractAuthenticationProcessingFilter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.validation.Errors;
import org.threefour.homelearn.member.dto.CustomUserDetails;
import org.threefour.homelearn.member.dto.LoginDTO;
import org.threefour.homelearn.member.dto.RefreshToken;
import org.threefour.homelearn.member.mapper.RefreshMapper;

import javax.servlet.FilterChain;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.*;

public class AjaxLoginFilter extends AbstractAuthenticationProcessingFilter {

  private final UserDetailsService userDetailsService;
  private final JWTUtil jwtUtil;
  private final RefreshMapper refreshMapper;

  public AjaxLoginFilter(UserDetailsService userDetailsService, JWTUtil jwtUtil, RefreshMapper refreshMapper) {
    super(new AntPathRequestMatcher("/members/login-proc", "POST"));
    this.userDetailsService = userDetailsService;
    this.jwtUtil = jwtUtil;
    this.refreshMapper = refreshMapper;
  }

  @Override
  public Authentication attemptAuthentication(HttpServletRequest request, HttpServletResponse response) throws AuthenticationException, IOException, ServletException {
    Gson gson = new Gson();
    LoginDTO loginDTO = gson.fromJson(request.getReader(), LoginDTO.class);
    AjaxAuthenticationToken ajaxAuthenticationToken = new AjaxAuthenticationToken(loginDTO.getUsername(), loginDTO.getPassword());
    return getAuthenticationManager().authenticate(ajaxAuthenticationToken);
  }

  @Override
  protected void successfulAuthentication(HttpServletRequest request, HttpServletResponse response, FilterChain chain, Authentication authResult) throws IOException, ServletException {
    String username = authResult.getPrincipal().toString();
    CustomUserDetails userDetails = (CustomUserDetails) userDetailsService.loadUserByUsername(username);

    String id = String.valueOf(userDetails.getId());
    List<String> roles = new ArrayList<>();

    Collection<? extends GrantedAuthority> authorities = userDetails.getAuthorities();
    for (GrantedAuthority grantedAuthority : authorities) roles.add(grantedAuthority.getAuthority());

    Map<String, Object> accessTokenMap = new HashMap<>();
    accessTokenMap.put("category", "access");
    accessTokenMap.put("id", id);
    accessTokenMap.put("username", username);
    accessTokenMap.put("roles", roles);

    Map<String, Object> refreshTokenMap = new HashMap<>();
    refreshTokenMap.put("category", "refresh");
    refreshTokenMap.put("id", id);
    refreshTokenMap.put("username", username);
    refreshTokenMap.put("roles", roles);

    String accessToken = jwtUtil.createToken(accessTokenMap, username, 1000 * 60 * 10L);
    String refreshToken = jwtUtil.createToken(refreshTokenMap, username, 1000 * 60 * 60 * 24L);

    addRefreshEntity(username, refreshToken, 1000 * 60 * 60 * 24L);
    response.addCookie(createCookie("accessToken", accessToken));
    response.addCookie(createCookie("refreshToken", refreshToken));
  }

  private Cookie createCookie(String key, String value) {
    Cookie cookie = new Cookie(key, value);
    cookie.setPath("/");
    cookie.setMaxAge(60 * 60 * 24);
    cookie.setHttpOnly(true);
    return cookie;
  }

  private void addRefreshEntity(String username, String refresh, Long expiredMs) {
    Date date = new Date(System.currentTimeMillis() + expiredMs);
    Timestamp timestamp = new Timestamp(date.getTime());
    RefreshToken refreshEntity = new RefreshToken();
    refreshEntity.setUsername(username);
    refreshEntity.setRefreshToken(refresh);
    refreshEntity.setExpiration(timestamp);

    refreshMapper.insertRefresh(refreshEntity);
  }

  @Override
  protected void unsuccessfulAuthentication(HttpServletRequest request, HttpServletResponse response, AuthenticationException failed) throws IOException, ServletException {
    // 유저는 있고 비밀번호가 다를 때
    System.out.println("로그인 실패");
    response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
  }

}
