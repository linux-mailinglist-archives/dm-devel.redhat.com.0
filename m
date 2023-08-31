Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C676E78F4ED
	for <lists+dm-devel@lfdr.de>; Thu, 31 Aug 2023 23:58:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693519085;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=BS1crJeHCcSIIIe6KA9/o5yxK5Jsz9S9pbUvcIEOY+8=;
	b=gvQCvYnc3fLIa+P5c/rKxmFTFgWwLz0/Gg695en0DIiJ4iPb9UWKLXOYS52wti7sestfZc
	PK0z5CmPXkZ/Y548AG9/OCLgHxpPCzHTuWb1D0EOp0GNZov10SRNOpeaaEcMlU9jqrbJym
	qOkEK2EgeCs/HjjRPzSVLBnAWdgkYqY=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-52-iHapLl8IOMmRtKdbmhCgcQ-1; Thu, 31 Aug 2023 17:57:35 -0400
X-MC-Unique: iHapLl8IOMmRtKdbmhCgcQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 192053C0ED5D;
	Thu, 31 Aug 2023 21:57:33 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AE3082166B25;
	Thu, 31 Aug 2023 21:57:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2A9EB19465B9;
	Thu, 31 Aug 2023 21:57:23 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 05EFF1946587
 for <dm-devel@listman.corp.redhat.com>; Thu, 31 Aug 2023 21:57:22 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D82CA112131B; Thu, 31 Aug 2023 21:57:21 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4BD921121315;
 Thu, 31 Aug 2023 21:57:21 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
 by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 37VLvDHR030151;
 Thu, 31 Aug 2023 16:57:13 -0500
Received: (from bmarzins@localhost)
 by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 37VLvCwX030150;
 Thu, 31 Aug 2023 16:57:12 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Thu, 31 Aug 2023 16:57:08 -0500
Message-Id: <1693519032-30111-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: [dm-devel] [PATCH v2 0/4] Make prio timeouts work like checkers
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
Cc: device-mapper development <dm-devel@redhat.com>,
 Martin Wilck <Martin.Wilck@suse.com>
MIME-Version: 1.0
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patchset changes how prioritizers set their timeouts, to make them
match how the checker functions work, and also cleans up some minor
timeout issues.

This patchset has been entirely reworked based on suggestions from
Martin Wilck: Patch [1/4] no longer rechecks the timeout values at all
in the checker loop. Patch [2/4] makes the checker_timeout a path
variable, following Martin's suggestion. Patch [3/4] roughly corresponds
to patches 2, 3 & 4 of the previous patchset, except that it uses the
path's checker_timeout variable to cleanup a number of function calls,
and incidentally fixes the issues in detect_prio() and the path_latency
prioritizer. Patch [4/4] is new. It makes the datacore checker respect
the checker timeout as well, if no timeout is specified in the prio
args.

Benjamin Marzinski (4):
  libmultipath: don't bother to recheck timeout
  libmultipath: make checker_timeout a path variable
  libmultipath: make prioritizer timeouts work like checker timeouts
  libmultipath: standardize datacore prioritizer timeouts

 libmultipath/discovery.c                 | 21 ++++----------
 libmultipath/libmultipath.version        |  4 +--
 libmultipath/prio.c                      | 21 ++++++++------
 libmultipath/prio.h                      |  9 +++---
 libmultipath/prioritizers/alua.c         | 12 ++++----
 libmultipath/prioritizers/alua_rtpg.c    | 31 +++++++++++----------
 libmultipath/prioritizers/alua_rtpg.h    |  7 ++---
 libmultipath/prioritizers/ana.c          |  3 +-
 libmultipath/prioritizers/const.c        |  3 +-
 libmultipath/prioritizers/datacore.c     | 19 +++++--------
 libmultipath/prioritizers/emc.c          |  9 +++---
 libmultipath/prioritizers/hds.c          |  9 +++---
 libmultipath/prioritizers/hp_sw.c        |  9 +++---
 libmultipath/prioritizers/iet.c          |  3 +-
 libmultipath/prioritizers/ontap.c        | 20 ++++++--------
 libmultipath/prioritizers/path_latency.c |  9 +++---
 libmultipath/prioritizers/random.c       |  3 +-
 libmultipath/prioritizers/rdac.c         |  9 +++---
 libmultipath/prioritizers/sysfs.c        |  3 +-
 libmultipath/prioritizers/weightedpath.c |  3 +-
 libmultipath/propsel.c                   | 35 +++++++++++++++---------
 libmultipath/structs.c                   |  1 +
 libmultipath/structs.h                   |  1 +
 23 files changed, 117 insertions(+), 127 deletions(-)

-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

