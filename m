Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 0FE4614DFFC
	for <lists+dm-devel@lfdr.de>; Thu, 30 Jan 2020 18:35:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580405708;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=M4BjnW/TWuSLLydPpnrqsL06ImN4Utnp446F5elCEfU=;
	b=HzIfkx+i0IY881bMQFvAB6dAqq0bHgDNTUGwrQjjOUgNARO6oSVVsLGWH9k8NPBulJe53G
	jmE+fJnCt3EeUynL9u/ebNN3bjeEzYqAMXuB1Jcx7kkVvbSnK1opZB3WXDAoc3hITe/S7D
	ISZtfQOsHPpuHKwzV1rBPKEuTu7LWzs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-lvHsGHB5MSazHc-4KIAXQw-1; Thu, 30 Jan 2020 12:35:05 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BBD8D107ACC9;
	Thu, 30 Jan 2020 17:34:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 287E919E9C;
	Thu, 30 Jan 2020 17:34:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6A0958579D;
	Thu, 30 Jan 2020 17:34:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00UHYVOM003425 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 30 Jan 2020 12:34:32 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id EF56D77928; Thu, 30 Jan 2020 17:34:31 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from leontynka.twibright.com (ovpn-205-84.brq.redhat.com
	[10.40.205.84])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D67377948;
	Thu, 30 Jan 2020 17:34:29 +0000 (UTC)
Received: from debian-a64.vm ([192.168.208.2])
	by leontynka.twibright.com with smtp (Exim 4.92)
	(envelope-from <mpatocka@redhat.com>)
	id 1ixDhy-0002Bm-SR; Thu, 30 Jan 2020 18:34:27 +0100
Received: by debian-a64.vm (sSMTP sendmail emulation);
	Thu, 30 Jan 2020 18:34:16 +0100
Message-Id: <20200130173416.623237840@debian-a64.vm>
User-Agent: quilt/0.65
Date: Thu, 30 Jan 2020 18:25:40 +0100
From: Mikulas Patocka <mpatocka@redhat.com>
To: Mike Snitzer <msnitzer@redhat.com>, David Teigland <teigland@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Mikulas Patocka <mpatocka@redhat.com>
Subject: [dm-devel] [PATCH 1/3] dm-integrity: dont replay journal data past
	the end of the device
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: lvHsGHB5MSazHc-4KIAXQw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=dm-integrity-dont-replay-past-the-end-of-device.patch

The following patches make it possible to shrink or extend the device. If
the device was shrunk, we don't want to replay journal data pointing past
the end of the device.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

---
 drivers/md/dm-integrity.c |    4 ++++
 1 file changed, 4 insertions(+)

Index: linux-2.6/drivers/md/dm-integrity.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-integrity.c	2020-01-29 15:21:08.000000000 +0100
+++ linux-2.6/drivers/md/dm-integrity.c	2020-01-29 15:21:08.000000000 +0100
@@ -2205,6 +2205,8 @@ static void do_journal_write(struct dm_i
 					sec &= ~(sector_t)(ic->sectors_per_block - 1);
 				}
 			}
+			if (unlikely(sec >= ic->provided_data_sectors))
+				continue;
 			get_area_and_offset(ic, sec, &area, &offset);
 			restore_last_bytes(ic, access_journal_data(ic, i, j), je);
 			for (k = j + 1; k < ic->journal_section_entries; k++) {
@@ -2214,6 +2216,8 @@ static void do_journal_write(struct dm_i
 					break;
 				BUG_ON(unlikely(journal_entry_is_inprogress(je2)) && !from_replay);
 				sec2 = journal_entry_get_sector(je2);
+				if (unlikely(sec2 >= ic->provided_data_sectors))
+					break;
 				get_area_and_offset(ic, sec2, &area2, &offset2);
 				if (area2 != area || offset2 != offset + ((k - j) << ic->sb->log2_sectors_per_block))
 					break;

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

