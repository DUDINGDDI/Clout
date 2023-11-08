package com.mmm.clout.contractservice.contract.infrastructure.configuration;

import com.mmm.clout.contractservice.contract.application.*;
import com.mmm.clout.contractservice.contract.domain.provider.MemberProvider;
import com.mmm.clout.contractservice.contract.domain.repository.ContractRepository;
import com.mmm.clout.contractservice.contract.infrastructure.persistence.feign.MemberServiceFeignClient;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class ContractConfiguration {

    @Bean
    public CreateContractProcessor createContractProcessor(ContractRepository contractRepository, MemberProvider memberProvider) {
        return new CreateContractProcessor(contractRepository, memberProvider);
    }

    @Bean
    public UpdateRRNContractProcessor updateRRNContractProcessor(ContractRepository contractRepository) {
        return new UpdateRRNContractProcessor(contractRepository);
    }

    @Bean
    public UpdateStateContractProcessor updateStateContractProcessor(ContractRepository contractRepository) {
        return new UpdateStateContractProcessor(contractRepository);
    }

    @Bean
    public DeleteContractProcessor deleteContractProcessor(ContractRepository contractRepository) {
        return new DeleteContractProcessor(contractRepository);
    }

    @Bean
    public SelectContractProcessor selectContractProcessor(ContractRepository contractRepository) {
        return new SelectContractProcessor(contractRepository);
    }

    @Bean
    public SelectAllContractClouterProcessor selectAllContractClouterProcessor(ContractRepository contractRepository) {
        return new SelectAllContractClouterProcessor(contractRepository);
    }

    @Bean
    public SelectAllContractAdvertiserProcessor selectAllContractAdvertiserProcessor(ContractRepository contractRepository) {
        return new SelectAllContractAdvertiserProcessor(contractRepository);
    }
}
