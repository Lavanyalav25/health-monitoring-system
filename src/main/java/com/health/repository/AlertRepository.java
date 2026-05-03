package com.health.repository;

import com.health.entity.Alert;
import com.health.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface AlertRepository extends JpaRepository<Alert, Integer> {
    List<Alert> findByUserOrderByCreatedAtDesc(User user);
}
