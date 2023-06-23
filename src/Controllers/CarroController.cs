using AutoMapper;

using CatalogoCarros.Api.Data;
using CatalogoCarros.Api.Models;

using Microsoft.AspNetCore.Mvc;

namespace CatalogoCarros.Api.Controller
{
    [ApiController]
    [Route("[controller]")]
    public class CarroController : ControllerBase
    {
        private readonly AppDbContext _context;
        private readonly IMapper _mapper;

        public CarroController(AppDbContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        [HttpGet]
        public IEnumerable<Carro> RecuperarCinemas()
        {
            return _context.Carros;
        }
    }
}
