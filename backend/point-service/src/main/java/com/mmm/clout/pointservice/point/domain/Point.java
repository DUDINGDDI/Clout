package com.mmm.clout.pointservice.point.domain;

import com.mmm.clout.pointservice.common.entity.BaseEntity;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.DynamicInsert;

@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@AllArgsConstructor
@DynamicInsert
@Table(name = "point")
@Entity
public class Point extends BaseEntity {

    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "point_id")
    private Long id;

    private Long memberId;

    private Long totalPoint;


    public Point(Long memberId, Long chargePoint) {
        this.memberId = memberId;
        this.totalPoint += totalPoint;
    }


    public static Point charge(Long memberId, Long chargePoint) {
        return new Point(memberId, chargePoint);
    }
}
