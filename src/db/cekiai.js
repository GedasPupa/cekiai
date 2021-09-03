import { dbConnect, dbDisconnect, dbQuery } from "./db.js";

async function getList() {
    let conn;
    try {
        conn = await dbConnect();
        let r = await dbQuery(
            conn,
            // "select cekiai.data, parduotuves.pavadinimas from cekiai, parduotuves where cekiai.pardavejai_id = parduotuves.id order by parduotuves.pavadinimas",
            "SELECT cekiai.id, cekiai.data, parduotuves.pavadinimas, sum(kaina) as suma FROM cekiai, parduotuves, prekes WHERE cekiai.pardavejai_id = parduotuves.id and prekes.cekiai_id = cekiai.id GROUP BY cekiai.id, cekiai.data, parduotuves.pavadinimas -- HAVING sum(kaina) > 5.00 ORDER BY sum(kaina) desc",
        );
        return r.results;
    } finally {
        try {
            await dbDisconnect(conn);
        } catch (err) {
        // ignored
        }
    }
}

async function getOne(id) {
    id = parseInt(id);
    if (isFinite(id)) {
      let conn;
      try {
        conn = await dbConnect();
        let r = await dbQuery(
            conn,
            "select id, data, pardavejai_id from cekiai where id = ?",
            [id],
        );
        return r.results;
      } finally {
        try {
            await dbDisconnect(conn);
        } catch (err) {
            // ignored
        }
      }
    } else {
      throw new Error("Bad id");
    }
  }
  
async function save(id, data, pardavejai_id, mokejimu_tipai_id) {
    let conn;
    try {
      conn = await dbConnect();
      if (id) {
        let r = await dbQuery(
            conn,
            "update cekiai set data = ? where id = ?;",
            [data, id],
        );
        return r.results;
      } else {
        let r = await dbQuery(
            conn,
            "insert into cekiai (data, pardavejai_id, mokejimu_tipai_id) values (?, ?, ?);",
            [data, pardavejai_id, mokejimu_tipai_id],
        );
        return r.results;
      }
    } finally {
        try {
            await dbDisconnect(conn);
        } catch (err) {
            // ignored
        }
    }
}
  
async function deleteRecord(id) {
    id = parseInt(id);
    if (isFinite(id)) {
        let conn;
        try {
        conn = await dbConnect();
        let r = await dbQuery(
            conn,
            "delete from cekiai where id = ?",
            [id],
        );
        } finally {
        try {
            await dbDisconnect(conn);
        } catch (err) {
            // ignored
        }
        }
    } else {
        throw new Error("Bad id");
    }
}

export { getList, getOne, save, deleteRecord };