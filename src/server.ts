import Fastify from 'fastify'
import routes from './routes/routes.js'

const fastify = Fastify({
  logger: true,
})

//declare routes using async/await syntax
fastify.get('/', async (request, reply) => {
  return { hello: 'world' }
})

// Start the server and listen on port 3000
const start = async (): Promise<void> => {
  try {
    const address = await fastify.listen({
      port: 3000,
      host: '0.0.0.0',
    })

    fastify.log.info(`Server listening at ${address}`)
  } catch (err) {
    fastify.log.error(err)
    process.exit(1)
  }
}

start()
