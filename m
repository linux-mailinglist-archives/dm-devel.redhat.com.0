Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 9988E7A2A4
	for <lists+dm-devel@lfdr.de>; Tue, 30 Jul 2019 09:55:54 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9FE08C0021D7;
	Tue, 30 Jul 2019 07:55:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6B38760167;
	Tue, 30 Jul 2019 07:55:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 022DC1972D;
	Tue, 30 Jul 2019 07:55:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6TKWMHU028616 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 29 Jul 2019 16:32:22 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 228A85D6A5; Mon, 29 Jul 2019 20:32:22 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.43])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1DBCC5D6A7
	for <dm-devel@redhat.com>; Mon, 29 Jul 2019 20:32:19 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
	[91.189.89.112]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6F7193092640
	for <dm-devel@redhat.com>; Mon, 29 Jul 2019 20:32:18 +0000 (UTC)
Received: from mail-pf1-f197.google.com ([209.85.210.197])
	by youngberry.canonical.com with esmtps
	(TLS1.0:RSA_AES_128_CBC_SHA1:16) (Exim 4.76)
	(envelope-from <gpiccoli@canonical.com>) id 1hsCJd-0001rI-4C
	for dm-devel@redhat.com; Mon, 29 Jul 2019 20:32:17 +0000
Received: by mail-pf1-f197.google.com with SMTP id d190so39173405pfa.0
	for <dm-devel@redhat.com>; Mon, 29 Jul 2019 13:32:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=whXvhgGtatFXmXSUn6jtBUdUIA159PzirgC5FY68oK4=;
	b=XU35uhokKtBtM7LCseRkG1Dav6tOPtbHZ51dqlDcAl7FyqURuLNsJjZyIDDUheCBNj
	DOvq+Jxjb1HPqYSTbB7nPqkcDlJz8wxU/Yre+mXalL+QsULkhGOv7CN8lmk/rg9fHKWk
	JakvNhlUQrduEJ7bOv4no+TU6WbDbalqORXtSBo+YZbi7S3sayGiTN9H6BN8ALIKRVrY
	riFtHK1pvezUcOV1Bhy8YrJSv+/tI6Tp90tbO7gexdHjaRazaMBtWnwIvX72V9ei8AcX
	D6mqRvRSrkEE1i6JJ1JFtbOTHwTSTcJ4kPds7LDgFCzxO900rXGZMxz5pT31F3C0hYbC
	JgLg==
X-Gm-Message-State: APjAAAV4BcZHZjvoamZbEqxFN/vouOURBLe9CAOnKMu47PyJgcFpDE3C
	BczMGft31yPEoU/AZksb/7/IVyeAipG+HhqefZHwLUiwuWQMIrZgG8dpdP1udKrXFec+LABiTlK
	wYwQJ0pudsKmiUMLE30ibJ5xPZsED3Q==
X-Received: by 2002:a17:902:5998:: with SMTP id
	p24mr36839249pli.110.1564432335923; 
	Mon, 29 Jul 2019 13:32:15 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzmi8xgalciar0mz+ASsu8t3lRBPdbMQ9dkrP8A8M7iRLQ6QwazuOhdM70/JckE2LFiY299IA==
X-Received: by 2002:a17:902:5998:: with SMTP id
	p24mr36839236pli.110.1564432335717; 
	Mon, 29 Jul 2019 13:32:15 -0700 (PDT)
Received: from localhost ([152.254.214.186]) by smtp.gmail.com with ESMTPSA id
	i137sm63642116pgc.4.2019.07.29.13.32.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Jul 2019 13:32:15 -0700 (PDT)
From: "Guilherme G. Piccoli" <gpiccoli@canonical.com>
To: linux-raid@vger.kernel.org
Date: Mon, 29 Jul 2019 17:31:34 -0300
Message-Id: <20190729203135.12934-2-gpiccoli@canonical.com>
In-Reply-To: <20190729203135.12934-1-gpiccoli@canonical.com>
References: <20190729203135.12934-1-gpiccoli@canonical.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.43]); Mon, 29 Jul 2019 20:32:19 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]);
	Mon, 29 Jul 2019 20:32:19 +0000 (UTC) for IP:'91.189.89.112'
	DOMAIN:'youngberry.canonical.com'
	HELO:'youngberry.canonical.com' FROM:'gpiccoli@canonical.com'
	RCPT:''
X-RedHat-Spam-Score: -4.998  (RCVD_IN_DNSWL_HI, SPF_HELO_NONE,
	SPF_NONE) 91.189.89.112 youngberry.canonical.com
	91.189.89.112 youngberry.canonical.com <gpiccoli@canonical.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.43
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 30 Jul 2019 03:55:28 -0400
Cc: songliubraving@fb.com, gpiccoli@canonical.com, neilb@suse.com,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	jay.vosburgh@canonical.com
Subject: [dm-devel] [PATCH 1/2] md/raid0: Introduce new array state 'broken'
	for raid0
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Tue, 30 Jul 2019 07:55:53 +0000 (UTC)

Currently if a md/raid0 array gets one or more members removed while
being mounted, kernel keeps showing state 'clean' in the 'array_state'
sysfs attribute. Despite udev signaling the member device is gone, 'mdadm'
cannot issue the STOP_ARRAY ioctl successfully, given the array is mounted.

Nothing else hints that something is wrong (except that the removed devices
don't show properly in the output of 'mdadm detail' command). There is no
other property to be checked, and if user is not performing reads/writes
to the array, even kernel log is quiet and doesn't give a clue about the
missing member.

This patch changes this behavior; when 'array_state' is read we introduce
a non-expensive check (only for raid0) that relies in the comparison of
the total number of disks when array was assembled with gendisk flags of
those devices to validate if all members are available and functional.
A new array state 'broken' was added: it mimics the state 'clean' in every
aspect, being useful only to distinguish if such array has some member
missing. Also, we show a rate-limited warning in kernel log in such case.

This patch has no proper functional change other than adding a 'clean'-like
state; it was tested with ext4 and xfs filesystems. It requires a 'mdadm'
counterpart to handle the 'broken' state.

Cc: NeilBrown <neilb@suse.com>
Cc: Song Liu <songliubraving@fb.com>
Signed-off-by: Guilherme G. Piccoli <gpiccoli@canonical.com>
---
 drivers/md/md.c    | 23 +++++++++++++++++++----
 drivers/md/md.h    |  2 ++
 drivers/md/raid0.c | 26 ++++++++++++++++++++++++++
 3 files changed, 47 insertions(+), 4 deletions(-)

diff --git a/drivers/md/md.c b/drivers/md/md.c
index fba49918d591..b80f36084ec1 100644
--- a/drivers/md/md.c
+++ b/drivers/md/md.c
@@ -4160,12 +4160,18 @@ __ATTR_PREALLOC(resync_start, S_IRUGO|S_IWUSR,
  * active-idle
  *     like active, but no writes have been seen for a while (100msec).
  *
+ * broken
+ *     RAID0-only: same as clean, but array is missing a member.
+ *     It's useful because RAID0 mounted-arrays aren't stopped
+ *     when a member is gone, so this state will at least alert
+ *     the user that something is wrong.
+ *
  */
 enum array_state { clear, inactive, suspended, readonly, read_auto, clean, active,
-		   write_pending, active_idle, bad_word};
+		   write_pending, active_idle, broken, bad_word};
 static char *array_states[] = {
 	"clear", "inactive", "suspended", "readonly", "read-auto", "clean", "active",
-	"write-pending", "active-idle", NULL };
+	"write-pending", "active-idle", "broken", NULL };
 
 static int match_word(const char *word, char **list)
 {
@@ -4181,7 +4187,7 @@ array_state_show(struct mddev *mddev, char *page)
 {
 	enum array_state st = inactive;
 
-	if (mddev->pers)
+	if (mddev->pers) {
 		switch(mddev->ro) {
 		case 1:
 			st = readonly;
@@ -4201,7 +4207,15 @@ array_state_show(struct mddev *mddev, char *page)
 				st = active;
 			spin_unlock(&mddev->lock);
 		}
-	else {
+
+		if ((mddev->pers->level == 0) &&
+		   ((st == clean) || (st == broken))) {
+			if (mddev->pers->is_missing_dev(mddev))
+				st = broken;
+			else
+				st = clean;
+		}
+	} else {
 		if (list_empty(&mddev->disks) &&
 		    mddev->raid_disks == 0 &&
 		    mddev->dev_sectors == 0)
@@ -4315,6 +4329,7 @@ array_state_store(struct mddev *mddev, const char *buf, size_t len)
 		break;
 	case write_pending:
 	case active_idle:
+	case broken:
 		/* these cannot be set */
 		break;
 	}
diff --git a/drivers/md/md.h b/drivers/md/md.h
index 41552e615c4c..e7b42b75701a 100644
--- a/drivers/md/md.h
+++ b/drivers/md/md.h
@@ -590,6 +590,8 @@ struct md_personality
 	int (*congested)(struct mddev *mddev, int bits);
 	/* Changes the consistency policy of an active array. */
 	int (*change_consistency_policy)(struct mddev *mddev, const char *buf);
+	/* Check if there is any missing/failed members - RAID0 only for now. */
+	bool (*is_missing_dev)(struct mddev *mddev);
 };
 
 struct md_sysfs_entry {
diff --git a/drivers/md/raid0.c b/drivers/md/raid0.c
index 58a9cc5193bf..79618a6ae31a 100644
--- a/drivers/md/raid0.c
+++ b/drivers/md/raid0.c
@@ -455,6 +455,31 @@ static inline int is_io_in_chunk_boundary(struct mddev *mddev,
 	}
 }
 
+bool raid0_is_missing_dev(struct mddev *mddev)
+{
+	struct md_rdev *rdev;
+	static int already_missing;
+	int def_disks, work_disks = 0;
+	struct r0conf *conf = mddev->private;
+
+	def_disks = conf->strip_zone[0].nb_dev;
+	rdev_for_each(rdev, mddev)
+		if (rdev->bdev->bd_disk->flags & GENHD_FL_UP)
+			work_disks++;
+
+	if (unlikely(def_disks - work_disks)) {
+		if (!already_missing) {
+			already_missing = 1;
+			pr_warn("md: %s: raid0 array has %d missing/failed members\n",
+				mdname(mddev), (def_disks - work_disks));
+		}
+		return true;
+	}
+
+	already_missing = 0;
+	return false;
+}
+
 static void raid0_handle_discard(struct mddev *mddev, struct bio *bio)
 {
 	struct r0conf *conf = mddev->private;
@@ -789,6 +814,7 @@ static struct md_personality raid0_personality=
 	.takeover	= raid0_takeover,
 	.quiesce	= raid0_quiesce,
 	.congested	= raid0_congested,
+	.is_missing_dev	= raid0_is_missing_dev,
 };
 
 static int __init raid0_init (void)
-- 
2.22.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
