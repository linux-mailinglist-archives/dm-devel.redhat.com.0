Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id E8D331CD39C
	for <lists+dm-devel@lfdr.de>; Mon, 11 May 2020 10:18:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589185136;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=1GzGTbT2MQZkzKewYyRQWvtYnM4bfZwVgTSOXkscbV4=;
	b=VofHM1I/+WkNehWpXx8IcLyaCGouZ6lMbSatzAIvtneQCl2tdR0PzKo+XltltE34W7Ug2Z
	epTBvYNjQNo3Zo7IMmRF7GDrMkymhb9+tIapaRAdSjbvh3f4P3iPOY5xyXUnySYCz8nmg2
	6lMdRuiuxCaqPi6e9PEdp6l2Z1gXDEc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-100-2DHxX737MQ2ZOTpqhpSRYQ-1; Mon, 11 May 2020 04:18:54 -0400
X-MC-Unique: 2DHxX737MQ2ZOTpqhpSRYQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1B337107ACCA;
	Mon, 11 May 2020 08:18:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D302510016DA;
	Mon, 11 May 2020 08:18:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 43E80180954D;
	Mon, 11 May 2020 08:18:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 047IrhOh016442 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 7 May 2020 14:53:43 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 717E311231C; Thu,  7 May 2020 18:53:43 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6DBF911515F
	for <dm-devel@redhat.com>; Thu,  7 May 2020 18:53:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D972E800C6D
	for <dm-devel@redhat.com>; Thu,  7 May 2020 18:53:37 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-489-AfHM2bsaPuKTZ3QEEJQ_yA-1;
	Thu, 07 May 2020 14:53:34 -0400
X-MC-Unique: AfHM2bsaPuKTZ3QEEJQ_yA-1
Received: from embeddedor (unknown [189.207.59.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 03278216FD;
	Thu,  7 May 2020 18:47:31 +0000 (UTC)
Date: Thu, 7 May 2020 13:51:58 -0500
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>,
	dm-devel@redhat.com
Message-ID: <20200507185158.GA14116@embeddedor>
MIME-Version: 1.0
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mimecast-Spam-Signature: yes
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 047IrhOh016442
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 11 May 2020 04:18:30 -0400
Cc: dm-devel@redhat.com, linux-kernel@vger.kernel.org
Subject: [dm-devel] [PATCH] dm integrity: Replace zero-length array with
	flexible-array
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

The current codebase makes use of the zero-length array language
extension to the C90 standard, but the preferred mechanism to declare
variable-length types such as these ones is a flexible array member[1][2],
introduced in C99:

struct foo {
        int stuff;
        struct boo array[];
};

By making use of the mechanism above, we will get a compiler warning
in case the flexible array does not occur last in the structure, which
will help us prevent some kind of undefined behavior bugs from being
inadvertently introduced[3] to the codebase from now on.

Also, notice that, dynamic memory allocations won't be affected by
this change:

"Flexible array members have incomplete type, and so the sizeof operator
may not be applied. As a quirk of the original implementation of
zero-length arrays, sizeof evaluates to zero."[1]

sizeof(flexible-array-member) triggers a warning because flexible array
members have incomplete type[1]. There are some instances of code in
which the sizeof operator is being incorrectly/erroneously applied to
zero-length arrays and the result is zero. Such instances may be hiding
some bugs. So, this work (flexible-array member conversions) will also
help to get completely rid of those sorts of issues.

This issue was found with the help of Coccinelle.

[1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
[2] https://github.com/KSPP/linux/issues/21
[3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")

Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/md/dm-crypt.c                          |    2 +-
 drivers/md/dm-integrity.c                      |    2 +-
 drivers/md/dm-log-writes.c                     |    2 +-
 drivers/md/dm-raid.c                           |    2 +-
 drivers/md/dm-raid1.c                          |    2 +-
 drivers/md/dm-stats.c                          |    2 +-
 drivers/md/dm-stripe.c                         |    2 +-
 drivers/md/dm-switch.c                         |    2 +-
 drivers/md/persistent-data/dm-btree-internal.h |    2 +-
 9 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
index 3df90daba89e..bac110987a65 100644
--- a/drivers/md/dm-crypt.c
+++ b/drivers/md/dm-crypt.c
@@ -212,7 +212,7 @@ struct crypt_config {
 	struct mutex bio_alloc_lock;
 
 	u8 *authenc_key; /* space for keys in authenc() format (if used) */
-	u8 key[0];
+	u8 key[];
 };
 
 #define MIN_IOS		64
diff --git a/drivers/md/dm-integrity.c b/drivers/md/dm-integrity.c
index 4094c47eca7f..fe39ed31b20d 100644
--- a/drivers/md/dm-integrity.c
+++ b/drivers/md/dm-integrity.c
@@ -92,7 +92,7 @@ struct journal_entry {
 		} s;
 		__u64 sector;
 	} u;
-	commit_id_t last_bytes[0];
+	commit_id_t last_bytes[];
 	/* __u8 tag[0]; */
 };
 
diff --git a/drivers/md/dm-log-writes.c b/drivers/md/dm-log-writes.c
index 8ea20b56b4d6..e3d35c6c9f71 100644
--- a/drivers/md/dm-log-writes.c
+++ b/drivers/md/dm-log-writes.c
@@ -127,7 +127,7 @@ struct pending_block {
 	char *data;
 	u32 datalen;
 	struct list_head list;
-	struct bio_vec vecs[0];
+	struct bio_vec vecs[];
 };
 
 struct per_bio_data {
diff --git a/drivers/md/dm-raid.c b/drivers/md/dm-raid.c
index 9a18bef0a5ff..10e8b2fe787b 100644
--- a/drivers/md/dm-raid.c
+++ b/drivers/md/dm-raid.c
@@ -254,7 +254,7 @@ struct raid_set {
 		int mode;
 	} journal_dev;
 
-	struct raid_dev dev[0];
+	struct raid_dev dev[];
 };
 
 static void rs_config_backup(struct raid_set *rs, struct rs_layout *l)
diff --git a/drivers/md/dm-raid1.c b/drivers/md/dm-raid1.c
index 089aed57e083..2f655d9f4200 100644
--- a/drivers/md/dm-raid1.c
+++ b/drivers/md/dm-raid1.c
@@ -83,7 +83,7 @@ struct mirror_set {
 	struct work_struct trigger_event;
 
 	unsigned nr_mirrors;
-	struct mirror mirror[0];
+	struct mirror mirror[];
 };
 
 DECLARE_DM_KCOPYD_THROTTLE_WITH_MODULE_PARM(raid1_resync_throttle,
diff --git a/drivers/md/dm-stats.c b/drivers/md/dm-stats.c
index 71417048256a..35d368c418d0 100644
--- a/drivers/md/dm-stats.c
+++ b/drivers/md/dm-stats.c
@@ -56,7 +56,7 @@ struct dm_stat {
 	size_t percpu_alloc_size;
 	size_t histogram_alloc_size;
 	struct dm_stat_percpu *stat_percpu[NR_CPUS];
-	struct dm_stat_shared stat_shared[0];
+	struct dm_stat_shared stat_shared[];
 };
 
 #define STAT_PRECISE_TIMESTAMPS		1
diff --git a/drivers/md/dm-stripe.c b/drivers/md/dm-stripe.c
index fa813c0f993d..151d022b032d 100644
--- a/drivers/md/dm-stripe.c
+++ b/drivers/md/dm-stripe.c
@@ -41,7 +41,7 @@ struct stripe_c {
 	/* Work struct used for triggering events*/
 	struct work_struct trigger_event;
 
-	struct stripe stripe[0];
+	struct stripe stripe[];
 };
 
 /*
diff --git a/drivers/md/dm-switch.c b/drivers/md/dm-switch.c
index 8a0f057b8122..bff4c7fa1cd2 100644
--- a/drivers/md/dm-switch.c
+++ b/drivers/md/dm-switch.c
@@ -53,7 +53,7 @@ struct switch_ctx {
 	/*
 	 * Array of dm devices to switch between.
 	 */
-	struct switch_path path_list[0];
+	struct switch_path path_list[];
 };
 
 static struct switch_ctx *alloc_switch_ctx(struct dm_target *ti, unsigned nr_paths,
diff --git a/drivers/md/persistent-data/dm-btree-internal.h b/drivers/md/persistent-data/dm-btree-internal.h
index a240990a7f33..f4e644dd8101 100644
--- a/drivers/md/persistent-data/dm-btree-internal.h
+++ b/drivers/md/persistent-data/dm-btree-internal.h
@@ -38,7 +38,7 @@ struct node_header {
 
 struct btree_node {
 	struct node_header header;
-	__le64 keys[0];
+	__le64 keys[];
 } __packed;
 
 


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

