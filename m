Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [216.205.24.74])
	by mail.lfdr.de (Postfix) with ESMTP id C601D18EC02
	for <lists+dm-devel@lfdr.de>; Sun, 22 Mar 2020 20:46:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584906373;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=D3rz4+/l+ILK8tc+DVyqKS7m1oaGx0amnVI676p4/hM=;
	b=KTkVskf73HTyNepXi9HT0OS/bTl+Rc0O+rQQ67Q216VxyUXy3ftwsMW1YVITAtm1+uGUtm
	3S8+r2B8gnI16oQlNIJ2QKF/vNm/4DMFo6QGSMlKVANzGIfKsY4QFXkhaVsAt/YvAw8P8Z
	lHaxPJo/f7Ze03KY6OrQySHCpUNYwHQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-282-bNzyAplINe-1CABy-phCuw-1; Sun, 22 Mar 2020 15:45:07 -0400
X-MC-Unique: bNzyAplINe-1CABy-phCuw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 70CFF100726B;
	Sun, 22 Mar 2020 19:45:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 859A95DA76;
	Sun, 22 Mar 2020 19:45:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2F44086396;
	Sun, 22 Mar 2020 19:44:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02MJiS1D025801 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 22 Mar 2020 15:44:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4068010002A9; Sun, 22 Mar 2020 19:44:28 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from leontynka.twibright.com (unknown [10.40.192.116])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CC7FF1001E91;
	Sun, 22 Mar 2020 19:44:27 +0000 (UTC)
Received: from debian-a64.vm ([192.168.208.2])
	by leontynka.twibright.com with smtp (Exim 4.92)
	(envelope-from <mpatocka@redhat.com>)
	id 1jG6WG-0005xu-57; Sun, 22 Mar 2020 20:44:25 +0100
Received: by debian-a64.vm (sSMTP sendmail emulation);
	Sun, 22 Mar 2020 20:44:24 +0100
Message-Id: <20200322194423.875742040@debian-a64.vm>
User-Agent: quilt/0.65
Date: Sun, 22 Mar 2020 20:42:24 +0100
From: Mikulas Patocka <mpatocka@redhat.com>
To: Mike Snitzer <msnitzer@redhat.com>, David Teigland <teigland@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Mikulas Patocka <mpatocka@redhat.com>
Subject: [dm-devel] [PATCH 4/7] dm-integrity: introduce
	get_provided_data_sectors
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=dm-integrity-get_provided_data_sectors.patch

Refactoring: move code to a new function get_provided_data_sectors.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

---
 drivers/md/dm-integrity.c |   33 +++++++++++++++++++++++----------
 1 file changed, 23 insertions(+), 10 deletions(-)

Index: linux-2.6/drivers/md/dm-integrity.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-integrity.c	2020-03-09 15:45:34.000000000 +0100
+++ linux-2.6/drivers/md/dm-integrity.c	2020-03-09 15:45:34.000000000 +0100
@@ -3077,6 +3077,24 @@ static int calculate_device_limits(struc
 	return 0;
 }
 
+static void get_provided_data_sectors(struct dm_integrity_c *ic)
+{
+	if (!ic->meta_dev) {
+		int test_bit;
+		ic->provided_data_sectors = 0;
+		for (test_bit = fls64(ic->meta_device_sectors) - 1; test_bit >= 3; test_bit--) {
+			__u64 prev_data_sectors = ic->provided_data_sectors;
+
+			ic->provided_data_sectors |= (sector_t)1 << test_bit;
+			if (calculate_device_limits(ic))
+				ic->provided_data_sectors = prev_data_sectors;
+		}
+	} else {
+		ic->provided_data_sectors = ic->data_device_sectors;
+		ic->provided_data_sectors &= ~(sector_t)(ic->sectors_per_block - 1);
+	}
+}
+
 static int initialize_superblock(struct dm_integrity_c *ic, unsigned journal_sectors, unsigned interleave_sectors)
 {
 	unsigned journal_sections;
@@ -3104,20 +3122,15 @@ static int initialize_superblock(struct
 		ic->sb->log2_interleave_sectors = max((__u8)MIN_LOG2_INTERLEAVE_SECTORS, ic->sb->log2_interleave_sectors);
 		ic->sb->log2_interleave_sectors = min((__u8)MAX_LOG2_INTERLEAVE_SECTORS, ic->sb->log2_interleave_sectors);
 
-		ic->provided_data_sectors = 0;
-		for (test_bit = fls64(ic->meta_device_sectors) - 1; test_bit >= 3; test_bit--) {
-			__u64 prev_data_sectors = ic->provided_data_sectors;
-
-			ic->provided_data_sectors |= (sector_t)1 << test_bit;
-			if (calculate_device_limits(ic))
-				ic->provided_data_sectors = prev_data_sectors;
-		}
+		get_provided_data_sectors(ic);
 		if (!ic->provided_data_sectors)
 			return -EINVAL;
 	} else {
 		ic->sb->log2_interleave_sectors = 0;
-		ic->provided_data_sectors = ic->data_device_sectors;
-		ic->provided_data_sectors &= ~(sector_t)(ic->sectors_per_block - 1);
+
+		get_provided_data_sectors(ic);
+		if (!ic->provided_data_sectors)
+			return -EINVAL;
 
 try_smaller_buffer:
 		ic->sb->journal_sections = cpu_to_le32(0);

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

