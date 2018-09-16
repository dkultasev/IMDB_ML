using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebApp.Models
{
    public class MovieReviewViewModel
    {
        public string TitleId { get; set; }
        public string Title { get; set; }
        public int MovieYear { get; set; }
        public decimal AvgRating { get; set; }
        public int? UserRating { get; set; }
    }
}
