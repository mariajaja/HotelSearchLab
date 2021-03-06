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
	
	// find a way to get
	public void updateHotelVote(Long id, Integer votes) {
		em.createQuery("FROM Hotel WHERE id = :id UPDATE votes = :votes").setParameter("id", id).setParameter("votes", votes);
	}
	
	public List<String> findCityList() {
		return em.createQuery("SELECT DISTINCT city FROM Hotel", String.class).getResultList();
	}
	
	public List<Hotel> findHotelList(String city) {
		return em.createQuery("FROM Hotel WHERE city = :city ORDER BY pricePerNight", Hotel.class).setParameter("city", city).getResultList();
	}
	
	public List<Hotel> findHotelList(String city, Integer maxPrice) {
		return em.createQuery("FROM Hotel WHERE city = :city AND pricePerNight <= :maxPrice ORDER BY pricePerNight", Hotel.class).setParameter("city", city).setParameter("maxPrice", maxPrice).getResultList();
	}

}
