# Stage 1: Build the executable
FROM alpine:latest AS builder

# Install necessary tools for building
RUN apk add --no-cache git bash cmake make g++ flex bison

# Set up workspace
RUN mkdir -p /workspace
WORKDIR /workspace

# Clone the repository
RUN git clone https://github.com/KCL-Planning/VAL.git .

# Build the project
RUN ./scripts/linux/build_linux64.sh all Release

# Stage 2: Minimal runtime image
FROM alpine:latest

# Install runtime dependencies (if any)
RUN apk add --no-cache libstdc++ 

# Copy the built executable from the builder stage
COPY --from=builder /workspace/build/linux64/Release/_CPack_Packages/Linux/TGZ/Val--Linux/bin /usr/local/bin/
COPY --from=builder /workspace/build/linux64/Release/_CPack_Packages/Linux/TGZ/Val--Linux/bin/libVAL.so /usr/local/lib

# Set executable as entrypoint (if desired)
ENTRYPOINT ["/usr/local/bin/Validate"]

# Optionally specify a default command
CMD ["-h"]
