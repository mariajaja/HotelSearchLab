package co.grandcircus.hotel.HotelSearch;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import co.grandcircus.hotel.HotelSearch.dao.HotelDao;

@Controller
public class HotelController {
	
	@Autowired
	private HotelDao hotelDao;
	
	@RequestMapping("/")
	public ModelAndView index() {
		ModelAndView mav = new ModelAndView("index");
		mav.addObject("cities", hotelDao.findCityList());
		return mav;
	}
	
	@GetMapping("/list")
	public ModelAndView citySearch(@RequestParam(name="city") String city, @RequestParam(name="maxPrice", required=false) Integer maxPrice) {
		ModelAndView mav = new ModelAndView("city-search");
		mav.addObject("city", city);
		if (maxPrice != null) {
			mav.addObject("hotelList", hotelDao.findHotelList(city, maxPrice));
		} else {
			mav.addObject("hotelList", hotelDao.findHotelList(city));
		}
		return mav;
	}

}
