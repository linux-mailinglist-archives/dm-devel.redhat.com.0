Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id EFEBB91EFB
	for <lists+dm-devel@lfdr.de>; Mon, 19 Aug 2019 10:34:14 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E479B307D962;
	Mon, 19 Aug 2019 08:34:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 17F148CCCB;
	Mon, 19 Aug 2019 08:34:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1EC5A24F31;
	Mon, 19 Aug 2019 08:34:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7GDfDx7028389 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 16 Aug 2019 09:41:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 039AA17995; Fri, 16 Aug 2019 13:41:13 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F22B017CE2
	for <dm-devel@redhat.com>; Fri, 16 Aug 2019 13:41:10 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
	[91.189.89.112]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 245DAC009DDD
	for <dm-devel@redhat.com>; Fri, 16 Aug 2019 13:41:09 +0000 (UTC)
Received: from mail-qt1-f199.google.com ([209.85.160.199])
	by youngberry.canonical.com with esmtps
	(TLS1.0:RSA_AES_128_CBC_SHA1:16) (Exim 4.76)
	(envelope-from <gpiccoli@canonical.com>) id 1hycTb-0001Kn-S0
	for dm-devel@redhat.com; Fri, 16 Aug 2019 13:41:08 +0000
Received: by mail-qt1-f199.google.com with SMTP id k13so5910933qtp.15
	for <dm-devel@redhat.com>; Fri, 16 Aug 2019 06:41:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=4N5xU9SyzOFldeE0V1HPJ7KCJ6tN+7YPLGNAaqnzYCw=;
	b=BW+7VSpocZDeD0zOCfQz7IQOe3SdoJcpM3n05HNKDFhpM96t7FCwkgawY3nXKmoAF7
	b2vlHULLjdQUC5y8ghONAdhXIPlZkVIFPLR4qRK3Ia/0v3yl2aTq3wTDz1iYjMweVcFG
	pHNyrACSDUn6dkexg1IuzqB9RYqDtGBimWbkxKerb7ub4GlFmRmok58CYM15rNliv5MR
	5DiR+xAJ2Vt+d29zDZsLp1TIvPf4uJbUAk8iEzH1UonsWXs0Ud14hWu8HxY6gVuQh/zC
	G9rgnX6nzLLi835iZVFdJu3/zH1X/aRIQZ+/owAYSTs+KmXhIqIYzbS07At6GEmKKiwG
	KT3Q==
X-Gm-Message-State: APjAAAWzWkbjUknDydCoM5TWGFVgmYBmLR9oxxUkgYnzGjzMGMMttHfQ
	2sVMBSsele4RJfsaK3LFWTPZMv5+r13zo93sMCJ6WTrIEDwS6Y5zwACe69vHTvZUtF+GXcxWdbS
	nu8+e8XFfBdY9v8KacJO3k2rxFGc/qg==
X-Received: by 2002:ae9:e91a:: with SMTP id x26mr8807453qkf.305.1565962866538; 
	Fri, 16 Aug 2019 06:41:06 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwygp8F7l+JofXM1Fz9C0aXGXFyMZ2WmVpWE1a9KOfVKgvwBjgYBmjCKz5pS9XXRy+Bg7quRQ==
X-Received: by 2002:ae9:e91a:: with SMTP id x26mr8807436qkf.305.1565962866250; 
	Fri, 16 Aug 2019 06:41:06 -0700 (PDT)
Received: from localhost ([191.13.19.2]) by smtp.gmail.com with ESMTPSA id
	u57sm3517952qtk.29.2019.08.16.06.41.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 16 Aug 2019 06:41:05 -0700 (PDT)
From: "Guilherme G. Piccoli" <gpiccoli@canonical.com>
To: linux-raid@vger.kernel.org
Date: Fri, 16 Aug 2019 10:40:58 -0300
Message-Id: <20190816134059.29751-1-gpiccoli@canonical.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.32]); Fri, 16 Aug 2019 13:41:09 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]);
	Fri, 16 Aug 2019 13:41:09 +0000 (UTC) for IP:'91.189.89.112'
	DOMAIN:'youngberry.canonical.com'
	HELO:'youngberry.canonical.com' FROM:'gpiccoli@canonical.com'
	RCPT:''
X-RedHat-Spam-Score: -4.998  (RCVD_IN_DNSWL_HI, SPF_HELO_NONE,
	SPF_NONE) 91.189.89.112 youngberry.canonical.com
	91.189.89.112 youngberry.canonical.com <gpiccoli@canonical.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.32
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 19 Aug 2019 04:33:53 -0400
Cc: Song Liu <songliubraving@fb.com>, gpiccoli@canonical.com,
	NeilBrown <neilb@suse.com>, linux-block@vger.kernel.org,
	dm-devel@redhat.com, jay.vosburgh@canonical.com
Subject: [dm-devel] [PATCH v2 1/2] md raid0/linear: Introduce new array
	state 'broken'
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Mon, 19 Aug 2019 08:34:13 +0000 (UTC)

Currently if md raid0/linear array gets one or more members removed while
being mounted, kernel keeps showing state 'clean' in the 'array_state'
sysfs attribute. Despite udev signaling the member device is gone, 'mdadm'
cannot issue the STOP_ARRAY ioctl successfully, given the array is mounted.

Nothing else hints that something is wrong (except that the removed devices
don't show properly in the output of 'mdadm detail' command). There is no
other property to be checked, and if user is not performing reads/writes
to the array, even kernel log is quiet and doesn't give a clue about the
missing member.

This patch changes this behavior; when 'array_state' is read we introduce
a non-expensive check (only for raid0/md-linear) that relies in the
comparison of the total number of disks when array was assembled with
gendisk flags of those devices to validate if all members are available
and functional. A new array state 'broken' was added: it mimics the state
'clean' in every aspect, being useful only to distinguish if such array
has some member missing. Also, we show a rate-limited warning in kernel
log in such case.

This patch has no proper functional change other than adding the
'clean'-like state; it was tested with ext4 and xfs filesystems. It
requires a 'mdadm' counterpart to handle the 'broken' state.

Cc: NeilBrown <neilb@suse.com>
Cc: Song Liu <songliubraving@fb.com>
Signed-off-by: Guilherme G. Piccoli <gpiccoli@canonical.com>
---

Cover-letter from v1:
lore.kernel.org/linux-block/20190729203135.12934-1-gpiccoli@canonical.com

v1 -> v2:
* Added handling for md/linear 'broken' state;
* Check for is_missing_dev() instead of personality (thanks Neil for
the suggestion);
* Changed is_missing_dev() handlers to static;
* Print rate-limited warning in case of more members go away, not only
the first.

Song, after thinking and experimenting a bit more, I don't think it
makes sense to allow setting the 'broken' state, unless we refactor
and "re-purpose" this state. What 'broken' really means is a 'clean'
state but with 1+ members missing - setting it is the same as set
'clean', so it'd be counter-intuitive to set 'broken' but having in
fact set 'clean' merely with the name 'broken'.

The purpose of 'broken' is really to only indicate a missing member,
as noticed by kernel in array_state reads.
If you really think we should use 'broken' for other purposes and hence
users should be allowed to set it, let's discuss and rewrite it.
Personally I think the less we change, the better. We just need
some way to warn users about the missing members of their arrays.
Thanks,

Guilherme


 drivers/md/md-linear.c | 25 +++++++++++++++++++++++++
 drivers/md/md.c        | 22 ++++++++++++++++++----
 drivers/md/md.h        |  2 ++
 drivers/md/raid0.c     | 26 ++++++++++++++++++++++++++
 4 files changed, 71 insertions(+), 4 deletions(-)

diff --git a/drivers/md/md-linear.c b/drivers/md/md-linear.c
index ed2297541414..a404f700e3f8 100644
--- a/drivers/md/md-linear.c
+++ b/drivers/md/md-linear.c
@@ -237,6 +237,30 @@ static void linear_free(struct mddev *mddev, void *priv)
 	kfree(conf);
 }
 
+static bool linear_is_missing_dev(struct mddev *mddev)
+{
+	struct md_rdev *rdev;
+	static int already_missing;
+	int def_disks, work_disks = 0;
+
+	def_disks = mddev->raid_disks;
+	rdev_for_each(rdev, mddev)
+		if (rdev->bdev->bd_disk->flags & GENHD_FL_UP)
+			work_disks++;
+
+	if (unlikely(def_disks - work_disks)) {
+		if (already_missing < (def_disks - work_disks)) {
+			already_missing = def_disks - work_disks;
+			pr_warn("md: %s: linear array has %d missing/failed members\n",
+				mdname(mddev), already_missing);
+		}
+		return true;
+	}
+
+	already_missing = 0;
+	return false;
+}
+
 static bool linear_make_request(struct mddev *mddev, struct bio *bio)
 {
 	char b[BDEVNAME_SIZE];
@@ -325,6 +349,7 @@ static struct md_personality linear_personality =
 	.size		= linear_size,
 	.quiesce	= linear_quiesce,
 	.congested	= linear_congested,
+	.is_missing_dev	= linear_is_missing_dev,
 };
 
 static int __init linear_init (void)
diff --git a/drivers/md/md.c b/drivers/md/md.c
index ba4de55eea13..0ef93d21cab6 100644
--- a/drivers/md/md.c
+++ b/drivers/md/md.c
@@ -4160,12 +4160,17 @@ __ATTR_PREALLOC(resync_start, S_IRUGO|S_IWUSR,
  * active-idle
  *     like active, but no writes have been seen for a while (100msec).
  *
+ * broken
+ *     RAID0/LINEAR-only: same as clean, but array is missing a member.
+ *     It's useful because RAID0/LINEAR mounted-arrays aren't stopped
+ *     when a member is gone, so this state will at least alert the
+ *     user that something is wrong.
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
@@ -4181,7 +4186,7 @@ array_state_show(struct mddev *mddev, char *page)
 {
 	enum array_state st = inactive;
 
-	if (mddev->pers)
+	if (mddev->pers) {
 		switch(mddev->ro) {
 		case 1:
 			st = readonly;
@@ -4201,7 +4206,15 @@ array_state_show(struct mddev *mddev, char *page)
 				st = active;
 			spin_unlock(&mddev->lock);
 		}
-	else {
+
+		if ((mddev->pers->is_missing_dev) &&
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
@@ -4315,6 +4328,7 @@ array_state_store(struct mddev *mddev, const char *buf, size_t len)
 		break;
 	case write_pending:
 	case active_idle:
+	case broken:
 		/* these cannot be set */
 		break;
 	}
diff --git a/drivers/md/md.h b/drivers/md/md.h
index 5d7c1cad4946..2b40990c7642 100644
--- a/drivers/md/md.h
+++ b/drivers/md/md.h
@@ -590,6 +590,8 @@ struct md_personality
 	int (*congested)(struct mddev *mddev, int bits);
 	/* Changes the consistency policy of an active array. */
 	int (*change_consistency_policy)(struct mddev *mddev, const char *buf);
+	/* Check if there are any missing/failed members - RAID0/LINEAR only. */
+	bool (*is_missing_dev)(struct mddev *mddev);
 };
 
 struct md_sysfs_entry {
diff --git a/drivers/md/raid0.c b/drivers/md/raid0.c
index ef896ee7198b..f7144be96029 100644
--- a/drivers/md/raid0.c
+++ b/drivers/md/raid0.c
@@ -455,6 +455,31 @@ static inline int is_io_in_chunk_boundary(struct mddev *mddev,
 	}
 }
 
+static bool raid0_is_missing_dev(struct mddev *mddev)
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
+		if (already_missing < (def_disks - work_disks)) {
+			already_missing = def_disks - work_disks;
+			pr_warn("md: %s: raid0 array has %d missing/failed members\n",
+				mdname(mddev), already_missing);
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
@@ -788,6 +813,7 @@ static struct md_personality raid0_personality=
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
