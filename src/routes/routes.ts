//declare routes using async/await syntax

async function routes (fastify, options) {
  fastify.get('/', async (request, reply) => {
    return { hello: 'world' }
  })
}
//ESM
export default routes