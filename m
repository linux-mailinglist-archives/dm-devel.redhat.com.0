Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 1FFEB2428C9
	for <lists+dm-devel@lfdr.de>; Wed, 12 Aug 2020 13:36:12 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-251-tecTMxIiOFqWZ0EylbSPHg-1; Wed, 12 Aug 2020 07:36:08 -0400
X-MC-Unique: tecTMxIiOFqWZ0EylbSPHg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E23C185E2E0;
	Wed, 12 Aug 2020 11:35:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 46B4319D71;
	Wed, 12 Aug 2020 11:35:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F32DEA555D;
	Wed, 12 Aug 2020 11:35:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07CBZfT7028767 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 12 Aug 2020 07:35:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 262E210EE97B; Wed, 12 Aug 2020 11:35:41 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2061B100619D
	for <dm-devel@redhat.com>; Wed, 12 Aug 2020 11:35:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9AF7D800BED
	for <dm-devel@redhat.com>; Wed, 12 Aug 2020 11:35:38 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-348-GuxnSGYxOJqUPK4noVOBOw-1;
	Wed, 12 Aug 2020 07:35:36 -0400
X-MC-Unique: GuxnSGYxOJqUPK4noVOBOw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 34159B6F2;
	Wed, 12 Aug 2020 11:35:56 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Wed, 12 Aug 2020 13:35:03 +0200
Message-Id: <20200812113511.26469-1-mwilck@suse.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 07CBZfT7028767
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH v2 00/74] multipath-tools series part V: removed
	path handling
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

Hi Christophe, hi Ben,

This is part V of a larger patch series for multipath-tools I've been preparing.
It's based on the previously submitted part IV.

The full series will also be available here:
https://github.com/mwilck/multipath-tools/tree/ups/submit-2008
This part is tagged "submit-200812-5".

The series addresses several issues with missing, unintialized, and removed
paths. The motivation was that I strongly dislike the side effects of
disassemble_map(), adding paths and setting WWIDs while parsing map
parameters. IMO this has always been a layering violation. This patch set adds
a new function dedicated to handling paths which have not been detected via
udev but are present as members of dm maps. That makes it much easier to
track and improve the logic applied when such devices are detected.

I believe that the new logic will also fix the issue recently reported by
Chongyun ("libmultipath/dmparser: add missing path with good status when sync
state with dm kernel"). At least, the approach is very similar, although
the call to pathinfo() for new devices now happens in update_pathvec_from_dm()
rather than in disassemble_map().

The patch set also gets rid of the "is_daemon" argument for disassemble_map(),
causing semantics in daemon and non-daemon mode. The reason for this parameter
goes way back into history; it was avoiding to re-add manually removed paths
because they were still showing up in maps. But OTOH we must add missing
devices which we've failed to detect. The patch set handles this by tracking
the state of "being removed" as a new init state, and only actually removing
the paths from pathvec when they don't show up in maps any more.

Changes v1 -> v2, as suggested by Ben Marzinski:

 * 55: "libmultipath: add uninitialize_path()"
 * 58: "libmultipath: verify_paths(): don't delete paths from pathvec"
    - context changes
 * 61: "libmultipath: adopt_paths(): skip removed paths"
    - set pp->mpp before checking for INIT_REMOVED
 * 63: "multipathd: deal with INIT_REMOVED during path addition"
    - BUG message if path not mpp member
    - set pp->tick to 1 to make sure paths are quickly reinstated
    - remove "was_removed" variable
 * 64: "multipathd: check_path(): set retrigger_delay if necessary"
    - drop, replace with "libmultipath: orphan_paths(): avoid BUG message"
 * 65: libmultipath: add update_pathvec_from_dm()
    - add comment about pp->udev being initialized
    - discard paths with pathinfo() errors
    - set must_reload if pathgroup was removed
 * 66: "libmultipath: update_pathvec_from_dm: handle pp->mpp mismatch"
    - handle the two failure cases "pp->mpp points to different map" and 
      "wrong wwid" differently. In the latter case, use orphan_path()
 * 71: "multipath: use update_pathvec_from_dm()"
    - use DI_NOIO for CMD_LIST_SHORT. In update_pathvec_from_dm, mask
      out DI_NOIO when checking existing paths

NOTE: In my v1 submission, I made a mistake when sending part V, so that
*patch number 54 is present twice* in the full series.
I deliberately didn't correct that this time, to preserve numbering.

Regards
Martin

Martin Wilck (21):
  libmultipath: protect use of pp->udev
  libmultipath: add uninitialize_path()
  multipath-tools: introduce INIT_REMOVED state
  libmultipath: update_mpp_paths(): handle INIT_REMOVED
  libmultipath: verify_paths(): don't delete paths from pathvec
  libmultipath: sync_paths(): handle INIT_REMOVED
  libmultipath: orphan_paths(): delete paths in INIT_REMOVED state
  libmultipath: adopt_paths(): skip removed paths
  multipathd: ev_remove_path(): use INIT_REMOVED
  multipathd: deal with INIT_REMOVED during path addition
  libmultipath: orphan_paths(): avoid BUG message
  libmultipath: add update_pathvec_from_dm()
  libmultipath: update_pathvec_from_dm: handle pp->mpp mismatch
  libmultipath: disassemble_map(): always search paths by dev_t
  libmultipath: disassemble_map(): require non-NULL pathvec
  libmultipath: disassemble_map(): get rid of "is_daemon" argument
  libmultipath: disassemble_map(): do not change pathvec and WWIDs
  multipath: use update_pathvec_from_dm()
  libmpathpersist: use update_pathvec_from_dm()
  libmultipath: decrease loglevel in store_path()
  libmultipath: dmparser: constify function arguments

 libmpathpersist/mpath_persist.c       |  56 +----
 libmultipath/configure.c              |   2 +-
 libmultipath/discovery.c              |  15 +-
 libmultipath/dmparser.c               |  70 ++----
 libmultipath/dmparser.h               |   4 +-
 libmultipath/prioritizers/alua_rtpg.c |   6 +-
 libmultipath/structs.c                |  21 +-
 libmultipath/structs.h                |   6 +
 libmultipath/structs_vec.c            | 293 +++++++++++++++++++++++---
 libmultipath/structs_vec.h            |  11 +-
 multipath/main.c                      |  72 +------
 multipathd/cli_handlers.c             |  54 ++++-
 multipathd/main.c                     | 112 ++++++++--
 13 files changed, 479 insertions(+), 243 deletions(-)

-- 
2.28.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

