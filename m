Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id DEB342FAF94
	for <lists+dm-devel@lfdr.de>; Tue, 19 Jan 2021 05:46:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1611031599;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=IcmeeALM4b9b+2Z9sCtvmHqtCPIOnRLdi5XRoAJHwHk=;
	b=PftW24z+uOAdsc75usDi5orTgSn04RcJNltkHYCZb56n2QiD+RQDifBncCZ5NTBdUXvk3M
	zkoz3Nt6zJ6yT46cM+pdGlqGrkbuzolJsOwKYGRYRbgR4Q3TCF2PU7VmjyiJCSGEGDOxS4
	cBqHwDgofy9+dk3N+ZZS1HpAIzASclY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-424-lYTGqKeWOPKxsDqDQ2kWXQ-1; Mon, 18 Jan 2021 23:46:37 -0500
X-MC-Unique: lYTGqKeWOPKxsDqDQ2kWXQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3AC48107ACE6;
	Tue, 19 Jan 2021 04:46:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 684C3289BA;
	Tue, 19 Jan 2021 04:46:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 049644EA6C;
	Tue, 19 Jan 2021 04:46:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10J4k9Wf017560 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 18 Jan 2021 23:46:09 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 759249CA0; Tue, 19 Jan 2021 04:46:09 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 79B686F95D;
	Tue, 19 Jan 2021 04:46:06 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 10J4k45T018701; 
	Mon, 18 Jan 2021 22:46:05 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 10J4k4La018700;
	Mon, 18 Jan 2021 22:46:04 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Mon, 18 Jan 2021 22:46:03 -0600
Message-Id: <1611031564-18663-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v3 0/1] Multipath io_err_stat fixes
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

I found an ABBA deadlock in the io_err_stat marginal path code, and in
the process of fixing it, noticed a potential crash on shutdown. This
patchset addresses both of the issues.

Changes from v2:

0001: This is patch 0006 from v2. It is exactly the same code. But the
commit message now mentions that check_path() no longer switches paths
from delayed to pending.

Changes from v1:

0002: use cleanup_mutex instead of cleanup_unlock as suggested by
Martin

0003: add pthread_testcancel and use cleanup_mutex instead of
cleanup_unlock as suggested by Martin. Also, make tmp_pathvec a constant
pointer, since it should always equal _pathvec.

0004-0006 are new patches to deal with io_err_stat issues from Martin's
review


Benjamin Marzinski (1):
  multipathd: cleanup logging for marginal paths

 libmultipath/io_err_stat.c |  7 +++----
 multipathd/main.c          | 25 ++++++++++++++-----------
 2 files changed, 17 insertions(+), 15 deletions(-)

-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

