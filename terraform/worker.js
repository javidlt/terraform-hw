export default {
  async fetch(request, env) {
    if (request.method !== "GET") {
      return new Response("Method Not Allowed", { status: 405 });
    }

    const url = new URL(request.url);

    const body = {
      message: "Hello from practica11 worker",
      method: request.method,
      path: url.pathname,
      database: env.DB ? "bound" : "unbound",
      timestamp: new Date().toISOString(),
    };

    return new Response(JSON.stringify(body, null, 2), {
      status: 200,
      headers: { "content-type": "application/json" },
    });
  },
};
