using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using WebApp.Models;

namespace WebApp.Controllers
{
    [Produces("application/json")]
    [Route("api/Reviewers")]
    public class ReviewersController : Controller
    {
        public Reviewer[] Reviewers()
        {
            //todo: will get these values from database later
            return new []
            {
                new Reviewer(){Id = 1, Name = "Dima"},
                new Reviewer(){Id = 2, Name = "Valera"},
            };
        }
    }
}