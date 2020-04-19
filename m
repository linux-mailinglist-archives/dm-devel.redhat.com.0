Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id DFE4A1B023B
	for <lists+dm-devel@lfdr.de>; Mon, 20 Apr 2020 09:07:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587366443;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=JyKHCDV5EwdQhjSD6kIrliKnGfWZpwTM1Wx09WKnWf0=;
	b=bIb73psZkw2yK1ZxTLF4CkRKIzNbjseG+M8CovH+xBbJbxP0UgZDHyb5fDKOX9FaXSlKfB
	k5CloewsiqIzPHVnb9nVeWmJCgrNy0DHOxEVUGDp0DtKAl7B8bofgieBN8kvn5yTNx+hCp
	2b8kivWwkdo47QaffZY9WMuwTBkCKRA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-409-x6JrTHvUNX6BIylC_gxf0w-1; Mon, 20 Apr 2020 03:07:21 -0400
X-MC-Unique: x6JrTHvUNX6BIylC_gxf0w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EDC8E8018A4;
	Mon, 20 Apr 2020 07:07:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 54C7B10013A1;
	Mon, 20 Apr 2020 07:07:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C416818089CE;
	Mon, 20 Apr 2020 07:07:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03J7jLdT003003 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 19 Apr 2020 03:45:22 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C1662B17F0; Sun, 19 Apr 2020 07:45:21 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BDEFDB17E4
	for <dm-devel@redhat.com>; Sun, 19 Apr 2020 07:45:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 662448FF67B
	for <dm-devel@redhat.com>; Sun, 19 Apr 2020 07:45:19 +0000 (UTC)
Received: from master.debian.org (master.debian.org [82.195.75.110]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-110-eMnEL93MOreCg9OUOlnxzw-1; Sun, 19 Apr 2020 03:45:16 -0400
X-MC-Unique: eMnEL93MOreCg9OUOlnxzw-1
Received: from pabs by master.debian.org with local (Exim 4.92)
	(envelope-from <pabs@master.debian.org>)
	id 1jQ4Q1-00040I-4w; Sun, 19 Apr 2020 07:31:09 +0000
From: Paul Wise <pabs3@bonedaddy.net>
To: Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>,
	dm-devel@redhat.com, linux-kernel@vger.kernel.org
Date: Sun, 19 Apr 2020 15:30:23 +0800
Message-Id: <20200419073026.197967-1-pabs3@bonedaddy.net>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03J7jLdT003003
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 20 Apr 2020 03:06:56 -0400
Cc: Paul Wise <pabs3@bonedaddy.net>
Subject: [dm-devel] [PATCH 0/3] dm raid/raid1: enable discard support when
	any devices support discard
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This makes dm raid and dm raid1 (mirroring) consistent with md raid,
which supports discard when only some of the devices support discard.

Another patch will be needed to fix the queue discard limits sysfs files,
fixing `fstrim --fstab`, but these patches suffice to fix `fstrim /` and
I haven't finished figuring out how the queue discard limits are set yet.

Paul Wise (3):
  dm: add support for targets that allow discard when one device does
  dm raid: only check for RAID 4/5/6 once during discard support setup
  dm raid/raid1: enable discard support when any devices support discard

 drivers/md/dm-cache-target.c  |  2 +-
 drivers/md/dm-clone-target.c  |  2 +-
 drivers/md/dm-log-writes.c    |  2 +-
 drivers/md/dm-raid.c          | 21 ++++++++++-----------
 drivers/md/dm-raid1.c         |  1 +
 drivers/md/dm-table.c         | 32 +++++++++++++++++++++-----------
 drivers/md/dm-thin.c          |  8 ++++----
 drivers/md/dm-zoned-target.c  |  2 +-
 include/linux/device-mapper.h | 13 ++++++++-----
 include/uapi/linux/dm-ioctl.h |  4 ++--
 10 files changed, 50 insertions(+), 37 deletions(-)

-- 
2.26.1


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

