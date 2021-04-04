import express from 'express';

export const app = express();

app.set('PORT', process.env['PORT'] || '3000');

app.use(express.json());
app.use(express.urlencoded({ extended: false }));

app
	.get('/', (req, res, next) => {
		const group = req.query['group'];
		const key = req.query['key'];
		if(group == 'nogi-profile') {
			if(key == 'mysql') {
				res.send(process.env['MYSQL_PASSWORD']);
			}
		}

		if(!res.headersSent) {
			res.send('nogi-profile-keystore');
		}
	});

app
	.use((req, res, next) => {
		res.sendStatus(404);
	})
	.use(((err, req, res, next) => {
		console.error(err);
		res.sendStatus(500);
	}) as express.ErrorRequestHandler);
