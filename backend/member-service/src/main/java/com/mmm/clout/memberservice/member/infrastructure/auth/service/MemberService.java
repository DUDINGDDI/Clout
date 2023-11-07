package com.mmm.clout.memberservice.member.infrastructure.auth.service;

import com.mmm.clout.memberservice.member.domain.Member;
import com.mmm.clout.memberservice.member.domain.repository.MemberRepository;
import com.mmm.clout.memberservice.member.infrastructure.auth.dto.MemberDTO;
import com.mmm.clout.memberservice.member.infrastructure.auth.dto.RequestMemberDto;
import com.mmm.clout.memberservice.member.infrastructure.auth.exception.NoMatchPasswordException;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;
import java.util.NoSuchElementException;
import java.util.UUID;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class MemberService {

    private final MemberRepository memberRepository;
    private final BCryptPasswordEncoder encoder;

    public MemberDTO getUserById(Long id) {
        Member member = this.memberRepository.findById(id).orElseThrow(() -> new NoSuchElementException("존재하지 않는 유저 입니다."));
        MemberDTO dto = MemberDTO.builder()
            .id(member.getId())
            .role(member.getRole())
            .userId(member.getUserId())
            .build();
        return dto;
    }

    public Member getUserByUserId(String userId) {
        return memberRepository.findByUserId(userId).orElse(null);
    }

    @Transactional
    public void updateUser(RequestMemberDto dto) {
        Member member = this.memberRepository.findByUserId(dto.getUserId()).get();
        if(encoder.matches(dto.getOldPassword(), member.getPwd())) {
            member.passwordUpdate(encoder.encode(dto.getNewPassword()));
        } else {
            throw new NoMatchPasswordException("이전 비밀번호가 일치하지 않습니다.");
        }
    }

    public List<MemberDTO> getUsers() {
        List<Member> members = memberRepository.findAll();
        return members.stream().map(user -> MemberDTO.builder()
            .id(user.getId())
            .userId(user.getUserId())
            .role(user.getRole())
            .build()).collect(Collectors.toList());
    }

    @Transactional
    public void passwordInit(String userId) {
        Member member = this.memberRepository.findByUserId(userId).orElseThrow(() -> new NoSuchElementException("존재하지 않는 유저입니다."));
        String password = makePassword();
        member.passwordUpdate(encoder.encode(password));
        // 새로 만든 비밀번호 발송 로직 필요
    }

    private String makePassword() {
        String uuid = "";
        for (int i = 0; i < 5; i++) {
            uuid = UUID.randomUUID().toString().replaceAll("-", ""); // -를 제거해 주었다.
            uuid = uuid.substring(0, 10); //uuid를 앞에서부터 10자리 잘라줌.
        }
        return uuid;
    }
}


