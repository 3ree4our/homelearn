package org.threefour.homelearn.member.mapper;

import org.threefour.homelearn.member.dto.MemberRole;

import java.util.List;

public interface MemberRoleMapper {
  int insertMemberRole(MemberRole memberRole);

  List<MemberRole> findByMemberId(Long id);
}
