import { drizzle } from "drizzle-orm/node-postgres";
import { Pool } from "pg";

const pool = new Pool({
  connectionString: "postgresql://postgresql:test123@mydb:6432/mydb",
});

export const db = drizzle(pool);
