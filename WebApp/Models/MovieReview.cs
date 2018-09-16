using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebApp.Models
{
    public class MovieReview
    {
        public int UserId { get; set; }
        public string TitleId { get; set; }
        public decimal Rating { get; set; }
        public DateTime RatingDate { get; set; }
    }
}
