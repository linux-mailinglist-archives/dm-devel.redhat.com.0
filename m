Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 558951C2CD6
	for <lists+dm-devel@lfdr.de>; Sun,  3 May 2020 15:42:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588513359;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ubHoM7UHV4hi7zBbLqMZUQdu4h4UvD1TwDac58+ikU8=;
	b=M9N0553eymku7q0Mzv/GLb2Z4WaFalAML0S/P4N6wkhdu7MzOUi2BYH5qFLC0c1EuPP/2m
	WUcw5ZMs0zM40jH3f5Y/he2quGusuFnz5TkrFiyr8i/YscQDwV6aUsD5WdAFmt8dzFS5ix
	gCX7B1Sn/J84iiR1wVHYrF6MjLvMA+I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-26-iMH-lHQxOLWvIEjTiQGJxQ-1; Sun, 03 May 2020 09:42:36 -0400
X-MC-Unique: iMH-lHQxOLWvIEjTiQGJxQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8A17A46B;
	Sun,  3 May 2020 13:42:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5D8FD6B8C7;
	Sun,  3 May 2020 13:42:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D40944CAA0;
	Sun,  3 May 2020 13:42:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03UKmjNR030844 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 30 Apr 2020 16:48:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7E2A52166BA4; Thu, 30 Apr 2020 20:48:45 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7A8382166BA3
	for <dm-devel@redhat.com>; Thu, 30 Apr 2020 20:48:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 318DA800FFA
	for <dm-devel@redhat.com>; Thu, 30 Apr 2020 20:48:42 +0000 (UTC)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
	[46.235.227.227]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-205-svK4JZuYNoKZotq3NkotUw-1; Thu, 30 Apr 2020 16:48:37 -0400
X-MC-Unique: svK4JZuYNoKZotq3NkotUw-1
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: krisman) with ESMTPSA id 78C692A2BB9
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: agk@redhat.com, snitzer@redhat.com
Date: Thu, 30 Apr 2020 16:48:28 -0400
Message-Id: <20200430204830.2589456-1-krisman@collabora.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03UKmjNR030844
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Sun, 03 May 2020 09:42:24 -0400
Cc: dm-devel@redhat.com, kernel@collabora.com,
	Gabriel Krisman Bertazi <krisman@collabora.com>, khazhy@google.com
Subject: [dm-devel] [PATCH v3 0/2] Historical Service Time Path Selector
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

This is the third version of HST considering the review by Mike
Snitzer.  This version drops the encapsulation patches and passes the
parameter directly to end_io.  It also uses jiffies_to_nsecs directly in
dm_start_time_ns_from_clone, instead of converting to msecs in an
intermediary step.

This didn't show any regressions compared to the benchmark I presented
on previous version:

v2: https://www.redhat.com/archives/dm-devel/2020-April/msg00270.html
v1: https://www.redhat.com/archives/dm-devel/2020-April/msg00176.html

This was tested primarily on a Google cloud SAN with real data and usage
patterns and with artificial benchmarks using fio.

Gabriel Krisman Bertazi (1):
  md: mpath: Pass IO start time to path selector

Khazhismel Kumykov (1):
  md: mpath: Add Historical Service Time Path Selector

 drivers/md/Kconfig                      |  11 +
 drivers/md/Makefile                     |   1 +
 drivers/md/dm-historical-service-time.c | 561 ++++++++++++++++++++++++
 drivers/md/dm-mpath.c                   |   9 +-
 drivers/md/dm-path-selector.h           |   2 +-
 drivers/md/dm-queue-length.c            |   2 +-
 drivers/md/dm-service-time.c            |   2 +-
 drivers/md/dm.c                         |  10 +
 include/linux/device-mapper.h           |   2 +
 9 files changed, 594 insertions(+), 6 deletions(-)
 create mode 100644 drivers/md/dm-historical-service-time.c

-- 
2.26.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

