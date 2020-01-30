Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 2347E14DFFF
	for <lists+dm-devel@lfdr.de>; Thu, 30 Jan 2020 18:35:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580405712;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=QUlKnfqZJjjTaMDWDyFUKrezaw1gKFbyKpalGK5aC2g=;
	b=AIYTjX1eY+Bi0BrtRetqw6GIcJp+tBxmW7ErhtNSjLMET1OTR521Ub+V3wbrh+go3rMu6o
	/VGXQ7OdTQ+SYsTKOwJtgC0oEJe1vUYvSyy92SH88kFmfO+BBJ/aszfl5Lye6282/nCLLf
	cIFs6xXKvF3yidQcghsiUPedg6T2e6o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-143-qIuL31fIO0idICfNkiMrrw-1; Thu, 30 Jan 2020 12:35:08 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5BCE4800D50;
	Thu, 30 Jan 2020 17:34:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 35AB519756;
	Thu, 30 Jan 2020 17:34:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B073B18089C8;
	Thu, 30 Jan 2020 17:34:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00UHYXqm003433 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 30 Jan 2020 12:34:33 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 4616D5C3FA; Thu, 30 Jan 2020 17:34:33 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from leontynka.twibright.com (ovpn-205-84.brq.redhat.com
	[10.40.205.84])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8320F5C1B2;
	Thu, 30 Jan 2020 17:34:30 +0000 (UTC)
Received: from debian-a64.vm ([192.168.208.2])
	by leontynka.twibright.com with smtp (Exim 4.92)
	(envelope-from <mpatocka@redhat.com>)
	id 1ixDi0-0002Bp-34; Thu, 30 Jan 2020 18:34:29 +0100
Received: by debian-a64.vm (sSMTP sendmail emulation);
	Thu, 30 Jan 2020 18:34:17 +0100
Message-Id: <20200130173417.840042000@debian-a64.vm>
User-Agent: quilt/0.65
Date: Thu, 30 Jan 2020 18:25:41 +0100
From: Mikulas Patocka <mpatocka@redhat.com>
To: Mike Snitzer <msnitzer@redhat.com>, David Teigland <teigland@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Mikulas Patocka <mpatocka@redhat.com>
Subject: [dm-devel] [PATCH 2/3] dm-integrity: introduce
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: qIuL31fIO0idICfNkiMrrw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=dm-integrity-get_provided_data_sectors.patch

Refactoring: move code to a new function get_provided_data_sectors.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

---
 drivers/md/dm-integrity.c |   54 +++++++++++++++++++++++++++++++---------------
 1 file changed, 37 insertions(+), 17 deletions(-)

Index: linux-2.6/drivers/md/dm-integrity.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-integrity.c	2020-01-29 15:21:08.000000000 +0100
+++ linux-2.6/drivers/md/dm-integrity.c	2020-01-29 20:29:32.000000000 +0100
@@ -3086,6 +3093,24 @@ static int calculate_device_limits(struc
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
@@ -3113,20 +3138,15 @@ static int initialize_superblock(struct
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

