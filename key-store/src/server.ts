import { app } from './app';

const port = app.get('PORT');
const server = app.listen(port);

server.on('listening', () => {
	console.log('listen...', port);
});

process.once('SIGTERM', () => {
	server.close();
});
process.on('SIGINT', () => {
	process.emit('SIGTERM', 'SIGTERM');
});
