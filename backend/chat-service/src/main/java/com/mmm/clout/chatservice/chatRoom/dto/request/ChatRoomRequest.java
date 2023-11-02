package com.mmm.clout.chatservice.chatRoom.dto.request;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Getter;

import javax.validation.constraints.NotNull;

@Getter
@AllArgsConstructor
public class ChatRoomRequest {

    @NotNull
    @Schema(description = "광고 id")
    private Long advertisementId;

    @NotNull
    @Schema(description = "광고주 id")
    private Long hostId;

    @NotNull
    @Schema(description = "클라우터 id")
    private Long guestId;
}
