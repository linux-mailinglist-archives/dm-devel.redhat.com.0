Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C8340444F9F
	for <lists+dm-devel@lfdr.de>; Thu,  4 Nov 2021 08:23:09 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-203-o9DUQ9OpMH2U2KxjyVC7SA-1; Thu, 04 Nov 2021 03:23:05 -0400
X-MC-Unique: o9DUQ9OpMH2U2KxjyVC7SA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 406C8806692;
	Thu,  4 Nov 2021 07:22:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 19CF860C23;
	Thu,  4 Nov 2021 07:22:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E6FBC1806D03;
	Thu,  4 Nov 2021 07:22:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
	[10.11.54.2])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1A46nAtf006338 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 4 Nov 2021 02:49:10 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B10BC40C1252; Thu,  4 Nov 2021 06:49:10 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ABAEF400F3C6
	for <dm-devel@redhat.com>; Thu,  4 Nov 2021 06:49:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8D67D8011AF
	for <dm-devel@redhat.com>; Thu,  4 Nov 2021 06:49:10 +0000 (UTC)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
	(mail-bn7nam10on2087.outbound.protection.outlook.com [40.107.92.87])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-431-RGZh_wCoPbWj703kLAutKQ-1; Thu, 04 Nov 2021 02:48:39 -0400
X-MC-Unique: RGZh_wCoPbWj703kLAutKQ-1
Received: from BN6PR22CA0049.namprd22.prod.outlook.com (2603:10b6:404:ca::11)
	by CH2PR12MB4922.namprd12.prod.outlook.com (2603:10b6:610:65::22)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14;
	Thu, 4 Nov 2021 06:48:36 +0000
Received: from BN8NAM11FT039.eop-nam11.prod.protection.outlook.com
	(2603:10b6:404:ca:cafe::ec) by BN6PR22CA0049.outlook.office365.com
	(2603:10b6:404:ca::11) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15 via
	Frontend Transport; Thu, 4 Nov 2021 06:48:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
	smtp.mailfrom=nvidia.com; infradead.org; dkim=none (message not signed)
	header.d=none; infradead.org;
	dmarc=pass action=none header.from=nvidia.com
Received: from mail.nvidia.com (216.228.112.34) by
	BN8NAM11FT039.mail.protection.outlook.com (10.13.177.169) with
	Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
	15.20.4669.10 via Frontend Transport; Thu, 4 Nov 2021 06:48:36 +0000
Received: from dev.nvidia.com (172.20.187.6) by HQMAIL107.nvidia.com
	(172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.18;
	Thu, 4 Nov 2021 06:48:34 +0000
From: Chaitanya Kulkarni <chaitanyak@nvidia.com>
To: <linux-block@vger.kernel.org>, <linux-raid@vger.kernel.org>,
	<linux-nvme@lists.infradead.org>, <linux-scsi@vger.kernel.org>,
	<target-devel@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
	<linux-xfs@vger.kernel.org>, <dm-devel@redhat.com>
Date: Wed, 3 Nov 2021 23:46:31 -0700
Message-ID: <20211104064634.4481-6-chaitanyak@nvidia.com>
In-Reply-To: <20211104064634.4481-1-chaitanyak@nvidia.com>
References: <20211104064634.4481-1-chaitanyak@nvidia.com>
MIME-Version: 1.0
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
	HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d463c2a0-3cc9-4ef9-715f-08d99f5f205d
X-MS-TrafficTypeDiagnostic: CH2PR12MB4922:
X-Microsoft-Antispam-PRVS: <CH2PR12MB49221098D02442DD978C64ECA38D9@CH2PR12MB4922.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: gLwEKNl/4NCZ2aXAcasSAQW/zJDJM2GuhK8L/BvmKkaQA4L+RDYpQZZrg3dCMopLZ9YgDUiqIntp8Jv+unb3obuOoQb0aFNTgEj/DRn40UHsElmL6Vgyasza905kvDkueExaOlyuKX6KKX5x1UD8oSHUHeXQd9N9+QVthtbE+6hdBtwDwXlJGjWo73HU6BD2GtIXXDPz/+BiHsdNGb5daYb7MdyvVNhF2vgVVCLiNY5dojm5ntd/cmijm5Xqh7J7zzuNIr1UjdwgSRw5vS9YiwTXO1CFg5l6fg2HD4KAnMqvNNFwC3Tx/f0II1YG9D2qpsOOnqkDMBVbktrunPlxK07bmHdQrm1EuySCQ/FcwSGY9cNlV4W255mJb+sNkVqGah6rozTO8ttomqDk388bNioAcb4ausqBFrgX8ffV8XV/hgq2Pzpa64VqeNwDDuGMORbB/lGPaJWsaD23L/NG3USaxpJH8Cwz3xBS6dds3ZQq5NUuJtgsfLSkJunSTy70KIrrFPH76GQiW7QocO+mjuFRCKVSWv+8rwvPkNHZoLgcnSqRjuIyBETVxbSIEnjbOgCm7W9ZCELS8LcGGomYbY9FWllovcTtvfXDyO0L5lhtkh+rsWwGAZB5FX+7L5yDr6/RH7KeOgFeS5IvzOMLpUHllH8z0c0V5uGQGD/IGtfJn8BMqTaojKC4Fa54KqbkqmDUI7xhiYXhg7lXGSroFKwm/q9fAFYUVAUnGIkEsJB5D+QPcsc8IrDhjCUC59yy
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com;
	CAT:NONE;
	SFS:(4636009)(46966006)(36840700001)(36860700001)(36756003)(70586007)(336012)(26005)(186003)(5660300002)(82310400003)(7696005)(107886003)(16526019)(2906002)(86362001)(15650500001)(4326008)(70206006)(2616005)(8936002)(316002)(36906005)(7636003)(1076003)(54906003)(110136005)(8676002)(356005)(7416002)(426003)(508600001)(7406005)(6666004)(83380400001)(47076005)(21314003)(2101003);
	DIR:OUT; SFP:1101
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2021 06:48:36.1661 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d463c2a0-3cc9-4ef9-715f-08d99f5f205d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;
	Ip=[216.228.112.34]; Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT039.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4922
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 1A46nAtf006338
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 04 Nov 2021 03:22:43 -0400
Cc: snitzer@redhat.com, ebiggers@google.com, djwong@kernel.org, clm@fb.com,
	adilger.kernel@dilger.ca, osandov@fb.com, agk@redhat.com,
	javier@javigon.com, sagi@grimberg.me, dongli.zhang@oracle.com,
	willy@infradead.org, hch@lst.de, danil.kipnis@cloud.ionos.com,
	idryomov@gmail.com, jinpu.wang@cloud.ionos.com,
	Chaitanya Kulkarni <kch@nvidia.com>, jejb@linux.ibm.com,
	josef@toxicpanda.com, ming.lei@redhat.com, dsterba@suse.com,
	viro@zeniv.linux.org.uk, jefflexu@linux.alibaba.com,
	bvanassche@acm.org, axboe@kernel.dk, tytso@mit.edu,
	martin.petersen@oracle.com, song@kernel.org,
	johannes.thumshirn@wdc.com, jlayton@kernel.org,
	kbusch@kernel.org, jack@suse.com
Subject: [dm-devel] [RFC PATCH 5/8] nvmet: add Verify emulation support for
	bdev-ns
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Chaitanya Kulkarni <kch@nvidia.com>

Not all devices can support verify requests which can be mapped to
the controller specific command. This patch adds a way to emulate
REQ_OP_VERIFY for NVMeOF block device namespace. We add a new
workqueue to offload the emulation with the help of
__blkdev_emulate_verify().

Signed-off-by: Chaitanya Kulkarni <kch@nvidia.com>
---
 drivers/nvme/target/core.c        | 12 +++++++-
 drivers/nvme/target/io-cmd-bdev.c | 51 ++++++++++++++++++++++++++-----
 drivers/nvme/target/nvmet.h       |  3 ++
 3 files changed, 57 insertions(+), 9 deletions(-)

diff --git a/drivers/nvme/target/core.c b/drivers/nvme/target/core.c
index 8ce4d59cc9e7..8a17a6479073 100644
--- a/drivers/nvme/target/core.c
+++ b/drivers/nvme/target/core.c
@@ -16,6 +16,7 @@
 #include "nvmet.h"
 
 struct workqueue_struct *buffered_io_wq;
+struct workqueue_struct *verify_wq;
 static const struct nvmet_fabrics_ops *nvmet_transports[NVMF_TRTYPE_MAX];
 static DEFINE_IDA(cntlid_ida);
 
@@ -1546,11 +1547,17 @@ static int __init nvmet_init(void)
 
 	nvmet_ana_group_enabled[NVMET_DEFAULT_ANA_GRPID] = 1;
 
+	verify_wq = alloc_workqueue("nvmet-verify-wq", WQ_MEM_RECLAIM, 0);
+	if (!verify_wq) {
+		error = -ENOMEM;
+		goto out;
+	}
+
 	buffered_io_wq = alloc_workqueue("nvmet-buffered-io-wq",
 			WQ_MEM_RECLAIM, 0);
 	if (!buffered_io_wq) {
 		error = -ENOMEM;
-		goto out;
+		goto out_free_verify_work_queue;
 	}
 
 	error = nvmet_init_discovery();
@@ -1566,6 +1573,8 @@ static int __init nvmet_init(void)
 	nvmet_exit_discovery();
 out_free_work_queue:
 	destroy_workqueue(buffered_io_wq);
+out_free_verify_work_queue:
+	destroy_workqueue(verify_wq);
 out:
 	return error;
 }
@@ -1576,6 +1585,7 @@ static void __exit nvmet_exit(void)
 	nvmet_exit_discovery();
 	ida_destroy(&cntlid_ida);
 	destroy_workqueue(buffered_io_wq);
+	destroy_workqueue(verify_wq);
 
 	BUILD_BUG_ON(sizeof(struct nvmf_disc_rsp_page_entry) != 1024);
 	BUILD_BUG_ON(sizeof(struct nvmf_disc_rsp_page_hdr) != 1024);
diff --git a/drivers/nvme/target/io-cmd-bdev.c b/drivers/nvme/target/io-cmd-bdev.c
index 5a888cdadfea..80b8e7bfd1ae 100644
--- a/drivers/nvme/target/io-cmd-bdev.c
+++ b/drivers/nvme/target/io-cmd-bdev.c
@@ -433,25 +433,60 @@ static void nvmet_bdev_execute_write_zeroes(struct nvmet_req *req)
 	}
 }
 
-static void nvmet_bdev_execute_verify(struct nvmet_req *req)
+static void __nvmet_req_to_verify_sectors(struct nvmet_req *req,
+		sector_t *sects, sector_t *nr_sects)
 {
 	struct nvme_verify_cmd *verify = &req->cmd->verify;
+
+	*sects = le64_to_cpu(verify->slba) << (req->ns->blksize_shift - 9);
+	*nr_sects = (((sector_t)le16_to_cpu(verify->length) + 1) <<
+			(req->ns->blksize_shift - 9));
+}
+
+static void nvmet_bdev_emulate_verify_work(struct work_struct *w)
+{
+	struct nvmet_req *req = container_of(w, struct nvmet_req, b.work);
+	sector_t nr_sector;
+	sector_t sector;
+	int ret = 0;
+
+	__nvmet_req_to_verify_sectors(req, &sector, &nr_sector);
+	if (!nr_sector)
+		goto out;
+
+	ret = blkdev_emulate_verify(req->ns->bdev, sector, nr_sector,
+			GFP_KERNEL);
+out:
+	nvmet_req_complete(req,
+			   blk_to_nvme_status(req, errno_to_blk_status(ret)));
+}
+
+static void nvmet_bdev_submit_emulate_verify(struct nvmet_req *req)
+{
+	INIT_WORK(&req->b.work, nvmet_bdev_emulate_verify_work);
+	queue_work(verify_wq, &req->b.work);
+}
+
+
+static void nvmet_bdev_execute_verify(struct nvmet_req *req)
+{
 	struct bio *bio = NULL;
 	sector_t nr_sector;
 	sector_t sector;
-	int ret;
+	int ret = 0;
 
 	if (!nvmet_check_transfer_len(req, 0))
 		return;
 
+	/* offload emulation */
 	if (!bdev_verify_sectors(req->ns->bdev)) {
-		nvmet_req_complete(req, NVME_SC_INTERNAL | NVME_SC_DNR);
+		nvmet_bdev_submit_emulate_verify(req);
 		return;
 	}
 
-	sector = le64_to_cpu(verify->slba) << (req->ns->blksize_shift - 9);
-	nr_sector = (((sector_t)le16_to_cpu(verify->length) + 1) <<
-			(req->ns->blksize_shift - 9));
+	__nvmet_req_to_verify_sectors(req, &sector, &nr_sector);
+	if (!nr_sector)
+		goto out;
 
 	ret = __blkdev_issue_verify(req->ns->bdev, sector, nr_sector,
 			GFP_KERNEL, &bio);
@@ -459,9 +494,9 @@ static void nvmet_bdev_execute_verify(struct nvmet_req *req)
 		bio->bi_private = req;
 		bio->bi_end_io = nvmet_bio_done;
 		submit_bio(bio);
-	} else {
-		nvmet_req_complete(req, errno_to_nvme_status(req, ret));
 	}
+out:
+	nvmet_req_complete(req, errno_to_nvme_status(req, ret));
 }
 
 u16 nvmet_bdev_parse_io_cmd(struct nvmet_req *req)
diff --git a/drivers/nvme/target/nvmet.h b/drivers/nvme/target/nvmet.h
index 8776dd1a0490..7f3f584b1e7b 100644
--- a/drivers/nvme/target/nvmet.h
+++ b/drivers/nvme/target/nvmet.h
@@ -323,6 +323,8 @@ struct nvmet_req {
 	union {
 		struct {
 			struct bio      inline_bio;
+			/* XXX: should we take work out of union ? */
+			struct work_struct      work;
 		} b;
 		struct {
 			bool			mpool_alloc;
@@ -355,6 +357,7 @@ struct nvmet_req {
 };
 
 extern struct workqueue_struct *buffered_io_wq;
+extern struct workqueue_struct *verify_wq;
 
 static inline void nvmet_set_result(struct nvmet_req *req, u32 result)
 {
-- 
2.22.1


--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

