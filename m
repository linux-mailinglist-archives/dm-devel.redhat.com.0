Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 49991767604
	for <lists+dm-devel@lfdr.de>; Fri, 28 Jul 2023 21:06:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690571186;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=N8Sff32ng12etZxNQPEOkhzb4vCpqxjV1Ym9OcgjZJk=;
	b=BMiYL3LK13yfjXUTlCOYt8nO1KoW9JGCMbObtMjlbFm3oUaZZG76CRDn6B2lTICxWg1Hxm
	HN+PHgcA/GQ8xQ9/qI4QLxl43JP7rCSgB4Iyc2al4eJiPInMkjWwTP8mFOn2QzZwUqa3A1
	Z8lVyxdRnQ25+8II+1FGKNjt2C7faJY=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-640-Qca_P5EpNI61bcfQx8A0Pw-1; Fri, 28 Jul 2023 15:06:23 -0400
X-MC-Unique: Qca_P5EpNI61bcfQx8A0Pw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 086A0299E764;
	Fri, 28 Jul 2023 19:06:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 122FF40C2063;
	Fri, 28 Jul 2023 19:06:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2938D19452CF;
	Fri, 28 Jul 2023 19:06:06 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9843C194658C
 for <dm-devel@listman.corp.redhat.com>; Fri, 28 Jul 2023 19:06:04 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1F05C40C206F; Fri, 28 Jul 2023 19:06:04 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DFB6F40C2063;
 Fri, 28 Jul 2023 19:06:03 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
 by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 36SJ5wU4008321;
 Fri, 28 Jul 2023 14:05:58 -0500
Received: (from bmarzins@localhost)
 by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 36SJ5uWo008320;
 Fri, 28 Jul 2023 14:05:56 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Fri, 28 Jul 2023 14:05:51 -0500
Message-Id: <1690571155-8283-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: [dm-devel] [RFC PATCH 0/4] Make prio timeouts work like checkers
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patchset changes how prioritizers set their timeouts, to make them
match how the checker functions work, and also cleans up some minor
timeout issues. I did this to make out timeouts consistent, but if
someone has a good reason to object to that, I don't feel
strongly that it's necessary, and I can resend just the bugfixes.

Benjamin Marzinski (4):
  libmultipath: don't bother to reset default timeout value
  libmultipath: make prioritizer timeouts work like checker timeouts
  libmultipath: fix timeouts for detect_alua()
  libmultipath: fix timeouts for path_latency prioritizer

 libmultipath/discovery.c                 | 13 +++++++------
 libmultipath/prio.c                      | 14 +++++++++-----
 libmultipath/prio.h                      |  3 +--
 libmultipath/prioritizers/alua.c         |  2 +-
 libmultipath/prioritizers/alua_rtpg.c    |  5 ++---
 libmultipath/prioritizers/emc.c          |  5 +++--
 libmultipath/prioritizers/hds.c          |  4 ++--
 libmultipath/prioritizers/hp_sw.c        |  4 ++--
 libmultipath/prioritizers/ontap.c        |  7 +++----
 libmultipath/prioritizers/path_latency.c |  5 +++--
 libmultipath/prioritizers/rdac.c         |  4 ++--
 11 files changed, 35 insertions(+), 31 deletions(-)

-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

