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
    public class AnswerController : ApiController
    {
        ModelTriviaDBContainer db = new ModelTriviaDBContainer();
        [HttpGet]
        public IHttpActionResult GetAnswer()
        {
            try
            {
                return Ok(db.AnswerSet.ToList());
            }
            catch (Exception)
            {
                throw;
            }
        }
        [HttpPost]
        public IHttpActionResult InsertAnswer(Answer answer)
        {
            try
            {
                db.Entry(answer).State = System.Data.Entity.EntityState.Added;
                db.SaveChanges();
                return Ok(answer);
            }
            catch (Exception)
            {
                throw;
            }
        }
        [HttpPost]
        public IHttpActionResult UpdateAnswer(Answer answer)
        {
            try
            {
                db.Entry(answer).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
                return Ok(answer);
            }
            catch (Exception)
            {
                throw;
            }
        }
        [HttpPost]
        public IHttpActionResult DeleteAnswer(Answer answer)
        {
            try
            {
                db.Entry(answer).State = System.Data.Entity.EntityState.Deleted;
                db.SaveChanges();
                return Ok(answer);
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}
