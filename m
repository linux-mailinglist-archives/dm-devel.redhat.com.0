Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 47E7027B6AE
	for <lists+dm-devel@lfdr.de>; Mon, 28 Sep 2020 22:51:37 +0200 (CEST)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1601326296;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=l88YjYYAsJe2jhToe7iz3PL44cMlAv0DWH/lU07Dx68=;
	b=evb7shB2cph05l+pasSjjLOTUGZXHudibvjRiHnaD3XKzkp3QTdxYZDqpBPFrC8ci5IZEF
	rF2GLdGhKhENsUJCNWor5oohWmkPgvzzW7VkDvlcEsOuR7WLyjlWSwNvhuqspVhjz49hBZ
	ZxQm/JB/73Vz2S6dDfsUaE2ipHTVb/U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-414-Hw2Lo8faN2itaj5CISXqkA-1; Mon, 28 Sep 2020 16:51:33 -0400
X-MC-Unique: Hw2Lo8faN2itaj5CISXqkA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B972DE75F;
	Mon, 28 Sep 2020 20:51:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 699DD10013C0;
	Mon, 28 Sep 2020 20:51:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D5D171826D2A;
	Mon, 28 Sep 2020 20:51:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08SKp8f4023455 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 28 Sep 2020 16:51:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 272A278807; Mon, 28 Sep 2020 20:51:08 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B3A5778822;
	Mon, 28 Sep 2020 20:51:04 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 08SKp39T024509; 
	Mon, 28 Sep 2020 15:51:03 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 08SKp2pe024508;
	Mon, 28 Sep 2020 15:51:02 -0500
Date: Mon, 28 Sep 2020 15:51:02 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20200928205102.GQ3384@octiron.msp.redhat.com>
References: <20200924134054.14632-1-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20200924134054.14632-1-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: lixiaokeng@huawei.com, dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 00/23] libmultipath: improve cleanup on exit
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Sep 24, 2020 at 03:40:31PM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> Hi Christophe, hi Ben, hi lixiaokeng,
> 
> this series was inspired by lixiaokeng's recent posting "[QUESTION] memory
> leak in main (multipath)". It implements my first idea, registering
> cleanup handlers with atexit(). However it turned out to be quite
> complex. In particular multipathd has a lot of things to clean up.
> 
> This series is based on the previous series "multipath-tools: shutdown, 
> libdevmapper races, globals".
> 
> While the bulk of the series is the cleanup handling, it also contains
> some bug fixes for issues that I found while working on this.
> 
> Regards
> Martin
> 
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
For all patches except 1, 7, 14, 18, & 23
> Martin Wilck (23):
>   multipathd: uxlsnr: avoid deadlock on exit
>   multipathd: Fix liburcu memory leak
>   multipathd: move handling of io_err_stat_attr into libmultipath
>   multipathd: move vecs desctruction into cleanup function
>   multipathd: make some globals static
>   multipathd: move threads destruction into separate function
>   multipathd: move conf destruction into separate function
>   multipathd: move pid destruction into separate function
>   multipathd: close pidfile on exit
>   multipathd: add helper for systemd notification at exit
>   multipathd: child(): call cleanups in failure case, too
>   multipathd: unwatch_all_dmevents: check if waiter is initialized
>   multipathd: print error message if config can't be loaded
>   libmultipath: add libmp_dm_exit()
>   multipathd: fixup libdm deinitialization
>   libmultipath: log_thread_stop(): check if logarea is initialized
>   multipathd: add cleanup_child() exit handler
>   libmultipath: fix log_thread startup and teardown
>   multipathd: move cleanup_{prio,checkers,foreign} to libmultipath_exit
>   multipath: use atexit() for cleanup handlers
>   mpathpersist: use atexit() for cleanup handlers
>   multipath: fix leaks in check_path_valid()
>   multipath-tools: mpath-tools.supp: file with valgrind suppressions
> 
>  libmpathpersist/mpath_persist.c       |   2 -
>  libmultipath/config.c                 |   5 +
>  libmultipath/config.h                 |   2 +
>  libmultipath/devmapper.c              |  10 +
>  libmultipath/devmapper.h              |   1 +
>  libmultipath/io_err_stat.c            |   7 +-
>  libmultipath/libmultipath.version     |  26 +--
>  libmultipath/log_pthread.c            |  60 +++--
>  mpathpersist/main.c                   |   5 +-
>  multipath/main.c                      |  94 +++++---
>  multipathd/dmevents.c                 |   2 +
>  multipathd/main.c                     | 305 +++++++++++++++++---------
>  multipathd/uxlsnr.c                   |  17 +-
>  third-party/valgrind/mpath-tools.supp |  33 +++
>  14 files changed, 389 insertions(+), 180 deletions(-)
>  create mode 100644 third-party/valgrind/mpath-tools.supp
> 
> -- 
> 2.28.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

