using AutoMapper;
using MealBookingAPI.Application.DTOs;
using MealBookingAPI.Data.Models;
using MealBookingAPI.Data.Repository.IRepository;
using Microsoft.AspNetCore.Mvc;

namespace MealBookingAPI.Application.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BookingController : Controller
    {
        private readonly IRepository<Booking> _repository;
        private readonly IMapper _mapper;

        public BookingController(IRepository<Booking> repository, IMapper mapper)
        {
            _repository = repository;
            _mapper = mapper;
        }

        [HttpPost]
        public async Task<IActionResult> CreateTEntity(BookingRequestDTO request)
        {
            var booking = _mapper.Map<BookingRequestDTO, Booking>(request);
            await _repository.InsertAsync(booking);
            var bookingDto = _mapper.Map<Booking, BookingRequestDTO>(booking);
            return Ok(bookingDto);
        }
        [HttpGet]
        public async Task<IActionResult> GetBookings()
        {
            var bookingList = await _repository.GetAll();
            var bookingDto = _mapper.Map<List<Booking>,List<BookingRequestDTO>>(bookingList.ToList());
            if (bookingDto == null)
            {
                return NotFound();
            }
            else
            {
                return Ok(bookingDto);
            }
        }
        [HttpDelete("{id}")]
        public async Task<IActionResult> RemoveBooking(int id)
        {
            var booking = await _repository.GetByIdAsync(id);
            var deleted = await _repository.DeleteAsync(booking);
            var entity = _mapper.Map<Booking, BookingRequestDTO>(booking);
            if(deleted != false)
            {
                return Ok(entity);
            }
            else
            {
                return BadRequest();
            }
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> UpdateBooking(int id,[FromBody] Booking booking)
        {
            if(!ModelState.IsValid || id != booking.Id)
            {
                return BadRequest("Booking id MISMATCH");
            }
            else
            {
                var update = await _repository.GetByIdAsync(id);
                if(update == null)
                {
                    return NotFound($"Employee with Id = {id} not found");
                }
                if (await _repository.UpdateAsync(booking))
                {
                    return Ok();
                }
                else
                {
                    return BadRequest();
                }
            }
        }
    }
}
