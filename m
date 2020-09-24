Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2C32127728B
	for <lists+dm-devel@lfdr.de>; Thu, 24 Sep 2020 15:37:37 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-196-jV3ebHQRPjec2DnYGGrfmg-1; Thu, 24 Sep 2020 09:37:32 -0400
X-MC-Unique: jV3ebHQRPjec2DnYGGrfmg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3655681F03D;
	Thu, 24 Sep 2020 13:37:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1191373695;
	Thu, 24 Sep 2020 13:37:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AF0F48C7A3;
	Thu, 24 Sep 2020 13:37:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08ODbDZe025462 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 24 Sep 2020 09:37:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B45922156A34; Thu, 24 Sep 2020 13:37:13 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AF8C12156A23
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 13:37:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 68FB6811E78
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 13:37:09 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-137-UkMofHR6M5CSIYpbMrk9WA-1;
	Thu, 24 Sep 2020 09:37:06 -0400
X-MC-Unique: UkMofHR6M5CSIYpbMrk9WA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id E558BB083;
	Thu, 24 Sep 2020 13:37:04 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Thu, 24 Sep 2020 15:36:33 +0200
Message-Id: <20200924133644.14034-1-mwilck@suse.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 08ODbDZe025462
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 00/11] multipath-tools: add linker version scripts
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

Hi Christophe, hi Ben,

Patch 1-5 are small fixes, the first two resent from an earlier
submission. Patch 6ff. add version scripts for the linker to
libmultipath, libmpathpersist, and libmpathcmd.

Is it useful to do this for libmultipath? We have always said that this is
not a public, stable ABI. However, I still believe it has merits. First of
all, it's a description of the ABI we use. It turns out that it cuts the
size of the exported symbol list of libmultipath roughly in half, which is
better than I'd expected. It leads to ld.so-time failure rather than weird
crashes in the unlikely case that non-matching binaries are used
together. It allows packaging scripts to check compatibility of binaries
and libraries without resorting to version and release. It will help us
stabilize the ABI, albeit only in the long run. Finally, it's a step
towards modernizing our code base in general.

To avoid misunderstanding, my intention is not to provide a stable or even
backward-compatible ABI in libmultipath.so.0. We're still allowed to make
changes to globally visible data structures like "struct config", and to
remove symbols from the ABI, like no serious shared library would do.
We just need to bump the ABI version when we do so.

Regards,
Martin

Martin Wilck (11):
  libmultipath: find_mpe(): don't match with empty WWID
  libmultipath: copy mpp->hwe from pp->hwe
  libmultipath: dm_map_present_by_uuid(): fix dm_task_create() call
  libdmmp tests: fix compilation
  libmultipath: prio: constify some function parameters
  libmultipath: checkers/prio: allow non-lazy .so loading
  multipath-tools Makefiles: separate rules for .so and man pages
  libmultipath: create separate .so for unit tests
  libmultipath: add linker version script
  libmpathpersist: add linker version script
  libmpathcmd: add linker version script

 libdmmp/test/libdmmp_speed_test.c       |   2 +-
 libdmmp/test/libdmmp_test.c             |   2 +-
 libmpathcmd/Makefile                    |  14 +-
 libmpathcmd/libmpathcmd.version         |  13 ++
 libmpathpersist/Makefile                |  16 +-
 libmpathpersist/libmpathpersist.version |  20 +++
 libmultipath/Makefile                   |  22 ++-
 libmultipath/checkers.c                 |  17 ++
 libmultipath/config.c                   |   2 +-
 libmultipath/configure.c                |   7 +
 libmultipath/devmapper.c                |   2 +-
 libmultipath/libmultipath.version       | 215 ++++++++++++++++++++++++
 libmultipath/prio.c                     |  26 ++-
 libmultipath/prio.h                     |   4 +-
 libmultipath/propsel.c                  |   4 +-
 libmultipath/structs.c                  |  15 ++
 libmultipath/structs.h                  |   1 +
 libmultipath/structs_vec.c              |  54 +++---
 multipathd/main.c                       |  10 --
 tests/Makefile                          |  10 +-
 20 files changed, 384 insertions(+), 72 deletions(-)
 create mode 100644 libmpathcmd/libmpathcmd.version
 create mode 100644 libmpathpersist/libmpathpersist.version
 create mode 100644 libmultipath/libmultipath.version

-- 
2.28.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

