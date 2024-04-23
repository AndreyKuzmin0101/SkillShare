package ru.kpfu.itis.kuzmin.skillshare.service.impl;


import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import ru.kpfu.itis.kuzmin.skillshare.dto.request.ResumeRequestDto;
import ru.kpfu.itis.kuzmin.skillshare.mapper.ResumeMapper;
import ru.kpfu.itis.kuzmin.skillshare.repository.spring.ResumeSpringRepository;
import ru.kpfu.itis.kuzmin.skillshare.service.ResumeService;

@Service
@RequiredArgsConstructor
public class ResumeServiceImpl implements ResumeService {

    private final ResumeSpringRepository resumeRepository;
    private final ResumeMapper resumeMapper;

    @Override
    public Long save(ResumeRequestDto resumeDto) {
        return resumeRepository
                .save(resumeMapper.toEntity(resumeDto))
                .getId();
    }
}
