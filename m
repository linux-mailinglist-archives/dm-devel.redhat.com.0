Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id C597C7A29F
	for <lists+dm-devel@lfdr.de>; Tue, 30 Jul 2019 09:55:49 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8028330BC590;
	Tue, 30 Jul 2019 07:55:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A01419C65;
	Tue, 30 Jul 2019 07:55:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 97419180B7B0;
	Tue, 30 Jul 2019 07:55:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6TJYSQQ019038 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 29 Jul 2019 15:34:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CD33C614C5; Mon, 29 Jul 2019 19:34:28 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.45])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C153F60A98
	for <dm-devel@redhat.com>; Mon, 29 Jul 2019 19:34:26 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
	[91.189.89.112]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6F4D93087958
	for <dm-devel@redhat.com>; Mon, 29 Jul 2019 19:34:25 +0000 (UTC)
Received: from mail-pg1-f200.google.com ([209.85.215.200])
	by youngberry.canonical.com with esmtps
	(TLS1.0:RSA_AES_128_CBC_SHA1:16) (Exim 4.76)
	(envelope-from <gpiccoli@canonical.com>) id 1hsBPb-00072J-MT
	for dm-devel@redhat.com; Mon, 29 Jul 2019 19:34:23 +0000
Received: by mail-pg1-f200.google.com with SMTP id q9so38825602pgv.17
	for <dm-devel@redhat.com>; Mon, 29 Jul 2019 12:34:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=A55J61QpsVvab7TmtGxzd7FgTJSRQiuBNgN4th6hVbE=;
	b=YPvzv+M/uwYd9NH9TFxRRD/7ANOkliePHZw9aqs/f5s1y8W6G3vpGHqHtsEcDBFtiq
	ot7dF6BljTIcha9haLqOsqZTBETye04J1s+CjDIajvE5wc1Oo6b5nIVFI5ieVQVtumzv
	3Cn9GuaEPp7OvczKwXOUnEuP1mS2lHNd2dePMEe0Zl2E6EsTwh+7ZNAKix2TBbZX86Fe
	BBuYFPnx16Sjx1CS7n4mZbCnk46/6hxhqwDfedxJUG7E13j34D4PwZF6raBdH0irPXwd
	eRrbqggEwpL7e9vtgmvvKEOc4iJloVvIPJqc92c2axqmc6MY0+QSY9+isghN+CkD7r0a
	VV9w==
X-Gm-Message-State: APjAAAVEgTxSg5TH9DG9R67aT0Ei6m63E0/cAd45k6qNO1p9ChNOsQ2u
	vM5u6SD26A6GJL0n5L1KYLVn46QEQajF1gxHuWKxyiZHI/nYH4VCT/IHo1h3yRlIErltOzSoF8M
	0qLruUnkIpnRpCmT4YzbYw5Ziot3Bag==
X-Received: by 2002:a17:902:4222:: with SMTP id
	g31mr37050757pld.41.1564428862304; 
	Mon, 29 Jul 2019 12:34:22 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxWECzCbAQxIwnmjYqImcSoYKsv3xNBRik3H0+WMu4EiUmnsmLVWTPudi9tpYcExfXGMrtDXg==
X-Received: by 2002:a17:902:4222:: with SMTP id
	g31mr37050736pld.41.1564428862083; 
	Mon, 29 Jul 2019 12:34:22 -0700 (PDT)
Received: from localhost ([152.254.214.186]) by smtp.gmail.com with ESMTPSA id
	m9sm106222912pgr.24.2019.07.29.12.34.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Jul 2019 12:34:21 -0700 (PDT)
From: "Guilherme G. Piccoli" <gpiccoli@canonical.com>
To: linux-raid@vger.kernel.org
Date: Mon, 29 Jul 2019 16:33:59 -0300
Message-Id: <20190729193359.11040-1-gpiccoli@canonical.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.45]); Mon, 29 Jul 2019 19:34:25 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]);
	Mon, 29 Jul 2019 19:34:25 +0000 (UTC) for IP:'91.189.89.112'
	DOMAIN:'youngberry.canonical.com'
	HELO:'youngberry.canonical.com' FROM:'gpiccoli@canonical.com'
	RCPT:''
X-RedHat-Spam-Score: -4.998  (RCVD_IN_DNSWL_HI, SPF_HELO_NONE,
	SPF_NONE) 91.189.89.112 youngberry.canonical.com
	91.189.89.112 youngberry.canonical.com <gpiccoli@canonical.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.45
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 30 Jul 2019 03:55:28 -0400
Cc: Song Liu <songliubraving@fb.com>, gpiccoli@canonical.com,
	NeilBrown <neilb@suse.com>, linux-block@vger.kernel.org,
	dm-devel@redhat.com, jay.vosburgh@canonical.com
Subject: [dm-devel] [PATCH] md/raid0: Fail BIOs if their underlying block
	device is gone
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Tue, 30 Jul 2019 07:55:48 +0000 (UTC)

Currently md/raid0 is not provided with any mechanism to validate if
an array member got removed or failed. The driver keeps sending BIOs
regardless of the state of array members. This leads to the following
situation: if a raid0 array member is removed and the array is mounted,
some user writing to this array won't realize that errors are happening
unless they check kernel log or perform one fsync per written file.

In other words, no -EIO is returned and writes (except direct ones) appear
normal. Meaning the user might think the wrote data is correctly stored in
the array, but instead garbage was written given that raid0 does stripping
(and so, it requires all its members to be working in order to not corrupt
data).

This patch proposes a small change in this behavior: we check if the block
device's gendisk is UP when submitting the BIO to the array member, and if
it isn't, we flag the md device as broken and fail subsequent I/Os. In case
the array is restored (i.e., the missing array member is back), the flag is
cleared and we can submit BIOs normally.

With this patch, the filesystem reacts much faster to the event of missing
array member: after some I/O errors, ext4 for instance aborts the journal
and prevents corruption. Without this change, we're able to keep writing
in the disk and after a machine reboot, e2fsck shows some severe fs errors
that demand fixing. This patch was tested in both ext4 and xfs
filesystems.

Cc: NeilBrown <neilb@suse.com>
Cc: Song Liu <songliubraving@fb.com>
Signed-off-by: Guilherme G. Piccoli <gpiccoli@canonical.com>
---

After an attempt to change the way md/raid0 fails in case one of its
members gets removed (see [0]), we got not so great feedback from the
community and also, the change was complex and had corner cases.
One of the points which seemed to be a consensus in that attempt was
that raid0 could benefit from a way of failing faster in case a member
gets removed. This patch aims for that, in a simpler way than earlier
proposed. Any feedbacks are welcome, thanks in advance!


Guilherme


[0] lore.kernel.org/linux-block/20190418220448.7219-1-gpiccoli@canonical.com


 drivers/md/md.c    | 5 +++++
 drivers/md/md.h    | 3 +++
 drivers/md/raid0.c | 8 ++++++++
 3 files changed, 16 insertions(+)

diff --git a/drivers/md/md.c b/drivers/md/md.c
index 24638ccedce4..fba49918d591 100644
--- a/drivers/md/md.c
+++ b/drivers/md/md.c
@@ -376,6 +376,11 @@ static blk_qc_t md_make_request(struct request_queue *q, struct bio *bio)
 	struct mddev *mddev = q->queuedata;
 	unsigned int sectors;
 
+	if (unlikely(test_bit(MD_BROKEN, &mddev->flags))) {
+		bio_io_error(bio);
+		return BLK_QC_T_NONE;
+	}
+
 	blk_queue_split(q, &bio);
 
 	if (mddev == NULL || mddev->pers == NULL) {
diff --git a/drivers/md/md.h b/drivers/md/md.h
index 10f98200e2f8..41552e615c4c 100644
--- a/drivers/md/md.h
+++ b/drivers/md/md.h
@@ -248,6 +248,9 @@ enum mddev_flags {
 	MD_UPDATING_SB,		/* md_check_recovery is updating the metadata
 				 * without explicitly holding reconfig_mutex.
 				 */
+	MD_BROKEN,              /* This is used in RAID-0 only, to stop I/O
+				 * in case an array member is gone/failed.
+				 */
 };
 
 enum mddev_sb_flags {
diff --git a/drivers/md/raid0.c b/drivers/md/raid0.c
index bf5cf184a260..58a9cc5193bf 100644
--- a/drivers/md/raid0.c
+++ b/drivers/md/raid0.c
@@ -586,6 +586,14 @@ static bool raid0_make_request(struct mddev *mddev, struct bio *bio)
 
 	zone = find_zone(mddev->private, &sector);
 	tmp_dev = map_sector(mddev, zone, sector, &sector);
+
+	if (unlikely(!(tmp_dev->bdev->bd_disk->flags & GENHD_FL_UP))) {
+		set_bit(MD_BROKEN, &mddev->flags);
+		bio_io_error(bio);
+		return true;
+	}
+
+	clear_bit(MD_BROKEN, &mddev->flags);
 	bio_set_dev(bio, tmp_dev->bdev);
 	bio->bi_iter.bi_sector = sector + zone->dev_start +
 		tmp_dev->data_offset;
-- 
2.22.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
