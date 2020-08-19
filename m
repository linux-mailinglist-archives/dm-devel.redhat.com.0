Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id C7641249F63
	for <lists+dm-devel@lfdr.de>; Wed, 19 Aug 2020 15:18:24 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-mL6pRIElO_q2QgDvR5R_FA-1; Wed, 19 Aug 2020 09:18:20 -0400
X-MC-Unique: mL6pRIElO_q2QgDvR5R_FA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6A2DA100CEC4;
	Wed, 19 Aug 2020 13:18:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 496305DA60;
	Wed, 19 Aug 2020 13:18:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0AAD4662B0;
	Wed, 19 Aug 2020 13:18:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07JDI8lc020845 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 19 Aug 2020 09:18:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 83401CF63A; Wed, 19 Aug 2020 13:18:08 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7E861CF626
	for <dm-devel@redhat.com>; Wed, 19 Aug 2020 13:18:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8C7FD9B4484
	for <dm-devel@redhat.com>; Wed, 19 Aug 2020 13:18:07 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-235-oK5_MtMDPz6BAQkG-50TQg-1;
	Wed, 19 Aug 2020 09:18:02 -0400
X-MC-Unique: oK5_MtMDPz6BAQkG-50TQg-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id B2453AC79;
	Wed, 19 Aug 2020 13:18:27 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Wed, 19 Aug 2020 15:17:45 +0200
Message-Id: <20200819131747.13400-1-mwilck@suse.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 07JDI8lc020845
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH v3 00/80] multipath-tools series part VI:
	incomplete udev initialization
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

Hi Christophe, hi Ben,

This is v3 of part VI of a larger patch series for multipath-tools I've been
preparing. It's based on the previously submitted part V.

The full series will also be available here:
https://github.com/mwilck/multipath-tools/tree/ups/submit-200819
This part is tagged "submit-200819-6".

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
Logically, it rather belongs to part III.

Changes v2 -> v3, as suggested by Ben Marzinski:

 * 76/80 "libmultipath: select_action(): force udev reload for uninitialized
   maps"
   - moved configure.c changes from 77/80 to this patch, where it belongs
 * 77/80 "libmultipath: log dm_task_run() errors"
   - moved some hunks to 76/80, see above

Changes v1 -> v2, as suggested by Ben Marzinski:

 * 76/80 "libmultipath: select_action(): force udev reload for uninitialized
   maps"
    - fetch udevice from cmpp, not mpp (was fixed in "libmultipath: log
      dm_task_run() errors" in v1)
    - force reload only if active paths are available
 * 77/80 "libmultipath: log dm_task_run() errors"
    - moved cmpp fix to previous patch, where it belongs
    - remove pointless debug msg
 * 79/80 "multipathd: rename update_path_groups() -> reload_and_sync_map()"
    - context changes
 * 80/80 "libmultipath: select_action(): don't drop map if alias clashes"
    - fixed wrong strlcpy() (mpp->alias is a pointer)

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
2.28.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

