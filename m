Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 13FA13839E8
	for <lists+dm-devel@lfdr.de>; Mon, 17 May 2021 18:30:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1621269047;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=gC0BJ2o/oiWERdhavuAvfOZoYYHeh2b0ikxySWEVOaI=;
	b=JoPTD3xNXQTOMnAqUrgypp1ap2g3J1+TFxTiOMXqr02vVmBqbLzRCDKqLEyvyo2g/VysYA
	sUGwZPDI574VtSGUwyGrgvaPGm7O2zJrRtdzMJ97DJUCzlwjMjsRVN95pscIt8aIozHeEN
	GYflcHB6wGUc+0UIIJ3TChtZcDvSqkY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-370-Y3XuuhZvP3afFdYjJf1L6Q-1; Mon, 17 May 2021 12:30:38 -0400
X-MC-Unique: Y3XuuhZvP3afFdYjJf1L6Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4C380107ACE8;
	Mon, 17 May 2021 16:30:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D1735946D;
	Mon, 17 May 2021 16:30:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3B9451800BB4;
	Mon, 17 May 2021 16:30:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14HGU8OW004674 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 17 May 2021 12:30:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0FEAD5D767; Mon, 17 May 2021 16:30:08 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C9BC05D703;
	Mon, 17 May 2021 16:30:02 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 14HGU0Vt006318; 
	Mon, 17 May 2021 11:30:00 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 14HGU0uv006317;
	Mon, 17 May 2021 11:30:00 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Mon, 17 May 2021 11:29:53 -0500
Message-Id: <1621268999-6280-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v4 0/6] Memory issues found by coverity
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This is collection of issues found by coverity. The first three patches
deal with ev_remove_path() removing the path, but returning failure,
causing a use-after-free error. The next two patches fix memory leaks.
The final patch removes an unnecessary call to rescan_paths() from
uev_update_path()

Changes from v3:
0003: Handle NULL returns from strdup(). Suggested by Martin Wilck

Changes from v2:
0003: Combined with v2 patch 0006, with changes changes in comments,
      how the return codes are defined, and how they are handled, based
      on Martin's suggestions
0006: New patch based on Martin's suggestions about wwid change handling
      in uev_update_path().

Changes from v1:
0001: changed comment based on Martin's suggestion
0004: moved location of atexit() call based on Martin's suggestion
0006: New patch, based on Martin's comments on patch 0003

Benjamin Marzinski (6):
  multipathd: don't fail to remove path once the map is removed
  multipathd: remove duplicate orphan_paths in flush_map
  multipathd: fix ev_remove_path return code handling
  multipath: free vectors in configure
  kpartx: Don't leak memory when getblock returns NULL
  multipathd: don't rescan_path on wwid change in uev_update_path

 kpartx/kpartx.c            |  2 ++
 libmultipath/structs_vec.c |  4 +--
 multipath/main.c           |  7 ++++-
 multipathd/cli_handlers.c  | 24 ++++++++++++++--
 multipathd/main.c          | 56 ++++++++++++++++++++------------------
 multipathd/main.h          | 14 ++++++++++
 6 files changed, 75 insertions(+), 32 deletions(-)

-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

