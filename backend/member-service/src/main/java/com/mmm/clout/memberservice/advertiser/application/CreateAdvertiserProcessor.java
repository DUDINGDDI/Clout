package com.mmm.clout.memberservice.advertiser.application;

import com.mmm.clout.memberservice.advertiser.application.command.CreateAdrCommand;
import com.mmm.clout.memberservice.advertiser.domain.Advertiser;
import com.mmm.clout.memberservice.advertiser.domain.repository.AdvertiserRepository;
import com.mmm.clout.memberservice.advertiser.infrastructure.exception.AdrIdDuplicateException;
import com.mmm.clout.memberservice.member.domain.Member;
import com.mmm.clout.memberservice.member.domain.repository.MemberRepository;
import com.mmm.clout.memberservice.star.domain.Star;
import com.mmm.clout.memberservice.star.domain.repository.StarRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.transaction.annotation.Transactional;

@RequiredArgsConstructor
public class CreateAdvertiserProcessor {

    private final AdvertiserRepository advertiserRepository;
    private final MemberRepository memberRepository;
    private final BCryptPasswordEncoder encoder;
    private final StarRepository starRepository;

    @Transactional
    public Advertiser execute(CreateAdrCommand command) {
        checkUserId(command.getUserId());
        Advertiser advertiser = command.toEntity();
        advertiser.changePwd(encoder.encode(advertiser.getPwd()));
        Advertiser savedAdvertiser = advertiserRepository.save(advertiser);
        initStar(savedAdvertiser);
        return savedAdvertiser;
    }

    private Star initStar(Member member) {
        return starRepository.save(Star.init(member));
    }

    private boolean checkUserId(String userId) {
        Member findMember = memberRepository.findByUserId(userId).orElse(null);
        if (findMember == null) {
            return true;
        } else {
            throw new AdrIdDuplicateException();
        }
    }
}
