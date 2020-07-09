Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 45F58219EA1
	for <lists+dm-devel@lfdr.de>; Thu,  9 Jul 2020 13:04:15 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-pIwqAvq2NUiY1AQRMzFBXA-1; Thu, 09 Jul 2020 07:04:12 -0400
X-MC-Unique: pIwqAvq2NUiY1AQRMzFBXA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 092A6108BD0A;
	Thu,  9 Jul 2020 11:04:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D9C076106A;
	Thu,  9 Jul 2020 11:04:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 74FA61CA6;
	Thu,  9 Jul 2020 11:04:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 069B3voD002093 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 9 Jul 2020 07:03:57 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C5C62114B304; Thu,  9 Jul 2020 11:03:56 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9D40C114B300
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 11:03:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B1B10858EE4
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 11:03:54 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-140-Csum6q4YN_yGUNbuzfvg3w-1;
	Thu, 09 Jul 2020 07:03:50 -0400
X-MC-Unique: Csum6q4YN_yGUNbuzfvg3w-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id A227FAE84;
	Thu,  9 Jul 2020 11:03:46 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Thu,  9 Jul 2020 13:03:24 +0200
Message-Id: <20200709110330.9917-1-mwilck@suse.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 069B3voD002093
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 00/80] multipath-tools series part VI: incomplete
	udev initialization
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
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

Hi Christophe, hi Ben,

This is part VI of a larger patch series for multipath-tools I've been preparing.
It's based on the previously submitted part V.

The full series will also be available here:
https://github.com/mwilck/multipath-tools/tree/ups/submit-2007

There are tags in that repo for each part of the series.
This part is tagged "submit-200709-6".

The series handles an issue observed in certain partner installations, where
DM devices were incompletely initialized by udev - during initrd procesing,
the "add" event had been processed, but the subsequent "change" event had not,
because udevd had been killed before getting around to handle them.

My first attempt to fix this was based on udev rules ("11-dm-mpath.rules: Fix
udev rule processing during coldplug"), but this patch was wrong. We have to
add logic in multipathd itself. The most important patch in the series that
fixed the actual customer problem is patch 76. Patch 75 was supposed to handle
a slightly different incarnation of the same problem, which so far hasn't been
actually observed. But I think having this patch "just in case" doesn't hurt,
either.

Patch 78 and 79 rename "update_path_groups()", which over time has grown
to be the main entry point for reloading maps.

Patch 80 fixes an issue which I observed while testing the first 3 patches.

Regards,
Martin

Martin Wilck (6):
  multipathd: uev_trigger(): handle incomplete ADD events
  libmultipath: select_action(): force udev reload for uninitialized
    maps
  libmultipath: log dm_task_run() errors
  libmultipath: move reload_map() to multipathd
  multipathd: rename update_path_groups() -> reload_and_sync_map()
  libmultipath: select_action(): don't drop map if alias clashes

 libmultipath/configure.c  | 112 +++++++++++++++-----------------------
 libmultipath/configure.h  |   3 +-
 libmultipath/devmapper.c  |  61 +++++++++++++++++----
 libmultipath/devmapper.h  |   4 ++
 multipathd/cli_handlers.c |   8 +--
 multipathd/dmevents.c     |   4 +-
 multipathd/main.c         |  71 ++++++++++++++++++++++--
 multipathd/main.h         |   4 +-
 multipathd/waiter.c       |   2 +
 9 files changed, 178 insertions(+), 91 deletions(-)

-- 
2.26.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

