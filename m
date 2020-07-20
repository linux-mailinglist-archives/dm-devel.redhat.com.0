Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id DAD38227038
	for <lists+dm-devel@lfdr.de>; Mon, 20 Jul 2020 23:19:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1595279993;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=0Yy5BeIVhMXmPZnCJpxkCcGW9VhKcwK/++84p0zCFRU=;
	b=f68ARBT9E4FGd/R0oYt0wFxYg9GQBcoktQoXABHKBhDQkNDXqRW+q0z+SZut+Uwb7krYi4
	AGIKk6A1yY/wPz4yMKVf1hTbOBZ8evmbd+MuESJ9JXAEsyDN7ZlHdL27ojpiZNC3dtb9lR
	hmoOmsWrsfxFwBTg0a7CbkCSp4Meya8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-80-fDMmBO43N3OFTNUSjVQtqQ-1; Mon, 20 Jul 2020 17:19:50 -0400
X-MC-Unique: fDMmBO43N3OFTNUSjVQtqQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F2166102C7F4;
	Mon, 20 Jul 2020 21:19:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6FCA960E1C;
	Mon, 20 Jul 2020 21:19:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 70C079A12B;
	Mon, 20 Jul 2020 21:19:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06KLJNqh017175 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 20 Jul 2020 17:19:23 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 656CF5D9DD; Mon, 20 Jul 2020 21:19:23 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 590735D9D5;
	Mon, 20 Jul 2020 21:19:20 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 06KLJIkT018882; 
	Mon, 20 Jul 2020 16:19:18 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 06KLJIt8018881;
	Mon, 20 Jul 2020 16:19:18 -0500
Date: Mon, 20 Jul 2020 16:19:17 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20200720211917.GG11089@octiron.msp.redhat.com>
References: <20200709105145.9211-1-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20200709105145.9211-1-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 00/74] multipath-tools series part V: removed
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, Jul 09, 2020 at 12:51:24PM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> Hi Christophe, hi Ben,
> 
> This is part V of a larger patch series for multipath-tools I've been preparing.
> It's based on the previously submitted part IV.
> 
> The full series will also be available here:
> https://github.com/mwilck/multipath-tools/tree/ups/submit-2007
> 
> There are tags in that repo for each part of the series.
> This part is tagged "submit-200709-5".


For the part, with the exception of patches 61,63,64,65,66 & 71
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>

> 
> The series addresses several issues with missing, unintialized, and removed
> paths. The motivation was that I strongly dislike the side effects of
> disassemble_map(), adding paths and setting WWIDs while parsing map
> parameters. IMO this has always been a layering violation. This patch set adds
> a new function dedicated to handling paths which have not been detected via
> udev but are present as members of dm maps. That makes it much easier to
> track and improve the logic applied when such devices are detected.
> 
> I believe that the new logic will also fix the issue recently reported by
> Chongyun ("libmultipath/dmparser: add missing path with good status when sync
> state with dm kernel"). At least, the approach is very similar, although
> the call to pathinfo() for new devices now happens in update_pathvec_from_dm()
> rather than in disassemble_map().
> 
> The patch set also gets rid of the "is_daemon" argument for disassemble_map(),
> causing semantics in daemon and non-daemon mode. The reason for this parameter
> goes way back into history; it was avoiding to re-add manually removed paths
> because they were still showing up in maps. But OTOH we must add missing
> devices which we've failed to detect. The patch set handles this by tracking
> the state of "being removed" as a new init state, and only actually removing
> the paths from pathvec when they don't show up in maps any more.
> 
> Regards
> Martin
> 
> Martin Wilck (21):
>   libmultipath: protect use of pp->udev
>   libmultipath: add uninitialize_path()
>   multipath-tools: introduce INIT_REMOVED state
>   libmultipath: update_mpp_paths(): handle INIT_REMOVED
>   libmultipath: verify_paths(): don't delete paths from pathvec
>   libmultipath: sync_paths(): handle INIT_REMOVED
>   libmultipath: orphan_paths(): delete paths in INIT_REMOVED state
>   libmultipath: adopt_paths(): skip removed paths
>   multipathd: ev_remove_path(): use INIT_REMOVED
>   multipathd: deal with INIT_REMOVED during path addition
>   multipathd: check_path(): set retrigger_delay if necessary
>   libmultipath: add update_pathvec_from_dm()
>   libmultipath: update_pathvec_from_dm: handle pp->mpp mismatch
>   libmultipath: disassemble_map(): always search paths by dev_t
>   libmultipath: disassemble_map(): require non-NULL pathvec
>   libmultipath: disassemble_map(): get rid of "is_daemon" argument
>   libmultipath: disassemble_map(): do not change pathvec and WWIDs
>   multipath: use update_pathvec_from_dm()
>   libmpathpersist: use update_pathvec_from_dm()
>   libmultipath: decrease loglevel in store_path()
>   libmultipath: dmparser: constify function arguments
> 
>  libmpathpersist/mpath_persist.c       |  56 +-----
>  libmultipath/configure.c              |   2 +-
>  libmultipath/discovery.c              |  15 +-
>  libmultipath/dmparser.c               |  70 ++-----
>  libmultipath/dmparser.h               |   4 +-
>  libmultipath/prioritizers/alua_rtpg.c |   6 +-
>  libmultipath/structs.c                |  21 +-
>  libmultipath/structs.h                |   6 +
>  libmultipath/structs_vec.c            | 263 +++++++++++++++++++++++---
>  libmultipath/structs_vec.h            |  11 +-
>  multipath/main.c                      |  71 +------
>  multipathd/cli_handlers.c             |  49 ++++-
>  multipathd/main.c                     | 113 ++++++++---
>  13 files changed, 445 insertions(+), 242 deletions(-)
> 
> -- 
> 2.26.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

