Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 381A4213086
	for <lists+dm-devel@lfdr.de>; Fri,  3 Jul 2020 02:40:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593736809;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=H8RcgeiKJxT+J/n7OcfoNiVSIjhWIwbwx1h62ImTrIY=;
	b=SxA/eXVHsgvNJXV9632hmm2zAYPSwFuntZugRs38yJOnuoiH3icanT76q7Vk2mfyjg9L5S
	RMq2OrjgBD+vIelvBw4xgtRTps2wSkN2VBkFgvxffmuDybgYw7/6GSHAKXtojRF9rBAOnM
	QFm8siwJTgm7XqRM2qI4FKKeR41QcG4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-142-kaFk3hYsPfuBmqiHGwFR5g-1; Thu, 02 Jul 2020 20:38:53 -0400
X-MC-Unique: kaFk3hYsPfuBmqiHGwFR5g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 42FA2800C60;
	Fri,  3 Jul 2020 00:38:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 290105C1C5;
	Fri,  3 Jul 2020 00:38:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1BB9E6C9C6;
	Fri,  3 Jul 2020 00:38:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0630cWLM019277 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 2 Jul 2020 20:38:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 77CD875550; Fri,  3 Jul 2020 00:38:32 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ACAD57554F;
	Fri,  3 Jul 2020 00:38:29 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 0630cSmT014254; 
	Thu, 2 Jul 2020 19:38:28 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 0630cSVI014253;
	Thu, 2 Jul 2020 19:38:28 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Thu,  2 Jul 2020 19:38:23 -0500
Message-Id: <1593736707-14216-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v2 0/4] misc patches
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This is a small collection of individual bug fix patches that apply on
top of my previous patch set.

Changes from v1:

0001:	Going with Martin's strtoul() method instead

0002:	Now getpagesize() is only called once, and size_p is only set if
	posix_memalign is successful, as suggested by Martin.
	

Benjamin Marzinski (4):
  libmultipath: fix sysfs dev_loss_tmo parsing
  kpartx: read devices with direct IO
  kpartx: handle alternate bsd disklabel location
  libmultipath: fix checker detection for nvme devices

 kpartx/bsd.c             | 16 ++++++++++--
 kpartx/dasd.c            |  7 ++---
 kpartx/gpt.c             | 22 +++++++---------
 kpartx/kpartx.c          | 56 ++++++++++++++++++++++++++++++++--------
 kpartx/kpartx.h          |  2 ++
 libmultipath/discovery.c | 12 ++++++---
 libmultipath/propsel.c   |  4 ++-
 7 files changed, 87 insertions(+), 32 deletions(-)

-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

