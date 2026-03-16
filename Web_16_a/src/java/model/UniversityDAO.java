/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import utils.DbUtils;
import utils.JPAUtil;


public class UniversityDAO {

    public UniversityDAO() {
    }

    public UniversityDTO searchByID(String ID) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            return em.find(UniversityDTO.class, ID);
        } finally {
            em.close();
        }
    }

//    public List<UniversityDTO> searchByName(String name) {
//        EntityManager em = JPAUtil.getEntityManager();
//
//        String jpql
//                = "SELECT u FROM University u "
//                + "WHERE u.status = true AND u.name LIKE :name";
//
//        return em.createQuery(jpql, UniversityDTO.class)
//                .setParameter("name", name)
//                .getResultList();
//    }

    public List<UniversityDTO> searchByName(String name) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            // Đã sửa 'University' thành 'UniversityDTO'
            // Đã TẠM BỎ 'u.status = true' vì class của bạn không có biến này. 
            // Nếu bạn muốn lọc theo isDraft thì sửa thành 'u.isDraft = false' nhé!
            String jpql = "SELECT u FROM UniversityDTO u WHERE u.name LIKE :name";
            
            return em.createQuery(jpql, UniversityDTO.class)
                    .setParameter("name", name)
                    .getResultList();
                    
        } catch (Exception e) {
            System.out.println("Lỗi JPQL: " + e.getMessage());
            return new ArrayList<>(); // Trả về rỗng để web không bị sập trang trắng
        } finally {
            if (em != null && em.isOpen()) {
                em.close();
            }
        }
    }
    
    public List<UniversityDTO> filterByName(String name) {
        name = "%" + name + "%";
        return searchByName(name);
    }

    public boolean softDelete(String id) {
        EntityManager em = JPAUtil.getEntityManager();
        EntityTransaction tx = em.getTransaction();

        try {
            tx.begin();

            UniversityDTO u = em.find(UniversityDTO.class, id);
            if (u != null) {
                // Cách 1: Xóa mềm (Đổi thành bản nháp).
                // Tuỳ vào class của bạn mà dùng u.setDraft(true) hoặc u.setIsDraft(true)
                u.setIsDraft(true); 
                
                // Cách 2: Nếu bạn muốn XÓA HẲN khỏi Database thì bỏ dòng trên và dùng dòng này:
                // em.remove(u);
            }

            tx.commit();
            return true;

        } catch (Exception e) {
            tx.rollback();
            System.out.println("=== LỖI KHI XÓA: " + e.getMessage());
            e.printStackTrace();
            return false;
        } finally {
            if (em != null && em.isOpen()) {
                em.close();
            }
        }
    }

    public boolean add(UniversityDTO u) {
        
        EntityManager em = JPAUtil.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();

            // Add
            em.persist(u);
            /////////////

            tx.commit();
            return true;
        } catch (Exception e) {
            tx.rollback();
            return false;
        } finally {
            em.close();
        }
    }

    public boolean update(UniversityDTO u) {
        EntityManager em = JPAUtil.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();

            // UPDATE
            em.merge(u);
            /////////////

            tx.commit();
            return true;
        } catch (Exception e) {
            tx.rollback();
            return false;
        } finally {
            em.close();
        }
    }
}