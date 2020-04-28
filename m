Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 78D0F1BBAD9
	for <lists+dm-devel@lfdr.de>; Tue, 28 Apr 2020 12:09:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588068597;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=84KicTmLte430/rErQrYrxWzJzI1CyrJOzfw569tM/E=;
	b=Ov6u7HxF8omLd71EalbtYNudfgEU/A0ws8V8/nGcfC5IOjM67u1aw+LR75VZY4zIvMuBt5
	DvLVSeMjm1ylRJv2tuJF1h2v5M+fOCxP+RwVxDHHMuyqPeUtcaVN06NkhRvIt8yGWptL0/
	UJjJKMkra1bYvnd3D8S4TWL+8s8I5sM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-182-CVLyt1fHMPKMEF5nvlF_-w-1; Tue, 28 Apr 2020 06:09:51 -0400
X-MC-Unique: CVLyt1fHMPKMEF5nvlF_-w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B2C31108BD14;
	Tue, 28 Apr 2020 10:09:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 811215D9E5;
	Tue, 28 Apr 2020 10:09:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3FFFB4CAA7;
	Tue, 28 Apr 2020 10:09:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03S0q6jA011299 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 27 Apr 2020 20:52:06 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 905A9AFD46; Tue, 28 Apr 2020 00:52:06 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8C19E6379C
	for <dm-devel@redhat.com>; Tue, 28 Apr 2020 00:52:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 77E07188B2A2
	for <dm-devel@redhat.com>; Tue, 28 Apr 2020 00:52:06 +0000 (UTC)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
	[46.235.227.227]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-457-1p_wtNVSMdmAYC7Zbl0neQ-1; Mon, 27 Apr 2020 20:51:53 -0400
X-MC-Unique: 1p_wtNVSMdmAYC7Zbl0neQ-1
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: krisman) with ESMTPSA id B6DA02A0CF2
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: agk@redhat.com, snitzer@redhat.com
Date: Mon, 27 Apr 2020 20:51:43 -0400
Message-Id: <20200428005146.242231-1-krisman@collabora.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03S0q6jA011299
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 28 Apr 2020 06:09:31 -0400
Cc: dm-devel@redhat.com, kernel@collabora.com,
	Gabriel Krisman Bertazi <krisman@collabora.com>, khazhy@google.com
Subject: [dm-devel] [PATCH v2 0/3] Historical Service Time Path Selector
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

Hi Mike,

Please find an updated version of HST integrating the change you
requested to also support BIO based multipath.  I hope you don't mind me
folding the function you implemented into patch 2.  If you prefer, I can
integrate a patch you provide into the series.

One interesting data point is that the selection performance on
BIO-based is worse when compared to request-based.  I tested a bit and I
believe the reason is that the paths are more sticky because the bucket
is too large, and it takes longer for HST to detect differences.  By
changing the bucket_size indirectly through the bucket_shift, the
bio-based multipath performance improved, but I'm not sure this is a
knob we want to expose to users.  For now, please consider the patches
below, for review.

By the way, the exercise to support bio-based mpath uncovered the mpath
initialization bug that I fixed in the previous patch I sent today, so
it was worth it.

Gabriel Krisman Bertazi (2):
  md: multipath: Encapsulate parameters passed to selectors
  md: multipath: Pass io_start_time to the path selector

Khazhismel Kumykov (1):
  md: Add Historical Service Time Path Selector

 drivers/md/Kconfig                      |  11 +
 drivers/md/Makefile                     |   1 +
 drivers/md/dm-historical-service-time.c | 561 ++++++++++++++++++++++++
 drivers/md/dm-mpath.c                   |  30 +-
 drivers/md/dm-path-selector.h           |   9 +-
 drivers/md/dm-queue-length.c            |   4 +-
 drivers/md/dm-service-time.c            |   8 +-
 drivers/md/dm.c                         |  10 +
 include/linux/device-mapper.h           |   2 +
 9 files changed, 623 insertions(+), 13 deletions(-)
 create mode 100644 drivers/md/dm-historical-service-time.c

-- 
2.26.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

