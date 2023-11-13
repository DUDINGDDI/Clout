package com.mmm.clout.memberservice.clouter.presentation;

import com.mmm.clout.memberservice.clouter.application.facade.ClouterFacade;
import com.mmm.clout.memberservice.clouter.presentation.docs.ClouterControllerDocs;
import com.mmm.clout.memberservice.clouter.presentation.request.CreateClrRequest;
import com.mmm.clout.memberservice.clouter.presentation.request.UpdateClrRequest;
import com.mmm.clout.memberservice.clouter.presentation.response.CreateClrResponse;
import com.mmm.clout.memberservice.clouter.presentation.response.SelectClrResponse;
import com.mmm.clout.memberservice.clouter.presentation.response.SelectTop10Response;
import com.mmm.clout.memberservice.clouter.presentation.response.UpdateClrResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Controller
@RequestMapping("/v1/clouters")
@RequiredArgsConstructor
public class ClouterController implements ClouterControllerDocs{

    private final ClouterFacade clouterFacade;

    @PostMapping(value = "/signup", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.MULTIPART_FORM_DATA_VALUE})
    public ResponseEntity<CreateClrResponse> create(
            @RequestPart CreateClrRequest createClrRequest,
            @RequestPart(value = "files") List<MultipartFile> fileList
            ) throws Exception {
        CreateClrResponse result = CreateClrResponse.from(
                clouterFacade.create(createClrRequest.toCommand(), fileList)
        );
        return new ResponseEntity<>(result, HttpStatus.CREATED);
    }

    @PutMapping("/{clouterId}")
    public ResponseEntity<UpdateClrResponse> update(
            @PathVariable("clouterId") Long clouterId,
            @RequestBody UpdateClrRequest updateClrRequest
    ) {
        UpdateClrResponse result = UpdateClrResponse.from(
                clouterFacade.update(updateClrRequest.toCommand(clouterId))
        );
        return new ResponseEntity<>(result, HttpStatus.OK);
    }

    @GetMapping("/{clouterId}")
    public ResponseEntity<SelectClrResponse> selectClouter(
            @PathVariable("clouterId") Long clouterId
    ) {
        SelectClrResponse result = SelectClrResponse.from(
                clouterFacade.select(clouterId)
        );
        return new ResponseEntity<>(result, HttpStatus.OK);
    }

    @GetMapping("/{clouterId}/contract")
    public ResponseEntity<SelectClrResponse> selectClouterForContract(
            @PathVariable("clouterId") Long clouterId
    ) {
        SelectClrResponse result = SelectClrResponse.from(
                clouterFacade.selectForContract(clouterId)
        );
        return new ResponseEntity<>(result, HttpStatus.OK);
    }

    @GetMapping("/top10")
    public ResponseEntity<SelectTop10Response> getClouterTop10() {
        SelectTop10Response response = SelectTop10Response.from(
            clouterFacade.selectTop10()
        );
        return new ResponseEntity<>(response, HttpStatus.OK);
    }

    @GetMapping("/test")
    public ResponseEntity<String> test() {
        return new ResponseEntity<>("ok", HttpStatus.OK);
    }
}
