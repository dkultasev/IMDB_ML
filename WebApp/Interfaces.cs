using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;

namespace WebApp
{
    public class ValeraPutItSomewhere
    {
        interface IMoviesWithRatingsByUserName
        {
            string TitleId { get; set; }
            double AvgRating { get; set; }
            int NbrVotes { get; set; }
            int CustomReviewerId { get; set; }
            int Rating { get; set; }
            int TitleYear { get; set; }
        }
    }
}
