Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 0A16A1AD65F
	for <lists+dm-devel@lfdr.de>; Fri, 17 Apr 2020 08:44:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587105859;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ah/CoYXYByLvgsjM2XfZhk3idCeJF0DBNi8yJfxtaPM=;
	b=bVHOAtPELSFTY5QGffBHnTwn45mvCxkogoQCtEWiDoovuwBPnt3ARCr6J0ZMFRWJc2IYhc
	XibAUN9Sgv3hU5xm5xcgEtRsW8E0oOoTr2UTJ+KiS5/lO3NWZ3WsRSVmLOEFOkfnOfUykn
	GBkU2rYhe5iz0/7hHBEffZa01d+LLsU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-hpEVAMKFOQOnjaQBd9pUCg-1; Fri, 17 Apr 2020 02:44:17 -0400
X-MC-Unique: hpEVAMKFOQOnjaQBd9pUCg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7761D1800D4A;
	Fri, 17 Apr 2020 06:44:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C63BE1036D15;
	Fri, 17 Apr 2020 06:44:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F341918095FF;
	Fri, 17 Apr 2020 06:44:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03GLDoNo002317 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 16 Apr 2020 17:13:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 881161006B08; Thu, 16 Apr 2020 21:13:50 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 844311006B06
	for <dm-devel@redhat.com>; Thu, 16 Apr 2020 21:13:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DEEC4800A18
	for <dm-devel@redhat.com>; Thu, 16 Apr 2020 21:13:47 +0000 (UTC)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
	[46.235.227.227]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-66-EN2HrBxsP36jBpHCOSq14g-1; Thu, 16 Apr 2020 17:13:45 -0400
X-MC-Unique: EN2HrBxsP36jBpHCOSq14g-1
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: krisman) with ESMTPSA id E8F742A23DF
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: agk@redhat.com, snitzer@redhat.com
Date: Thu, 16 Apr 2020 17:13:34 -0400
Message-Id: <20200416211336.2423618-1-krisman@collabora.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03GLDoNo002317
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 17 Apr 2020 02:43:50 -0400
Cc: linux-kernel@vger.kernel.org, khazhy@google.com, song@kernel.org,
	dm-devel@redhat.com, kernel@collabora.com,
	Gabriel Krisman Bertazi <krisman@collabora.com>
Subject: [dm-devel] [PATCH 0/2] Historical Service Time Path Selector
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

Hello,

This small series implements a new path selector that leverages
historical path IO time in order to estimate future path performance.
Implementation details can be found on Patch 2.

This selector yields better path distribution, considering the mean
deviation from the calculated optimal utilization, for small IO depths
when compared to the Service Time selector with fio benchmarks.  For
instance, on a multipath setup with 4 paths, where one path is 4 times
slower than the rest, issuing 500MB of randwrites, we have the following
path utilization rates:

      |    depth=1    |    depth=64   |       |
      |   ST  |   HST |   ST  |   HST |  Best |
|-----+-------+-------+-------+-------+-------|
| sda | 0.250 | 0.294 | 0.297 | 0.294 | 0.307 |
| sdb | 0.250 | 0.297 | 0.296 | 0.297 | 0.307 |
| sdc | 0.250 | 0.296 | 0.298 | 0.296 | 0.307 |
| sdd | 0.250 | 0.112 | 0.106 | 0.112 | 0.076 |

For small depths, HST is much quicker in detecting slow paths and has a
better selection than ST.  As the iodepth increases, ST gets close to
HST, which still behaves steadily.

The raw performance data for different depths types of IO can be found
at:

  <https://people.collabora.com/~krisman/GOO0012/hst-vs-st-bench.html>

This was tested primarily on a Google cloud SAN with real data and usage
patterns and with artificial benchmarks using fio.

Khazhismel Kumykov (2):
  md: Expose struct request to path selector
  md: Add Historical Service Time Path Selector

 drivers/md/Kconfig                      |  11 +
 drivers/md/Makefile                     |   1 +
 drivers/md/dm-historical-service-time.c | 561 ++++++++++++++++++++++++
 drivers/md/dm-mpath.c                   |  12 +-
 drivers/md/dm-path-selector.h           |   6 +
 5 files changed, 589 insertions(+), 2 deletions(-)
 create mode 100644 drivers/md/dm-historical-service-time.c

-- 
2.26.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

