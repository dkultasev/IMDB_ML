using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using WebApp.Infrastructure;
using WebApp.Models;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace WebApp.Controllers
{
    [Route("api/[controller]")]
    public class MovieReviewsController : Controller
    {
        private readonly ImdbContext _context;

        public MovieReviewsController(ImdbContext context)
        {
            _context = context;
        }

        [HttpPost]
        public void AddMovieReview(string titleId, int userId, int rating)
        {
            var review = _context.MovieReviews.SingleOrDefault(x => x.UserId == userId && x.TitleId == titleId);
            if (review == null)
            {
                review = new MovieReview()
                {
                    UserId = userId,
                    TitleId = titleId,
                    Rating = rating,
                    RatingDate = new DateTime()
                };
                _context.MovieReviews.Add(review);
            }
            else
            {
                review.Rating = rating;
                review.RatingDate = new DateTime();
            }

            _context.SaveChanges();
        }
        
    }
}
