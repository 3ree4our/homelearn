package org.threefour.homelearn.home.controller;

import com.nimbusds.jose.shaded.gson.Gson;
import lombok.RequiredArgsConstructor;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.threefour.homelearn.file.dto.AttachFile;
import org.threefour.homelearn.file.service.FileService;
import org.threefour.homelearn.member.dto.CustomUserDetails;
import org.threefour.homelearn.member.dto.MemberResponseDTO;
import org.threefour.homelearn.member.dto.Role;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequiredArgsConstructor
public class HomeApiController {

  private final FileService fileService;

  @GetMapping(value = "/get-info", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
  public ResponseEntity<String> getInfo() {
    Gson gson = new Gson();
    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    CustomUserDetails principal = (CustomUserDetails) authentication.getPrincipal();

    Collection<? extends GrantedAuthority> authorities = principal.getAuthorities();
    List<String> collect = authorities.stream()
            .map(GrantedAuthority::getAuthority)
            .collect(Collectors.toList());

    List<Role> list = new ArrayList<>();
    for (String s : collect) {
      Role role = new Role();
      role.setRole(s);
      list.add(role);
    }

    MemberResponseDTO dto = MemberResponseDTO.builder()
            .id(principal.getId())
            .email(principal.getUsername())
            .nickname(principal.getNickname())
            .createdAt(principal.getCreatedAt())
            .modifiedAt(principal.getModifiedAt())
            .roles(list)
            .build();

    List<AttachFile> profileImage = fileService.getProfileImageByMemberId(dto.getId());
    for (AttachFile file : profileImage) dto.setAttachFile(file);

    return ResponseEntity.ok(gson.toJson(dto));
  }
}
