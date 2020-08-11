Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id CE82F242237
	for <lists+dm-devel@lfdr.de>; Wed, 12 Aug 2020 00:01:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1597183259;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=zFovCB7VEwUnzQo52IcpOJen7q0w3ybpUL/PqsobYEI=;
	b=I2YTdyHfxM0E/RPybHalbuBP4cjJvakM+qajcZPnfN8TVVSgF4/fUiEcvDlPdCdhrbkiYl
	cV1UQKQLxUqiAtbW101iwo/vkvMZwqG+CKOLoHNMw6swHV1e6AINdqB78SRV3Y9trz92uq
	+ISIPdSJ7hhOyGeY7utqyNeR0F1dHv4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-76-Dk92YySJN7219SWP8eUOiw-1; Tue, 11 Aug 2020 18:00:57 -0400
X-MC-Unique: Dk92YySJN7219SWP8eUOiw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A3FDA80046F;
	Tue, 11 Aug 2020 22:00:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 82A0869335;
	Tue, 11 Aug 2020 22:00:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3BF3697529;
	Tue, 11 Aug 2020 22:00:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07BLwnMp009101 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 11 Aug 2020 17:58:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2D95110027A6; Tue, 11 Aug 2020 21:58:49 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 26E2F1002395;
	Tue, 11 Aug 2020 21:58:45 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 07BLwie3015835; 
	Tue, 11 Aug 2020 16:58:44 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 07BLwhro015834;
	Tue, 11 Aug 2020 16:58:43 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Tue, 11 Aug 2020 16:58:35 -0500
Message-Id: <1597183123-15797-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v2 0/8] multipath cleanups
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

Patches 0003 & 0004 fix an issue that I've seen with paths whose checker
takes too long when multipathd is starting up and creating devices.

The others are minor build fixes or small cleanups to my previous
patchset.

Changes in v2:
- patch 0003 no longer refactors count_active_paths(), as suggested
  by Martin Wilck
- Added patches 0007 & 0008, which are both unrelated minor changes.

Benjamin Marzinski (8):
  Makefile.inc: trim extra information from systemd version
  kpartx: fix -Wsign-compare error
  libmultipath: refactor path counting
  libmultipath: count pending paths as active on loads
  libmultipath: deal with flushing no maps
  multipath: deal with delegation failures correctly
  multipathd: unset mpp->hwe when removing map
  multipathd: log reason for calling domap()

 Makefile.inc                    |  2 +-
 kpartx/kpartx.c                 |  2 +-
 libmpathpersist/mpath_persist.c |  4 ++--
 libmultipath/devmapper.c        |  5 +++--
 libmultipath/structs.c          | 38 +++++++++++++++++++++------------
 libmultipath/structs.h          |  2 +-
 libmultipath/structs_vec.c      |  1 +
 multipath/main.c                |  9 +++++---
 multipathd/main.c               | 14 ++++++++----
 9 files changed, 49 insertions(+), 28 deletions(-)

-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

