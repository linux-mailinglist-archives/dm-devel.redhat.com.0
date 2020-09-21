Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2124127338E
	for <lists+dm-devel@lfdr.de>; Mon, 21 Sep 2020 22:24:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1600719852;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=J1Mp40YFPTHAznmuuo0PZ4UD0wt7UiYiZBshw7r1Jmg=;
	b=UFOFHl8IUffMH5TGf8SxF5FtNZB2h/FBLeH1i/jJKWbkB7TubDe2GOY92/oMOmdoM6XjK9
	n9nBufennxY/5fzlqes8TNiV/XMIYW2vxPktvZn+bxcfjJ2yLR+cXGxA09iOk7a7lDm+So
	vKRHHYejuSNuAAc7IklCCoyh0oCOp6E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-8j-Cw3EkPEmP6gKdquAhqA-1; Mon, 21 Sep 2020 16:24:09 -0400
X-MC-Unique: 8j-Cw3EkPEmP6gKdquAhqA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E191480046B;
	Mon, 21 Sep 2020 20:24:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D240575261;
	Mon, 21 Sep 2020 20:23:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B51851888B4C;
	Mon, 21 Sep 2020 20:23:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08LKKI9L009574 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 21 Sep 2020 16:20:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CACA719744; Mon, 21 Sep 2020 20:20:18 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A12BA19D6C;
	Mon, 21 Sep 2020 20:20:15 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 08LKKEJG000491; 
	Mon, 21 Sep 2020 15:20:14 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 08LKKDZg000490;
	Mon, 21 Sep 2020 15:20:13 -0500
Date: Mon, 21 Sep 2020 15:20:13 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20200921202013.GA11108@octiron.msp.redhat.com>
References: <20200916153718.582-1-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20200916153718.582-1-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: lixiaokeng@huawei.com, dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 00/19] multipath-tools: shutdown,
 libdevmapper races, globals
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Sep 16, 2020 at 05:36:59PM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> Hi Christophe, hi Ben,
> 
> this series contains a number of patches I've wanted to do for some
> time. As usual, it's based on my "upstream-queue" tree
> (https://github.com/openSUSE/multipath-tools/tree/upstream-queue).
> 
> Patch 1-8 are related to multipathd shutdown and systemd notifcation.
> Patch 1 and 8 have been part of my earlier series "multipath-tools: 
> Fix remaining shutdown delay issues" from Jan, 2019. But this is so
> long ago that I didn't mark this as a v2. I have tried to address
> Ben's issues with #1 (size_mismatch_seen leak, and premature sd_notify)
> (https://www.redhat.com/archives/dm-devel/2019-January/msg00097.html).
> #8 is just resent, after the recent discussion
> (https://www.redhat.com/archives/dm-devel/2020-August/msg00342.html).
> Ben's remark about sd_notify() drove me to reexamine that feature,
> and actually improve a little by informing systemd of shutdown and
> reconfigure operations.
> 
> Patch 9-11 are an attempt to fix races in libdevmapper, as discussed
> a while ago in the "fix fd leak when iscsi device logs in" thread
> (https://www.redhat.com/archives/dm-devel/2020-July/msg00321.html and
> references).
> 
> Patch 12ff. add definitions of the symbol get_multipath_config(),
> put_multipath_config(), udev, and logsink to libmultipath. This way
> callers won't have to bother with defining these global symbols any
> more in the future (but they still can).

Thanks for doing this. I really like these cleanups. I'll be resending
my libmpathvalid library code on top of this set.

Reviewed-by: Benjamin Marzinski <bmarizns@redhatc.com> 
For all the patches I didn't comment on. 

-Ben

> Regards,
> Martin
> 
> Cc: lixiaokeng@huawei.com
> 
> Martin Wilck (19):
>   multipathd: allow shutdown during configure()
>   multipathd: avoid sending "READY=1" to systemd on early shutdown
>   multipathd: send "STOPPING=1" to systemd on shutdown
>   multipathd: send "RELOADING=1" to systemd on DAEMON_CONFIGURE state
>   multipathd: use volatile qualifier for running_state
>   multipathd: generalize and fix wait_for_state_change_if()
>   multipathd: set_config_state(): avoid code duplication
>   multipathd: cancel threads early during shutdown
>   multipath-tools: don't call dm_lib_release() any more
>   libmultipath: devmapper: refactor libdm version determination
>   libmultipath: protect racy libdevmapper calls with a mutex
>   libmultipath: constify file argument in config parser
>   libmultipath: provide defaults for {get,put}_multipath_config
>   libmpathpersist: allow using libmultipath {get,put}_multipath_config
>   multipath: use {get_put}_multipath_config from libmultipath
>   mpathpersist: use {get,put}_multipath_config() from libmultipath
>   libmultipath: add udev and logsink symbols
>   multipath: remove logsink and udev
>   mpathpersist: remove logsink and udev
> 
>  kpartx/kpartx.c                 |   1 -
>  libmpathpersist/mpath_persist.c |  43 +++++-
>  libmpathpersist/mpath_persist.h |  28 ++++
>  libmultipath/config.c           |  95 +++++++++++--
>  libmultipath/config.h           |  28 +++-
>  libmultipath/configure.c        |   6 +
>  libmultipath/debug.c            |   2 +
>  libmultipath/devmapper.c        | 228 +++++++++++++++++++++-----------
>  libmultipath/devmapper.h        |  13 +-
>  libmultipath/discovery.c        |   3 +
>  libmultipath/parser.c           |   9 +-
>  libmultipath/parser.h           |   2 +-
>  libmultipath/propsel.c          |  10 +-
>  libmultipath/util.c             |  10 ++
>  libmultipath/util.h             |   2 +
>  mpathpersist/main.c             |  26 +---
>  multipath/main.c                |  28 +---
>  multipathd/cli_handlers.c       |   2 -
>  multipathd/dmevents.c           |   4 +-
>  multipathd/main.c               | 117 ++++++++--------
>  multipathd/waiter.c             |   2 +-
>  21 files changed, 441 insertions(+), 218 deletions(-)
> 
> -- 
> 2.28.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

