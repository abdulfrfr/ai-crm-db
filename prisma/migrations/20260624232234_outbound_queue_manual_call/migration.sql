-- DropForeignKey
ALTER TABLE "OutboundQueue" DROP CONSTRAINT "OutboundQueue_ticketId_fkey";

-- AlterTable
ALTER TABLE "OutboundQueue" ADD COLUMN     "orgId" TEXT,
ALTER COLUMN "ticketId" DROP NOT NULL;

-- AddForeignKey
ALTER TABLE "OutboundQueue" ADD CONSTRAINT "OutboundQueue_ticketId_fkey" FOREIGN KEY ("ticketId") REFERENCES "Ticket"("id") ON DELETE SET NULL ON UPDATE CASCADE;
