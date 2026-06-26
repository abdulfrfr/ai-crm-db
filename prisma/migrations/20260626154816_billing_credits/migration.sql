-- AlterTable
ALTER TABLE "Organization" ADD COLUMN     "creditBalanceUsd" DOUBLE PRECISION NOT NULL DEFAULT 30.0;

-- CreateTable
CREATE TABLE "CreditLedger" (
    "id" TEXT NOT NULL,
    "orgId" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "amountUsd" DOUBLE PRECISION NOT NULL,
    "description" TEXT NOT NULL,
    "callId" TEXT,
    "paymentRef" TEXT,
    "balanceAfter" DOUBLE PRECISION NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "CreditLedger_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "BillingTopup" (
    "id" TEXT NOT NULL,
    "orgId" TEXT NOT NULL,
    "amountUsd" DOUBLE PRECISION NOT NULL,
    "txRef" TEXT NOT NULL,
    "flwTxId" TEXT,
    "status" TEXT NOT NULL DEFAULT 'pending',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "completedAt" TIMESTAMP(3),

    CONSTRAINT "BillingTopup_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "CreditLedger_orgId_idx" ON "CreditLedger"("orgId");

-- CreateIndex
CREATE INDEX "CreditLedger_createdAt_idx" ON "CreditLedger"("createdAt");

-- CreateIndex
CREATE UNIQUE INDEX "BillingTopup_txRef_key" ON "BillingTopup"("txRef");

-- CreateIndex
CREATE INDEX "BillingTopup_orgId_idx" ON "BillingTopup"("orgId");

-- CreateIndex
CREATE INDEX "BillingTopup_txRef_idx" ON "BillingTopup"("txRef");

-- AddForeignKey
ALTER TABLE "CreditLedger" ADD CONSTRAINT "CreditLedger_orgId_fkey" FOREIGN KEY ("orgId") REFERENCES "Organization"("id") ON DELETE CASCADE ON UPDATE CASCADE;
