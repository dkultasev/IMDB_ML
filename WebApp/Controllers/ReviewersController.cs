using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using WebApp.Infrastructure;
using WebApp.Models;

namespace WebApp.Controllers
{
    [Produces("application/json")]
    [Route("api/Reviewers")]
    public class ReviewersController : Controller
    {
        private readonly ImdbContext _context;

        public ReviewersController(ImdbContext context)
        {
            _context = context;
        }

        public Reviewer[] Reviewers()
        {
            return _context.Reviewers.AsNoTracking().ToArray();
        }
    }
}