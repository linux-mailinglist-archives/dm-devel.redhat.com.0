Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 5459F21163A
	for <lists+dm-devel@lfdr.de>; Thu,  2 Jul 2020 00:44:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593643444;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=8t4dzOdoqadq1BOOTSgrZFlUkPCPJKZw2uF5R6l82jY=;
	b=P5dQdoUHEI8GDxVilcIuZIYMoov/5mrTnTYBwAqHiM38m4JDnSyGsaFmNXSmaytoxpVBpY
	dOdpK+obuXzFu/PBB8AEKk9vuwSXlZhsSI973FlfcWGzNW3ksTKghHvGk9AyCZi8st+oaF
	gYOBOwaparuiFq/VjXFRRUlPkaSxmeE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-367-hhADcLVSNfassQRXcZlMHQ-1; Wed, 01 Jul 2020 18:42:56 -0400
X-MC-Unique: hhADcLVSNfassQRXcZlMHQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C05997BAC;
	Wed,  1 Jul 2020 22:42:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7790F73FC2;
	Wed,  1 Jul 2020 22:42:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E28891809542;
	Wed,  1 Jul 2020 22:42:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 061Mdfkw020002 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 1 Jul 2020 18:39:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 309E13829; Wed,  1 Jul 2020 22:39:41 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 50D2B60BE1;
	Wed,  1 Jul 2020 22:39:38 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 061Mdavw006244; 
	Wed, 1 Jul 2020 17:39:37 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 061Mda4R006243;
	Wed, 1 Jul 2020 17:39:36 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Wed,  1 Jul 2020 17:39:32 -0500
Message-Id: <1593643176-6206-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 0/4] misc patches
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

This is a small collection of individual bug fix patches that apply on
top of my previous patch set.

Benjamin Marzinski (4):
  libmultipath: fix sysfs dev_loss_tmo parsing
  kpartx: read devices with direct IO
  kpartx: handle alternate bsd disklabel location
  libmultipath: fix checker detection for nvme devices

 kpartx/bsd.c             | 16 ++++++++++++--
 kpartx/dasd.c            |  7 +++---
 kpartx/gpt.c             | 22 +++++++++----------
 kpartx/kpartx.c          | 46 ++++++++++++++++++++++++++++++----------
 kpartx/kpartx.h          |  2 ++
 libmultipath/discovery.c | 15 +++++++++----
 libmultipath/propsel.c   |  4 +++-
 7 files changed, 79 insertions(+), 33 deletions(-)

-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

