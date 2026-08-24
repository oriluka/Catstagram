import Fastify from 'fastify'
import routes from './routes/routes.js'

const fastify = Fastify({
  logger: true,
})

//declare routes using async/await syntax
fastify.get('/', async (request, reply) => {
  return { hello: 'world' }
})


// Run the server!
fastify.listen({ port: 3000 }, function (err, address) {
  if (err) {
    fastify.log.error(err)
    process.exit(1)
  }})
  // Server is now listening on ${address}
