package com.mmm.clout.advertisementservice.apply.infrastructure.config;

import com.mmm.clout.advertisementservice.apply.application.CreateApplyProcessor;
import com.mmm.clout.advertisementservice.apply.domain.repository.ApplyRepository;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class ApplyConfig {

    @Bean
    CreateApplyProcessor createApplyProcessor(
        ApplyRepository applyRepository
    ) {
        return new CreateApplyProcessor(
            applyRepository
        );
    }

}
