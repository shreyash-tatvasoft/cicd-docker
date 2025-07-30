FROM public.ecr.aws/library/node:18

# Set working directory
WORKDIR /app

# Install dependencies
COPY package*.json ./
RUN npm install

# Copy source files
COPY tsconfig.json ./
COPY src ./src
COPY public ./public

# Build TypeScript
RUN npm run build

# Expose the app port
EXPOSE 8000

# Run compiled app
CMD ["node", "dist/app.js"]
