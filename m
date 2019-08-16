Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id D159B91EFA
	for <lists+dm-devel@lfdr.de>; Mon, 19 Aug 2019 10:34:14 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 14E71300C032;
	Mon, 19 Aug 2019 08:34:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 168B018B47;
	Mon, 19 Aug 2019 08:34:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E5A1F24F30;
	Mon, 19 Aug 2019 08:34:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7GDZ5nc028191 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 16 Aug 2019 09:35:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C30B583BB7; Fri, 16 Aug 2019 13:35:05 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.40])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BDE5783BA3
	for <dm-devel@redhat.com>; Fri, 16 Aug 2019 13:35:02 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
	[91.189.89.112]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3E55D3084295
	for <dm-devel@redhat.com>; Fri, 16 Aug 2019 13:35:01 +0000 (UTC)
Received: from mail-qt1-f200.google.com ([209.85.160.200])
	by youngberry.canonical.com with esmtps
	(TLS1.0:RSA_AES_128_CBC_SHA1:16) (Exim 4.76)
	(envelope-from <gpiccoli@canonical.com>) id 1hycNf-0000oP-R4
	for dm-devel@redhat.com; Fri, 16 Aug 2019 13:34:59 +0000
Received: by mail-qt1-f200.google.com with SMTP id e32so5912354qtc.7
	for <dm-devel@redhat.com>; Fri, 16 Aug 2019 06:34:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=UMgyJz5cP/cLZxpMyAQ6fwneZ+H/SLqNfT4XWYL3XWk=;
	b=NIggN72tkCVOArbrb7FKupJxfhwS2PIjlwXgXPY+BB0TY+rXnB4qn6XmeDcHi1Ivhs
	/SaosyNOWWZaQo9HZgkgHvzYS+Fl3MQfcaX5lcwSoX2t/nMcd5mfu3K8GYzEf4M4w24u
	HS/xI75IjCj66lTz1i9kF7V6aGxZNSJBujpaUlKvMYZ7H331qxhlqXthA5JB5qIR+594
	DPAE4NDESLlFjniBcs3uE595N0QQPQSV2AENiRYUJh45TZyDlpS5eeCz3ogyYNqwb9GE
	i87UYWQKqArtKKdbQ7vZ8WQkOMlvTzn4XV2T674tVB3EyCgqv0Dj9gx/elBBVbHE/F8E
	cYqA==
X-Gm-Message-State: APjAAAW/4t2fNXcF4xohLjh5ntfkujFoKqLdlJonM7/gBwpynvpZNaU4
	EqNTAYd4juAO844me3ZPNjVsTiS+dC7e9Cnqs+xztFJTHjfm9hRfGND12CA+TqFN352uoAY8sq/
	vcvg6URAkFjbco2okpN2BUTPs92OXdg==
X-Received: by 2002:a05:620a:144d:: with SMTP id
	i13mr8878212qkl.197.1565962497839; 
	Fri, 16 Aug 2019 06:34:57 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxpFpAst8B+U+sLZCTK4ARWCT9s7fD0hENh/Bq14SHpaUS2p14lDyvzy6EjpLCi0vDpur/xFg==
X-Received: by 2002:a05:620a:144d:: with SMTP id
	i13mr8878192qkl.197.1565962497556; 
	Fri, 16 Aug 2019 06:34:57 -0700 (PDT)
Received: from localhost ([191.13.19.2]) by smtp.gmail.com with ESMTPSA id
	q62sm3226982qkb.69.2019.08.16.06.34.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 16 Aug 2019 06:34:56 -0700 (PDT)
From: "Guilherme G. Piccoli" <gpiccoli@canonical.com>
To: linux-raid@vger.kernel.org
Date: Fri, 16 Aug 2019 10:34:41 -0300
Message-Id: <20190816133441.29350-1-gpiccoli@canonical.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.40]); Fri, 16 Aug 2019 13:35:01 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]);
	Fri, 16 Aug 2019 13:35:01 +0000 (UTC) for IP:'91.189.89.112'
	DOMAIN:'youngberry.canonical.com'
	HELO:'youngberry.canonical.com' FROM:'gpiccoli@canonical.com'
	RCPT:''
X-RedHat-Spam-Score: -4.998  (RCVD_IN_DNSWL_HI, SPF_HELO_NONE,
	SPF_NONE) 91.189.89.112 youngberry.canonical.com
	91.189.89.112 youngberry.canonical.com <gpiccoli@canonical.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.40
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 19 Aug 2019 04:33:53 -0400
Cc: Song Liu <songliubraving@fb.com>, gpiccoli@canonical.com,
	NeilBrown <neilb@suse.com>, linux-block@vger.kernel.org,
	dm-devel@redhat.com, jay.vosburgh@canonical.com
Subject: [dm-devel] [PATCH v2] md raid0/linear: Fail BIOs if their
	underlying block device is gone
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Mon, 19 Aug 2019 08:34:13 +0000 (UTC)

Currently md raid0/linear are not provided with any mechanism to validate
if an array member got removed or failed. The driver keeps sending BIOs
regardless of the state of array members. This leads to the following
situation: if a raid0/linear array member is removed and the array is
mounted, some user writing to this array won't realize that errors are
happening unless they check dmesg or perform one fsync per written file.

In other words, no -EIO is returned and writes (except direct ones) appear
normal. Meaning the user might think the wrote data is correctly stored in
the array, but instead garbage was written given that raid0 does stripping
(and so, it requires all its members to be working in order to not corrupt
data). For md/linear, writes to the available members will work fine, but
if the writes go to the missing member(s), it'll cause a file corruption
situation, whereas the portion of the writes to the missing device aren't
written effectively.

This patch proposes a small change in this behavior: we check if the block
device's gendisk is UP when submitting the BIO to the array member, and if
it isn't, we flag the md device as broken and fail subsequent write I/Os.
If the array is restored (i.e., the missing array members are back) and
the array is restarted, the flag is cleared and we can submit BIOs normally.

With this patch, the filesystem reacts much faster to the event of missing
array member: after some I/O errors, ext4 for instance aborts the journal
and prevents corruption. Without this change, we're able to keep writing
in the disk and after a machine reboot, e2fsck shows some severe fs errors
that demand fixing. This patch was tested in ext4 and xfs filesystems.

Cc: NeilBrown <neilb@suse.com>
Cc: Song Liu <songliubraving@fb.com>
Signed-off-by: Guilherme G. Piccoli <gpiccoli@canonical.com>
---

v1 -> v2:
* Fail only WRITE requests (thanks Neil for the suggestion);
* Added handling for md-linear failures too (thanks Song for
the suggestion).


 drivers/md/md-linear.c | 6 ++++++
 drivers/md/md.c        | 5 +++++
 drivers/md/md.h        | 3 +++
 drivers/md/raid0.c     | 7 +++++++
 4 files changed, 21 insertions(+)

diff --git a/drivers/md/md-linear.c b/drivers/md/md-linear.c
index 7354466ddc90..ed2297541414 100644
--- a/drivers/md/md-linear.c
+++ b/drivers/md/md-linear.c
@@ -258,6 +258,12 @@ static bool linear_make_request(struct mddev *mddev, struct bio *bio)
 		     bio_sector < start_sector))
 		goto out_of_bounds;
 
+	if (unlikely(!(tmp_dev->rdev->bdev->bd_disk->flags & GENHD_FL_UP))) {
+		set_bit(MD_BROKEN, &mddev->flags);
+		bio_io_error(bio);
+		return true;
+	}
+
 	if (unlikely(bio_end_sector(bio) > end_sector)) {
 		/* This bio crosses a device boundary, so we have to split it */
 		struct bio *split = bio_split(bio, end_sector - bio_sector,
diff --git a/drivers/md/md.c b/drivers/md/md.c
index 24638ccedce4..ba4de55eea13 100644
--- a/drivers/md/md.c
+++ b/drivers/md/md.c
@@ -376,6 +376,11 @@ static blk_qc_t md_make_request(struct request_queue *q, struct bio *bio)
 	struct mddev *mddev = q->queuedata;
 	unsigned int sectors;
 
+	if (unlikely(test_bit(MD_BROKEN, &mddev->flags)) && (rw == WRITE)) {
+		bio_io_error(bio);
+		return BLK_QC_T_NONE;
+	}
+
 	blk_queue_split(q, &bio);
 
 	if (mddev == NULL || mddev->pers == NULL) {
diff --git a/drivers/md/md.h b/drivers/md/md.h
index 10f98200e2f8..5d7c1cad4946 100644
--- a/drivers/md/md.h
+++ b/drivers/md/md.h
@@ -248,6 +248,9 @@ enum mddev_flags {
 	MD_UPDATING_SB,		/* md_check_recovery is updating the metadata
 				 * without explicitly holding reconfig_mutex.
 				 */
+	MD_BROKEN,              /* This is used in RAID-0/LINEAR only, to stop
+				 * I/O in case an array member is gone/failed.
+				 */
 };
 
 enum mddev_sb_flags {
diff --git a/drivers/md/raid0.c b/drivers/md/raid0.c
index bf5cf184a260..ef896ee7198b 100644
--- a/drivers/md/raid0.c
+++ b/drivers/md/raid0.c
@@ -586,6 +586,13 @@ static bool raid0_make_request(struct mddev *mddev, struct bio *bio)
 
 	zone = find_zone(mddev->private, &sector);
 	tmp_dev = map_sector(mddev, zone, sector, &sector);
+
+	if (unlikely(!(tmp_dev->bdev->bd_disk->flags & GENHD_FL_UP))) {
+		set_bit(MD_BROKEN, &mddev->flags);
+		bio_io_error(bio);
+		return true;
+	}
+
 	bio_set_dev(bio, tmp_dev->bdev);
 	bio->bi_iter.bi_sector = sector + zone->dev_start +
 		tmp_dev->data_offset;
-- 
2.22.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
