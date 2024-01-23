# Build Phase
FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . . 
RUN npm run build

# Run Phase
FROM nginx
# Copy the build folder from 'builder' phase (RUN line) into '/usr/share/nginx/html'
COPY --from=builder /app/build /usr/share/nginx/html


