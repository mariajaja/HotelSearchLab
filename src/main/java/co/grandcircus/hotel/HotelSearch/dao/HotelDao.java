package co.grandcircus.hotel.HotelSearch.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import co.grandcircus.hotel.HotelSearch.entity.Hotel;

@Repository
@Transactional
public class HotelDao {
	
	@PersistenceContext
	EntityManager em;

	public List<Hotel> findAll() {
		return em.createQuery("FROM Hotel", Hotel.class).getResultList();
	}
	
	public List<String> findCityList() {
		return em.createQuery("SELECT DISTINCT city FROM Hotel", String.class).getResultList();
	}
	
	public List<Hotel> findHotelList(String city) {
		return em.createQuery("FROM Hotel WHERE city = :city", Hotel.class).setParameter("city", city).getResultList();
	}
}
