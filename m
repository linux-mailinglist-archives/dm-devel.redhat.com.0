Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C26345517D
	for <lists+dm-devel@lfdr.de>; Thu, 18 Nov 2021 01:09:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1637194144;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=wsvgqd1l+KUrFz4bFc9nlh1O+LSS4vhzoObcUYoEOmE=;
	b=bdxZFGB+eflKbs0Fh50c9nI77Hd8M7WNqqrl2A5ZLF3qq97nOLmU1xPsaLhW37LHhVIsCA
	E30u90zcRDMpeNKbmtNKu9hRSeztK2lgez5dngCSFeTJ52kbMMw+4X20CAw5mAbuHmCtog
	ZHvG0RNLVpSLpb8nlx03n3MJ5B4882E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-i1IH8sMROGq1TPBdRcDW3A-1; Wed, 17 Nov 2021 19:08:11 -0500
X-MC-Unique: i1IH8sMROGq1TPBdRcDW3A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5018981C85F;
	Thu, 18 Nov 2021 00:08:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 201BF9324;
	Thu, 18 Nov 2021 00:08:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9D6FC180BAD2;
	Thu, 18 Nov 2021 00:07:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1AI07dEh006762 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 17 Nov 2021 19:07:39 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 4A4F560C81; Thu, 18 Nov 2021 00:07:39 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (unknown [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 96A5A60C13;
	Thu, 18 Nov 2021 00:07:35 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 1AI07XKU006023; 
	Wed, 17 Nov 2021 18:07:33 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 1AI07X2C006022;
	Wed, 17 Nov 2021 18:07:33 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Wed, 17 Nov 2021 18:07:28 -0600
Message-Id: <1637194052-5985-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v3 0/4] Add "reconfigure all" multipath command
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

This patchset is supposed to replace Martin's

multipathd: add "force_reconfigure" option

patch from his uxlsnr overhaul patchset. It also makes the default
reconfigure be a weak reconfigure, but instead of adding a configuration
option to control this, it adds a new multipathd command,
"reconfigure all", to do a full reconfigure. The HUP signal is left
doing only weak reconfigures.

In order to keep from having two states that are handled nearly
identically, the code adds an extra variable to track the type of
configuration that was selected, but this could easily be switch to
use a new DAEMON_CONFIGURE_ALL state instead.

The final patch, that added the new command, is meant to apply on top of
Martin's changed client handler code. I can send one that works with the
current client handler code, if people would rather review that.

Changes from v2 as suggested by Martin Wilck:
0003: configure() and enable_delayed_reconfig() directly access
reload_type, instead of having the value passed in.
schedule_reconfigure() takes an enum force_reload_types instead of a
bool
0004: Modified to deal with schedule_reconfigure() changes.

Changes from v1 as suggested by Martin Wilck:

0001: update libmultipath.version to handle ABI change in struct config
0003: Clarify commit message

Benjamin Marzinski (4):
  multipathd: move delayed_reconfig out of struct config
  multipathd: remove reconfigure from header file.
  multipathd: pass in the type of reconfigure
  multipathd: add "reconfigure all" command.

 libmpathpersist/libmpathpersist.version | 12 ++--
 libmultipath/config.h                   |  1 -
 libmultipath/configure.c                |  2 +-
 libmultipath/libmultipath.version       | 22 +++----
 multipath/main.c                        |  2 +-
 multipathd/cli.c                        |  1 +
 multipathd/cli.h                        |  2 +
 multipathd/cli_handlers.c               | 12 +++-
 multipathd/main.c                       | 84 +++++++++++++++----------
 multipathd/main.h                       |  3 +-
 multipathd/multipathd.8                 | 10 ++-
 11 files changed, 88 insertions(+), 63 deletions(-)

-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

