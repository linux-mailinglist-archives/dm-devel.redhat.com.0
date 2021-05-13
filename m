Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id DF79437FC78
	for <lists+dm-devel@lfdr.de>; Thu, 13 May 2021 19:25:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1620926704;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=FW9ceXnFlKbLG8HvHOVTCGwWHBE3DThy0Qtm0iTEY1w=;
	b=Aq+YnawTAk8uPkk7MpY0nZ7XGCZZdGPceMsGAyNHjlPgkABC8+ex/XM9WfZLXpmfGpVJZX
	QzlAa0W03VQF2128CJmDuWyHMkJY181f1xasf9GISymEMB5luRmpUA+A09b+Hfcpn9QgXP
	i7vQgLg3hTHDSW/iM9l3hY/nd5RA37Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-181-OYWUrMzhOy6EP0fWXRJgag-1; Thu, 13 May 2021 13:24:13 -0400
X-MC-Unique: OYWUrMzhOy6EP0fWXRJgag-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E93B8501FA;
	Thu, 13 May 2021 17:23:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B51FF19704;
	Thu, 13 May 2021 17:23:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6A197180B464;
	Thu, 13 May 2021 17:23:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14DHNOmv005651 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 13 May 2021 13:23:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 25DAF4D730; Thu, 13 May 2021 17:23:24 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3DA9C5F9B8;
	Thu, 13 May 2021 17:23:18 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 14DHNGeO012067; 
	Thu, 13 May 2021 12:23:16 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 14DHNGVw012066;
	Thu, 13 May 2021 12:23:16 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Thu, 13 May 2021 12:23:09 -0500
Message-Id: <1620926595-12029-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v2 0/6] Memory issues found by coverity
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
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

This is collection of issues found by coverity. The first three patches
deal with ev_remove_path() removing the path, but returning failure,
causing a use-after-free error. The next two patches fix memory leaks.
The final patch cleans up the returns from ev_remove_path().

Changes from v1:
0001: changed comment based on Martin's suggestion
0004: moved location of atexit() call based on Martin's suggestion
0006: New patch, based on Martin's comments on patch 0003

Benjamin Marzinski (6):
  multipathd: don't fail to remove path once the map is removed
  multipathd: remove duplicate orphan_paths in flush_map
  multipathd: make ev_remove_path return success on path removal
  multipath: free vectors in configure
  kpartx: Don't leak memory when getblock returns NULL
  multipathd: use symbolic returns for ev_remove_path()

 kpartx/kpartx.c            |  2 ++
 libmultipath/structs_vec.c |  4 +--
 multipath/main.c           |  7 +++++-
 multipathd/cli_handlers.c  | 14 +++++++++--
 multipathd/main.c          | 51 ++++++++++++++++++++++----------------
 multipathd/main.h          |  9 +++++++
 6 files changed, 60 insertions(+), 27 deletions(-)

-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

