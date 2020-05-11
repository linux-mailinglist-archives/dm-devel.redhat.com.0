Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 670371CE0C6
	for <lists+dm-devel@lfdr.de>; Mon, 11 May 2020 18:40:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589215199;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=A16N+1hAqt+Af6FkZlmVqo5rf4isGpO+6svI8bemrQQ=;
	b=Pph3eYVZhn64EVJAjDw58KB7bdTnX0hrPXLoSud51SMXoKDgRTbRHEbu0QQ03bz860gr2Y
	F5vGL7259uNZdod55M7Ue5hGTwQ+4WFZ09XgBH8K7oJNzFfdg60lgWpIdvG9pSqtdT0xrU
	8SxfR/BctIucXKbjUw0RZHkzn9ZT/dk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-36-nweDCo9EPg2rtbQrW8kW9w-1; Mon, 11 May 2020 12:39:56 -0400
X-MC-Unique: nweDCo9EPg2rtbQrW8kW9w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E544C107ACF3;
	Mon, 11 May 2020 16:39:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 92AAE1053B1B;
	Mon, 11 May 2020 16:39:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 519FA1809554;
	Mon, 11 May 2020 16:39:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04BGdOFZ015513 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 11 May 2020 12:39:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5D8392156A3B; Mon, 11 May 2020 16:39:24 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 59EAE2156A22
	for <dm-devel@redhat.com>; Mon, 11 May 2020 16:39:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6685F8007AC
	for <dm-devel@redhat.com>; Mon, 11 May 2020 16:39:22 +0000 (UTC)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
	[46.235.227.227]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-345-ENZrl-jhMY6k7WTrQodSnA-1; Mon, 11 May 2020 12:39:17 -0400
X-MC-Unique: ENZrl-jhMY6k7WTrQodSnA-1
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: krisman) with ESMTPSA id 5BD812A07F2
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: agk@redhat.com, snitzer@redhat.com
Date: Mon, 11 May 2020 12:39:08 -0400
Message-Id: <20200511163910.3778467-1-krisman@collabora.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04BGdOFZ015513
X-loop: dm-devel@redhat.com
Cc: breeves@redhat.com, linux-kernel@vger.kernel.org, khazhy@google.com,
	song@kernel.org, dm-devel@redhat.com, mpatocka@redhat.com,
	kernel@collabora.com, Gabriel Krisman Bertazi <krisman@collabora.com>
Subject: [dm-devel] [PATCH v4 0/2] Historical Service Time Path Selector
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

Hi,

This fourth version of HST applies the suggestion from Mikulas Patocka
to do the ktime_get_ns inside the mpath map_bio instead of generic
device-mapper code. This means that struct dm_mpath_io gained another
64bit field.  For the request-based case, we continue to use the block
layer start time information.

With this modification, I was able obtain similar performance on  BIO
to request-based multipath with HST on the benchmarks shared in v1.

v3: https://www.redhat.com/archives/dm-devel/2020-April/msg00308.html
v2: https://www.redhat.com/archives/dm-devel/2020-April/msg00270.html
v1: https://www.redhat.com/archives/dm-devel/2020-April/msg00176.html

Gabriel Krisman Bertazi (1):
  md: mpath: Pass IO start time to path selector

Khazhismel Kumykov (1):
  md: mpath: Add Historical Service Time Path Selector

 drivers/md/Kconfig                      |  11 +
 drivers/md/Makefile                     |   1 +
 drivers/md/dm-historical-service-time.c | 561 ++++++++++++++++++++++++
 drivers/md/dm-mpath.c                   |  12 +-
 drivers/md/dm-path-selector.h           |   2 +-
 drivers/md/dm-queue-length.c            |   2 +-
 drivers/md/dm-service-time.c            |   2 +-
 7 files changed, 585 insertions(+), 6 deletions(-)
 create mode 100644 drivers/md/dm-historical-service-time.c

-- 
2.26.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

