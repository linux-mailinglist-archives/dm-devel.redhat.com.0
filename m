Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B31D5116AD
	for <lists+dm-devel@lfdr.de>; Wed, 27 Apr 2022 14:22:31 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-390-RsfZkKQWMVKzoE9nh0bcZA-1; Wed, 27 Apr 2022 08:22:29 -0400
X-MC-Unique: RsfZkKQWMVKzoE9nh0bcZA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CE5653C0E18E;
	Wed, 27 Apr 2022 12:22:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B40715742C1;
	Wed, 27 Apr 2022 12:22:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 403141947046;
	Wed, 27 Apr 2022 12:22:24 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id CD6CD1947BBF
 for <dm-devel@listman.corp.redhat.com>; Tue, 26 Apr 2022 12:24:38 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id BEA872167D69; Tue, 26 Apr 2022 12:24:38 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BA2242167D64
 for <dm-devel@redhat.com>; Tue, 26 Apr 2022 12:24:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A9B5F1E15C18
 for <dm-devel@redhat.com>; Tue, 26 Apr 2022 12:24:37 +0000 (UTC)
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-503-TnOE-KE8P7OEFlTOzgF6oA-1; Tue, 26 Apr 2022 08:24:28 -0400
X-MC-Unique: TnOE-KE8P7OEFlTOzgF6oA-1
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20220426121521epoutp03d7c2068860314753c67dedff1c583af9~pcU6tdR6_1888718887epoutp03A;
 Tue, 26 Apr 2022 12:15:21 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20220426121521epoutp03d7c2068860314753c67dedff1c583af9~pcU6tdR6_1888718887epoutp03A
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTP id
 20220426121520epcas5p2dd6146d0bef54e20540de6f2504020b6~pcU6Z1pVc3196931969epcas5p2N;
 Tue, 26 Apr 2022 12:15:20 +0000 (GMT)
Received: from epsmges5p3new.samsung.com (unknown [182.195.38.183]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4KngnJ3L7Dz4x9Pw; Tue, 26 Apr
 2022 12:15:16 +0000 (GMT)
Received: from epcas5p3.samsung.com ( [182.195.41.41]) by
 epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
 44.11.09762.452E7626; Tue, 26 Apr 2022 21:15:16 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
 20220426102009epcas5p3e5b1ddfd5d3c7200972cecb139650da6~pawV82u7H2815828158epcas5p3M;
 Tue, 26 Apr 2022 10:20:09 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20220426102009epsmtrp1037d86074cc99f7d34807a2919fd0836~pawV6Wisp2358223582epsmtrp1E;
 Tue, 26 Apr 2022 10:20:09 +0000 (GMT)
X-AuditID: b6c32a4b-213ff70000002622-cf-6267e2548fd3
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 CE.BA.08924.957C7626; Tue, 26 Apr 2022 19:20:09 +0900 (KST)
Received: from test-zns.sa.corp.samsungelectronics.net (unknown
 [107.110.206.5]) by epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20220426102004epsmtip1d83fc09a765589a173a68a4e9fcb0cd8~pawQ0HHvp0427604276epsmtip15;
 Tue, 26 Apr 2022 10:20:04 +0000 (GMT)
From: Nitesh Shetty <nj.shetty@samsung.com>
To: 
Date: Tue, 26 Apr 2022 15:42:34 +0530
Message-Id: <20220426101241.30100-7-nj.shetty@samsung.com>
In-Reply-To: <20220426101241.30100-1-nj.shetty@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01TaVBbVRj1vvfyElDwla23MAqNogUMEAj0skm1TOfNYDVV6w9mFAM8AYEQ
 EyjUcRQaoS1tSUHplLQGVFo2BVnKFtKxoSEllCKNtMIMRTaRxhK2ERk2SQPaf+dbzv2+c+58
 HNzByHblJIszGKlYlMolbYmWLi8v3rvjiXH+w81OqN7QjaPOoUUWqh1RkOjC3AqOzDcmWKhY
 cZGNVvv6cWSctEea2Uss9Ms/uRiaaNzE0NDP7Rjq/K4YQ9W1OgxNV34PkPrbeQytjfHR2NIw
 gYq19wCaGlRiSDPsgzo1PQQydlwmUdnVKTY6c7+NRNdNGhxV6jcwdEe5RqIifRMLtU3mAtSy
 WoajrgeDBKozmQl0a9gN5Z1dYaP+dT3rwIu08ddoWjnaR9JF8lk23a4cYdP9DxoI2tiXSTfW
 nCbppoov6K9+qwS0eiiHpE/c1uH0xYUlkj4nnyXp9rxRFj0/NUzQ5uuDpHB3TEp4EiNKYKQe
 jDg+PSFZnBjBjX4n9mBsULA/n8cPQfu5HmJRGhPBjXpDyDuUnLplJNfjmCg1cyslFMlkXL9X
 w6XpmRmMR1K6LCOCy0gSUiUCia9MlCbLFCf6ipmMUL6/f0DQVuOHKUl3e/tJyY3w7NbWYSwH
 XAkoADYcSAmg+n4rXgBsOQ6UGsCTKjPLGiwA2FVYB6zBIoB/t9dgO5TNs4WYtdABoHn1r21K
 HgZVq9NbFA6HpHxg7ybHQnCiCFi9vExYenBqjg3XCiaApeBICWFL959sCyYoT1hRrSct2I4K
 hTMT3SzLO5Dyg4rRXZa0DRUGr+hmMWvLLthTOklYME65Q/m1S481QCrfFppUFkGWTaNgs2KB
 tGJH+FDfzLZiVzijyN/GWbA1vxyzkr8EsMBgIKyFSDjQuY5ZlsApL1jf4WdNPwdLDHWYdbA9
 PLc6ue2KHWxT7eAX4A/15dtz98B7y7nbmIam3lNsq1mFADaV55DngYfyCUHKJwQp/x9dDvAa
 sIeRyNISGVmQJFDMZP33zfHpaY3g8XV5R7eB8d/nfLUA4wAtgByc62RX4vlRnINdguj4p4w0
 PVaamcrItCBoy/Ai3NU5Pn3rPMUZsXxBiL8gODhYEBIYzOfutjMk/iRyoBJFGUwKw0gY6Q4P
 49i45mCKqk/CtEx4TEVgVanrmbhy/cmOjTTTzZdzBVdfF8rl655azLQ3KOp9z/MOgkZ3aoD3
 uTpgfkTgZpccNvGmorwThUZ+9pre3BfVgE1x5dGGwmMJ8aV9ZiN7ac4kWTGVMhxV2dwr+Uvx
 gx3yjb3Chf22ET66Ne+Aa3h21lFh3GEpEXpaY3w0oGk13Z79+JS943qKi7MK72wab+W76GI/
 6JY9DChdC7tQd1Tdl43X3vmjZJ/78/S47u1ie2Pee6MdPN3xZ3IqqqOOOLv118f0FN5962aV
 NuTrZ8cPuuRFHRp9KiCoJvzEDNinOfL06FikLJx3a3qgbvHH6UdNDS9d5h3+hkvIkkR8b1wq
 E/0Le799yOYEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0xTdxjGd649xdWdVjL+QnahgSwpswjZ5Q0zjn1YcrIFcFlINjZkZT1c
 tlJIj4hrFi5WmHIZFiKpxc1hlQK6yWDSFloiKJbCGMRalI7LCDDmTECcUVhRZiFL/Pbk/f2e
 59PLELJvqHAmV3uA12lVGjkdQnZdkb+462N3dubuy8ORcHHoGgHOiX8oOD9VS0PD3TUClvvm
 KKirNYkgMDJKgHd+O7iWGikYWy3DYa5jA4eJyw4cnGfqcGg9P4DDotWCQU/TCg7rs3Ewe99P
 Ql3/OAYLPjMOLn8MOF0eErzdp2g43bwggqqbdhp677gIsLof4/CbeZ0Go7uTAvt8GQZdgdME
 XJn2kfDTnWUSBv0RUF69JoLRR24qMYrz3nifM8+M0JzRsCTiHOYpETc6/TPJeUcKuY62YzTX
 ebaEq79lxbieiVKaO/zrAMGZ7t2nuRrDEs05ymcobmXBT3LLvT56X1hayB41r8k9yOti934W
 knN9eJQu6NtzyGbz46XYufhKTMwg9jW0Uf0tXomFMDLWjqGuC0ZqC+xEzY+uElt5B2p9vCja
 kgw4MvssTxoMQ7MxaHiDCTqhLIlaHz4kgw7Bmhhk6XXhQbCDTUbjs5VkMJNsNDrb6qaDWcIm
 oNtz16jgDmJjUe2MNHgWs2+hcwNLm/OyJ8qtwKEtW4o8J+c3Vwj2JWS41Egcx1jzU8j8FPoB
 w9uwnXyBkJedJ8QVxGv5IqWgyhMKtdnKz/PzOrDNX1Eo7Jiz7a6yH8MZrB9DDCEPlZyIzsqU
 SdSqr/S8Lj9DV6jhhX4sgiHlYZKxSk+GjM1WHeC/5PkCXvc/xRlxeCkeevFmSpr6a1GLrX6b
 Izd/9/7kLP2CcWxaFr+mLrblGH6sNhZVBeiwlNR3NTqZNLpeW4aF/+vg2hUO0e+Hc3ziM/pU
 iUe8d2jVwA7q89++0Tw++WlFRUVZYslR2y+LNQ/e+K44UUjoSpdaUnQlTMb+hJX06c5MoeXI
 4PO3Y6f+xpWXnpn84z0PF7iXNjMUafxie/LV5RhBum5J6vsz97js+myqsqa7xdzTWZX0XFME
 O5n2ScNA2JwTPiwvfL19bNvJY5rav7pf3ohSN71qsuxardZfODVpaiiyxr35TtaDo43FSvvB
 SMWJVdMLcnv6B4tHyq2vfP9skszjTZd8ZNK3R8lJIUcVpyB0guo/5gYd4ZoDAAA=
X-CMS-MailID: 20220426102009epcas5p3e5b1ddfd5d3c7200972cecb139650da6
X-Msg-Generator: CA
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220426102009epcas5p3e5b1ddfd5d3c7200972cecb139650da6
References: <20220426101241.30100-1-nj.shetty@samsung.com>
 <CGME20220426102009epcas5p3e5b1ddfd5d3c7200972cecb139650da6@epcas5p3.samsung.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Mailman-Approved-At: Wed, 27 Apr 2022 12:14:17 +0000
Subject: [dm-devel] [PATCH v4 06/10] nvmet: add copy command support for
 bdev and file ns
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: djwong@kernel.org, linux-nvme@lists.infradead.org, clm@fb.com,
 dm-devel@redhat.com, osandov@fb.com, Alasdair Kergon <agk@redhat.com>,
 Naohiro Aota <naohiro.aota@wdc.com>, msnitzer@redhat.com, bvanassche@acm.org,
 linux-scsi@vger.kernel.org, gost.dev@samsung.com, nitheshshetty@gmail.com,
 James Smart <james.smart@broadcom.com>, hch@lst.de,
 Nitesh Shetty <nj.shetty@samsung.com>, chaitanyak@nvidia.com,
 Chaitanya Kulkarni <kch@nvidia.com>, Mike Snitzer <snitzer@kernel.org>,
 josef@toxicpanda.com, linux-block@vger.kernel.org, dsterba@suse.com,
 kbusch@kernel.org, Frederick.Knight@netapp.com,
 Sagi Grimberg <sagi@grimberg.me>, axboe@kernel.dk,
 Johannes Thumshirn <jth@kernel.org>, tytso@mit.edu, martin.petersen@oracle.com,
 linux-kernel@vger.kernel.org, Arnav Dawn <arnav.dawn@samsung.com>,
 jack@suse.com, linux-fsdevel@vger.kernel.org,
 lsf-pc@lists.linux-foundation.org,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Arnav Dawn <arnav.dawn@samsung.com>

Add support for handling target command on target.
For bdev-ns we call into blkdev_issue_copy, which the block layer
completes by a offloaded copy request to backend bdev or by emulating the
request.

For file-ns we call vfs_copy_file_range to service our request.

Currently target always shows copy capability by setting
NVME_CTRL_ONCS_COPY in controller ONCS.

Signed-off-by: Arnav Dawn <arnav.dawn@samsung.com>
Signed-off-by: Nitesh Shetty <nj.shetty@samsung.com>
---
 drivers/nvme/host/tcp.c           |  2 +-
 drivers/nvme/target/admin-cmd.c   |  8 +++-
 drivers/nvme/target/io-cmd-bdev.c | 65 +++++++++++++++++++++++++++++++
 drivers/nvme/target/io-cmd-file.c | 49 +++++++++++++++++++++++
 4 files changed, 121 insertions(+), 3 deletions(-)

diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
index 4e4cdcf8210a..2c77e5b596bb 100644
--- a/drivers/nvme/host/tcp.c
+++ b/drivers/nvme/host/tcp.c
@@ -2395,7 +2395,7 @@ static blk_status_t nvme_tcp_setup_cmd_pdu(struct nvme_ns *ns,
 		return ret;
 
 	if (unlikely((rq->cmd_flags & REQ_COPY) && (req_op(rq) == REQ_OP_READ))) {
-		blk_mq_start_request(req);
+		blk_mq_start_request(rq);
 		return BLK_STS_OK;
 	}
 
diff --git a/drivers/nvme/target/admin-cmd.c b/drivers/nvme/target/admin-cmd.c
index 397daaf51f1b..db32debdb528 100644
--- a/drivers/nvme/target/admin-cmd.c
+++ b/drivers/nvme/target/admin-cmd.c
@@ -431,8 +431,7 @@ static void nvmet_execute_identify_ctrl(struct nvmet_req *req)
 	id->nn = cpu_to_le32(NVMET_MAX_NAMESPACES);
 	id->mnan = cpu_to_le32(NVMET_MAX_NAMESPACES);
 	id->oncs = cpu_to_le16(NVME_CTRL_ONCS_DSM |
-			NVME_CTRL_ONCS_WRITE_ZEROES);
-
+			NVME_CTRL_ONCS_WRITE_ZEROES | NVME_CTRL_ONCS_COPY);
 	/* XXX: don't report vwc if the underlying device is write through */
 	id->vwc = NVME_CTRL_VWC_PRESENT;
 
@@ -534,6 +533,11 @@ static void nvmet_execute_identify_ns(struct nvmet_req *req)
 
 	if (req->ns->bdev)
 		nvmet_bdev_set_limits(req->ns->bdev, id);
+	else {
+		id->msrc = to0based(BIO_MAX_VECS);
+		id->mssrl = cpu_to_le16(BIO_MAX_VECS << (PAGE_SHIFT - SECTOR_SHIFT));
+		id->mcl = cpu_to_le32(le16_to_cpu(id->mssrl) * BIO_MAX_VECS);
+	}
 
 	/*
 	 * We just provide a single LBA format that matches what the
diff --git a/drivers/nvme/target/io-cmd-bdev.c b/drivers/nvme/target/io-cmd-bdev.c
index 27a72504d31c..18666d36423f 100644
--- a/drivers/nvme/target/io-cmd-bdev.c
+++ b/drivers/nvme/target/io-cmd-bdev.c
@@ -47,6 +47,30 @@ void nvmet_bdev_set_limits(struct block_device *bdev, struct nvme_id_ns *id)
 	id->npda = id->npdg;
 	/* NOWS = Namespace Optimal Write Size */
 	id->nows = to0based(ql->io_opt / ql->logical_block_size);
+
+	/*Copy limits*/
+	if (ql->max_copy_sectors) {
+		id->mcl = cpu_to_le32((ql->max_copy_sectors << 9) / ql->logical_block_size);
+		id->mssrl = cpu_to_le16((ql->max_copy_range_sectors << 9) /
+				ql->logical_block_size);
+		id->msrc = to0based(ql->max_copy_nr_ranges);
+	} else {
+		if (ql->zoned == BLK_ZONED_NONE) {
+			id->msrc = to0based(BIO_MAX_VECS);
+			id->mssrl = cpu_to_le16(
+					(BIO_MAX_VECS << PAGE_SHIFT) / ql->logical_block_size);
+			id->mcl = cpu_to_le32(le16_to_cpu(id->mssrl) * BIO_MAX_VECS);
+#ifdef CONFIG_BLK_DEV_ZONED
+		} else {
+			/* TODO: get right values for zoned device */
+			id->msrc = to0based(BIO_MAX_VECS);
+			id->mssrl = cpu_to_le16(min((BIO_MAX_VECS << PAGE_SHIFT),
+					ql->chunk_sectors) / ql->logical_block_size);
+			id->mcl = cpu_to_le32(min(le16_to_cpu(id->mssrl) * BIO_MAX_VECS,
+						ql->chunk_sectors));
+#endif
+		}
+	}
 }
 
 void nvmet_bdev_ns_disable(struct nvmet_ns *ns)
@@ -442,6 +466,43 @@ static void nvmet_bdev_execute_write_zeroes(struct nvmet_req *req)
 	}
 }
 
+static void nvmet_bdev_execute_copy(struct nvmet_req *req)
+{
+	struct nvme_copy_range range;
+	struct range_entry *rlist;
+	struct nvme_command *cmnd = req->cmd;
+	sector_t dest, dest_off = 0;
+	int ret, id, nr_range;
+
+	nr_range = cmnd->copy.nr_range + 1;
+	dest = le64_to_cpu(cmnd->copy.sdlba) << req->ns->blksize_shift;
+	rlist = kmalloc_array(nr_range, sizeof(*rlist), GFP_KERNEL);
+
+	for (id = 0 ; id < nr_range; id++) {
+		ret = nvmet_copy_from_sgl(req, id * sizeof(range), &range, sizeof(range));
+		if (ret)
+			goto out;
+
+		rlist[id].dst = dest + dest_off;
+		rlist[id].src = le64_to_cpu(range.slba) << req->ns->blksize_shift;
+		rlist[id].len = (le16_to_cpu(range.nlb) + 1) << req->ns->blksize_shift;
+		rlist[id].comp_len = 0;
+		dest_off += rlist[id].len;
+	}
+	ret = blkdev_issue_copy(req->ns->bdev, nr_range, rlist, req->ns->bdev, GFP_KERNEL);
+	if (ret) {
+		for (id = 0 ; id < nr_range; id++) {
+			if (rlist[id].len != rlist[id].comp_len) {
+				req->cqe->result.u32 = cpu_to_le32(id);
+				break;
+			}
+		}
+	}
+out:
+	kfree(rlist);
+	nvmet_req_complete(req, errno_to_nvme_status(req, ret));
+}
+
 u16 nvmet_bdev_parse_io_cmd(struct nvmet_req *req)
 {
 	switch (req->cmd->common.opcode) {
@@ -460,6 +521,10 @@ u16 nvmet_bdev_parse_io_cmd(struct nvmet_req *req)
 	case nvme_cmd_write_zeroes:
 		req->execute = nvmet_bdev_execute_write_zeroes;
 		return 0;
+	case nvme_cmd_copy:
+		req->execute = nvmet_bdev_execute_copy;
+		return 0;
+
 	default:
 		return nvmet_report_invalid_opcode(req);
 	}
diff --git a/drivers/nvme/target/io-cmd-file.c b/drivers/nvme/target/io-cmd-file.c
index f3d58abf11e0..fe26a9120436 100644
--- a/drivers/nvme/target/io-cmd-file.c
+++ b/drivers/nvme/target/io-cmd-file.c
@@ -338,6 +338,46 @@ static void nvmet_file_dsm_work(struct work_struct *w)
 	}
 }
 
+static void nvmet_file_copy_work(struct work_struct *w)
+{
+	struct nvmet_req *req = container_of(w, struct nvmet_req, f.work);
+	int nr_range;
+	loff_t pos;
+	struct nvme_command *cmnd = req->cmd;
+	int ret = 0, len = 0, src, id;
+
+	nr_range = cmnd->copy.nr_range + 1;
+	pos = le64_to_cpu(req->cmd->copy.sdlba) << req->ns->blksize_shift;
+	if (unlikely(pos + req->transfer_len > req->ns->size)) {
+		nvmet_req_complete(req, errno_to_nvme_status(req, -ENOSPC));
+		return;
+	}
+
+	for (id = 0 ; id < nr_range; id++) {
+		struct nvme_copy_range range;
+
+		ret = nvmet_copy_from_sgl(req, id * sizeof(range), &range,
+					sizeof(range));
+		if (ret)
+			goto out;
+
+		len = (le16_to_cpu(range.nlb) + 1) << (req->ns->blksize_shift);
+		src = (le64_to_cpu(range.slba) << (req->ns->blksize_shift));
+		ret = vfs_copy_file_range(req->ns->file, src, req->ns->file, pos, len, 0);
+out:
+		if (ret != len) {
+			pos += ret;
+			req->cqe->result.u32 = cpu_to_le32(id);
+			nvmet_req_complete(req, ret < 0 ? errno_to_nvme_status(req, ret) :
+					errno_to_nvme_status(req, -EIO));
+			return;
+
+		} else
+			pos += len;
+}
+	nvmet_req_complete(req, ret);
+
+}
 static void nvmet_file_execute_dsm(struct nvmet_req *req)
 {
 	if (!nvmet_check_data_len_lte(req, nvmet_dsm_len(req)))
@@ -346,6 +386,12 @@ static void nvmet_file_execute_dsm(struct nvmet_req *req)
 	queue_work(nvmet_wq, &req->f.work);
 }
 
+static void nvmet_file_execute_copy(struct nvmet_req *req)
+{
+	INIT_WORK(&req->f.work, nvmet_file_copy_work);
+	schedule_work(&req->f.work);
+}
+
 static void nvmet_file_write_zeroes_work(struct work_struct *w)
 {
 	struct nvmet_req *req = container_of(w, struct nvmet_req, f.work);
@@ -392,6 +438,9 @@ u16 nvmet_file_parse_io_cmd(struct nvmet_req *req)
 	case nvme_cmd_write_zeroes:
 		req->execute = nvmet_file_execute_write_zeroes;
 		return 0;
+	case nvme_cmd_copy:
+		req->execute = nvmet_file_execute_copy;
+		return 0;
 	default:
 		return nvmet_report_invalid_opcode(req);
 	}
-- 
2.35.1.500.gb896f729e2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

