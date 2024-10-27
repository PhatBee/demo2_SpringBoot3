package vn.phatbee.demo2_springboot3.services;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import vn.phatbee.demo2_springboot3.entity.Category;

import java.util.List;
import java.util.Optional;

public interface CategoryService {
    long count();

    void deleteById(Long aLong);

    List<Category> findAll(Sort sort);

    Page<Category> findAll(Pageable pageable);

    List<Category> findAll();

    Optional<Category> findByName(String name);

    Page<Category> findByNameContaining(String name, Pageable pageable);

    <S extends Category> S save(S entity);

    Optional<Category> findById(Long aLong);
}
