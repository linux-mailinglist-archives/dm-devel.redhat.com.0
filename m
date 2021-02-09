Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7AC903147FD
	for <lists+dm-devel@lfdr.de>; Tue,  9 Feb 2021 06:19:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1612847996;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=QPXqzKYAV2DF+rrzP7aT67oNX/3ow0Zm3vzjSJCdwIs=;
	b=JObyLCxnywoAILfZrUUTsfe/f9Kne3nND0WHjMLC5J3uErXLSMxy+mjF/ynJ07wL7Rogze
	faKrR/6ooEIr6rnZfDo1YVFeOnq5b0k5LUjPNm9qCiMtXEkPtu28KDVcdCwTNTdao10wPD
	F8R/QEkDSO9Q6aX+hBCa4VgcEAYz0ec=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-588-X30NCOJPMKGIPv3s6JWLgw-1; Tue, 09 Feb 2021 00:19:54 -0500
X-MC-Unique: X30NCOJPMKGIPv3s6JWLgw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 81EE4100A267;
	Tue,  9 Feb 2021 05:19:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 766EE19C71;
	Tue,  9 Feb 2021 05:19:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6081D4E58E;
	Tue,  9 Feb 2021 05:19:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1195JWFF029768 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 9 Feb 2021 00:19:32 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C85D519D9C; Tue,  9 Feb 2021 05:19:32 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D851219C71;
	Tue,  9 Feb 2021 05:19:29 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 1195JSHI008851; 
	Mon, 8 Feb 2021 23:19:28 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 1195JRnv008850;
	Mon, 8 Feb 2021 23:19:27 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Mon,  8 Feb 2021 23:19:25 -0600
Message-Id: <1612847967-8813-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Chongyun Wu <wucy11@chinatelecom.cn>, Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 0/2] Handle remapped LUNs better
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

This patchset adds a new config option, recheck_wwid_time, to help deal
with devices getting remapped. It's based on Chongyun's patch, but
instead of always checking if the LUN is remapped, users can set how
many seconds the LUN must be down before it gets rechecked, or disable
this checking entirely, since it is simply there to keep users from
shooting themselves in the foot.  Setting the value to 0 makes this
always recheck when a path is restored.

Unlike Chongyun's patch, it doesn't issue a remove uevent. I'm not
actually sure what the purpose of the remove uevent was, since it
doesn't cause the path to be removed, and multipath already removed it.
Instead, it works like Martin's uev_update_path code, and re-adds the
path after it removes it.  There is one issue I noticed here.  While
udev will update the WWID in the database when it gets a new uevent,
sysfs will still record the original WWID, so if multipathd ever fails
back to using sysfs for the WWID, it will see the wrong value.

Another possible check that I didn't include is this patchset is to have
multipath look at the LUN number whenever it adds a new path to a
multipath device. If the LUN number doesn't match the existing LUN
numbers, all the old paths should have their wwids checked as soon as
possible (immediately, if the path is up), since mismatching LUN numbers
is a red flag that something has gone wrong.

Benjamin Marzinski (2):
  libmultipath: fix use-after-free in uev_add_path
  multipathd: add recheck_wwid_time option to verify the path wwid

 libmultipath/config.c             |   1 +
 libmultipath/config.h             |   1 +
 libmultipath/configure.c          |   4 +-
 libmultipath/configure.h          |   2 +
 libmultipath/defaults.h           |   1 +
 libmultipath/dict.c               |  36 ++++++++++
 libmultipath/libmultipath.version |   6 ++
 libmultipath/structs.h            |  10 +++
 multipath/multipath.conf.5        |  18 +++++
 multipathd/cli_handlers.c         |   9 +++
 multipathd/main.c                 | 107 +++++++++++++++++++++++++++---
 multipathd/main.h                 |   2 +
 12 files changed, 187 insertions(+), 10 deletions(-)

-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

