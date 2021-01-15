Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 3990D2F707A
	for <lists+dm-devel@lfdr.de>; Fri, 15 Jan 2021 03:21:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1610677266;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=CVlZtWA3tbiDiPCFdVdkqZe1RzONxx2ByKHH42MzWIM=;
	b=af/m7dxWU2Mxqwm6E8AWWgnC+UwPIHM0DLIXLmPY9H1f01CjlekWkJsBb47tmwiKTkIYV3
	WnMhxbN1iEtxfX2gLD32yIowXCqks30g+qNPnx9QFE36NpBqZDyc3m0jpraYwEiAUlrCMS
	Nni/ndKZ2IZo9/IKth8b7F0g1gYzQ00=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-327-s4AWHk2NOFC63_AIDv0VRA-1; Thu, 14 Jan 2021 21:21:03 -0500
X-MC-Unique: s4AWHk2NOFC63_AIDv0VRA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A90891005D75;
	Fri, 15 Jan 2021 02:20:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B2295D742;
	Fri, 15 Jan 2021 02:20:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 804F34BB7B;
	Fri, 15 Jan 2021 02:20:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10F2KXIj030965 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 14 Jan 2021 21:20:33 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 316B360C6F; Fri, 15 Jan 2021 02:20:33 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 09C8A60C6B;
	Fri, 15 Jan 2021 02:20:29 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 10F2KSdC023588; 
	Thu, 14 Jan 2021 20:20:28 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 10F2KSOi023587;
	Thu, 14 Jan 2021 20:20:28 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Thu, 14 Jan 2021 20:20:21 -0600
Message-Id: <1610677227-23550-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v2 0/6] Multipath io_err_stat fixes
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
MIME-Version: 1.0
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

I found an ABBA deadlock in the io_err_stat marginal path code, and in
the process of fixing it, noticed a potential crash on shutdown. This
patchset addresses both of the issues.

Changes from v1:

0002: use cleanup_mutex instead of cleanup_unlock as suggested by
Martin

0003: add pthread_testcancel and use cleanup_mutex instead of
cleanup_unlock as suggested by Martin. Also, make tmp_pathvec a constant
pointer, since it should always equal _pathvec.

0004-0006 are new patches to deal with io_err_stat issues from Martin's
review

Benjamin Marzinski (6):
  libmultipath: make find_err_path_by_dev() static
  multipathd: avoid io_err_stat crash during shutdown
  multipathd: avoid io_err_stat ABBA deadlock
  multipathd: use get_monotonic_time() in io_err_stat code
  multipathd: combine free_io_err_stat_path and destroy_directio_ctx
  multipathd: cleanup logging for marginal paths

 libmultipath/io_err_stat.c | 216 ++++++++++++++++---------------------
 multipathd/main.c          |  25 +++--
 2 files changed, 105 insertions(+), 136 deletions(-)

-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

