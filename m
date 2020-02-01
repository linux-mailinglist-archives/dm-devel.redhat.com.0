Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id CC2A21502D5
	for <lists+dm-devel@lfdr.de>; Mon,  3 Feb 2020 09:54:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580720072;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=RXWUcp8kscDPYS3dw/gquMskk3HJDftYeYRxkF6JDSU=;
	b=O0OeB7ZGwoykA7q2hYN0viqAjNnPa6+qkTe6kjNZNoDOUe6E69FikN5UuMErk4zVE0L8un
	Q+UpT88HYEwMLzwuBKjJFXO7JHX5YAkn/BxGO7HQkb8NsIRJKLKBWdAbHbIcyX4Pl1tjk0
	eC6zKiLg4ExOFFLiDl0lSwHxKl0/Mvs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-277-F5l9g3XmPs6gBZ4nsjURnQ-1; Mon, 03 Feb 2020 03:54:30 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C642B800D53;
	Mon,  3 Feb 2020 08:54:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 23F9F5DA82;
	Mon,  3 Feb 2020 08:54:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4810E18033C2;
	Mon,  3 Feb 2020 08:54:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0110tUon004795 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 31 Jan 2020 19:55:30 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 4F60E60C84; Sat,  1 Feb 2020 00:55:30 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from pbitcolo-build-13.permabit.com
	(pbitcolo-build-13.permabit.lab.eng.bos.redhat.com [10.19.117.79])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EDDDB60BE2;
	Sat,  1 Feb 2020 00:55:24 +0000 (UTC)
From: John Dorminy <jdorminy@redhat.com>
To: agk@redhat.com, snitzer@redhat.com
Date: Fri, 31 Jan 2020 19:55:24 -0500
Message-Id: <20200201005524.23405-1-jdorminy@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 03 Feb 2020 03:53:45 -0500
Cc: dm-devel@redhat.com
Subject: [dm-devel] [PATCH] dm: expose dm_copy_name_and_uuid()
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
X-MC-Unique: F5l9g3XmPs6gBZ4nsjURnQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

While dm_device_name() returns the MAJOR:MINOR numbers of a device,
some targets would like to know the pretty name of a device, and
some targets would like to know the uuid expected for the device.

The MAJOR:MINOR name is useful for logging, but printing the long
name of the device can make it easier for the user to correlate
messages with the device names they know in userspace.

The UUID can be useful for devices which store a UUID on disk, and
would like to verify the on-disk UUID matches the UUID known by DM.

dm_copy_name_and_uuid() appears to be the only way to get at the
pretty name and the UUID at present, and this change exports the
function for use by GPLd modules.

Signed-off-by: John Dorminy <jdorminy@redhat.com>
---
 drivers/md/dm-ioctl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/md/dm-ioctl.c b/drivers/md/dm-ioctl.c
index 1e03bc89e20f..711a46015696 100644
--- a/drivers/md/dm-ioctl.c
+++ b/drivers/md/dm-ioctl.c
@@ -2018,7 +2018,7 @@ int dm_copy_name_and_uuid(struct mapped_device *md, char *name, char *uuid)
 
 	return r;
 }
-
+EXPORT_SYMBOL_GPL(dm_copy_name_and_uuid);
 
 /**
  * dm_early_create - create a mapped device in early boot.
-- 
2.20.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

