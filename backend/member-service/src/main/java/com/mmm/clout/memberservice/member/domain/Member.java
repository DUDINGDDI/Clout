package com.mmm.clout.memberservice.member.domain;

import com.mmm.clout.memberservice.common.Role;
import lombok.*;
import lombok.experimental.SuperBuilder;
import org.hibernate.annotations.DynamicInsert;

import javax.persistence.*;

@Getter
@ToString
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@AllArgsConstructor
@SuperBuilder
@DynamicInsert
@DiscriminatorColumn(name = "DTYPE")
@Entity(name = "members")
@Inheritance(strategy = InheritanceType.JOINED)
public abstract class Member {

    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="member_id")
    private Long id;

    @Column(length = 25)
    private String userId;

    @Column(length = 500)
    private String pwd;

    private Long avgScore;

    private Integer totalContractCount;

    @Enumerated(EnumType.STRING)
    private Role role;

    public Member update(String pwd) {
        this.pwd = pwd;
        return this;
    }
    public Long passwordUpdate(String newPassword) {
        this.pwd = newPassword;
        return this.id;
    }

    public Member(String userId, String pwd, Role role) {
        this.userId = userId;
        this.pwd = pwd;
        this.role = role;
        this.avgScore = 0L;
        this.totalContractCount = 0;
    }

    public Long updateAvgScore(Long avgScore) {
        this.avgScore = avgScore;
        return this.avgScore;
    }

    public Member changePwd(String pwd) {
        this.pwd = pwd;
        return this;
    }
}
