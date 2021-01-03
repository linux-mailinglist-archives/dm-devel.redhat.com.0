Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 302552E9DE1
	for <lists+dm-devel@lfdr.de>; Mon,  4 Jan 2021 20:04:46 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-325-2RpiBwT6On-CynZx-GhSOg-1; Mon, 04 Jan 2021 14:04:42 -0500
X-MC-Unique: 2RpiBwT6On-CynZx-GhSOg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7EE56107ACF7;
	Mon,  4 Jan 2021 19:04:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 58BEB5C8AA;
	Mon,  4 Jan 2021 19:04:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A16451809CA1;
	Mon,  4 Jan 2021 19:04:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 103Lm0su025177 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 3 Jan 2021 16:48:01 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id BCAEF112C084; Sun,  3 Jan 2021 21:48:00 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B8719112C082
	for <dm-devel@redhat.com>; Sun,  3 Jan 2021 21:47:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9099D800296
	for <dm-devel@redhat.com>; Sun,  3 Jan 2021 21:47:58 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-595-_WLJp5VEPzaksTEZTuQC7w-1;
	Sun, 03 Jan 2021 16:47:56 -0500
X-MC-Unique: _WLJp5VEPzaksTEZTuQC7w-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8B4D2207C9;
	Sun,  3 Jan 2021 21:41:31 +0000 (UTC)
From: Arnd Bergmann <arnd@kernel.org>
To: Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>,
	dm-devel@redhat.com, Song Liu <song@kernel.org>,
	Bart Van Assche <bvanassche@acm.org>, Hannes Reinecke <hare@suse.com>, 
	Damien Le Moal <damien.lemoal@wdc.com>
Date: Sun,  3 Jan 2021 22:40:51 +0100
Message-Id: <20210103214129.1996037-1-arnd@kernel.org>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 103Lm0su025177
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 04 Jan 2021 14:03:12 -0500
Cc: linux-raid@vger.kernel.org, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>
Subject: [dm-devel] [PATCH] dm zoned: select CONFIG_CRC32
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Arnd Bergmann <arnd@arndb.de>

Without crc32 support, this driver fails to link:

arm-linux-gnueabi-ld: drivers/md/dm-zoned-metadata.o: in function `dmz_write_sb':
dm-zoned-metadata.c:(.text+0xe98): undefined reference to `crc32_le'
arm-linux-gnueabi-ld: drivers/md/dm-zoned-metadata.o: in function `dmz_check_sb':
dm-zoned-metadata.c:(.text+0x7978): undefined reference to `crc32_le'

Fixes: 3b1a94c88b79 ("dm zoned: drive-managed zoned block device target")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/md/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/md/Kconfig b/drivers/md/Kconfig
index b7e2d9666614..a67b9ed3ca89 100644
--- a/drivers/md/Kconfig
+++ b/drivers/md/Kconfig
@@ -622,6 +622,7 @@ config DM_ZONED
 	tristate "Drive-managed zoned block device target support"
 	depends on BLK_DEV_DM
 	depends on BLK_DEV_ZONED
+	select CRC32
 	help
 	  This device-mapper target takes a host-managed or host-aware zoned
 	  block device and exposes most of its capacity as a regular block
-- 
2.29.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

