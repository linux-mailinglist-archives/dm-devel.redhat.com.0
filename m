Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6305858BD
	for <lists+dm-devel@lfdr.de>; Sat, 30 Jul 2022 07:13:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1659158025;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=dMgiLCvi2efwmnXf8J4IRJZmf6yO6mxUuRav58JfCfc=;
	b=OCDa4806ZwIF0oc2BFLOTin5RIMM6Xk89KinQnHpDjxqmCOFWL6SnJi8TwYXBA2jOg5Km9
	GknQlKH4GB3ztovLsgdiPBQzyo1GyxzaHjXbjswb4BPYVYNTw1bguPwRbkgLr6d3Lel/qN
	Kn159kDTHN941JhRlJMISdxp18UEPsE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-644-g5NfKiMVN1-M6SjfZxk0bA-1; Sat, 30 Jul 2022 01:13:40 -0400
X-MC-Unique: g5NfKiMVN1-M6SjfZxk0bA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CFBBC2811376;
	Sat, 30 Jul 2022 05:13:33 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3BA5540CF8E7;
	Sat, 30 Jul 2022 05:13:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 33ECC194D6E4;
	Sat, 30 Jul 2022 05:13:04 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 3EB37194D063
 for <dm-devel@listman.corp.redhat.com>; Sat, 30 Jul 2022 05:13:03 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 12CAF2166B2B; Sat, 30 Jul 2022 05:13:03 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DB9B82166B26;
 Sat, 30 Jul 2022 05:13:02 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
 by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 26U5D1De024117;
 Sat, 30 Jul 2022 00:13:01 -0500
Received: (from bmarzins@localhost)
 by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 26U5D0sp024116;
 Sat, 30 Jul 2022 00:13:00 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Sat, 30 Jul 2022 00:12:54 -0500
Message-Id: <1659157980-24079-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Subject: [dm-devel] [RFC PATCH 0/6] allowing path checking to be interrupted.
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: Wu Guanghao <wuguanghao3@huawei.com>,
 device-mapper development <dm-devel@redhat.com>,
 Martin Wilck <Martin.Wilck@suse.com>
MIME-Version: 1.0
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When there are a huge number of paths (> 10000) The about of time that
the checkerloop can hold the vecs lock for while checking the paths
can get to be large enough that it starves other vecs lock users.  If
path checking takes long enough, it's possible that uxlsnr threads will
never run. To deal with this, this patchset makes it possible to drop
the vecs lock while checking the paths, and then reacquire it and
continue with the next path to check.

My choice of only checking if there are waiters every 128 paths checked
and only interrupting if path checking has taken more than a second are
arbitrary. I didn't want to slow down path checking in the common case
where this isn't an issue, and I wanted to avoid path checking getting
starved by other vecs->lock users. Having the checkerloop wait for 10000
nsec was based on my own testing with a setup using 4K multipath devies
with 4 paths each. This was almost always long enough for the uevent or
uxlsnr client to grab the vecs lock, but I'm not sure how dependent this
is on details of the system. For instance with my setup in never took
more than 20 seconds to check the paths. and usually, a looping through
all the paths took well under 10 seconds, most often under 5. I would
only occasionally run into situations where a uxlsnr client would time
out.

Benjamin Marzinski (6):
  multipathd: Use regular pthread_mutex_t for waiter_lock
  multipathd: track waiters for mutex_lock
  multipathd: Occasionally allow waiters to interrupt checking paths
  multipathd: allow uxlsnr clients to interrupt checking paths
  multipathd: fix uxlsnr timeout
  multipathd: Don't check if timespec.tv_sec is zero

 libmultipath/lock.h    |  16 +++++
 libmultipath/structs.h |   1 +
 multipathd/main.c      | 144 +++++++++++++++++++++++++----------------
 multipathd/uxlsnr.c    |  23 +++++--
 multipathd/uxlsnr.h    |   1 +
 multipathd/waiter.c    |  14 ++--
 6 files changed, 132 insertions(+), 67 deletions(-)

-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

