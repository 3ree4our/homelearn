package org.threefour.homelearn.member.jwt;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import org.springframework.beans.factory.annotation.Value;

import java.util.Date;
import java.util.Map;
import java.util.function.Function;

public class JWTUtil {

  @Value("${spring.jwt.secret}")
  private String secretKey;

  public String getUsername(String token) {
    return Jwts.parser().setSigningKey(secretKey).parseClaimsJws(token).getBody().getSubject();
  }

  public boolean isExpired(String token) {
    boolean before = Jwts.parser().setSigningKey(secretKey).parseClaimsJws(token).getBody().getExpiration().before(new Date());
    return before;
  }

  public <T> T getClaim(String token, Function<Claims, T> claimsResolver) {
    Claims body = Jwts.parser().setSigningKey(secretKey).parseClaimsJws(token).getBody();
    return claimsResolver.apply(body);
  }

  public String createToken(Map<String, Object> claims, String subject, Long expiredMs) {

    return Jwts.builder()
            .setClaims(claims)
            .setSubject(subject)
            .setIssuedAt(new Date(System.currentTimeMillis()))
            .setExpiration(new Date(System.currentTimeMillis() + expiredMs))
            .signWith(SignatureAlgorithm.HS256, secretKey)
            .compact();
  }

}
