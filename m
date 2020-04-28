Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 9CF0B1BC230
	for <lists+dm-devel@lfdr.de>; Tue, 28 Apr 2020 17:04:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588086288;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Z5T1wTO0QE7N6CVRkqa9zfS+aHfQ9PfsdC1cwtCuuy0=;
	b=fbw27DB9fLyiBpkhDBOIDghkBrn4j0FVIiqEGA0OtP7Cpw/8VqJzjV+zMOlQ+zJDksAEvM
	fx+5waktZc0dQucZH+2CfO2A1uMH0Ek+nCpPPtIU2GAZjKjnYdtFe/1CwQI+4say9UyjXB
	/pt10GBfOwRQMRveYN2pGrHopS+gSjc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-407-u1gjB4Y5P2evCHLznF5hAA-1; Tue, 28 Apr 2020 11:04:46 -0400
X-MC-Unique: u1gjB4Y5P2evCHLznF5hAA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3A92E80058A;
	Tue, 28 Apr 2020 15:04:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D6A975D9E5;
	Tue, 28 Apr 2020 15:04:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C16A71809542;
	Tue, 28 Apr 2020 15:04:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03SF42Gs019286 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 28 Apr 2020 11:04:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 878422026D69; Tue, 28 Apr 2020 15:04:02 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 823602029F71
	for <dm-devel@redhat.com>; Tue, 28 Apr 2020 15:04:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0261685A59F
	for <dm-devel@redhat.com>; Tue, 28 Apr 2020 15:04:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-329-CcNKyK92MpqGS2KToGupoQ-1; Tue, 28 Apr 2020 11:03:55 -0400
X-MC-Unique: CcNKyK92MpqGS2KToGupoQ-1
Received: from [2601:1c0:6280:3f0::19c2]
	by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTRm6-0005pn-5b; Tue, 28 Apr 2020 15:03:54 +0000
To: LKML <linux-kernel@vger.kernel.org>, dm-devel@redhat.com
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <d33b3bfb-c38d-9770-e6a6-929519dc21d4@infradead.org>
Date: Tue, 28 Apr 2020 08:03:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.7.0
MIME-Version: 1.0
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: Heinz Mauelshagen <dm-devel@redhat.com>, Mike Snitzer <snitzer@redhat.com>,
	Alasdair Kergon <agk@redhat.com>
Subject: [dm-devel] [PATCH -next] md: dm-ebs-target: fix build errors &
	Kconfig entry
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

From: Randy Dunlap <rdunlap@infradead.org>

Fix build errors by selecting DM_BUFIO.

Fix Kconfig entry formatting by using tabs instead of spaces,
using "help" instead of "---help---", and
indenting help text with one additional space.

Fixes these build errors:

ld: drivers/md/dm-ebs-target.o: in function `__ebs_forget_bio':
dm-ebs-target.c:(.text+0x1bc): undefined reference to `dm_bufio_forget'
ld: drivers/md/dm-ebs-target.o: in function `ebs_dtr':
dm-ebs-target.c:(.text+0x2fe): undefined reference to `dm_bufio_client_destroy'
ld: drivers/md/dm-ebs-target.o: in function `__ebs_rw_bio':
dm-ebs-target.c:(.text+0x4c4): undefined reference to `dm_bufio_get_block_size'
ld: dm-ebs-target.c:(.text+0x4f1): undefined reference to `dm_bufio_read'
ld: dm-ebs-target.c:(.text+0x504): undefined reference to `dm_bufio_get_block_size'
ld: dm-ebs-target.c:(.text+0x519): undefined reference to `dm_bufio_new'
ld: dm-ebs-target.c:(.text+0x567): undefined reference to `dm_bufio_mark_partial_buffer_dirty'
ld: dm-ebs-target.c:(.text+0x56f): undefined reference to `dm_bufio_release'
ld: drivers/md/dm-ebs-target.o: in function `__ebs_process_bios':
dm-ebs-target.c:(.text+0x6bf): undefined reference to `dm_bufio_prefetch'
ld: dm-ebs-target.c:(.text+0x72d): undefined reference to `dm_bufio_prefetch'
ld: dm-ebs-target.c:(.text+0x783): undefined reference to `dm_bufio_prefetch'
ld: dm-ebs-target.c:(.text+0x7fe): undefined reference to `dm_bufio_write_dirty_buffers'
ld: drivers/md/dm-ebs-target.o: in function `ebs_ctr':
dm-ebs-target.c:(.text+0xa82): undefined reference to `dm_bufio_client_create'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Heinz Mauelshagen <dm-devel@redhat.com>
Cc: Alasdair Kergon <agk@redhat.com>
Cc: Mike Snitzer <snitzer@redhat.com>
Cc: dm-devel@redhat.com
---
 drivers/md/Kconfig |   12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

--- linux-next-20200428.orig/drivers/md/Kconfig
+++ linux-next-20200428/drivers/md/Kconfig
@@ -338,12 +338,12 @@ config DM_WRITECACHE
 	   to be cached in standard RAM.
 
 config DM_EBS
-       tristate "Emulated block size target (EXPERIMENTAL)"
-       depends on BLK_DEV_DM
-       default n
-       ---help---
-	 dm-ebs emulates smaller logical block size on backing devices
-	 with larger ones (e.g. 512 byte sectors on 4K native disks).
+	tristate "Emulated block size target (EXPERIMENTAL)"
+	depends on BLK_DEV_DM
+	select DM_BUFIO
+	help
+	  dm-ebs emulates smaller logical block size on backing devices
+	  with larger ones (e.g. 512 byte sectors on 4K native disks).
 
 config DM_ERA
        tristate "Era target (EXPERIMENTAL)"

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

