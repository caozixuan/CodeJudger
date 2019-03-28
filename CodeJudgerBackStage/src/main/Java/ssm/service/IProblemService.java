package ssm.service;

import org.springframework.stereotype.Service;
import ssm.model.Problem;

import java.util.List;

public interface IProblemService {
    public List<Problem> getAllProblems();
}
