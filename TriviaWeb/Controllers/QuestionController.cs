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
    public class QuestionController : ApiController
    {
        ModelTriviaDBContainer db = new ModelTriviaDBContainer();
        [HttpGet]
        public IHttpActionResult GetQuestion()
        {
            try
            {
                return Ok(db.QuestionSet.ToList());
            }
            catch (Exception)
            {
                throw;
            }
        }
        [HttpPost]
        public IHttpActionResult InsertQuestion(Question question)
        {
            try
            {
                db.Entry(question).State = System.Data.Entity.EntityState.Added;
                db.SaveChanges();
                return Ok(question);
            }
            catch (Exception)
            {
                throw;
            }
        }
        [HttpPost]
        public IHttpActionResult UpdateQuestion(Question question)
        {
            try
            {
                db.Entry(question).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
                return Ok(question);
            }
            catch (Exception)
            {
                throw;
            }
        }
        [HttpPost]
        public IHttpActionResult DeleteQuestion(Question question)
        {
            try
            {
                db.Entry(question).State = System.Data.Entity.EntityState.Deleted;
                db.SaveChanges();
                return Ok(question);
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}
