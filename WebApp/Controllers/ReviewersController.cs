using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using Dapper;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
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

        [HttpGet]
        public Reviewer[] Reviewers()
        {
            return QueryableExtensions.AsNoTracking(_context.Reviewers).ToArray();
        }


    }
}