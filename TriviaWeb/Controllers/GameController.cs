using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
using TriviaWeb.Models.DB;

namespace TriviaWeb.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class GameController : ApiController
    {
        ModelTriviaDBContainer db = new ModelTriviaDBContainer();
        [HttpGet]
        public IHttpActionResult GetGame()
        {
            try
            {
                return Ok(db.GameSet.ToList());
            }
            catch (Exception)
            {
                throw;
            }
        }
        [HttpPost]
        public IHttpActionResult InsertGame(Game game)
        {
            try
            {
                db.Entry(game).State = System.Data.Entity.EntityState.Added;
                db.SaveChanges();
                return Ok(game);
            }
            catch (Exception)
            {
                throw;
            }
        }
        [HttpPost]
        public IHttpActionResult UpdateGame(Game game)
        {
            try
            {
                db.Entry(game).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
                return Ok(game);
            }
            catch (Exception)
            {
                throw;
            }
        }
        [HttpPost]
        public IHttpActionResult DeleteGame(Game game)
        {
            try
            {
                db.Entry(game).State = System.Data.Entity.EntityState.Deleted;
                db.SaveChanges();
                return Ok(game);
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}
