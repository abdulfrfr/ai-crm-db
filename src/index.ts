// Re-export everything from the generated Prisma client so consumers
// only need to import from '@aicrm/db' — never from '@prisma/client' directly.
export {
  PrismaClient,
  Prisma,
  type Organization,
  type User,
  type Contact,
  type Customer,
  type Call,
  type TranscriptSegment,
  type Ticket,
  type TicketComment,
  type TicketStatusHistory,
  type OutboundQueue,
  type Deal,
  type DealFollowUp,
  type Announcement,
  type AnnouncementDelivery,
  type Notification,
  type CrmIdMap,
  type CreditLedger,
  type BillingTopup,
} from '../client'

import { PrismaClient } from '../client'

// Global singleton — one connection pool per process.
// Next.js dev hot-reloads create new module instances; the globalThis trick
// prevents a new PrismaClient (and connection pool) on every file change.
const globalForPrisma = globalThis as unknown as { prisma: PrismaClient }

export const prisma: PrismaClient =
  globalForPrisma.prisma ??
  new PrismaClient({
    log: process.env.NODE_ENV === 'development' ? ['error'] : ['error'],
  })

if (process.env.NODE_ENV !== 'production') {
  globalForPrisma.prisma = prisma
}
