import express from 'express';
import { getList, getOne, save, deleteRecord } from './db/mokejimuTipai.js';

const router = express.Router();

router.get('/', async (req, res) => {
    try {
        const mokejimuTipai = await getList();      
        res.render('mokejimuTipai', { mokejimuTipai, title: 'Visi mokejimuTipai' });

    } catch (err) {
        res.status(500).end(`<html><body><h1>Ivyko klaida: ${err.message}</h1></body></html>`);
    }
});

router.get("/naujas", async (req, res) => {
    res.type("text/html");
    try {
      res.render("mokejimuTipas", {});
    } catch (err) {
      console.log(err);
      res.status(500).send(err);
    }
  });
  
router.get("/:id", async (req, res) => {
    res.type("text/html");
    try {
        const mokejimuTipas = await getOne(req.params.id);
        if (mokejimuTipas.length > 0) {
        res.render("mokejimuTipas", mokejimuTipas[0]);
        } else {
        res.redirect("/mokejimuTipai");
        }
    } catch (err) {
        console.log(err);
        res.status(500).send(err);
    }
});
  
router.post("/save", async (req, res) => {
    res.type("text/html");
    if (
        typeof req.body.pavadinimas !== "string" ||
        req.body.pavadinimas.trim() === ""
    ) {
        res.redirect("/mokejimuTipai");
        return;
    }
    try {
        await save(
        req.body.id,
        req.body.pavadinimas,
        );
        res.redirect("/mokejimuTipai");
    } catch (err) {
        console.log(err);
        res.status(500).send(err);
    }
});
  
router.get("/:id/delete", async (req, res) => {
    res.type("text/html");
    try {
        await deleteRecord(req.params.id);
        res.redirect("/mokejimuTipai");
    } catch (err) {
        console.log(err);
        res.status(500).send(err);
    }
});

export { router };