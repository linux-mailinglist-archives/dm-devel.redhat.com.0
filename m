Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id DBF523349BD
	for <lists+dm-devel@lfdr.de>; Wed, 10 Mar 2021 22:15:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1615410954;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=4nG3i+qbPI+1nRsC+51J0EJXJ6Akt8SZwiC0Bexwb34=;
	b=YqV0jo/b3PrXuJbEVTWex3i8aX3W+uMmgs7e1VvYxNoeQWdhGZTv4hG//TrwuQnXsS9HCK
	VDBXI6e4Ms0REgmLXyjTABdz+uOF920gUs/kS7HVsIZSHBLl3KnYAPKttNirrIUUuDqTZx
	z1OREXuw6yiApNOz2AWpmMEKvYaAS18=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18-A8B-OoU-MtqmL08uYWMJjA-1; Wed, 10 Mar 2021 16:15:51 -0500
X-MC-Unique: A8B-OoU-MtqmL08uYWMJjA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C15C8A0C01;
	Wed, 10 Mar 2021 21:15:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A665419C48;
	Wed, 10 Mar 2021 21:15:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7F30F1809C8C;
	Wed, 10 Mar 2021 21:15:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12ALFOOL016627 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 10 Mar 2021 16:15:24 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 15E1A60C6E; Wed, 10 Mar 2021 21:15:24 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 199D260C13;
	Wed, 10 Mar 2021 21:15:17 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 12ALFFoL012593; 
	Wed, 10 Mar 2021 15:15:15 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 12ALFFcb012592;
	Wed, 10 Mar 2021 15:15:15 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Wed, 10 Mar 2021 15:15:13 -0600
Message-Id: <1615410915-12555-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 0/2] libmutipath: only give out free
	user_friendly_names
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

This patchset fixes a bug that we're run into on installation. Right
now, multipath doesn't ever check that the user_friendly_name it
selected is actually not in-use.  Normally, this is fine, since it won't
pick a name without first adding it to the bindings file.  However, if
the device was created in the initramfs, the bindings file in the
regular filesystem won't be updated until multipathd processes those
paths when starting up after the switchroot. If new path devices are
discovered when multipath starts up after the switchroot, they could be
processed first, and pick the already in use user_friendly_name. In this
case multipath will fail back to using the WWID for the new device, and
renaming the old device.  Later, if multipathd is reconfigured, the new
device will get renamed to the previously in-use user_friendly_name it
added to the bindings file.  All this renaming of devices is messing
with the installer.

To deal with this, this patchset checks that the selected alias is not
in use by an existing dm device, before writing it to the bindings file.
If it is, multipath just steps through the free aliases in the bindings
file, checking until it finds a one that's not in use. I've updated the
lookup_binding() tests to test this functionality as well.

Benjamin Marzinski (2):
  libmultipath: check if user_friendly_name is in use
  tests: add tests for checking if alias is in use

 libmultipath/alias.c |  48 ++++-
 tests/alias.c        | 427 +++++++++++++++++++++++++++++++++++++++++--
 2 files changed, 459 insertions(+), 16 deletions(-)

-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

