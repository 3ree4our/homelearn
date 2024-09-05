package org.threefour.homelearn.member.jwt;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.ExpiredJwtException;
import lombok.RequiredArgsConstructor;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.filter.OncePerRequestFilter;
import org.threefour.homelearn.file.dto.AttachFile;
import org.threefour.homelearn.file.mapper.FileMapper;
import org.threefour.homelearn.member.dto.CustomUserDetails;
import org.threefour.homelearn.member.dto.MemberResponseDTO;
import org.threefour.homelearn.member.dto.Role;
import org.threefour.homelearn.member.service.CustomUserDetailsService;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.function.Function;
import java.util.stream.Collectors;

@RequiredArgsConstructor
public class JWTFilter extends OncePerRequestFilter {

  private final JWTUtil jwtUtil;
  private final CustomUserDetailsService customUserDetailsService;

  @Override
  protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {
    String authorization = request.getHeader("Authorization");
    String accessToken = "";
    if (authorization != null && authorization.startsWith("Bearer ")) {
      accessToken = authorization.substring(7);
    }

    if (accessToken.length() == 0 || accessToken == null) {
      filterChain.doFilter(request, response);
      return;
    }

    // 토큰 만료 여부!
    try {
      jwtUtil.isExpired(accessToken);
    } catch (ExpiredJwtException e) {
      PrintWriter out = response.getWriter();
      out.print("access token expired");

      response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
      return;
    }

    Function<Claims, String> getCategory = claims -> claims.get("category", String.class);
    String category = jwtUtil.getClaim(accessToken, getCategory);
    if (!category.startsWith("access")) {
      PrintWriter out = response.getWriter();
      out.print("invaild access token");

      response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
      return;
    }

    String username = jwtUtil.getUsername(accessToken);

    Function<Claims, String> getId = claims -> claims.get("id", String.class);
    String id = jwtUtil.getClaim(accessToken, getId);

    Function<Claims, List<String>> getRoles = claims -> claims.get("roles", List.class);
    List<String> roles = jwtUtil.getClaim(accessToken, getRoles);

    CustomUserDetails userDetails = (CustomUserDetails) customUserDetailsService.loadUserByUsername(username);

    List<Role> list = new ArrayList<>();
    for (String s : roles) {
      Role r = new Role();
      r.setRole(s);
      list.add(r);
    }

    MemberResponseDTO member = MemberResponseDTO.builder()
            .id(Long.parseLong(id))
            .email(username)
            .password("임시(완) 비밀번호")
            .nickname(userDetails.getNickname())
            .createdAt(userDetails.getCreatedAt())
            .modifiedAt(userDetails.getModifiedAt())
            .roles(list)
            .build();

    CustomUserDetails user = new CustomUserDetails(member);
    UsernamePasswordAuthenticationToken authenticationToken = new UsernamePasswordAuthenticationToken(user, null, user.getAuthorities());
    SecurityContextHolder.getContext().setAuthentication(authenticationToken);

    filterChain.doFilter(request, response);
  }
}