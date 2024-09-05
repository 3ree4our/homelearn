package org.threefour.homelearn.member.mapper;

import org.threefour.homelearn.member.dto.MemberRole;
import org.threefour.homelearn.member.dto.Role;

import java.util.List;

public interface RoleMapper {
  void insertRole(Role role);

  List<Role> selectRolesByRoleId(MemberRole memberRole);
}
