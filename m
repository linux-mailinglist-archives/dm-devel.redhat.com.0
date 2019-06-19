Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 59FE04C83D
	for <lists+dm-devel@lfdr.de>; Thu, 20 Jun 2019 09:22:20 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 39FA388318;
	Thu, 20 Jun 2019 07:22:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3F1DC1001B1D;
	Thu, 20 Jun 2019 07:22:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E085D206D1;
	Thu, 20 Jun 2019 07:21:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5J83nc1006760 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 19 Jun 2019 04:03:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 70A9C601A5; Wed, 19 Jun 2019 08:03:49 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx19.extmail.prod.ext.phx2.redhat.com
	[10.5.110.48])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6B070600C7
	for <dm-devel@redhat.com>; Wed, 19 Jun 2019 08:03:47 +0000 (UTC)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 735B1307D851
	for <dm-devel@redhat.com>; Wed, 19 Jun 2019 08:03:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id 1A296AF61;
	Wed, 19 Jun 2019 08:03:21 +0000 (UTC)
From: Qu Wenruo <wqu@suse.com>
To: dm-devel@redhat.com
Date: Wed, 19 Jun 2019 16:03:11 +0800
Message-Id: <20190619080312.11549-2-wqu@suse.com>
In-Reply-To: <20190619080312.11549-1-wqu@suse.com>
References: <20190619080312.11549-1-wqu@suse.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.48]); Wed, 19 Jun 2019 08:03:37 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]);
	Wed, 19 Jun 2019 08:03:37 +0000 (UTC) for IP:'195.135.220.15'
	DOMAIN:'mx2.suse.de' HELO:'mx1.suse.de' FROM:'wqu@suse.com' RCPT:''
X-RedHat-Spam-Score: -2.298  (RCVD_IN_DNSWL_MED, SPF_HELO_NONE,
	SPF_NONE) 195.135.220.15 mx2.suse.de 195.135.220.15
	mx2.suse.de <wqu@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.48
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 20 Jun 2019 03:21:43 -0400
Cc: linux-btrfs@vger.kernel.org
Subject: [dm-devel] [PATCH 1/2] dm log writes: Allow dm-log-writes to filter
	bios based on types to reduce log device space usage
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]); Thu, 20 Jun 2019 07:22:18 +0000 (UTC)

Since dm-log-writes will record all writes, include data and metadata
writes, it can consume a lot of space.
However for a lot of filesystems, the data bio (without METADATA flag)
can be skipped for certain use case, thus we can skip them in
dm-log-writes to hugely reduce space usage.

This patch will introduce a new optional constructor parameter,
"dump_type=%s", for dm-log-writes.

The '%s' can be ALL, METADATA, FUA, FLUSH, DISCARD, MARK or the ORed
result of them.
The default dump_type will be 'ALL', so the behavior is not changed at
all.

But user can specify dump_type=METADATA|FUA|FLUSH|DISCARD|MARK to skip
data writes to save space on log device.

Currently the dump_type can only be speicified at contruction time.

Signed-off-by: Qu Wenruo <wqu@suse.com>
---
 drivers/md/dm-log-writes.c | 146 +++++++++++++++++++++++++++++++++++--
 1 file changed, 141 insertions(+), 5 deletions(-)

diff --git a/drivers/md/dm-log-writes.c b/drivers/md/dm-log-writes.c
index af94bbe77ce2..9edf0bdcae39 100644
--- a/drivers/md/dm-log-writes.c
+++ b/drivers/md/dm-log-writes.c
@@ -115,6 +115,7 @@ struct log_writes_c {
 	struct list_head logging_blocks;
 	wait_queue_head_t wait;
 	struct task_struct *log_kthread;
+	u32 dump_type;
 };
 
 struct pending_block {
@@ -503,15 +504,99 @@ static int log_writes_kthread(void *arg)
 	return 0;
 }
 
+#define string_type_to_bit(string)			\
+({							\
+	if (!strcasecmp(p, #string)) {			\
+		dump_type |= LOG_##string##_FLAG;	\
+		continue;				\
+	}						\
+})
+static int parse_dump_types(struct log_writes_c *lc, const char *string)
+{
+	char *orig;
+	char *opts;
+	char *p;
+	u32 dump_type = LOG_MARK_FLAG;
+	int ret = 0;
+
+	opts = kstrdup(string, GFP_KERNEL);
+	if (!opts)
+		return -ENOMEM;
+	orig = opts;
+
+	while ((p = strsep(&opts, "|")) != NULL) {
+		if (!*p)
+			continue;
+		if (!strcasecmp(p, "ALL")) {
+			dump_type = (u32)-1;
+			/* No need to check other flags */
+			break;
+		}
+		string_type_to_bit(METADATA);
+		string_type_to_bit(FUA);
+		string_type_to_bit(FLUSH);
+		string_type_to_bit(DISCARD);
+		string_type_to_bit(MARK);
+		ret = -EINVAL;
+		goto out;
+	}
+out:
+	kfree(orig);
+	if (!ret)
+		lc->dump_type = dump_type;
+	return ret;
+}
+#undef string_type_to_bit
+
+/* Must be large enough to contain "METADATA|FUA|FLUSH|DISCARD|MARK" */
+#define DUMP_TYPES_BUF_SIZE	256
+#define dump_type_to_string(name)				\
+({								\
+	if (lc->dump_type & LOG_##name##_FLAG) {		\
+		if (!first_word)				\
+			strcat(buf, "|");			\
+		strcat(buf, #name);				\
+		first_word = false;				\
+	}							\
+ })
+static void status_dump_types(struct log_writes_c *lc, char *buf)
+{
+	bool first_word = true;
+
+	buf[0] = '\0';
+
+	if (lc->dump_type == (u32)-1) {
+		strcat(buf, "ALL");
+		return;
+	}
+	dump_type_to_string(METADATA);
+	dump_type_to_string(FUA);
+	dump_type_to_string(FLUSH);
+	dump_type_to_string(DISCARD);
+	dump_type_to_string(MARK);
+	return;
+}
+#undef dump_type_to_string
+
 /*
  * Construct a log-writes mapping:
- * log-writes <dev_path> <log_dev_path>
+ * log-writes <dev_path> <log_dev_path> [<option feature> ...]
+ * option feature can be:
+ * - dump_type=<flags>
+ *   flags can be ALL, METADATA, FUA, FLUSH, DISCARD or any of them combined
+ *   with '|'.
+ *   Default value is ALL.
+ *
+ *   This will make log-writes only to record writes with certain type.
+ *   E.g dump_type=METADATA|FUA|FLUSH|DISCARD will only record metadata writes
+ *       and save log device space.
  */
 static int log_writes_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 {
 	struct log_writes_c *lc;
 	struct dm_arg_set as;
 	const char *devname, *logdevname;
+	const char *arg_name;
 	int ret;
 
 	as.argc = argc;
@@ -533,8 +618,10 @@ static int log_writes_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 	init_waitqueue_head(&lc->wait);
 	atomic_set(&lc->io_blocks, 0);
 	atomic_set(&lc->pending_blocks, 0);
+	lc->dump_type = (u32)-1;
 
 	devname = dm_shift_arg(&as);
+	argc--;
 	ret = dm_get_device(ti, devname, dm_table_get_mode(ti->table), &lc->dev);
 	if (ret) {
 		ti->error = "Device lookup failed";
@@ -542,6 +629,7 @@ static int log_writes_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 	}
 
 	logdevname = dm_shift_arg(&as);
+	argc--;
 	ret = dm_get_device(ti, logdevname, dm_table_get_mode(ti->table),
 			    &lc->logdev);
 	if (ret) {
@@ -550,15 +638,35 @@ static int log_writes_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 		goto bad;
 	}
 
+	while (argc) {
+		arg_name = dm_shift_arg(&as);
+		argc--;
+
+		if (!arg_name) {
+			ti->error = "Insufficient feature arguments";
+			goto free_all;
+		}
+		/* dump_type= */
+		if (!strncasecmp(arg_name, "dump_type=", strlen("dump_type="))) {
+			ret = parse_dump_types(lc,
+					arg_name + strlen("dump_type="));
+			if (ret < 0) {
+				ti->error = "Bad dump type";
+				goto free_all;
+			}
+			continue;
+		}
+		ti->error = "Unrecognised log-writes feature requested";
+		goto free_all;
+	}
+
 	lc->sectorsize = bdev_logical_block_size(lc->dev->bdev);
 	lc->sectorshift = ilog2(lc->sectorsize);
 	lc->log_kthread = kthread_run(log_writes_kthread, lc, "log-write");
 	if (IS_ERR(lc->log_kthread)) {
 		ret = PTR_ERR(lc->log_kthread);
 		ti->error = "Couldn't alloc kthread";
-		dm_put_device(ti, lc->dev);
-		dm_put_device(ti, lc->logdev);
-		goto bad;
+		goto free_all;
 	}
 
 	/*
@@ -579,6 +687,9 @@ static int log_writes_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 	ti->private = lc;
 	return 0;
 
+free_all:
+	dm_put_device(ti, lc->dev);
+	dm_put_device(ti, lc->logdev);
 bad:
 	kfree(lc);
 	return ret;
@@ -589,6 +700,8 @@ static int log_mark(struct log_writes_c *lc, char *data)
 	struct pending_block *block;
 	size_t maxsize = lc->sectorsize - sizeof(struct log_write_entry);
 
+	if (!(lc->dump_type & LOG_MARK_FLAG))
+		goto wake_up;
 	block = kzalloc(sizeof(struct pending_block), GFP_KERNEL);
 	if (!block) {
 		DMERR("Error allocating pending block");
@@ -607,6 +720,7 @@ static int log_mark(struct log_writes_c *lc, char *data)
 	spin_lock_irq(&lc->blocks_lock);
 	list_add_tail(&block->list, &lc->logging_blocks);
 	spin_unlock_irq(&lc->blocks_lock);
+wake_up:
 	wake_up_process(lc->log_kthread);
 	return 0;
 }
@@ -643,6 +757,22 @@ static void normal_map_bio(struct dm_target *ti, struct bio *bio)
 	bio_set_dev(bio, lc->dev->bdev);
 }
 
+static bool need_record(struct log_writes_c *lc, struct bio *bio)
+{
+	if (lc->dump_type == (u32)-1)
+		return true;
+
+	if (lc->dump_type & LOG_METADATA_FLAG && (bio->bi_opf & REQ_META))
+		return true;
+	if (lc->dump_type & LOG_FUA_FLAG && (bio->bi_opf & REQ_FUA))
+		return true;
+	if (lc->dump_type & LOG_FLUSH_FLAG && (bio->bi_opf & REQ_PREFLUSH))
+		return true;
+	if (lc->dump_type & LOG_DISCARD_FLAG && (bio_op(bio) == REQ_PREFLUSH))
+		return true;
+	return false;
+}
+
 static int log_writes_map(struct dm_target *ti, struct bio *bio)
 {
 	struct log_writes_c *lc = ti->private;
@@ -673,6 +803,9 @@ static int log_writes_map(struct dm_target *ti, struct bio *bio)
 	if (!bio_sectors(bio) && !flush_bio)
 		goto map_bio;
 
+	/* Check against lc->dump_type */
+	if (!need_record(lc, bio))
+		goto map_bio;
 	/*
 	 * Discards will have bi_size set but there's no actual data, so just
 	 * allocate the size of the pending block.
@@ -803,6 +936,7 @@ static void log_writes_status(struct dm_target *ti, status_type_t type,
 {
 	unsigned sz = 0;
 	struct log_writes_c *lc = ti->private;
+	char dump_type_buf[DUMP_TYPES_BUF_SIZE];
 
 	switch (type) {
 	case STATUSTYPE_INFO:
@@ -813,7 +947,9 @@ static void log_writes_status(struct dm_target *ti, status_type_t type,
 		break;
 
 	case STATUSTYPE_TABLE:
-		DMEMIT("%s %s", lc->dev->name, lc->logdev->name);
+		status_dump_types(lc, dump_type_buf);
+		DMEMIT("%s %s dump_type=%s", lc->dev->name, lc->logdev->name,
+			dump_type_buf);
 		break;
 	}
 }
-- 
2.22.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
