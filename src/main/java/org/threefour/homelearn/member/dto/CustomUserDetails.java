package org.threefour.homelearn.member.dto;

import lombok.RequiredArgsConstructor;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.threefour.homelearn.file.dto.AttachFile;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;

public class CustomUserDetails implements UserDetails {

  private final MemberResponseDTO member;

  public CustomUserDetails(MemberResponseDTO member) {
    this.member = member;
  }

  @Override
  public Collection<? extends GrantedAuthority> getAuthorities() {
    Collection<GrantedAuthority> collection = new ArrayList<GrantedAuthority>();
    member.getRoles().forEach(role -> collection.add(new SimpleGrantedAuthority(role.getRole())));
    return collection;
  }

  public Long getId() {
    return member.getId();
  }

  @Override
  public String getPassword() {
    return member.getPassword();
  }

  @Override
  public String getUsername() {
    return member.getEmail();
  }

  public String getNickname() {
    return member.getNickname();
  }

  public String getCreatedAt() {
    return member.getCreatedAt();
  }

  public String getModifiedAt() {
    return member.getModifiedAt();
  }


  @Override
  public boolean isAccountNonExpired() {
    return true;
  }

  @Override
  public boolean isAccountNonLocked() {
    return true;
  }

  @Override
  public boolean isCredentialsNonExpired() {
    return true;
  }

  @Override
  public boolean isEnabled() {
    return true;
  }
}
