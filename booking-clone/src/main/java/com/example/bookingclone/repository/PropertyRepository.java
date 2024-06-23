package com.example.bookingclone.repository;

import com.example.bookingclone.model.Property;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PropertyRepository extends JpaRepository<Property, Long> {
}
