package com.mmm.clout.advertisementservice.apply.application.facade;

import com.mmm.clout.advertisementservice.apply.application.CreateApplyProcessor;
import com.mmm.clout.advertisementservice.apply.application.command.CreateApplyCommand;
import com.mmm.clout.advertisementservice.apply.domain.Apply;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class ApplyFacade {

    private final CreateApplyProcessor createApplyProcessor;

    public Apply create(CreateApplyCommand command) {
        return createApplyProcessor.execute(command);
    }

}
