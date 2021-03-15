module.exports = ({ env }) => ({
  host: env('HOST', '0.0.0.0'),
  port: env.int('PORT', 1338),
  admin: {
    auth: {
      secret: env('ADMIN_JWT_SECRET', 'ca4d3bc5f1f4270e5f6ddb0efc77196d'),
    },
  },
});
