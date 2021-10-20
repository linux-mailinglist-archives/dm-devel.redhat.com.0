Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 943094353B7
	for <lists+dm-devel@lfdr.de>; Wed, 20 Oct 2021 21:20:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1634757599;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ptMs25EDKnWkWfg9Szx1+atVVmgPXv0kqbl+IXEzX3g=;
	b=TNc482+iIsp6ZmKNdk2VO2ymRD6pjbaB+CUO9bPHMi42qnEHCY3gRF4WX4ZflBTEJC/4dE
	uFhAe7VB++uZRkHFXtxNp8Z4pm4yPYq8PwXQAO5ON/dsEnzE2zWN3QasWeVCbt/5rJDjVt
	bsSxll54Cp1K+tWZvxoImI3LviyDLqg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-480-7eU3O9j_PXabOi9nxQwdyg-1; Wed, 20 Oct 2021 15:19:57 -0400
X-MC-Unique: 7eU3O9j_PXabOi9nxQwdyg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 46FD3814413;
	Wed, 20 Oct 2021 19:19:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A5A7661077;
	Wed, 20 Oct 2021 19:19:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A02CF4EA2A;
	Wed, 20 Oct 2021 19:19:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19KJFPbH000571 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 20 Oct 2021 15:15:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DBA8660C5F; Wed, 20 Oct 2021 19:15:25 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (unknown [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B399860C0F;
	Wed, 20 Oct 2021 19:15:25 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 19KJFNpU006053; 
	Wed, 20 Oct 2021 14:15:23 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 19KJFMGv006052;
	Wed, 20 Oct 2021 14:15:22 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Wed, 20 Oct 2021 14:15:15 -0500
Message-Id: <1634757322-6015-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 0/7] multipathd: remove udev settle dependency
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

So, it turns out that commit 4ef67017 "libmultipath: add
update_pathvec_from_dm()" already does most of the hard work of making
multipath handle the uninitialized paths that exist during boot, after
the switch root, but before the all the coldplug uevents have been
processed. The only problem is that this code leaves the paths in a
partially initialized state, which doesn't completely get corrected until
a reconfigure happens. 

This patchset makes multipath track these partially initailized paths,
and makes sure that they get fully initialized, or removed, as
necessary.

The first patch is a tangentially related bug I found when trying
(unsuccessfully) to recreate multipathd's problem with dropping
uninitialized paths. Multipathd was not removing completely missing
paths from maps that it found while starting up. The solution I chose
was just to make sure that a full reload will happen on these maps, even
if a weak reconfigure was requested. However, this means that multipath
still completely ignores these missing paths. A side effect of this is
that "multipath -l" does not show these paths, even though they exist as
part of the multipath table. The full reloads are necessary, to take
care of issues that update_pathvec_from_dm() can run into, but we might
also want to think about marking these missing paths as INIT_REMOVED,
instead of not adding them at all. This would make "multipath -l" still
show them, until they actually get removed from the table.

Patch 0005 makes sure to fully initialize the paths when their coldplug
event occurs, but if the path is already fully initialized in udev, but
multipathd finds out about it from update_pathvec_from_dm(), multipath
doesn't do anything to finish initializing the path and moving it to
INIT_OK, besides waiting for a uevent or a reconfigure. This is probably
fine, since the only way I can see for a path to be in this state is for
someone to manually remove the path from multipathd monitoring. But if
I'm missing some other way that paths could end up in this state, we
could try proactively finishing the initalization of INIT_PARTIAL paths
that have all their udev information.

I'm also kind of on the fence about patch 0006. There is no reason why
we have to remove INIT_PARTIAL paths if the multipath device goes away.
But if a path is in INIT_PARTIAL for long enough that the multipath
device gets removed, then it's likely not a path we want to be
monitoring, and if a uevent occurs, we'll add it back, anyway. Also,
knowing that INIT_PARTIAL paths are always part of multipath devices
does make the code simpler.

I've tested these patches both by rebooting with necessary and
unnecessary multipath devices in the initramfs and multipathd.service
set to make multipathd start up at various points after the switch root,
and by manually sending remove uevents to unintialize some paths, and
then starting multipathd to test specific combinations of path states.
But more testing is always welcome.

Benjamin Marzinski (7):
  multipathd: remove missing paths on startup
  libmultipath: skip unneeded steps to get path name
  libmultipath: don't use fallback wwid in update_pathvec_from_dm
  libmultipath: always set INIT_REMOVED in set_path_removed
  multipathd: fully initialize paths added by update_pathvec_from_dm
  multipathd: remove INIT_PARTIAL paths that aren't in a multipath
    device
  multipathd: Remove dependency on systemd-udev-settle.service

 libmultipath/configure.c      |  2 ++
 libmultipath/devmapper.c      |  2 ++
 libmultipath/discovery.c      |  7 ++---
 libmultipath/discovery.h      |  2 ++
 libmultipath/structs.h        |  7 +++++
 libmultipath/structs_vec.c    | 40 ++++++++++++++++-------------
 multipathd/cli_handlers.c     |  4 +++
 multipathd/main.c             | 48 ++++++++++++++++++++++++++++++++---
 multipathd/main.h             |  1 +
 multipathd/multipathd.service |  3 +--
 10 files changed, 90 insertions(+), 26 deletions(-)

-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

