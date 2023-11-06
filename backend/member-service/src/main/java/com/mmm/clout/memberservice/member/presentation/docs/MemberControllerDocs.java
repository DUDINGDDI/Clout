package com.mmm.clout.memberservice.member.presentation.docs;

import com.mmm.clout.memberservice.member.infrastructure.auth.dto.AuthDto;
import com.mmm.clout.memberservice.member.presentation.response.IdDuplicateResponse;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.Valid;

@Tag(name = "기본 유저 CRUD", description = "유저 로그인, 로그아웃, 리이슈 등등 인증 서비스 제공 api")
public interface MemberControllerDocs {


    @Operation(summary = "로그인",
        responses =
        @ApiResponse(responseCode = "200", description = "헤더를 사용해서 엑세스토큰과, 리프레시 토큰 리턴"
        )
    )
    public ResponseEntity<?> login(@RequestBody @Valid AuthDto.LoginDto loginDto);

    @Operation(summary = "중복체크",
        responses =
        @ApiResponse(responseCode = "200", description = "중복이 없으면 true, 중복이면 익셉션 발생(409)",
            content =
            @Content(mediaType="application/json",
                schema=@Schema(implementation=IdDuplicateResponse.class))
        )
    )
    public ResponseEntity<IdDuplicateResponse> duplicateCheck(
        @RequestParam("userId") String userId
    );

    @Operation(summary = "액세스 토큰 재발급",
        responses =
        @ApiResponse(responseCode = "200", description = "액세스 토큰이 만료 되었을 경우 리스폰트 토큰을 보내면 엑세스 토큰 재발급"
        )
    )

    public ResponseEntity<?> reissue(
        @RequestHeader("REFRESH_TOKEN") String requestRefreshToken,
        @RequestHeader(HttpHeaders.AUTHORIZATION) String requestAccessToken);


    @Operation(summary = "로그아웃",
        responses =
        @ApiResponse(responseCode = "200", description = "리프레시 토큰 삭제"
        )
    )
    public ResponseEntity<?> logout(@RequestHeader("Authorization") String requestAccessToken);

    @Operation(summary = "인증키 sms 발송",
        responses =
        @ApiResponse(responseCode = "200", description = "인증키를 발송하고 해당하는 4자리의 인증키 string으로 반환"
        )
    )
    public ResponseEntity<String> sendSms(
        @RequestParam String phoneNumber);
}
