Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [216.205.24.74])
	by mail.lfdr.de (Postfix) with ESMTP id 2F70B18EBFC
	for <lists+dm-devel@lfdr.de>; Sun, 22 Mar 2020 20:45:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584906313;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=kaymuOKB8CNRmUjabTTVKc7qJuayofmzwV9P73jsz/M=;
	b=KR/gOwibYzqdxn0/ZCr0r1ob7i4GFA542tng7qp+dFkAQTrUmHUJcxKx5E2WIqMIf677fZ
	ZBNm68XW935z0xxb/ulcCv6USUVP8Jx43IQTNVz5pwXW4xhxAIDT50WYAvwJkz3jT4U4oI
	pLkXOtOGQtMBYzIIDSyHH4lVuyofjpA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-399-tHW-Fs4eO62APNUCoz_sog-1; Sun, 22 Mar 2020 15:45:10 -0400
X-MC-Unique: tHW-Fs4eO62APNUCoz_sog-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E0D9C800D6C;
	Sun, 22 Mar 2020 19:45:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 950A660BE2;
	Sun, 22 Mar 2020 19:45:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0063918089CD;
	Sun, 22 Mar 2020 19:45:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02MJiTEQ025823 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 22 Mar 2020 15:44:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5C91994974; Sun, 22 Mar 2020 19:44:29 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from leontynka.twibright.com (unknown [10.40.192.116])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 754D494960;
	Sun, 22 Mar 2020 19:44:26 +0000 (UTC)
Received: from debian-a64.vm ([192.168.208.2])
	by leontynka.twibright.com with smtp (Exim 4.92)
	(envelope-from <mpatocka@redhat.com>)
	id 1jG6WE-0005xr-Rf; Sun, 22 Mar 2020 20:44:23 +0100
Received: by debian-a64.vm (sSMTP sendmail emulation);
	Sun, 22 Mar 2020 20:44:22 +0100
Message-Id: <20200322194422.575390680@debian-a64.vm>
User-Agent: quilt/0.65
Date: Sun, 22 Mar 2020 20:42:23 +0100
From: Mikulas Patocka <mpatocka@redhat.com>
To: Mike Snitzer <msnitzer@redhat.com>, David Teigland <teigland@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Mikulas Patocka <mpatocka@redhat.com>
Subject: [dm-devel] [PATCH 3/7] dm-integrity: dont replay journal data past
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
--- linux-2.6.orig/drivers/md/dm-integrity.c	2020-03-09 15:44:41.000000000 +0100
+++ linux-2.6/drivers/md/dm-integrity.c	2020-03-09 15:44:41.000000000 +0100
@@ -2193,6 +2193,8 @@ static void do_journal_write(struct dm_i
 					sec &= ~(sector_t)(ic->sectors_per_block - 1);
 				}
 			}
+			if (unlikely(sec >= ic->provided_data_sectors))
+				continue;
 			get_area_and_offset(ic, sec, &area, &offset);
 			restore_last_bytes(ic, access_journal_data(ic, i, j), je);
 			for (k = j + 1; k < ic->journal_section_entries; k++) {
@@ -2202,6 +2204,8 @@ static void do_journal_write(struct dm_i
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

