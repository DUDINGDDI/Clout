package com.mmm.clout.pointservice.point.infrastructure.config;

import com.mmm.clout.pointservice.point.application.ChargePointProcessor;
import com.mmm.clout.pointservice.point.application.ReducePointProcessor;
import com.mmm.clout.pointservice.point.application.WithdrawPointProcessor;
import com.mmm.clout.pointservice.point.domain.repository.PointRepository;
import com.mmm.clout.pointservice.point.domain.repository.PointTransactionRepository;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class PointConfig {

    @Bean
    public ChargePointProcessor chargePointProcessor(
        PointRepository pointRepository,
        PointTransactionRepository pointTransactionRepository
    ) {
        return new ChargePointProcessor(
            pointRepository,
            pointTransactionRepository
        );
    }

    @Bean
    public ReducePointProcessor reducePointProcessor(
        PointRepository pointRepository,
        PointTransactionRepository pointTransactionRepository
    ) {
        return new ReducePointProcessor(
            pointRepository,
            pointTransactionRepository
        );
    }

    @Bean
    public WithdrawPointProcessor withdrawPointProcessor() {
        return new WithdrawPointProcessor();
    }
}
