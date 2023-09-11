// https://www.youtube.com/watch?v=hHM-hr9q4mo&t=599s

// npm install express 
// import { createServer } from 'node:http'
// const server = createServer((request, response) => {
//     console.log("oi")
//     response.write("oi")
//     return response.end()
// })
// server.listen(3333)

// npm install fastify
import { fastify } from 'fastify'
import { DatabaseMemory } from './database-memory.js'
const server = fastify()
const database = new DatabaseMemory()

// GET, POST, PUT, DELETE
// POST http://localhost:3333/videos
// PUT http://localhost:3333/videos/3

server.post('/videos', (request, reply) => {
    const { title, description, duration } = request.body

    database.create({
        title,
        description,
        duration
    })
    return reply.status(201).send()
})

server.get('/videos', (request, reply) => {
    const videos = database.list()
    return videos
})

server.put('/videos:id', (request, reply) => {
    const videoId = request.params.id
    const { title, description, duration } = request.body
    database.update(videoId, {
        title,
        description,
        duration,
    })
    return reply.status(204).send()
})

server.delete('/videos:id', () => {
    return "Hello node.js"
})

server.listen({ port: 3333, })