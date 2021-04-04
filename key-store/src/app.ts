import express from 'express';

export const app = express();

app.set('PORT', process.env['PORT'] || '3000');

app
	.get('/', (req, res, next) => {
		res.send('nogi-profile-keystore');
	});

app
	.use((req, res, next) => {
		res.sendStatus(404);
	})
	.use(((err, req, res, next) => {
		console.error(err);
		res.sendStatus(500);
	}) as express.ErrorRequestHandler);
