Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id CD676424782
	for <lists+dm-devel@lfdr.de>; Wed,  6 Oct 2021 21:50:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1633549816;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=LvkiQhTtqUCEP4+8hiNv6HvpUCFXWOkLcZu70kvz1ns=;
	b=SHF1Kdxq8sIUb2tvAnD1dRbELKsn9NQ6yVRnkyVqJqvmXekmnz8ejasdsVEXQ6nS6GhK/f
	vp5OWZgAtN7ahngD2PejFykCVEiaRULQPN6JpStpFff/idzz7SQp90ewP010ldOVFPe3ay
	ajaxUFvJYvuniA52qs5P3CuuK+Wy518=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-358-56gKqlDNN9Gfe5npR2tyUg-1; Wed, 06 Oct 2021 15:49:46 -0400
X-MC-Unique: 56gKqlDNN9Gfe5npR2tyUg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 03745100C66D;
	Wed,  6 Oct 2021 19:49:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9365B60583;
	Wed,  6 Oct 2021 19:49:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AC6DC4EA2F;
	Wed,  6 Oct 2021 19:49:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 196JQ80a016710 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 6 Oct 2021 15:26:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E44369AA3C; Wed,  6 Oct 2021 19:26:08 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (unknown [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 850FB9AA36;
	Wed,  6 Oct 2021 19:25:53 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 196JPpBS025265; 
	Wed, 6 Oct 2021 14:25:51 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 196JPo80025264;
	Wed, 6 Oct 2021 14:25:50 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Wed,  6 Oct 2021 14:25:46 -0500
Message-Id: <1633548350-25227-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v2 0/4] Add "reconfigure all" multipath command
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

Changes in v2:

4/4: Added text to the multipathd man page to explain the two types of
     reconfigure.

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
 multipathd/multipathd.8   | 10 ++++-
 9 files changed, 78 insertions(+), 46 deletions(-)

-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

