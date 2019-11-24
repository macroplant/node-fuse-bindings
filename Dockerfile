FROM node:12.11.1

RUN apt-get update -y \
 && apt-get install fuse libfuse-dev build-essential -y


COPY ./ ./

#RUN npm install -g node-gyp
RUN npm install --unsafe-perm
RUN npm run tape
#we also can call a "node-gyp-build" directly
#RUN node-gyp configure && node-gyp build

# FUSE also needs flags "--rm --device /dev/fuse --privileged"
# to work properly 
CMD ["npm", "run", "tape"]