package org.threefour.homelearn.member.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.threefour.homelearn.member.dto.CustomUserDetails;
import org.threefour.homelearn.member.dto.MemberResponseDTO;
import org.threefour.homelearn.member.dto.MemberRole;
import org.threefour.homelearn.member.dto.Role;
import org.threefour.homelearn.member.mapper.MemberMapper;
import org.threefour.homelearn.member.mapper.MemberRoleMapper;
import org.threefour.homelearn.member.mapper.RoleMapper;

import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class CustomUserDetailsService implements UserDetailsService {

  private final MemberMapper memberMapper;
  private final MemberRoleMapper memberRoleMapper;
  private final RoleMapper roleMapper;

  @Override
  public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
    // db에서 조회
    MemberResponseDTO member = memberMapper.findByUsername(username);

    List<MemberRole> memberRole = memberRoleMapper.findByMemberId(member.getId());

    for (MemberRole role : memberRole) {
      List<Role> roles = roleMapper.selectRolesByRoleId(role);
      for (Role r : roles) member.setRoles(r);
    }

    if (member != null) return new CustomUserDetails(member);
    return null;
  }
}
