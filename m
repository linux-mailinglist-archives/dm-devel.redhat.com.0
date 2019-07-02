Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF2F5D09F
	for <lists+dm-devel@lfdr.de>; Tue,  2 Jul 2019 15:27:13 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 068D5223889;
	Tue,  2 Jul 2019 13:26:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 602C64D6F6;
	Tue,  2 Jul 2019 13:26:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D137918363C1;
	Tue,  2 Jul 2019 13:25:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x62DOGFK023703 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 2 Jul 2019 09:24:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C334118BB1; Tue,  2 Jul 2019 13:24:16 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.41])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 222607DF56;
	Tue,  2 Jul 2019 13:24:12 +0000 (UTC)
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1CB50308A963;
	Tue,  2 Jul 2019 13:24:00 +0000 (UTC)
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id B56142A725E3A147B9F7;
	Tue,  2 Jul 2019 21:23:49 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS402-HUB.china.huawei.com
	(10.3.19.202) with Microsoft SMTP Server id 14.3.439.0; Tue, 2 Jul 2019
	21:23:42 +0800
From: Hou Tao <houtao1@huawei.com>
To: <linux-raid@vger.kernel.org>, <songliubraving@fb.com>
Date: Tue, 2 Jul 2019 21:29:18 +0800
Message-ID: <20190702132918.114818-4-houtao1@huawei.com>
In-Reply-To: <20190702132918.114818-1-houtao1@huawei.com>
References: <20190702132918.114818-1-houtao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.41]); Tue, 02 Jul 2019 13:24:01 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]);
	Tue, 02 Jul 2019 13:24:01 +0000 (UTC) for IP:'45.249.212.190'
	DOMAIN:'szxga04-in.huawei.com' HELO:'huawei.com'
	FROM:'houtao1@huawei.com' RCPT:''
X-RedHat-Spam-Score: -2.302  (RCVD_IN_DNSWL_MED, SPF_HELO_PASS,
	SPF_PASS) 45.249.212.190 szxga04-in.huawei.com
	45.249.212.190 szxga04-in.huawei.com <houtao1@huawei.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.41
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: snitzer@redhat.com, neilb@suse.com, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	houtao1@huawei.com, agk@redhat.com
Subject: [dm-devel] [RFC PATCH 3/3] raid1: export inflight io counters and
	internal stats in debugfs
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]); Tue, 02 Jul 2019 13:27:12 +0000 (UTC)

Just like the previous patch which exports debugfs files for md-core,
this patch exports debugfs file for md-raid1 under
/sys/kernel/debug/block/mdX/raid1.

Signed-off-by: Hou Tao <houtao1@huawei.com>
---
 drivers/md/raid1.c | 78 ++++++++++++++++++++++++++++++++++++++++++++++
 drivers/md/raid1.h |  1 +
 2 files changed, 79 insertions(+)

diff --git a/drivers/md/raid1.c b/drivers/md/raid1.c
index 2aa36e570e04..da06bb47195b 100644
--- a/drivers/md/raid1.c
+++ b/drivers/md/raid1.c
@@ -35,6 +35,7 @@
 #include "md.h"
 #include "raid1.h"
 #include "md-bitmap.h"
+#include "md-debugfs.h"
 
 #define UNSUPPORTED_MDDEV_FLAGS		\
 	((1L << MD_HAS_JOURNAL) |	\
@@ -2901,6 +2902,80 @@ static sector_t raid1_size(struct mddev *mddev, sector_t sectors, int raid_disks
 	return mddev->dev_sectors;
 }
 
+enum {
+	IOSTAT_NR_PENDING = 0,
+	IOSTAT_NR_WAITING,
+	IOSTAT_NR_QUEUED,
+	IOSTAT_BARRIER,
+	IOSTAT_CNT,
+};
+
+static int raid1_dbg_iostat_show(struct seq_file *m, void *data)
+{
+	struct r1conf *conf = m->private;
+	int idx;
+	int sum[IOSTAT_CNT] = {};
+
+	seq_printf(m, "retry_list active %d\n",
+			!list_empty(&conf->retry_list));
+	seq_printf(m, "bio_end_io_list active %d\n",
+			!list_empty(&conf->bio_end_io_list));
+	seq_printf(m, "pending_bio_list active %d cnt %d\n",
+			!bio_list_empty(&conf->pending_bio_list),
+			conf->pending_count);
+
+	for (idx = 0; idx < BARRIER_BUCKETS_NR; idx++) {
+		sum[IOSTAT_NR_PENDING] += atomic_read(&conf->nr_pending[idx]);
+		sum[IOSTAT_NR_WAITING] += atomic_read(&conf->nr_waiting[idx]);
+		sum[IOSTAT_NR_QUEUED] += atomic_read(&conf->nr_queued[idx]);
+		sum[IOSTAT_BARRIER] += atomic_read(&conf->barrier[idx]);
+	}
+
+	seq_printf(m, "sync_pending %d\n", atomic_read(&conf->nr_sync_pending));
+	seq_printf(m, "nr_pending %d\n", sum[IOSTAT_NR_PENDING]);
+	seq_printf(m, "nr_waiting %d\n", sum[IOSTAT_NR_WAITING]);
+	seq_printf(m, "nr_queued %d\n", sum[IOSTAT_NR_QUEUED]);
+	seq_printf(m, "barrier %d\n", sum[IOSTAT_BARRIER]);
+
+	return 0;
+}
+
+static int raid1_dbg_stat_show(struct seq_file *m, void *data)
+{
+	struct r1conf *conf = m->private;
+
+	seq_printf(m, "array_frozen %d\n", conf->array_frozen);
+	return 0;
+}
+
+static const struct md_debugfs_file raid1_dbg_files[] = {
+	{.name = "iostat", .show = raid1_dbg_iostat_show},
+	{.name = "stat", .show = raid1_dbg_stat_show},
+	{},
+};
+
+static void raid1_unregister_debugfs(struct r1conf *conf)
+{
+	debugfs_remove_recursive(conf->debugfs_dir);
+}
+
+static void raid1_register_debugfs(struct mddev *mddev, struct r1conf *conf)
+{
+	struct dentry *dir;
+
+	conf->debugfs_dir = NULL;
+
+	if (!mddev->debugfs_dir)
+		return;
+
+	dir = debugfs_create_dir("raid1", mddev->debugfs_dir);
+	if (IS_ERR_OR_NULL(dir))
+		return;
+
+	md_debugfs_create_files(dir, conf, raid1_dbg_files);
+	conf->debugfs_dir = dir;
+}
+
 static struct r1conf *setup_conf(struct mddev *mddev)
 {
 	struct r1conf *conf;
@@ -3022,6 +3097,8 @@ static struct r1conf *setup_conf(struct mddev *mddev)
 	if (!conf->thread)
 		goto abort;
 
+	raid1_register_debugfs(mddev, conf);
+
 	return conf;
 
  abort:
@@ -3136,6 +3213,7 @@ static void raid1_free(struct mddev *mddev, void *priv)
 {
 	struct r1conf *conf = priv;
 
+	raid1_unregister_debugfs(conf);
 	mempool_exit(&conf->r1bio_pool);
 	kfree(conf->mirrors);
 	safe_put_page(conf->tmppage);
diff --git a/drivers/md/raid1.h b/drivers/md/raid1.h
index e7ccad898736..d627020e92d4 100644
--- a/drivers/md/raid1.h
+++ b/drivers/md/raid1.h
@@ -139,6 +139,7 @@ struct r1conf {
 	sector_t		cluster_sync_low;
 	sector_t		cluster_sync_high;
 
+	struct dentry *debugfs_dir;
 };
 
 /*
-- 
2.22.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
