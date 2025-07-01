import compression from 'compression';
import cookieParser from 'cookie-parser';
import cors from 'cors';
import express from 'express';
import fs from 'fs';
import path from 'path';
import { collectDefaultMetrics, register } from 'prom-client';

import connectDB from './config/db.js';
import { PORT } from './config/utils.js';
import authRouter from './routes/auth.js';
import postsRouter from './routes/posts.js';
import { connectToRedis } from './services/redis.js';

const app = express();
const port = PORT || 5000;

// Middleware setup
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(cors());
app.use(cookieParser());
app.use(compression());

// Ensure logs directory exists
const logDir = path.join(process.cwd(), 'logs');
const logFile = path.join(logDir, 'backend.log');
fs.mkdirSync(logDir, { recursive: true });
const logStream = fs.createWriteStream(logFile, { flags: 'a' });
const log = (...args) => {
  const message = args.join(' ');
  logStream.write(message + '\n');
  console.log(message);
};

// Connect to database
connectDB();
log('✅ Connected to MongoDB');

// Connect to redis
connectToRedis();
log('✅ Connected to Redis');

// API routes
app.use('/api/posts', postsRouter);
app.use('/api/auth', authRouter);

// Health check
app.get('/', (req, res) => {
  res.send('Yay!! Backend of wanderlust app is now accessible');
});

// Prometheus metrics endpoint
collectDefaultMetrics();
app.get('/metrics', async (req, res) => {
  res.set('Content-Type', register.contentType);
  res.end(await register.metrics());
});

// Start server
app.listen(port, () => {
  log(`🚀 Server is running on port ${port}`);
});

export default app;
