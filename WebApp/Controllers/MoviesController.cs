using System;
using System.Collections.Generic;
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
    [Route("api/Movies")]
    public class MoviesController : Controller
    {
        private readonly ImdbContext _context;

        public MoviesController(ImdbContext context)
        {
            _context = context;
        }

        [HttpGet, Route("reviewer/{reviewerId:int}")]
        public MovieReviewViewModel[] Movies(int reviewerId)
        {
            var result =
                _context.Database.GetDbConnection().Query<MovieReviewViewModel>(
                        @"
select t.TitleId, t.Title, t.StartYear as MovieYear, t.AvgRating, utr.Rating as UserRating from Title tleft outer join UserTitleRating utr  on t.TitleId = utr.TitleId and utr.CustomReviewerId = @Id", new { Id = reviewerId })
                    .ToArray();

            return result;
        }
    }
}