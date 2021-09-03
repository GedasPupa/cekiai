import express from 'express';
import { getList, getOne, save, deleteRecord } from './db/cekiai.js';

const router = express.Router();

router.get('/', async (req, res) => {
    try {
        const cekiai = await getList();      
        res.render('cekiai', { cekiai, title: 'Visi cekiai' });

    } catch (err) {
        res.status(500).end(`<html><body><h1>Ivyko klaida: ${err.message}</h1></body></html>`);
    }
});

router.get("/naujas", async (req, res) => {
    res.type("text/html");
    try {
      res.render("cekis", {});
    } catch (err) {
      console.log(err);
      res.status(500).send(err);
    }
  });
  
router.get("/:id", async (req, res) => {
    res.type("text/html");
    try {
        const cekis = await getOne(req.params.id);
        if (cekis.length > 0) {
        res.render("cekis", cekis[0]);
        } else {
        res.redirect("/cekiai");
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
        res.redirect("/cekiai");
        return;
    }
    try {
        await save(
        req.body.id,
        req.body.pavadinimas,
        );
        res.redirect("/cekiai");
    } catch (err) {
        console.log(err);
        res.status(500).send(err);
    }
});
  
router.get("/:id/delete", async (req, res) => {
    res.type("text/html");
    try {
        await deleteRecord(req.params.id);
        res.redirect("/cekiai");
    } catch (err) {
        console.log(err);
        res.status(500).send(err);
    }
});

export { router };