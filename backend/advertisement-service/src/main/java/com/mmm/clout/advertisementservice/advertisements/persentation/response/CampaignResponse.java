package com.mmm.clout.advertisementservice.advertisements.persentation.response;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.mmm.clout.advertisementservice.advertisements.domain.AdCategory;
import com.mmm.clout.advertisementservice.advertisements.domain.AdPlatform;
import com.mmm.clout.advertisementservice.advertisements.domain.Campaign;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Getter;

@JsonInclude(Include.NON_NULL)
@Getter
@AllArgsConstructor
public class CampaignResponse {

    private Long campaignId;

    private List<AdPlatform> adPlatformList;

    private Long price;

    private String details;

    private LocalDateTime deletedAt;

    private String title;

    private AdCategory adCategory; // 광고 카테고리

    private Boolean isPriceChangeable; // 광고비 협의 여부

    private Boolean isDeliveryRequired; // 배송 여부

    private Integer numberOfRecruiter; // 모집인원

    private Integer numberOfApplicants; // 신청인원

    private Integer numberOfSelectedMembers; // 채택 인원

    private String offeringDetails; // 제공 내역 설명

    private String sellingLink; // 판매처 링크 (선택사항)

    private LocalDate applyStartDate; // 모집 시작 날짜

    private LocalDate applyEndDate; // 모집 종료 날짜

    private Integer minClouterAge; // 최소 클라우터 나이

    private Integer maxClouterAge; // 최대 클라우터 나이

    private Integer minFollower; // 최소 팔로워 수

    public static CampaignResponse from(Campaign campaign) {
        return new CampaignResponse(
            campaign.getId(),
            campaign.getAdPlatformList(),
            campaign.getPrice(),
            campaign.getDetails(),
            campaign.getDeletedAt(),
            campaign.getTitle(),
            campaign.getAdCategory(),
            campaign.getIsPriceChangeable(),
            campaign.getIsDeliveryRequired(),
            campaign.getNumberOfRecruiter(),
            campaign.getNumberOfApplicants(),
            campaign.getNumberOfSelectedMembers(),
            campaign.getOfferingDetails(),
            campaign.getSellingLink(),
            campaign.getApplyStartDate(),
            campaign.getApplyEndDate(),
            campaign.getMinClouterAge(),
            campaign.getMaxClouterAge(),
            campaign.getMinFollower()
        );
    }
}
