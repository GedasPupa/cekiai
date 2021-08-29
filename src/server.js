import { default as express } from 'express';
import exphbs from 'express-handlebars';
import { router as pardavejaiRouter } from './pardavejai.js';

const SERVER_PORT = 3000;
const WEB_DIR = 'web';

const app = express();
const hbs = exphbs({
    helpers: {
        dateFormat(d) {
            if (d instanceof Date) {
                return d.toISOString().substring(0, 10);
            } else {
                return d;
            }
        },
    },
});

app.engine('handlebars', hbs);
app.set('view engine', 'handlebars');

app.use(express.static(WEB_DIR));

app.use(express.urlencoded({
    extended: true
}));

app.use('/pardavejai', pardavejaiRouter);

app.listen(SERVER_PORT, () => {
    console.log(`Server started on port: ${SERVER_PORT}`);
});