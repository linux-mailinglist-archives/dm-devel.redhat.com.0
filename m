Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id BA04F41295F
	for <lists+dm-devel@lfdr.de>; Tue, 21 Sep 2021 01:22:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1632180125;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Pfd6n33xDW9AYbbwx5+EK0IluPX4irD10DOaPMLr0k0=;
	b=hf5duccH3shIIyHZjAlN/VWK90Civ5R7ZN0y2bMFk01D+KDBDdLFkRBpcMTfhnwfSIifOI
	l6xUPOk7bnG2I7fJnxhbwiHg72I8aHNuApUSEmbP86xuuN4ogYNnjtqEPHcF2YTqGS+Bio
	cgHx8mF0HL/IiZ9lnndroub+2Co/laE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-CKtOgL7TO3-qvSGoD9AT4g-1; Mon, 20 Sep 2021 19:21:56 -0400
X-MC-Unique: CKtOgL7TO3-qvSGoD9AT4g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 845281808302;
	Mon, 20 Sep 2021 23:21:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5647E18B5E;
	Mon, 20 Sep 2021 23:21:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2D98F4E58F;
	Mon, 20 Sep 2021 23:21:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18KNLNVW025892 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 20 Sep 2021 19:21:23 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BE4EB1017CF1; Mon, 20 Sep 2021 23:21:23 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (unknown [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5230B1017CE8;
	Mon, 20 Sep 2021 23:21:19 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 18KNLHEH009332; 
	Mon, 20 Sep 2021 18:21:17 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 18KNLHCx009331;
	Mon, 20 Sep 2021 18:21:17 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Mon, 20 Sep 2021 18:21:12 -0500
Message-Id: <1632180076-9294-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 0/4] Add "reconfigure all" multipath command
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

Benjamin Marzinski (4):
  multipathd: move delayed_reconfig out of struct config
  multipathd: remove reconfigure from header file.
  multipathd: pass in the type of reconfigure
  multipathd: add "reconfigure all" command.

 libmultipath/config.h     |  1 -
 libmultipath/configure.c  |  2 +-
 multipath/main.c          |  2 +-
 multipathd/cli.c          |  1 +
 multipathd/cli.h          |  2 +
 multipathd/cli_handlers.c | 12 +++++-
 multipathd/main.c         | 91 +++++++++++++++++++++++----------------
 multipathd/main.h         |  3 +-
 8 files changed, 70 insertions(+), 44 deletions(-)

-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

