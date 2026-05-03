package com.health.repository;

import com.health.entity.HealthData;
import com.health.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface HealthDataRepository extends JpaRepository<HealthData, Integer> {
    List<HealthData> findByUserOrderByIdDesc(User user);
}
